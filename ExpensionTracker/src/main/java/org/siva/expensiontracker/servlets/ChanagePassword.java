package org.siva.expensiontracker.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.siva.expensiontracker.dao.IUserDao;
import org.siva.expensiontracker.dao.IUserDaoImpl;

@WebServlet("/changePassword")
public class ChanagePassword extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String newPassword = request.getParameter("newPassword");
		String confirmPassword = request.getParameter("confirmPassword");
		
		HttpSession session = request.getSession();
		
		if (newPassword.equals(confirmPassword)) {
			String email = (String) session.getAttribute("emailID");
			IUserDao dao = new IUserDaoImpl();
			int changePassword = dao.changePassword(email, confirmPassword);
			if (changePassword!=0) {
				session.setAttribute("passwordSuccess", "Your Pasword Updated Successfully");
				response.sendRedirect("login.jsp");
			}
			else {
				session.setAttribute("passwordFail", "Something Went Wrong");
				response.sendRedirect("forgetPassword1.jsp");
			}
		}
		else {
			session.setAttribute("passwordFail", "New password and Confirm password most be same");
			response.sendRedirect("forgetPassword1.jsp");
		}
		
	}
	
	
}
