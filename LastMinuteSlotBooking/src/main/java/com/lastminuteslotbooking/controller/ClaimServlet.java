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

@WebServlet("/claim")
public class ClaimServlet extends HttpServlet {

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

		String slotIdParameter = request.getParameter("slotId");

		if (slotIdParameter == null || slotIdParameter.trim().isEmpty()) {
			response.getWriter().println("Slot ID is required.");
			return;
		}

		int slotId;
		try { slotId = Integer.parseInt(slotIdParameter); } catch (NumberFormatException e) { response.getWriter().println("Invalid slot ID."); return; }

		Claim claim = new Claim();

		claim.setUserId(user.getId());
		claim.setSlotId(slotId);
		claim.setStatus("CLAIMED");

		boolean claimed = claimService.claimSlot(claim);

		if (claimed) {

			response.sendRedirect("my-claims");

		} else {

			response.getWriter().println("Slot could not be claimed. " + "It may already be booked.");
		}
	}
}