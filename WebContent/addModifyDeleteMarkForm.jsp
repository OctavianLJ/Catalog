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

</head>
<script type="text/javascript" src="js/showFieldMark.js"></script>
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

<div class="button">
<a href="teacherPage.jsp">Back</a>
</div>
<form action="AddModifyDeleteMarkServlet" method="POST" >
<div class="form">
<div class ="form field">
Action:<br/>
<select  id="select" name="actions" onchange="showField()">
<option></option>
<option>Add</option>
<option>Modify</option>
<option>Delete</option>
</select>
</div>
<div class="form field">
Discipline:<br/>
<select id="selectx" name="discipline">
<option></option>
<% for (String s : discipline) {

%>	
<option><%=s %></option>
<%	
}
%>
</select>
</div>
<div class="form field">
Student: <br/><input type="text" name="studentName" placeholder="FirstName/LastName" />
</div>
<div class="form field">
Grade:<br/> 
<select name="grade">
<option></option>
<option>9th Grade</option>
<option>10th Grade</option>
<option>11th Grade</option>
<option>12th Grade</option>
</select>
</div>
<div class="form field">
Given Mark: <br/><input type="text" name="studentMark" />
<p><font color="red">${message }</font></p>
</div>
<div id="select1" style="display: none;" class="form field">
New Mark: <br/><input type="text" name="newMark" />
<p><font color="red">${message }</font></p>
</div>
<div class="form field">
<label for="datepicker">Date:</label><br/>
<input type="text" name="date" id="datepicker"/>
<script src="js/pikaday.js"></script>
</div>
<input type="submit" value="Apply"/>
</div>
</form>
<script src="js/newPikaday.js"></script>
</body>
</html>