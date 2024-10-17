package org.siva.expensiontracker.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import org.siva.expensiontracker.model.Expense;
import org.siva.expensiontracker.model.User;

public class IExpenseDaoImpl implements IExpenseDao {
	
	@Override
	public boolean addExpense(Expense expense) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("ExpensionTracker");
		EntityManager manager = factory.createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		transaction.begin();
		try {
			manager.persist(expense);
			transaction.commit();
			manager.close();
			factory.close();
			return true;
		}
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public List<Expense> getExpensesByUser(User user) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("ExpensionTracker");
		EntityManager manager = factory.createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		transaction.begin();
		String getExpensesByUser = "select expense from Expense expense where expense.user=:user";
		TypedQuery<Expense> query = manager.createQuery(getExpensesByUser, Expense.class);
		query.setParameter("user", user);
		try {
			List<Expense> expenses = query.getResultList();
			return expenses;
		}
		catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public Expense getExpenseByExpenseId(int expenseid) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("ExpensionTracker");
		EntityManager manager = factory.createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		transaction.begin();
		String getExpenseByExpenseId = "select expense from Expense expense where expense.expenseid=:id";
		TypedQuery<Expense> query = manager.createQuery(getExpenseByExpenseId, Expense.class);
		query.setParameter("id", expenseid);
		try {
			Expense expense = query.getSingleResult();
			return expense;
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public int updateExpense(Expense expense) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("ExpensionTracker");
		EntityManager manager = factory.createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		transaction.begin();
		try {
			String updateExpense = "update Expense expense set expense.title=:title, expense.date=:date, expense.time=:time, expense.description=:description, expense.price=:price, expense.user=:user where expense.expenseid=:expenseid";
			Query query = manager.createQuery(updateExpense);
			query.setParameter("expenseid", expense.getExpenseid());
			query.setParameter("title", expense.getTitle());
			query.setParameter("date", expense.getDate());
			query.setParameter("time", expense.getTime());
			query.setParameter("description", expense.getDescription());
			query.setParameter("price", expense.getPrice());
			query.setParameter("user", expense.getUser());
			int executeUpdate = query.executeUpdate();
			transaction.commit();
			manager.close();
			factory.close();
			return executeUpdate;
		}
		catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public boolean deleteExpense(int expenseId) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("ExpensionTracker");
		EntityManager manager = factory.createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		transaction.begin();
		Expense expense = manager.find(Expense.class, expenseId);
		if (expense!=null) {
			System.out.println(expense);
			manager.remove(expense);
			transaction.commit();
			manager.close();
			factory.close();
			return true;
		}
		return false;
	}

}
