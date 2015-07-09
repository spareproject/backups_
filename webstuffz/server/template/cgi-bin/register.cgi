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
<form action='/cgi-bin/debug.cgi' method='post'><table>

<tr><td>username</td><td><input type='text' name='username'</td></tr>
<tr><td>password</td><td><input type='password' name='password'></td></tr>
<tr><td>email</td><td><input type='email' name='email'></td></tr>
<tr><td>pubkey</td><td><input type='text' name='pubkey'></td></tr>
<tr><td><a href=/cgi-bin/login.cgi>login</a></td><td><input type='submit' name='register' value='register'></td></tr>
</table></form>
</div></div></div>

</body></html>
"
#############################################################################################################################################################################################################
