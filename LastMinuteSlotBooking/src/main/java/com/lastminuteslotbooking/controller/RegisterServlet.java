package com.lastminuteslotbooking.controller;

import java.io.IOException;

import com.lastminuteslotbooking.model.User;
import com.lastminuteslotbooking.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private UserService userService;

	@Override
	public void init() throws ServletException {
		userService = new UserService();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		User user = new User();

		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		user.setRole("USER");

		boolean registered = userService.registerUser(user);

		if (registered) {

			response.sendRedirect("login.jsp");

		} else {

			response.getWriter().println("Registration failed. Please try again.");
		}
	}
}