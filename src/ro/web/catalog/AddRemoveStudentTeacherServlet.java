package ro.web.catalog;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.access.AddRemoveStudentTeacher;
import jdbc.access.CheckCharacters;

@WebServlet("/AddRemoveStudentTeacherServlet")
public class AddRemoveStudentTeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AddRemoveStudentTeacher addRemove = new AddRemoveStudentTeacher();
	CheckCharacters checkCharacters = new CheckCharacters();

	public AddRemoveStudentTeacherServlet() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("actions");
		String name = request.getParameter("name");
		String pass = request.getParameter("password");
		String role = request.getParameter("role");
		String discipline = request.getParameter("discipline");
		String grade = request.getParameter("grade");
		boolean isSpecialCharacter = checkCharacters.checkForSpecialCharacter(name);
		
		if (isSpecialCharacter) {
			request.setAttribute("message", "Only letters and numbers are allowed!");
			request.getRequestDispatcher("addRemoveStudentTeacher2.jsp").forward(request, response);
		} else {
			if (action != null) {
				if (action.equalsIgnoreCase("Add")) {
					if (role.equalsIgnoreCase("Student")) {
						boolean isClone = addRemove.addStudent(name, pass, grade, role);
						if (isClone) {
							request.setAttribute("message", "User already exists!");
						}
					} else if (role.equalsIgnoreCase("Teacher")) {
						boolean isClone = addRemove.addTeacher(name, pass, discipline, grade, role);
						if (isClone) {
							request.setAttribute("message", "User already exists!");
						}
					}
				} else if (action.equalsIgnoreCase("Delete")) {
					if (role.equalsIgnoreCase("Student")) {
						addRemove.removeStudent(name, grade);
					} else if (role.equalsIgnoreCase("Teacher")) {
						addRemove.removeTeacher(name, grade, discipline);
					}
				}
			}
		}
		request.getRequestDispatcher("addRemoveStudentTeacher2.jsp").forward(request, response);
	}
}
// WORKING