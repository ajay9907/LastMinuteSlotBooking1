package com.lastminuteslotbooking.controller;

import java.io.IOException;
import java.util.List;
import com.lastminuteslotbooking.model.Claim;
import com.lastminuteslotbooking.model.Slot;
import com.lastminuteslotbooking.service.ClaimService;
import com.lastminuteslotbooking.service.SlotService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin")
public class AdminDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final SlotService slotService = new SlotService();
    private final ClaimService claimService = new ClaimService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) { response.sendRedirect("login.jsp"); return; }
        if (!"ADMIN".equalsIgnoreCase(String.valueOf(session.getAttribute("role")))) { response.sendRedirect("slots"); return; }

        List<Slot> slots = slotService.getAllSlots();
        List<Claim> claims = claimService.getAllClaims();
        long available = slots.stream().filter(Slot::isAvailable).count();
        long activeClaims = claims.stream().filter(c -> "CLAIMED".equalsIgnoreCase(c.getStatus())).count();
        request.setAttribute("slots", slots);
        request.setAttribute("claims", claims);
        request.setAttribute("totalSlots", slots.size());
        request.setAttribute("availableSlots", available);
        request.setAttribute("bookedSlots", slots.size() - available);
        request.setAttribute("totalClaims", claims.size());
        request.setAttribute("activeClaims", activeClaims);
        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }
}
