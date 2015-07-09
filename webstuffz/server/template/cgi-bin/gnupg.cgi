#!/bin/bash
. ./functions/session
#############################################################################################################################################################################################################
input
session
html
header

GPG="/home/nginx/server/template/gnupg"
echo "<fieldset><legend><h1><b>public</b></h1></legend><pre>"
gpg --homedir $GPG --list-keys
echo "</pre></fieldset>"

echo "<fieldset><legend><h1><b>private</b></h1></legend><pre>"
gpg --homedir $GPG --list-secret-keys
echo "</pre></fieldset>"
footer
#############################################################################################################################################################################################################
