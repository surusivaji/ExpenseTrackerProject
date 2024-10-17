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

@WebServlet("/updateExpense")
public class UpdateExpense extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String temp = request.getParameter("expenseid");
		int expenseId = Integer.parseInt(temp);
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String price = request.getParameter("price");
		
		User user = (User) session.getAttribute("user");
		
		IExpenseDao dao = new IExpenseDaoImpl();
		Expense expense = dao.getExpenseByExpenseId(expenseId);
		if (expense!=null) {
			System.out.println(expense);
			expense.setExpenseid(expenseId);
			expense.setTitle(title);
			expense.setDate(date);
			expense.setTime(time);
			expense.setDescription(description);
			expense.setPrice(price);
			expense.setUser(user);
			int updateExpense = dao.updateExpense(expense);
			if (updateExpense!=0) {
				System.out.println(expense);
				session.setAttribute("updateInfo", "Expense successfully updated");
				response.sendRedirect("viewExpense.jsp");
			}
			else {
				session.setAttribute("updateInfo", "something went wrong");
				response.sendRedirect("viewExpense.jsp");
			}
		}
		else {
			session.setAttribute("updateInfo", "user not found");
			response.sendRedirect("viewExpense.jsp");
		}
		
		
	}
	
}
