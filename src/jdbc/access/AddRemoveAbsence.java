package jdbc.access;

import java.sql.SQLException;
import java.sql.Statement;

public class AddRemoveAbsence {

	GetConnection getConnection = new GetConnection();
	GetIDFromTables ids = new GetIDFromTables();

	public void addAbsence(String name, String grade, String teacher, String discipline, String date) {
//		Date date = Calendar.getInstance().getTime();
//		DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
//		String setDate;
//		formatter = new SimpleDateFormat("EEEE, dd MMMM yyyy", Locale.US);
//		setDate = formatter.format(date);
		
		int studentId = ids.getIdStudent(name, grade);
		int disciplineId = ids.getIdFromDisciplineByTeacher(teacher, grade, discipline);
		int discipline_StudentID = ids.getIdFromStudent_Discipline(studentId, disciplineId);
		String sql = "insert into catalog.absences (id_student_discipline, date) values (" + discipline_StudentID
				+ ", '" + date + "')";
		Statement stm = getConnection.wStatement();
		try {
			stm.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void removeAbsence(String name, String grade, String teacher, String discipline, String date) {

		int studentId = ids.getIdStudent(name, grade);
		int disciplineId = ids.getIdFromDisciplineByTeacher(teacher, grade, discipline);
		int discipline_StudentID = ids.getIdFromStudent_Discipline(studentId, disciplineId);
		String sql = "delete from catalog.absences where id_student_discipline=" + discipline_StudentID + " and date='" + date + "';";
		Statement stm = getConnection.wStatement();
		try {
			stm.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
