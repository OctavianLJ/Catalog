<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Login</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="loginFont.css" rel="stylesheet" type="text/css">
<link href="css/login2.css" rel="stylesheet">
</head>

<body class="bg-dark">
	<div class="container">
		<div class="card card-login mx-auto mt-5">
			<div class="card-header">Login
			</div>
			<div class="card-body">
				<form action="LoginPage" method="POST">
					<div class="form-group">
					<p><font color="red">${message }</font></p>
						<label for="exampleInputUsername">Username</label> <input
							class="form-control" name="username" type="text"
							aria-describedby="usernameHelp" placeholder="Enter username">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword">Password</label> <input
							class="form-control" name="password" type="password"
							placeholder="Password">
					</div>
					<input class="btn btn-primary btn-block" type="submit" value="Login"/>
				</form>
			</div>
		</div>
	</div>
</body>
</html>