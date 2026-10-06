package com.lastminuteslotbooking.controller;

import java.io.IOException;
import java.util.List;

import com.lastminuteslotbooking.model.Claim;
import com.lastminuteslotbooking.model.User;
import com.lastminuteslotbooking.service.ClaimService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/my-claims")
public class MyClaimsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private ClaimService claimService = new ClaimService();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("user") == null) {
			response.sendRedirect("login.jsp");
			return;
		}

		User user = (User) session.getAttribute("user");

		List<Claim> claims = claimService.getClaimsByUserId(user.getId());

		request.setAttribute("claims", claims);

		request.getRequestDispatcher("my-claims.jsp").forward(request, response);
	}
}