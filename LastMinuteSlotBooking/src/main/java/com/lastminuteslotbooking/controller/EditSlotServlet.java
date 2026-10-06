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

@WebServlet("/edit-slot")
@MultipartConfig(maxFileSize = 2 * 1024 * 1024, maxRequestSize = 3 * 1024 * 1024)
public class EditSlotServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final SlotService slotService = new SlotService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!isAdmin(request)) { response.sendRedirect("login.jsp"); return; }
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            Slot slot = slotService.getSlotById(id);
            if (slot == null) { response.sendRedirect("admin"); return; }
            request.setAttribute("slot", slot);
            request.getRequestDispatcher("edit-slot.jsp").forward(request, response);
        } catch (NumberFormatException e) { response.sendRedirect("admin"); }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!isAdmin(request)) { response.sendRedirect("login.jsp"); return; }
        try {
            Slot slot = new Slot();
            slot.setId(Integer.parseInt(request.getParameter("id")));
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
            } else if (imageUrl != null && !imageUrl.isEmpty()) {
                // URL was supplied, so use it instead of an older uploaded image.
                slot.setImageData(new byte[0]);
                slot.setImageContentType(null);
            }
            if (slotService.updateSlot(slot)) response.sendRedirect("admin?updated=1");
            else response.sendRedirect("edit-slot?id=" + slot.getId() + "&error=1");
        } catch (Exception e) { response.sendRedirect("admin?error=1"); }
    }

    private boolean isAllowedImage(String type) {
        return "image/jpeg".equalsIgnoreCase(type) || "image/png".equalsIgnoreCase(type)
                || "image/gif".equalsIgnoreCase(type) || "image/webp".equalsIgnoreCase(type);
    }

    private boolean isAdmin(HttpServletRequest request) {
        HttpSession s = request.getSession(false);
        return s != null && s.getAttribute("user") != null && "ADMIN".equalsIgnoreCase(String.valueOf(s.getAttribute("role")));
    }
}
