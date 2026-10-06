package com.lastminuteslotbooking.dao;

import java.util.List;
import com.lastminuteslotbooking.model.Slot;

public interface SlotDAO {
    boolean addSlot(Slot slot);
    List<Slot> getAvailableSlots();
    List<Slot> searchAvailableSlots(String keyword, String location);
    List<Slot> getAllSlots();
    Slot getSlotById(int id);
    boolean updateSlot(Slot slot);
    boolean updateAvailability(int id, boolean available);
    boolean deleteSlot(int id);
}
