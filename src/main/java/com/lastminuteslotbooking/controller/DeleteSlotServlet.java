package com.lastminuteslotbooking.controller;

import java.io.IOException;
import com.lastminuteslotbooking.service.SlotService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete-slot")
public class DeleteSlotServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final SlotService slotService = new SlotService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession s = request.getSession(false);
        if (s == null || s.getAttribute("user") == null) { response.sendRedirect("login.jsp"); return; }
        if (!"ADMIN".equalsIgnoreCase(String.valueOf(s.getAttribute("role")))) { response.sendRedirect("slots"); return; }
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            boolean deleted = slotService.deleteSlot(id);
            response.sendRedirect("admin?deleted=" + (deleted ? "1" : "0"));
        } catch (NumberFormatException e) { response.sendRedirect("admin?deleted=0"); }
    }
}
