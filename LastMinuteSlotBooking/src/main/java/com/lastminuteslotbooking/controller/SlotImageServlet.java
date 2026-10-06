package com.lastminuteslotbooking.controller;

import java.io.IOException;
import java.io.OutputStream;
import com.lastminuteslotbooking.model.Slot;
import com.lastminuteslotbooking.service.SlotService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/slot-image")
public class SlotImageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final SlotService slotService = new SlotService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Slot slot = slotService.getSlotById(id);
            if (slot == null || slot.getImageData() == null || slot.getImageData().length == 0) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }
            String type = slot.getImageContentType();
            if (type == null || !type.toLowerCase().startsWith("image/")) type = "image/jpeg";
            response.setContentType(type);
            response.setContentLengthLong(slot.getImageData().length);
            response.setHeader("Cache-Control", "public, max-age=86400");
            try (OutputStream out = response.getOutputStream()) { out.write(slot.getImageData()); }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        }
    }
}
