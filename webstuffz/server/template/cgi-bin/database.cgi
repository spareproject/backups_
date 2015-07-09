#!/bin/bash
. ./functions/session
. ./functions/database
#############################################################################################################################################################################################################
input
session
html
header

testing

echo "
<fieldset><legend><h1><b>database</b></h1></legend>

<h2><b>user</b></h2><table>
<tr><td>username</td><td>uuid</td></tr>
<tr><td>password</td><td>sha512sum of user password</td></tr>
<tr><td>email</td><td>user email</td></tr>
<tr><td>pubkey</td><td>need to strip : (%3A) \\ (%2F) + (%2B) = (%3D) and + (newline)</td></tr>
<tr><td>fingerprint</td><td></td></tr>
<tr><td>last_successful</td><td>last successful login</td></tr>
<tr><td>last_failed</td><td>last failed login</td></tr>
<tr><td>attempts</td><td>number of attempted logins</td></tr>
<tr><td>flag</td><td>audit flagged account allow request prompt for audit</td></tr>
</table>
<br>

<h2><b>session</h2>
<p></p>
<table>

<tr><td>username</td><td></td></tr>

<tr><td>session</td><td>4096 random generated full valid char range cookie sha512sum</td></tr>
  <tr><td>timestamp</td><td>date created timestamp_session</td></tr>
  <tr><td>ip</td><td>ip address used to make the cookie</td></tr>
  <tr><td>expire_server</td><td>time the server stops giving any fucks</td></tr>
  <tr><td>expire_client</td><td>actually set cookie expire </td></tr>
<tr><td></td></tr>
<tr><td>last_seen</td><td>ip address current session was started with</td></tr>
<tr><td>challenge</td><td>sha512sum random 4096 bit encrypted with user public key</td></tr>
<tr><td>response</td><td>re use the same challenge for a given time period (easy entropy kill f5 spam)</td></tr>
<tr><td>timeout</td><td>need a time stamp limit to stop entropy attacks... </td></tr>
<tr><td>valid</td><td>takes epoch for time limit only if 2fa passes</td></tr>

<tr><td></td></tr>
<tr><td>revoke</td><td>ban login with this key (needs auditing?)</td></tr>
</table>
<br>

<h2><b>audit</b></h2><table>
<tr><td>ip</td><td>need somewhere to store information based on ips</td></tr>
<tr><td>request</td><td>what the ip address attempted to access</td></tr>
<tr><td>timestamp</td><td>time they requested access</td></tr>
</table>
<br>

<h2><b>gnupg</b></h2><table>
<tr><td>username</td><td>primary key / foreign key</td></tr>
<tr><td>user_fingerprint</td><td>user uploads public key at registration server signs it (should be physical exchange)</td></tr>
<tr><td>sign_fingerprint</td><td>defaults to the webserver gnupg keyring (key signed by host)</td></tr>
<tr><td>key</td><td>the signed public key</td></tr>
<tr><td></td><td></td></tr>
</table>

</fieldset>
"

footer
#############################################################################################################################################################################################################
