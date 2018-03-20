<%@page import="ro.web.dao.LoginDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
<title>Modify/Delete Mark</title>
<link rel="stylesheet" href="css/pikaday.css">
</head>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="loginFont.css" rel="stylesheet" type="text/css">
<link href="css/login2.css" rel="stylesheet">
<body background="res/teachersBackground.jpg">
<% 
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
LoginDAO login = new LoginDAO();
String name = (String) session.getAttribute("username");
String role = login.checkCredentials(name);
if (name == null || !role.equalsIgnoreCase("Teacher")) {
	response.sendRedirect("login2.jsp");
}
%>
<a class="btn btn-primary" href="teacherPage.jsp">Back</a>
<div class="container">
<div class="card card-login mx-auto mt-5">
<div class="card-header">Add / Remove Account</div>
<div class="card-body">
<form action="AddRemoveAbsencesServlet" method="POST">


<div class="form-group">
<select id="select" name="actions" onchange="showField()">
<option>Action</option>
<option>Add</option>
<option>Delete</option>
</select>
</div>
<div class="form-group">
<input class="form-control" type="text" name="studentName" placeholder="Student Name"/>
</div>
<div class="form-group">
<select name="grade">
<option>Grade</option>
<option>9th Grade</option>
<option>10th Grade</option>
<option>11th Grade</option>
<option>12th Grade</option>
</select>
</div>
<div class="form-group">
<label for="datepicker">Date:</label><br/>
<input class="form-control" type="text" name="date" id="datepicker"/>
<script src="js/pikaday.js"></script>
</div>
<input class="btn btn-primary btn-block" type="submit" value="Apply"/>
</form>
</div>
</div>
</div>
<script src="js/newPikaday.js"></script>
</body>
</html>


<!-- function showField() {
	var x = document.getElementById("select");
	var a = document.getElementById("dateField");
	if (x.value == "Delete") 
	alert();
	var b = document.createElement("input");
	b.setAttribute("type", "text");
	a.appendChild(b);
}
 -->