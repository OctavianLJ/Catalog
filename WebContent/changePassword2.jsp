<%@page import="ro.web.dao.LoginDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Change Password</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="loginFont.css" rel="stylesheet" type="text/css">
<link href="css/login2.css" rel="stylesheet">
</head>

<body class="bg-dark">
<% 
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
LoginDAO login = new LoginDAO();
String name = (String) session.getAttribute("username");
String role = login.checkCredentials(name);
%>
	<a class="btn btn-primary" href="login2.jsp">Back</a>
	<div class="container">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header">Change Password
			</div>
			<div class="card-body">
				<form action="ChangePasswordServlet" method="POST">
				<div class="form-group">
				<label><%= session.getAttribute("username") %></label>
				</div>
					<p><font color="green">${message }</font></p>
					<p><font color="red">${message2 }</font></p>
						
					<div class="form-group">
						 <input
							class="form-control" name="password" type="password"
							placeholder="Existing Password">
					</div>
					<div class="form-group">
						 <input
							class="form-control" name="newPassword" type="password"
							placeholder="New Password">
					</div>
					<div class="form-group">
						 <input
							class="form-control" name="confirmNewPassword" type="password"
							placeholder="Confirm New Password">
					</div>
					<input class="btn btn-primary btn-block" type="submit" value="Submit"/>
				</form>
			</div>
		</div>
	</div>
</body>
</html>