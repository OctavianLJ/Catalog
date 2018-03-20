<%@page import="ro.web.dao.LoginDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
<title>Modify/Delete Mark</title>
<link rel="stylesheet" href="css/pikaday.css">
</head>
<link type="text/css" rel="stylesheet" href="css/formStyle.css" />
<body background="res/teachersBackground.jpg">
<% 
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
LoginDAO login = new LoginDAO();
String name = (String) session.getAttribute("username");
String role = login.checkCredentials(name);
if (name == null || !role.equalsIgnoreCase("Teacher")) {
	response.sendRedirect("login.jsp");
}
%>
<div class="button">
<a href="teacherPage.jsp">Back</a>
</div>
<form action="AddRemoveAbsencesServlet" method="POST">

<div class="form">
<div class="form field">
Action:<br/>
<select id="select" name="actions" onchange="showField()">
<option></option>
<option>Add</option>
<option>Delete</option>
</select>
</div>
<div class="form field">
Student:<br/><input type="text" name="studentName" placeholder="FirstName/LastName"/>
</div>
<div class="form field">
<label for="datepicker">Date:</label><br/>
<input type="text" name="date" id="datepicker"/>
<script src="js/pikaday.js"></script>
</div>
<input type="submit" value="Apply" />
</div>
</form>
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