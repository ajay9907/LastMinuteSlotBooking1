package com.lastminuteslotbooking.controller;

import java.io.IOException;
import java.util.List;
import com.lastminuteslotbooking.model.Slot;
import com.lastminuteslotbooking.service.SlotService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/slots")
public class SlotServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final SlotService slotService = new SlotService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) { response.sendRedirect("login.jsp"); return; }
        String keyword = request.getParameter("keyword");
        String location = request.getParameter("location");
        List<Slot> slots = slotService.searchAvailableSlots(keyword, location);
        request.setAttribute("slots", slots);
        request.setAttribute("keyword", keyword == null ? "" : keyword);
        request.setAttribute("location", location == null ? "" : location);
        request.getRequestDispatcher("slots.jsp").forward(request, response);
    }
}
