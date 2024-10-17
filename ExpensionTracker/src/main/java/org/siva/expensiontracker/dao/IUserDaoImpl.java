package org.siva.expensiontracker.dao;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.TypedQuery;

import org.siva.expensiontracker.model.User;

public class IUserDaoImpl implements IUserDao {

	@Override
	public boolean saveUser(User user) {
		try {
			EntityManagerFactory factory = Persistence.createEntityManagerFactory("ExpensionTracker");
			EntityManager manager = factory.createEntityManager();
			EntityTransaction transaction = manager.getTransaction();
			transaction.begin();
			manager.persist(user);
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
	public User userLogin(String email, String password) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("ExpensionTracker");
		EntityManager manager = factory.createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		transaction.begin();
		String login = "select user from User user where user.email=:mail and user.password=:password";
		TypedQuery<User> query = manager.createQuery(login, User.class);
		query.setParameter("mail", email);
		query.setParameter("password", password);
		try {
			User user = query.getSingleResult();
			return user;
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public String checkEmailAndMobileNumber(String email, String mobileNumber) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("ExpensionTracker");
		EntityManager manager = factory.createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		transaction.begin();
		String checkEmailAndMobileNumber = "select user from User user where user.email=:email and user.mobileNumber=:mobile";
		TypedQuery<User> query = manager.createQuery(checkEmailAndMobileNumber, User.class);
		query.setParameter("email", email);
		query.setParameter("mobile", mobileNumber);
		try {
			User user = query.getSingleResult();
			return user.getEmail();
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	@Override
	public int changePassword(String email, String password) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("ExpensionTracker");
		EntityManager manager = factory.createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		transaction.begin();
		try {
			String updatePassword = "update User user set user.password=:password where user.email=:email";
			TypedQuery<User> query = manager.createQuery(updatePassword, User.class);
			query.setParameter("password", password);
			query.setParameter("email", email);
			int update = query.executeUpdate();
			transaction.commit();
			manager.close();
			factory.close();
			return update;
		}
		catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	@Override
	public boolean updateUser(User user, int userid) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("ExpensionTracker");
		EntityManager manager = factory.createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		transaction.begin();
		try {
			User updateUser = manager.find(User.class, userid);
			if (updateUser!=null) {
				updateUser.setFullName(user.getFullName());
				updateUser.setEmail(user.getEmail());
				updateUser.setMobileNumber(user.getMobileNumber());
				updateUser.setPassword(user.getPassword());
				updateUser.setAbout(user.getAbout());
				manager.persist(updateUser);
				System.out.println(updateUser);
				transaction.commit();
				manager.close();
				factory.close();
				return true;
			}
			else {
				return false;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Override
	public boolean deleteUser(int userid) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("ExpensionTracker");
		EntityManager manager = factory.createEntityManager();
		EntityTransaction transaction = manager.getTransaction();
		transaction.begin();
		try {
			User user = manager.find(User.class, userid);
			if (user!=null) {
				manager.remove(user);
				transaction.commit();
				manager.close();
				factory.close();
				return true;
			}
			else {
				return false;
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	

}
