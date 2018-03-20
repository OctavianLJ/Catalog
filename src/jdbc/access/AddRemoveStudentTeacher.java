package jdbc.access;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AddRemoveStudentTeacher {

	GetIDFromTables ids = new GetIDFromTables();
	GetConnection getConnection = new GetConnection();

	public boolean addStudent(String name, String pass, String grade, String userRole) {
		boolean clone = false;
		String getUsername = "";
		String getRole = "";
		List<String> getGrade = new ArrayList<String>();
		List<Integer> disciplineIdBasedOnGrade = null;
		String getField = "select * from catalog.login l, catalog.student s " + " where l.username=? and s.name=?";
		String addInStudent_Discipline = "";
		String student = "";
		PreparedStatement ps = getConnection.wPreparedStatement(getField);
		try {
			ps.setString(1, name);
			ps.setString(2, name);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				getUsername = rs.getString("username");
				getRole = rs.getString("user_type");
				getGrade.add(rs.getString("grade"));
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		if ((!getUsername.equals("") && getUsername.equals(name)) && (!getRole.equals("") && getRole.equals(userRole))
				&& (getGrade != null && getGrade.contains(grade))) {
			clone = true;
		} else if ((!getUsername.equals("") && getUsername.equals(name))
				&& (!getRole.equals("") && getRole.equals(userRole))) {
			disciplineIdBasedOnGrade = ids.getIdListByGrade(grade, "catalog.disciplines");
			student = "insert into catalog.student (name, grade) values ('" + name + "', '" + grade + "')";
			Statement st = getConnection.wStatement();

			try {
				st.executeUpdate(student);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			int studentId = ids.getIdStudent(name, grade);
			for (int id : disciplineIdBasedOnGrade) {
				addInStudent_Discipline = "insert into catalog.student_discipline (id_student, id_discipline) values ("
						+ studentId + ", " + id + ")";

				try {
					st.executeUpdate(addInStudent_Discipline);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		} else {
			disciplineIdBasedOnGrade = ids.getIdListByGrade(grade, "catalog.disciplines");
			student = "insert into catalog.student (name, grade) values ('" + name + "', '" + grade + "')";
			String login = "insert into catalog.login (username, password, user_type) values ('" + name + "', '" + pass
					+ "', '" + userRole + "')";
			Statement st = getConnection.wStatement();

			try {
				st.executeUpdate(student);
				st.executeUpdate(login);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			int studentId = ids.getIdStudent(name, grade);

			for (int id : disciplineIdBasedOnGrade) {
				addInStudent_Discipline = "insert into catalog.student_discipline (id_student, id_discipline) values ("
						+ studentId + ", " + id + ")";

				try {
					st.executeUpdate(addInStudent_Discipline);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		return clone;
	}

	public void removeStudent(String name, String grade) {
		int studentID = ids.getIdStudent(name, grade);
		List<Integer> idMarksList = ids.getIdsFromMarks(studentID);

		String delete = "delete from catalog.student_discipline where id_student=" + studentID
				+ "; delete from catalog.student where id=" + studentID + "; delete from catalog.login where username='"
				+ name + "'";
		Statement st = getConnection.wStatement();
		try {
			for (int i : idMarksList) {
				st.executeUpdate("delete from catalog.marks where id=" + i);
			}
			st.executeUpdate(delete);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public boolean addTeacher(String name, String pass, String discipline, String grade, String userRole) {
		boolean clone = false;
		List<String> getTeacher = new ArrayList<String>();
		List<String> getGrade = new ArrayList<String>();
		List<String> getUsername = new ArrayList<String>();
		List<String> getDiscipline = new ArrayList<String>();
		List<Integer> idStudents = null;
		int disciplineIdByTeacher = 0;
		String addTeacher = "";
		String login = "";
		String addInStudent_Discipline = "";
		String getField = "select * from catalog.login l, catalog.disciplines d "
				+ " where l.username=? and l.user_type=? and d.teacher=? or d.teacher='vacant'";
		Statement st = getConnection.wStatement();
		PreparedStatement ps = getConnection.wPreparedStatement(getField);
		try {
			ps.setString(1, name);
			ps.setString(2, userRole);
			ps.setString(3, name);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				getUsername.add(rs.getString("username"));
				getTeacher.add(rs.getString("teacher"));
				getDiscipline.add(rs.getString("discipline"));
				getGrade.add(rs.getString("grade"));
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		if ((getTeacher != null && getTeacher.contains(name) && !getTeacher.contains("vacant"))
				&& (getDiscipline != null && getDiscipline.contains(discipline))
				&& (getGrade != null && getGrade.contains(grade))) {
			clone = true;
		} else if ((getTeacher != null && getTeacher.contains(name) && !getTeacher.contains("vacant"))) {
			addTeacher = "insert into catalog.disciplines (grade, discipline, teacher) " + "values ('" + grade + "', '"
					+ discipline + "', '" + name + "')";
			st = getConnection.wStatement();
			try {
				st.executeUpdate(addTeacher);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			disciplineIdByTeacher = ids.getIdFromDisciplineByTeacher(name, grade, discipline);
			idStudents = ids.getIdListByGrade(grade, "catalog.student");
			for (int i : idStudents) {
				addInStudent_Discipline = "insert into catalog.student_discipline (id_student, id_discipline) values ("
						+ i + ", " + disciplineIdByTeacher + ")";

				try {
					st.executeUpdate(addInStudent_Discipline);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		} else if ((getDiscipline != null && getDiscipline.contains(discipline))
				&& (getGrade != null && getGrade.contains(grade))
				&& (getTeacher != null && getTeacher.contains("vacant"))) {
			addTeacher = "update catalog.disciplines set teacher='" + name + "' where teacher='vacant' and grade='"
					+ grade + "' and discipline='" + discipline + "';";
			login = "insert into catalog.login (username, password, user_type) " + "values ('" + name + "', '" + pass
					+ "', '" + userRole + "')";
			st = getConnection.wStatement();
			try {
				st.executeUpdate(addTeacher);
				st.executeUpdate(login);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {

			addTeacher = "insert into catalog.disciplines (grade, discipline, teacher) " + "values ('" + grade + "', '"
					+ discipline + "', '" + name + "')";
			login = "insert into catalog.login (username, password, user_type) " + "values ('" + name + "', '" + pass
					+ "', '" + userRole + "')";
			st = getConnection.wStatement();
			try {
				st.executeUpdate(addTeacher);
				st.executeUpdate(login);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			disciplineIdByTeacher = ids.getIdFromDisciplineByTeacher(name, grade, discipline);
			idStudents = ids.getIdListByGrade(grade, "catalog.student");
			for (int i : idStudents) {
				addInStudent_Discipline = "insert into catalog.student_discipline (id_student, id_discipline) values ("
						+ i + ", " + disciplineIdByTeacher + ")";

				try {
					st.executeUpdate(addInStudent_Discipline);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return clone;
	}

	public void removeTeacher(String teacher, String grade, String discipline) {

		String getUsername = "";
		String getField = "select * from catalog.disciplines where teacher=?";
		PreparedStatement ps = getConnection.wPreparedStatement(getField);
		try {
			ps.setString(1, teacher);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				getUsername = rs.getString("teacher");
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		String sql = "update catalog.disciplines set teacher='vacant' where teacher='" + teacher + "' and grade='"
				+ grade + "' and discipline='" + discipline + "' " + "; ";

		Statement st = getConnection.wStatement();

		try {
			st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (getUsername == null) {
			String deleteLogin = "delete from catalog.login where username='" + teacher + "';";
			st = getConnection.wStatement();

			try {
				st.executeUpdate(deleteLogin);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}

// WORKING
