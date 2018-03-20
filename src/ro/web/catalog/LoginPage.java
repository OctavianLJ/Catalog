package ro.web.catalog;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ro.web.dao.LoginDAO;

@WebServlet("/LoginPage")
public class LoginPage extends HttpServlet {

	LoginDAO login = new LoginDAO();
	//CheckCharacters checkCharacters = new CheckCharacters();
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
	//	boolean isSpecialCharacter = checkCharacters.checkForSpecialCharacter(username);

//		if (isSpecialCharacter) {
//			request.setAttribute("message", "Only letters and numbers are allowed!");
//			request.getRequestDispatcher("login.jsp").forward(request, response);
//		} else {
			try {
				if (login.checkDetails(username, password)) {

					HttpSession session = request.getSession();
					session.setAttribute("username", username);

					if (login.checkCredentials(username).equalsIgnoreCase("Teacher")) {

						response.sendRedirect("teacherPage.jsp");

					} else if (login.checkCredentials(username).equalsIgnoreCase("Student")) {

						response.sendRedirect("studentPage.jsp");
					} else if (login.checkCredentials(username).equalsIgnoreCase("Admin")) {
						response.sendRedirect("adminPage.jsp");
					}
				} else {
					request.setAttribute("message", "Invalid Account!");
					request.getRequestDispatcher("login2.jsp").forward(request, response);
				}
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}
	}
//}
// WORKING