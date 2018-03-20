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
<title>Accounts</title>
</head>
<link type="text/css" rel="stylesheet" href="css/pageStyle.css" />
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

<div class="box table">
	    <span class="box main">User</span>
		<span class="box main">Role</span>
	</div>


		<%
			String sql = "select * from catalog.login ORDER BY username, user_type ASC";
			GetConnection getConnection = new GetConnection();
			Statement stm = getConnection.wStatement();
			try {
				ResultSet rs = stm.executeQuery(sql);
				while (rs.next()) {
		%>
		
		<div class="box table">
		    <span class="box cell"><%=rs.getString("username")%></span> 
			<span class="box cell"><%=rs.getString("user_type")%></span> 
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