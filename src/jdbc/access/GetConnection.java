package jdbc.access;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class GetConnection {

	static final String DB_URL = "jdbc:h2:~/test;AUTO_SERVER=TRUE";
	static final String USERNAME = "SA";
	static final String PASSWORD = "";

	public Statement wStatement() {
		Statement stmt = null;
		try {
			Class.forName("org.h2.Driver");
			Connection conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
			stmt = conn.createStatement();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return stmt;
	}

	public PreparedStatement wPreparedStatement(String sql) {
		PreparedStatement ps = null;
		try {
			Class.forName("org.h2.Driver");
			Connection conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
			ps = conn.prepareStatement(sql);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return ps;
	}
}
//WORKING