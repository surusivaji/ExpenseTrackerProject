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

@WebServlet("/updateUser")
public class UpdateUser extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String temp = request.getParameter("userid");
		int userid = Integer.parseInt(temp);
		String fullName = request.getParameter("fullName");
		String mobileNumber = request.getParameter("mobileNumber");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String about = request.getParameter("about");
		
		User user = new User();
		user.setUserid(userid);
		user.setFullName(fullName);
		user.setMobileNumber(mobileNumber);
		user.setEmail(email);
		user.setPassword(password);
		user.setAbout(about);
		
		HttpSession session = request.getSession();
		
		IUserDao dao = new IUserDaoImpl();
		boolean isUpdated = dao.updateUser(user, userid);
		if (isUpdated) {
			System.out.println(true);
			session.setAttribute("user", user);
			session.setAttribute("userUpdationSuccess", "Your Account Updated Successfully Completed");
			response.sendRedirect("displayUser.jsp");
		}
		else {
			session.setAttribute("userUpationFail", "Something Went Wrong");
			response.sendRedirect("editUser.jsp");
		}
		
	}

}
