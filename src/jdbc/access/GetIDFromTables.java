package jdbc.access;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class GetIDFromTables {

	GetConnection getConnection = new GetConnection();

	
	public int getIdStudent(String name, String grade) {
		int i = 0;
		String sql = "select * from catalog.student where name=? and grade=?";
		PreparedStatement ps = getConnection.wPreparedStatement(sql);
		try {
			ps.setString(1, name);
			ps.setString(2, grade);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i = rs.getInt("id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return i;
	}
	
	public int getIdFromStudent_Discipline(int id_student, int id_discipline) {
		int i = 0;
	
		String sql = "select * from catalog.student_discipline sd where sd.id_student=? and sd.id_discipline=?";
		PreparedStatement ps = getConnection.wPreparedStatement(sql);
		try {
			ps.setInt(1, id_student);
			ps.setInt(2, id_discipline);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				i = rs.getInt("id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return i;
	}
	
	public int getIdFromDisciplineByTeacher(String teacher, String grade, String discipline) {
		int i = 0;
		
		String sql = "select * from catalog.disciplines where grade=? and teacher=? and discipline=?";
		PreparedStatement ps = getConnection.wPreparedStatement(sql);
		try {
			ps.setString(1, grade);
			ps.setString(2, teacher);
			ps.setString(3, discipline);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				i = rs.getInt("id");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return i;
	}
	
	public List<Integer> getIdListByGrade(String grade, String tabel) {
		
		String sql = "select * from " + tabel + " where grade=?";
		List<Integer> ids = new ArrayList<Integer>();
		PreparedStatement ps = getConnection.wPreparedStatement(sql);
		try {
			ps.setString(1, grade);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ids.add(rs.getInt("id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ids;
	}
	
	public List<Integer> getIdsFromMarks(int id_student) {
		String sql = "select m.id from catalog.student s, catalog.student_discipline sd, catalog.marks m where s.id=sd.id_student and m.id_student_discipline=sd.id and s.id=?";
		PreparedStatement ps = getConnection.wPreparedStatement(sql);
		List<Integer> ids = new ArrayList<Integer>();
		try {
			ps.setInt(1, id_student);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				ids.add(rs.getInt("id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ids;
	}
	
	public String getField(String table, String whereColumn, String whereField, String requestedField) {
		String s = "";
		String sql = "select * from " + table + " where " + whereColumn + "='" + whereField + "'";
		Statement st = getConnection.wStatement();
		try {
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
			s =	rs.getString(requestedField);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return s;
	}
}
