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

@WebServlet("/Next")
public class GetEmail extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobileNumber");
		
		HttpSession session = request.getSession();
		
		IUserDao dao = new IUserDaoImpl();
		String checkEmailAndMobileNumber = dao.checkEmailAndMobileNumber(email, mobile);
		if (checkEmailAndMobileNumber!=null) {
			session.setAttribute("emailID", email);
			System.out.println(email);
			response.sendRedirect("forgetPassword1.jsp");
		}
		else {
			session.setAttribute("mailError", "Invalid Credientials");
			response.sendRedirect("forgetPassword.jsp");
		}
	}
	
	

}
