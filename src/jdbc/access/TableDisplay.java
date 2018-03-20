//package jdbc.access;
//
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//
//public class TableDisplay {
//
//	GetConnection getConnection = new GetConnection();
//
//
//	public String getField(String studentName, String column) {
//		String s = "";
//		String sql = "select name, discipline, mark, teacher from catalog.student s, catalog.disciplines d, catalog.student_discipline sd, catalog.marks m "
//				+ "where s.id=sd.id_student and d.id=sd.id_discipline and sd.id=m.id_student_discipline where s.name=?";
//		PreparedStatement ps = getConnection.wPreparedStatement(sql);
//		try {
//			ps.setString(1, studentName);
//			ResultSet rs = ps.executeQuery();
//			while(rs.next()) {
//				s = rs.getString(column);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}		
//		return s;
//	}
//}

//PREVIOUS ATTEMPT TO GET TABLE FIELDS 