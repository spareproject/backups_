#!/bin/env bash
#############################################################################################################################################################################################################
. ./functions/session
#############################################################################################################################################################################################################
input
session
html
header
echo "
<fieldset>
<legend><h1><b>output</b></h1></legend>
TESTING:$TESTING
<pre>
$TEMP</br>
</pre>
</fieldset>
"

echo "
<fieldset><legend>multiple uploads</legend>
<form action='/cgi-bin/ftp.cgi' method='post' enctype='multipart/form-data'>
<table>
<tr>
<td>username</td>
<td><input type='text' name='username'</td>
</tr>
<tr>
<td>password</td>
<td><input type='password' name='password'></td>
</tr>
<tr>
<td>email</td>
<td><input type='email' name='email'></td>
</tr>
<tr>
<td>pubkey</td>
<td><input type='file' name='pubkey'></td>
</tr>
<tr>
<td></td>
<td><input type='submit' name='register' value='register'></td>
</tr>
</table>
</form>
</fieldset>
"

echo "
<fieldset>
<legend><h1><b>input</b></h1></legend>
<table>
<form action='/cgi-bin/ftp.cgi' method='post' enctype='multipart/form-data'>
<tr>
<td><input type='file' name='file'></td>
<td><input type='submit' name='upload' value='upload'></td>
</tr>
</form>
</table>
</fieldset>

"

footer
#############################################################################################################################################################################################################
