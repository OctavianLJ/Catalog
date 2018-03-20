package ro.web.catalog;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdbc.access.CheckCharacters;
import jdbc.access.GetConnection;
import jdbc.access.GetIDFromTables;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	GetConnection getConnection = new GetConnection();
	GetIDFromTables getPassword = new GetIDFromTables();
	CheckCharacters checkCharacters = new CheckCharacters();

	public ChangePasswordServlet() {
		super();

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		String existingPassword = request.getParameter("password");
		String newPassword = request.getParameter("newPassword");
		String confirmNewPassword = request.getParameter("confirmNewPassword");
		String dataBasePassword = getPassword.getField("catalog.login", "username", username, "password");
		List<String> errorList = new ArrayList<String>();
		boolean passwordIsValid = false;
		passwordIsValid = checkCharacters.passwordIsValid(newPassword, confirmNewPassword, errorList);
		String error = "";
		if (!errorList.isEmpty()) {
			error = errorList.get(0);
		}

		if (dataBasePassword != null && existingPassword.equals(dataBasePassword)) {
			if (passwordIsValid) {
				String sql = "update catalog.login set password=? where username=? and password=?";
				PreparedStatement ps = getConnection.wPreparedStatement(sql);
				try {
					ps.setString(1, newPassword);
					ps.setString(2, username);
					ps.setString(3, existingPassword);
					ps.executeUpdate();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				request.setAttribute("message", "Your password was changed successfully!");
				request.getRequestDispatcher("changePassword2.jsp").forward(request, response);
			} else {
				if (error != null) {
					request.setAttribute("message2", error);
					}
					request.getRequestDispatcher("changePassword2.jsp").forward(request, response);
			}
		} else {
				request.setAttribute("message2", "The existing password is incorrect!");
				request.getRequestDispatcher("changePassword2.jsp").forward(request, response);
		}
		System.out.println(dataBasePassword);
		System.out.println(username);
	}

}
