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
import org.siva.expensiontracker.model.User;

@WebServlet("/userRegistration")
public class UserRegistration extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String fullName = request.getParameter("fullName");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String about = request.getParameter("about");
		String mobileNumber = request.getParameter("mobileNumber");
		
		User user = new User();
		user.setFullName(fullName);
		user.setEmail(email);
		user.setPassword(password);
		user.setAbout(about);
		user.setMobileNumber(mobileNumber);
		
		IUserDao dao = new IUserDaoImpl();
		boolean save = dao.saveUser(user);
		
		HttpSession session = request.getSession();
				
		if (save) {	
			session.setAttribute("msgSuccess", "Registration successfully completed");
			response.sendRedirect("register.jsp");
		}
		else {
			session.setAttribute("msgFail", "Something went wrong");
			response.sendRedirect("register.jsp");
		}
		
	}

}
