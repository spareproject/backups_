#!/bin/env bash
#############################################################################################################################################################################################################
. ./functions/session
#############################################################################################################################################################################################################
input
session
#############################################################################################################################################################################################################
echo "
<!DOCTYPE html><html><head>
<meta charset='utf-8'/>
<link rel='stylesheet' type='text/css' href='/css/default.css'>
<title>spareProject...</title>
</head>
<body>
<div class='outer'>
<div class='middle'>
<div class='inner'>

<form action='/cgi-bin/2fa.cgi' method='post'>
<table>
<tr>
<td><input class='input_text' type='text' name='username' value='username'></td>
<td><a href=/cgi-bin/register.cgi>register</a></td>
</tr>
<tr>
<td><input type='password' name='password' value='password'></td>
<td><input type='submit' name='login' value='login'></td>
</tr>
</table>
</form>
</div>
</div>
</div>
</body></html>"
#############################################################################################################################################################################################################
