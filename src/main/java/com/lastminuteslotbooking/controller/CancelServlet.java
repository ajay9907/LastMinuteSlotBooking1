package com.lastminuteslotbooking.controller;

import java.io.IOException;

import com.lastminuteslotbooking.model.Claim;
import com.lastminuteslotbooking.model.User;
import com.lastminuteslotbooking.service.ClaimService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cancel")
public class CancelServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	private ClaimService claimService;

	@Override
	public void init() throws ServletException {
		claimService = new ClaimService();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);

		if (session == null || session.getAttribute("user") == null) {
			response.sendRedirect("login.jsp");
			return;
		}

		User user = (User) session.getAttribute("user");

		String claimIdParameter = request.getParameter("claimId");

		if (claimIdParameter == null || claimIdParameter.trim().isEmpty()) {

			response.getWriter().println("Claim ID is required.");
			return;
		}

		int claimId;
		try { claimId = Integer.parseInt(claimIdParameter); } catch (NumberFormatException e) { response.getWriter().println("Invalid claim ID."); return; }

		Claim claim = claimService.getClaimById(claimId);

		if (claim == null) {
			response.getWriter().println("Claim not found.");
			return;
		}

		if (claim.getUserId() != user.getId()) {
			response.getWriter().println("You are not authorized to cancel this claim.");
			return;
		}

		if (!"CLAIMED".equalsIgnoreCase(claim.getStatus())) {
			response.getWriter().println("This claim is already cancelled.");
			return;
		}

		boolean cancelled = claimService.cancelClaim(claimId);

		if (cancelled) {

			response.sendRedirect("my-claims");

		} else {

			response.getWriter().println("Unable to cancel the claim.");
		}
	}
}