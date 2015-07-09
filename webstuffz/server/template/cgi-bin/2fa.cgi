#!/bin/env bash
#############################################################################################################################################################################################################
. ./functions/session
#############################################################################################################################################################################################################
input
session
#############################################################################################################################################################################################################
echo "
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'/>
<link rel='stylesheet' type='text/css' href='/css/default.css'>
<title>spareProject...</title>
</head>
<body>
<div class='outer'><div class='middle'><div class='inner'>
<fieldset class='center'>
<pre>
"

gpg --homedir /home/nginx/server/template/gnupg -e -r webserver <<<$(cat /dev/random|tr -cd 'a-zA-Z0-9'|fold -w 63|head -n 1)

echo "
</pre><form action='/cgi-bin/index.cgi' method='post'><table class='center'>
<tr><td><input type='text' name='2fa'></td><td><input type='submit' name='2fa' value='submit'></td>
</tr></table></form>
</fieldset>
"


echo "</div></div></div></body></html>"
#############################################################################################################################################################################################################
