package ro.web.catalog;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdbc.access.AddRemoveAbsence;
import jdbc.access.GetIDFromTables;

@WebServlet("/AddRemoveAbsencesServlet")
public class AddRemoveAbsencesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	AddRemoveAbsence addRemoveAbsence = new AddRemoveAbsence();
	GetIDFromTables ids = new GetIDFromTables();

	public AddRemoveAbsencesServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String action = request.getParameter("actions");
		String studentName = request.getParameter("studentName");
		String grade = request.getParameter("grade");
		String teacher = (String) session.getAttribute("username");
		String date = request.getParameter("date");
		String discipline = ids.getField("catalog.disciplines", "teacher", teacher, "discipline");
		
		if (action != null) {
			if (action.equalsIgnoreCase("Add")) {
				addRemoveAbsence.addAbsence(studentName, grade, teacher, discipline, date);
			} else if (action.equalsIgnoreCase("Delete")) {
				addRemoveAbsence.removeAbsence(studentName, grade, teacher, discipline, date);
			}
		}
		
		response.sendRedirect("addRemoveAbsence2.jsp");
	}

}
