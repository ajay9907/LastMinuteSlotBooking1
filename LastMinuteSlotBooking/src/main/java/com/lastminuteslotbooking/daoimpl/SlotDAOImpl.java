package com.lastminuteslotbooking.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.lastminuteslotbooking.dao.SlotDAO;
import com.lastminuteslotbooking.model.Slot;
import com.lastminuteslotbooking.util.DBConnection;

public class SlotDAOImpl implements SlotDAO {

    private Slot map(ResultSet rs) throws SQLException {
        Slot slot = new Slot();
        slot.setId(rs.getInt("id"));
        slot.setEventName(rs.getString("event_name"));
        slot.setLocation(rs.getString("location"));
        Timestamp ts = rs.getTimestamp("slot_time");
        if (ts != null) slot.setSlotTime(ts.toLocalDateTime());
        slot.setDuration(rs.getInt("duration"));
        slot.setPrice(rs.getDouble("price"));
        slot.setAvailable(rs.getBoolean("is_available"));
        slot.setCreatedBy(rs.getInt("created_by"));
        slot.setImageUrl(rs.getString("image_url"));
        slot.setImageData(rs.getBytes("image_data"));
        slot.setImageContentType(rs.getString("image_content_type"));
        return slot;
    }

    @Override
    public boolean addSlot(Slot slot) {
        String sql = "INSERT INTO slots (event_name, location, slot_time, duration, price, is_available, created_by, image_url, image_data, image_content_type) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection c = DBConnection.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, slot.getEventName());
            ps.setString(2, slot.getLocation());
            ps.setTimestamp(3, Timestamp.valueOf(slot.getSlotTime()));
            ps.setInt(4, slot.getDuration());
            ps.setDouble(5, slot.getPrice());
            ps.setBoolean(6, slot.isAvailable());
            ps.setInt(7, slot.getCreatedBy());
            ps.setString(8, slot.getImageUrl());
            if (slot.getImageData() != null && slot.getImageData().length > 0) ps.setBytes(9, slot.getImageData()); else ps.setNull(9, java.sql.Types.LONGVARBINARY);
            if (slot.getImageContentType() != null) ps.setString(10, slot.getImageContentType()); else ps.setNull(10, java.sql.Types.VARCHAR);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }

    @Override
    public List<Slot> getAvailableSlots() {
        return searchAvailableSlots("", "");
    }

    @Override
    public List<Slot> searchAvailableSlots(String keyword, String location) {
        List<Slot> slots = new ArrayList<>();
        String sql = "SELECT * FROM slots WHERE is_available = TRUE "
                + "AND (? = '' OR LOWER(event_name) LIKE LOWER(CONCAT('%', ?, '%'))) "
                + "AND (? = '' OR LOWER(location) LIKE LOWER(CONCAT('%', ?, '%'))) "
                + "ORDER BY slot_time ASC";
        try (Connection c = DBConnection.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            keyword = keyword == null ? "" : keyword.trim();
            location = location == null ? "" : location.trim();
            ps.setString(1, keyword); ps.setString(2, keyword);
            ps.setString(3, location); ps.setString(4, location);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) slots.add(map(rs));
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return slots;
    }

    @Override
    public List<Slot> getAllSlots() {
        List<Slot> slots = new ArrayList<>();
        String sql = "SELECT * FROM slots ORDER BY slot_time ASC, id DESC";
        try (Connection c = DBConnection.getConnection(); PreparedStatement ps = c.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) slots.add(map(rs));
        } catch (SQLException e) { e.printStackTrace(); }
        return slots;
    }

    @Override
    public Slot getSlotById(int id) {
        String sql = "SELECT * FROM slots WHERE id = ?";
        try (Connection c = DBConnection.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) { if (rs.next()) return map(rs); }
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }

    @Override
    public boolean updateSlot(Slot slot) {
        String sqlWithUploadedImage = "UPDATE slots SET event_name=?, location=?, slot_time=?, duration=?, price=?, image_url=?, image_data=?, image_content_type=? WHERE id=?";
        String sqlWithImageUrl = "UPDATE slots SET event_name=?, location=?, slot_time=?, duration=?, price=?, image_url=?, image_data=NULL, image_content_type=NULL WHERE id=?";
        String sqlKeepImage = "UPDATE slots SET event_name=?, location=?, slot_time=?, duration=?, price=? WHERE id=?";

        try (Connection c = DBConnection.getConnection()) {
            String imageUrl = slot.getImageUrl() == null ? "" : slot.getImageUrl().trim();

            if (slot.getImageData() != null && slot.getImageData().length > 0) {
                try (PreparedStatement ps = c.prepareStatement(sqlWithUploadedImage)) {
                    ps.setString(1, slot.getEventName());
                    ps.setString(2, slot.getLocation());
                    ps.setTimestamp(3, Timestamp.valueOf(slot.getSlotTime()));
                    ps.setInt(4, slot.getDuration());
                    ps.setDouble(5, slot.getPrice());
                    ps.setString(6, imageUrl);
                    ps.setBytes(7, slot.getImageData());
                    ps.setString(8, slot.getImageContentType());
                    ps.setInt(9, slot.getId());
                    return ps.executeUpdate() > 0;
                }
            }

            if (!imageUrl.isEmpty()) {
                try (PreparedStatement ps = c.prepareStatement(sqlWithImageUrl)) {
                    ps.setString(1, slot.getEventName());
                    ps.setString(2, slot.getLocation());
                    ps.setTimestamp(3, Timestamp.valueOf(slot.getSlotTime()));
                    ps.setInt(4, slot.getDuration());
                    ps.setDouble(5, slot.getPrice());
                    ps.setString(6, imageUrl);
                    ps.setInt(7, slot.getId());
                    return ps.executeUpdate() > 0;
                }
            }

            try (PreparedStatement ps = c.prepareStatement(sqlKeepImage)) {
                ps.setString(1, slot.getEventName());
                ps.setString(2, slot.getLocation());
                ps.setTimestamp(3, Timestamp.valueOf(slot.getSlotTime()));
                ps.setInt(4, slot.getDuration());
                ps.setDouble(5, slot.getPrice());
                ps.setInt(6, slot.getId());
                return ps.executeUpdate() > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean updateAvailability(int id, boolean available) {
        String sql = "UPDATE slots SET is_available = ? WHERE id = ?";
        try (Connection c = DBConnection.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setBoolean(1, available); ps.setInt(2, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }

    @Override
    public boolean deleteSlot(int id) {
        String sql = "DELETE FROM slots WHERE id = ?";
        try (Connection c = DBConnection.getConnection(); PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setInt(1, id); return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }
}
