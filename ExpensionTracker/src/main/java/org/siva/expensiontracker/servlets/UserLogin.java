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

@WebServlet("/login")
public class UserLogin extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		IUserDao dao = new IUserDaoImpl();
		User user = dao.userLogin(email, password);
		
		HttpSession session = request.getSession();
		
		if (user!=null) {
			session.setAttribute("user", user);
			response.sendRedirect("home.jsp");
		}
		else {
			session.setAttribute("loginInfo", "Invalid Credientails");
			response.sendRedirect("login.jsp");
		}
		
	}
	

}
