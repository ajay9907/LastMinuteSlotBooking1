package com.lastminuteslotbooking.controller;

import java.io.IOException;

import com.lastminuteslotbooking.model.User;
import com.lastminuteslotbooking.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private UserService userService = new UserService();

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		User user = userService.loginUser(email, password);

		if (user != null) {

			HttpSession session = request.getSession();

			session.setAttribute("user", user);
			session.setAttribute("userId", user.getId());
			session.setAttribute("role", user.getRole());

			// Go through SlotServlet to load available slots
			response.sendRedirect("role.jsp");
		} else {

			response.getWriter().println("Invalid email or password.");
		}
	}
}