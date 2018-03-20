<%@page import="ro.web.dao.LoginDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Account</title>
</head>
<script type="text/javascript" src=js/showField.js></script>
<link type="text/css" rel="stylesheet" href="css/formStyle.css" />
<body background="res/adminsBackground.jpg">
<% 
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
LoginDAO login = new LoginDAO();
String name = (String) session.getAttribute("username");
String role = login.checkCredentials(name);
if (name == null || !role.equalsIgnoreCase("Admin")) {
	response.sendRedirect("login.jsp");
}
%>
<div class="button">
<a href="adminPage.jsp">Back</a>
</div>
<form action="AddRemoveStudentTeacherServlet" method="POST">

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
Name/Surname: <input type="text" name="name" />
<p><font color="red">${message }</font></p>
</div>
<div id="select1" style="display: none;" class="form field">
Passowrd: <br/> <input type="text" name="password" />
</div>


<div class="form field">
Account Type: <br/>
<select id="select2" name="role" onchange="showField()"> <!-- onchange="populate(this.id, 'select2')" --> 
<option></option>
<option>Student</option>
<option>Teacher</option>
</select>
</div>
<div class="form field">
Grade<br/>
<select name="grade">
<option></option>
<option>9th Grade</option>
<option>10th Grade</option>
<option>11th Grade</option>
<option>12th Grade</option>
</select>
</div>
 <div id="select3" style="display: none;" class="form field">
Specialty<br/>
<select name="discipline">
<option></option>
<option>English</option>
<option>Math</option>
<option>Spanish</option>
<option>Japanese</option>
<option>Physics</option>
<option>Chemistry</option>
<option>Biology</option>
<option>Geography</option>
<option>History</option>
<option>IT</option>
<option>Logic</option>
<option>Music</option>
<option>Psychology</option>
<option>Philosophy</option>
<option>Economy</option>
</select>
</div>
<input type="submit" value="Apply">
</div>
</form>
</body>
</html>

<!-- 
function populate(s1, s2) {
	var s1 = document.getElementById(s1);
	var s2 = document.getElementById(s2);
	s2.innerHTML = "";
	if (s1.value == "Student") {
		var optionArray = ["9th Grade|9th Grade", "10th Grade|10th Grade",
			"11th Grade|11th Grade", "12th Grade|12th Grade"];
	} else if (s1.value == "Teacher") {
		var optionArray = ["English|English", "Math|Math",
			"Spanish|Spanish", "Japanese|Japanese", "Physics|Physics",
			"Chemistry|Chemistry", "Biology|Biology", "Geography|Geography", 
			"History|History", "IT|IT", "Music|Music", "Logic|Logic", "Psychology|Psychology", 
			"Economy|Economy", "Philosophy|Philosophy"];
	}	
	for (option in optionArray) {
		var pair = optionArray[option].split("|");
		var newOption = document.createElement("option");
		newOption.value = pair[0];
		newOption.innerHTML = pair[1];
		s2.options.add(newOption);
	}
}
 -->
 
 <!--  
 <div class="form field">
Grade/SpecialtyS<br/>
<select id="select2" name="gradeOrDiscipline"></select>
</div>
  -->