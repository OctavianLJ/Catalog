<%@page import="java.sql.SQLException"%>
<%@page import="ro.web.dao.LoginDAO"%>
<%@page import="jdbc.access.GetConnection"%>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Set" %>
<%@page import="java.util.TreeSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
<title>Add Mark</title>
<link rel="stylesheet" href="css/pikaday.css">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="loginFont.css" rel="stylesheet" type="text/css">
<link href="css/login2.css" rel="stylesheet">
</head>
<script type="text/javascript" src="js/showFieldMark.js"></script>

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

<%
GetConnection getConnection = new GetConnection();
Set<String> discipline = new TreeSet<String>();
Set<String> grade = new TreeSet<String>();
String sql = "select * from catalog.disciplines where teacher='" + name + "'";
Statement st = getConnection.wStatement();
try {
ResultSet rs = st.executeQuery(sql);
while (rs.next()) {
	discipline.add(rs.getString("discipline"));
	grade.add(rs.getString("grade"));
}
} catch (SQLException e) {
	e.printStackTrace();
}
%>


<a class="btn btn-primary" href="teacherPage.jsp">Back</a>

<div class="container">
<div class="card card-login mx-auto mt-5">
<div class="card-header">Mark Operations</div>
<div class="card-body">
<form action="AddModifyDeleteMarkServlet" method="POST" >

<div class="form-group">
<select  id="select" name="actions" onchange="showField()">
<option>Action</option>
<option>Add</option>
<option>Modify</option>
<option>Delete</option>
</select>
</div>
<div class="form-group">

<select id="selectx" name="discipline">
<option>Discipline</option>
<% for (String s : discipline) {

%>	
<option><%=s %></option>
<%	
}
%>
</select>
</div>
<div class="form-group">
<input class="form-control" name="studentName" type="text" placeholder="Student Name">
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
<input class="form-control" type="text" name="studentMark" placeholder="Mark (a digit from 1 to 10)"/>
<p><font color="red">${message }</font></p>
</div>
<div id="select1" style="display: none;" class="form-group">
<input type="text" name="newMark" class="form-control" placeholder="New Mark (a digit from 1 to 10)"/>
<p><font color="red">${message }</font></p>
</div>
<div class="form-group">
<label for="datepicker">Date:</label>
<input type="text" name="date" id="datepicker" class="form-control"/>
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