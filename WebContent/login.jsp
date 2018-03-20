<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>Login</title>
</head>
<link type="text/css" rel="stylesheet" href="css/login.css">

<body>
<div class="logPage">
<h1>Virtual Marking System</h1>
<h2>Welcome!</h2> 
<h4>${message }</h4>
<form action="LoginPage" method="POST" >
<div class="field">
Username: <input type="text" name="username"/>
</div>
<div class="field">
Password: <input type="password" name="password" />
</div>
<div class="sub">
<input type="submit" value="Sumbit" />
</div>
</form>
</div>
</body>
</html>