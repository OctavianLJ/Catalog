<%@page import="jdbc.access.GetConnection"%>
<%@page import="ro.web.dao.LoginDAO"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Student's Page</title>
</head>
<link type="text/css" rel="stylesheet" href="css/pageStyle.css" />
<body background="res/studentsBackground.jpg">
<% 
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
LoginDAO login = new LoginDAO();
String name = (String) session.getAttribute("username");
String role = login.checkCredentials(name);
if (name == null || !role.equalsIgnoreCase("Student")) {
	response.sendRedirect("login2.jsp");
}
%>
<div class="box2 table">
    <a class="box button" href="LogoutPage">Logout</a>
	<a class="box button" href="absencesStudent.jsp">Absences</a>
	<a class="box button" href="changePassword2.jsp">Change Password</a>
</div>
	<form method="post">

			<div class="box table">
			    <span class="box main">Student</span>
				<span class="box main">Grade</span> 
				<span class="box main">Discipline</span>
				<span class="box main">Teacher</span> 
				<span class="box main">Mark</span>
				<span class="box main">Date</span>
			</div>

			<%
				GetConnection getConnection = new GetConnection();
				Statement stm = getConnection.wStatement();
				String s = (String) session.getAttribute("username");
				String sql = "select * from catalog.student s, catalog.disciplines d, catalog.student_discipline sd, catalog.marks m "
						+ "where s.id=sd.id_student and d.id=sd.id_discipline and sd.id=m.id_student_discipline and s.name='" + s
						+ "' ORDER BY d.discipline ASC";

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
		
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>

	</form>
</body>

</html>