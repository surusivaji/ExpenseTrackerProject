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

@WebServlet("/deleteUser")
public class DeleteUser extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String temp = request.getParameter("userid");
		int userid = Integer.parseInt(temp);
		
		HttpSession session = request.getSession();
		
		IUserDao dao = new IUserDaoImpl();
		boolean deleteUser = dao.deleteUser(userid);
		if (deleteUser) {
			session.setAttribute("userDeleteSuccess", "Your Account Permently Deleted Successfully");
			response.sendRedirect("login.jsp");
		}
		else {
			session.setAttribute("userDeleteFail", "Something Went Wrong");
			response.sendRedirect("displayUser.jsp");
		}
	}

}
