package org.siva.expensiontracker.dao;

import org.siva.expensiontracker.model.User;

public interface IUserDao {
	boolean saveUser(User user);
	User userLogin(String email, String password);
	String checkEmailAndMobileNumber(String email, String mobileNumber);
	int changePassword(String email, String password);
	boolean updateUser(User user, int id);
	boolean deleteUser(int userid);
}
