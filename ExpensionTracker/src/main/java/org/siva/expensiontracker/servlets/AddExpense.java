package org.siva.expensiontracker.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.siva.expensiontracker.dao.IExpenseDao;
import org.siva.expensiontracker.dao.IExpenseDaoImpl;
import org.siva.expensiontracker.model.Expense;
import org.siva.expensiontracker.model.User;

@WebServlet("/addExpense")
public class AddExpense extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		String title = request.getParameter("title");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String description = request.getParameter("description");
		String price = request.getParameter("price");
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		Expense expense = new Expense();
		expense.setTitle(title);
		expense.setDate(date);
		expense.setTime(time);
		expense.setDescription(description);
		expense.setPrice(price);
		expense.setUser(user);
		
		IExpenseDao dao = new IExpenseDaoImpl();
		boolean addExpense = dao.addExpense(expense);
		if (addExpense) {
			session.setAttribute("addSuccess", "Expense added successfully");
			response.sendRedirect("addExpense.jsp");
		}
		else {
			session.setAttribute("addFail", "Something went wrong");
			response.sendRedirect("addExpense.jsp");
		}
		
		
		
	}

}
