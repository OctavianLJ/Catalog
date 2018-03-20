package jdbc.access;

import java.sql.SQLException;
import java.sql.Statement;

public class AddModifyDeleteMark {
	
	GetIDFromTables ids = new GetIDFromTables();
	GetConnection getConnection = new GetConnection();
	
	public void addMark(String name, String teacher, String grade, String discipline, double mark, String date) {
		
//		Date modificationDate = Calendar.getInstance().getTime();
//        DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
//        String setDate;
//        formatter = new SimpleDateFormat("EEEE, dd MMMM yyyy", Locale.US);
//        setDate = formatter.format(modificationDate);
		
        int studentId = ids.getIdStudent(name, grade);
		int disciplineId = ids.getIdFromDisciplineByTeacher(teacher, grade, discipline);
		int discipline_StudentID = ids.getIdFromStudent_Discipline(studentId, disciplineId);
		String sql = "insert into catalog.marks (id_student_discipline, mark, date) values (" + discipline_StudentID + ", " + mark + ", '" + date + "')";
		Statement stm = getConnection.wStatement();
		try {
			stm.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void modifyMark(String name, String grade, String teacher, String discipline, double mark, double newMark, String date) {
		
//		Date todaysDate = Calendar.getInstance().getTime();
//        DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
//        String setDate;
//        formatter = new SimpleDateFormat("EEEE, dd MMMM yyyy", Locale.US);
//        setDate = formatter.format(todaysDate);
		
        int studentId = ids.getIdStudent(name, grade);
		int disciplineId = ids.getIdFromDisciplineByTeacher(teacher, grade, discipline);
		int discipline_StudentID = ids.getIdFromStudent_Discipline(studentId, disciplineId);
		String sql = "update catalog.marks set mark=" + newMark + " where id_student_discipline=" 
		+ discipline_StudentID + " and mark=" + mark + " and date='" + date + "'";
		Statement stm = getConnection.wStatement();
		try {
			stm.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void deleteMark(String name, String grade, String teacher, String discipline, double mark, String date) {
		
		int studentId = ids.getIdStudent(name, grade);
		int disciplineId = ids.getIdFromDisciplineByTeacher(teacher, grade, discipline);
		int discipline_StudentID = ids.getIdFromStudent_Discipline(studentId, disciplineId);
		String sql = "delete from catalog.marks where mark=" + mark + " and id_student_discipline=" + discipline_StudentID + " and date='" + date + "'";
		Statement st = getConnection.wStatement();
		
		try {
			st.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		AddModifyDeleteMark addModifyDeleteMark = new AddModifyDeleteMark();
		addModifyDeleteMark.addMark("Cosmin", "Viorel Mitache", "12th Grade", "IT", 10, "azi");
	}
}

//WORKING