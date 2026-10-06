package com.lastminuteslotbooking.service;

import com.lastminuteslotbooking.dao.UserDAO;
import com.lastminuteslotbooking.daoimpl.UserDAOImpl;
import com.lastminuteslotbooking.model.User;

public class UserService {

	private UserDAO userDAO;

	public UserService() {
		userDAO = new UserDAOImpl();
	}

	public boolean registerUser(User user) {

		if ((user == null) || user.getName() == null || user.getName().trim().isEmpty()) {
			return false;
		}

		if (user.getEmail() == null || user.getEmail().trim().isEmpty() || user.getPassword() == null || user.getPassword().trim().isEmpty()) {
			return false;
		}

		if (user.getRole() == null || user.getRole().trim().isEmpty()) {
			user.setRole("USER");
		}

		return userDAO.registerUser(user);
	}

	public User loginUser(String email, String password) {

		if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
			return null;
		}

		return userDAO.loginUser(email, password);
	}

	public User getUserById(int id) {

		if (id <= 0) {
			return null;
		}

		return userDAO.getUserById(id);
	}
}