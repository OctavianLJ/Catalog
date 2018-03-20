<%@page import="java.sql.SQLException"%>
<%@page import="ro.web.dao.LoginDAO"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="jdbc.access.GetConnection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Teacher's Page</title>
</head>
<link type="text/css" rel="stylesheet" href="css/pageStyle.css" />
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
<div class="box2 table">
    <a class="box button" href="LogoutPage">Logout</a>
	<a class="box button" href="addModifyDeleteMarkForm2.jsp">Add/Modify/Delete Mark</a>
	<a class="box button" href="addRemoveAbsence2.jsp">Add/Delete Absence</a>
	<a class="box button" href="absencesTeacher.jsp">Show Absences</a>
	<a class="box button" href="changePassword2.jsp">Change Password</a>
</div>

<div class="box table">
		<span class="box main">Student</span>
		<span class="box main">Grade</span>
		<span class="box main">Discipline</span>
		<span class="box main">Teacher</span> 
		<span class="box main">Mark</span>
		<span class="box main">Date</span>
	</div>


		<%
			String sql = "select * from catalog.student s, catalog.disciplines d, catalog.student_discipline sd, catalog.marks m "
					+ "where s.id=sd.id_student and d.id=sd.id_discipline and sd.id=m.id_student_discipline ORDER BY s.name, d.discipline ASC";
			GetConnection getConnection = new GetConnection();
			Statement stm = getConnection.wStatement();
			try {
				ResultSet rs = stm.executeQuery(sql);
				while (rs.next()) {
		%>
		
		<div class="box table">
			<span class="box cell"><%=rs.getString("name")%></span> 
			<span class="box cell"><%=rs.getString("grade")%></span> 
			<span class="box cell"><%=rs.getString("discipline")%></span> 
			<span class="box cell"><%=rs.getString("teacher")%></span>
			<span class="box cell"><%=rs.getString("mark")%></span> 
			<span class="box cell"><%=rs.getString("date")%></span>
		</div>
	
	<%
		}
	%>

	<%
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>


</body>

</html>