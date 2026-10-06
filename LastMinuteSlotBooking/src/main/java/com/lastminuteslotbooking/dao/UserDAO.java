package com.lastminuteslotbooking.dao;

import com.lastminuteslotbooking.model.User;

public interface UserDAO {

	boolean registerUser(User user);

	User loginUser(String email, String password);

	User getUserById(int id);
}