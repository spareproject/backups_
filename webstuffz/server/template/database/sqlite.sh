#!/bin/env bash

function create_tables {

# if it exists kill it with fire
if [[ -f ./webserver.sqlite ]];then rm ./webserver.sqlite;fi

# table create
sqlite3 ./webserver.sqlite <<< "
CREATE TABLE user(
  username        TEXT PRIMARY KEY UNIQUE,
  password        TEXT NOT NULL,
  email           TEXT NOT NULL,
  pubkey          TEXT NOT NULL,
  fingerprint     TEXT NOT NULL,
  last_successful INTEGER DEFAULT 0,
  last_failed     INTEGER DEFAULT 0,
  attempts        INTEGER DEFAULT 0,
  flag            INTEGER DEFAULT 0
);
CREATE TABLE session(
  uuid          INTEGER PRIMARY KEY,
  username      TEXT NOT NULL,
  session       TEXT NOT NULL,
  timestamp     INTEGER,
  ip            TEXT,
  expire_server INTEGER,
  expire_client INTEGER,
  last_seen     INTEGER,
  challenge     TEXT,
  response      TEXT,
  timeout       INTEGER,
  valid         INTEGER DEFAULT 0,
  revoke        INTEGER DEFAULT 0,
  FOREIGN KEY(username) REFERENCES user(username) ON DELETE CASCADE ON UPDATE CASCADE
);
"

# test data...
sqlite3 ./webserver.sqlite <<< "
INSERT INTO user(username,password,email,pubkey,fingerprint) 
VALUES(
'username',
'$(sha512sum<<<password|sed 's/\W//g')',
'bob@emailz.com',
readfile('public.key'),
readfile('fingerprint')
);
"

}

create_tables
chown -R cgi:cgi /home/nginx/server/template/database
