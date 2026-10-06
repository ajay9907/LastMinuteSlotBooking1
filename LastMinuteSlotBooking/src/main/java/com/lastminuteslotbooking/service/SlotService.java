package com.lastminuteslotbooking.service;

import java.time.LocalDateTime;
import java.util.List;
import com.lastminuteslotbooking.dao.SlotDAO;
import com.lastminuteslotbooking.daoimpl.SlotDAOImpl;
import com.lastminuteslotbooking.model.Slot;

public class SlotService {
    private final SlotDAO slotDAO = new SlotDAOImpl();

    public boolean addSlot(Slot slot) {
        return isValid(slot) && slotDAO.addSlot(slot);
    }

    public boolean updateSlot(Slot slot) {
        return slot != null && slot.getId() > 0 && isValid(slot) && slotDAO.updateSlot(slot);
    }

    private boolean isValid(Slot slot) {
        return slot != null && slot.getEventName() != null && !slot.getEventName().trim().isEmpty()
            && slot.getLocation() != null && !slot.getLocation().trim().isEmpty()
            && slot.getSlotTime() != null && slot.getSlotTime().isAfter(LocalDateTime.now())
            && slot.getDuration() > 0 && slot.getDuration() <= 1440 && slot.getPrice() >= 0;
    }

    public List<Slot> getAvailableSlots() { return slotDAO.getAvailableSlots(); }
    public List<Slot> searchAvailableSlots(String keyword, String location) { return slotDAO.searchAvailableSlots(keyword, location); }
    public List<Slot> getAllSlots() { return slotDAO.getAllSlots(); }
    public Slot getSlotById(int id) { return id > 0 ? slotDAO.getSlotById(id) : null; }
    public boolean updateAvailability(int id, boolean available) { return id > 0 && slotDAO.updateAvailability(id, available); }
    public boolean deleteSlot(int id) { return id > 0 && slotDAO.deleteSlot(id); }
}
