<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>Change Your Password</title>
</head>
<link type="text/css" rel="stylesheet" href="css/login.css">

<body>
<div class="button">
<a href="login2.jsp">Back</a>
</div>
<div class="logPage">
<h1>Change Your Password</h1>
<h4><font color="green">${message }</font></h4>
<h4><font color="red">${message2 }</font></h4>
<form action="ChangePasswordServlet" method="POST" >
<div class="field">
Username: <input type="text" name="username" />
</div>
<div class="field">
Existing Password: <input type="password" name="password" />
</div>
<div class="field">
New Password: <input type="password" name="newPassword" />
</div>
<div class="field">
Confirming New Password: <input type="password" name="confirmNewPassword" />
</div>
<div class="sub">
<input type="submit" value="Sumbit" />
</div>
</form>
</div>
</body>
</html>