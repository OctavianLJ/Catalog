package ro.web.catalog;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdbc.access.AddModifyDeleteMark;
import jdbc.access.GetIDFromTables;

@WebServlet("/AddModifyDeleteMarkServlet")
public class AddModifyDeleteMarkServlet extends HttpServlet {

	GetIDFromTables ids = new GetIDFromTables();
	AddModifyDeleteMark addModifyDeleteMark = new AddModifyDeleteMark();

	private static final long serialVersionUID = 1L;

	public AddModifyDeleteMarkServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String action = request.getParameter("actions");
		String teacher = (String) session.getAttribute("username");
		String discipline = request.getParameter("discipline");
		String studentName = request.getParameter("studentName");
		double studentMark = Double.parseDouble(request.getParameter("studentMark"));
		double newMark = 0;
		String grade = request.getParameter("grade");
		String date = request.getParameter("date");
		if ((studentMark < 1) || (studentMark > 10)) {
			request.setAttribute("message", "Only digits from 1 to 10 are allowed!");
			request.getRequestDispatcher("addModifyDeleteMarkForm2.jsp").forward(request, response);
		} else {
			if (action != null) {
				if (action.equalsIgnoreCase("Add")) {
					addModifyDeleteMark.addMark(studentName, teacher, grade, discipline, studentMark, date);
				} else if (action.equalsIgnoreCase("Modify")) {
					newMark = Double.parseDouble(request.getParameter("newMark"));
					addModifyDeleteMark.modifyMark(studentName, grade, teacher, discipline, studentMark, newMark, date);
				} else if (action.equalsIgnoreCase("Delete")) {
					addModifyDeleteMark.deleteMark(studentName, grade, teacher, discipline, studentMark, date);
				}
			}
		}
		response.sendRedirect("addModifyDeleteMarkForm2.jsp");
	}
}
// WORKING