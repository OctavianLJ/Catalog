package ro.web.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.access.GetConnection;

public class LoginDAO {

	GetConnection getConnection = new GetConnection();
	String sql = "select * from catalog.login where username=? and password=?";
	String sql2 = "select user_type from catalog.login where username=?";

	public boolean checkDetails(String username, String password) throws ClassNotFoundException, SQLException {

		PreparedStatement ps = getConnection.wPreparedStatement(sql);
		ps.setString(1, username);
		ps.setString(2, password);

		ResultSet myRs = ps.executeQuery();
		if (myRs.next()) {
			return true;
		}

		return false;
	}

	public String checkCredentials(String username) throws ClassNotFoundException, SQLException {
		String role = "";

			PreparedStatement ps = getConnection.wPreparedStatement(sql2);
			ps.setString(1, username);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				role = rs.getString("user_type");
			}
		return role;
	}
}
//WORKING