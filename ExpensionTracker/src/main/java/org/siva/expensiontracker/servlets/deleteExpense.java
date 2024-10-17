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

@WebServlet("/deleteExpense")
public class deleteExpense extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = request.getParameter("expenseid");
		int expenseid = Integer.parseInt(id);
		IExpenseDao dao = new IExpenseDaoImpl();
		boolean deleteExpense = dao.deleteExpense(expenseid);
		if (deleteExpense) {
			session.setAttribute("deleteSuccess", "Expense deleted successfully");
			response.sendRedirect("viewExpense.jsp");
		}
		else {
			session.setAttribute("deleteFail", "Something went wrong");
			response.sendRedirect("viewExpense.jsp");
		}
	}

}
