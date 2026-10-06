package com.lastminuteslotbooking.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import com.lastminuteslotbooking.model.Slot;
import com.lastminuteslotbooking.service.SlotService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.Part;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/add-slot")
@MultipartConfig(maxFileSize = 2 * 1024 * 1024, maxRequestSize = 3 * 1024 * 1024)
public class AddSlotServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final SlotService slotService = new SlotService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) { response.sendRedirect("login.jsp"); return; }
        if (!"ADMIN".equalsIgnoreCase(String.valueOf(session.getAttribute("role")))) { response.sendRedirect("slots"); return; }
        try {
            Slot slot = new Slot();
            slot.setEventName(request.getParameter("eventName"));
            slot.setLocation(request.getParameter("location"));
            slot.setSlotTime(LocalDateTime.parse(request.getParameter("slotTime")));
            slot.setDuration(Integer.parseInt(request.getParameter("duration")));
            slot.setPrice(Double.parseDouble(request.getParameter("price")));
            String imageUrl = request.getParameter("imageUrl");
            if (imageUrl != null) imageUrl = imageUrl.trim();
            if (imageUrl != null && !imageUrl.isEmpty() && !(imageUrl.startsWith("https://") || imageUrl.startsWith("http://"))) throw new IllegalArgumentException("Image URL must be http(s)");
            slot.setImageUrl(imageUrl == null ? "" : imageUrl);
            Part imagePart = request.getPart("imageFile");
            if (imagePart != null && imagePart.getSize() > 0) {
                String contentType = imagePart.getContentType();
                if (!isAllowedImage(contentType)) throw new IllegalArgumentException("Only JPG, PNG, GIF and WEBP images are allowed");
                slot.setImageData(imagePart.getInputStream().readAllBytes());
                slot.setImageContentType(contentType);
            }
            slot.setAvailable(true);
            slot.setCreatedBy((int) session.getAttribute("userId"));
            response.sendRedirect(slotService.addSlot(slot) ? "admin?added=1" : "add-slot.jsp?error=1");
        } catch (Exception e) { response.sendRedirect("add-slot.jsp?error=1"); }
    }

    private boolean isAllowedImage(String type) {
        return "image/jpeg".equalsIgnoreCase(type) || "image/png".equalsIgnoreCase(type)
                || "image/gif".equalsIgnoreCase(type) || "image/webp".equalsIgnoreCase(type);
    }
}
