package com.lastminuteslotbooking.controller;

import java.io.IOException;

import com.lastminuteslotbooking.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/role")
public class RoleServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		// Check login
		if (session == null || session.getAttribute("user") == null) {
			response.sendRedirect("login.jsp");
			return;
		}

		User user = (User) session.getAttribute("user");

		String selectedRole = request.getParameter("selectedRole");

		// USER option
		if ("USER".equalsIgnoreCase(selectedRole)) {

			response.sendRedirect("slots");
			return;
		}

		// ADMIN option
		if ("ADMIN".equalsIgnoreCase(selectedRole)) {

			// Check actual database role
			if ("ADMIN".equalsIgnoreCase(user.getRole())) {

				response.sendRedirect("admin");

			} else {

				response.getWriter().println("<h2>Access Denied</h2>"
						+ "<p>You are not authorized to access the Admin panel.</p>" + "<a href='role.jsp'>Back</a>");
			}

			return;
		}

		response.sendRedirect("role.jsp");
	}
}