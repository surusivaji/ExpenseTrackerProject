package org.siva.expensiontracker.dao;

import java.util.List;

import org.siva.expensiontracker.model.Expense;
import org.siva.expensiontracker.model.User;

public interface IExpenseDao {
	boolean addExpense(Expense expense);
	List<Expense> getExpensesByUser(User user);
	Expense getExpenseByExpenseId(int expenseid);
	int updateExpense(Expense expense);
	boolean deleteExpense(int expenseId);
}
