package com.lastminuteslotbooking.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lastminuteslotbooking.dao.ClaimDAO;
import com.lastminuteslotbooking.model.Claim;
import com.lastminuteslotbooking.util.DBConnection;

public class ClaimDAOImpl implements ClaimDAO {

    @Override
    public boolean claimSlot(Claim claim) {
        if (claim == null || claim.getUserId() <= 0 || claim.getSlotId() <= 0) return false;

        final String lockSlotSql = "SELECT is_available FROM slots WHERE id = ? FOR UPDATE";
        final String activeClaimSql = "SELECT id FROM claims WHERE user_id = ? AND slot_id = ? AND status = 'CLAIMED' LIMIT 1";
        final String insertClaimSql = "INSERT INTO claims (user_id, slot_id, status) VALUES (?, ?, 'CLAIMED')";
        final String bookSlotSql = "UPDATE slots SET is_available = FALSE WHERE id = ?";

        try (Connection connection = DBConnection.getConnection()) {
            connection.setAutoCommit(false);

            try {
                try (PreparedStatement ps = connection.prepareStatement(lockSlotSql)) {
                    ps.setInt(1, claim.getSlotId());
                    try (ResultSet rs = ps.executeQuery()) {
                        if (!rs.next() || !rs.getBoolean("is_available")) {
                            connection.rollback();
                            return false;
                        }
                    }
                }

                try (PreparedStatement ps = connection.prepareStatement(activeClaimSql)) {
                    ps.setInt(1, claim.getUserId());
                    ps.setInt(2, claim.getSlotId());
                    try (ResultSet rs = ps.executeQuery()) {
                        if (rs.next()) {
                            connection.rollback();
                            return false;
                        }
                    }
                }

                try (PreparedStatement ps = connection.prepareStatement(insertClaimSql)) {
                    ps.setInt(1, claim.getUserId());
                    ps.setInt(2, claim.getSlotId());
                    if (ps.executeUpdate() != 1) {
                        connection.rollback();
                        return false;
                    }
                }

                try (PreparedStatement ps = connection.prepareStatement(bookSlotSql)) {
                    ps.setInt(1, claim.getSlotId());
                    if (ps.executeUpdate() != 1) {
                        connection.rollback();
                        return false;
                    }
                }

                connection.commit();
                return true;
            } catch (SQLException e) {
                try { connection.rollback(); } catch (SQLException ignored) { }
                e.printStackTrace();
                return false;
            } finally {
                try { connection.setAutoCommit(true); } catch (SQLException ignored) { }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean cancelClaim(int claimId) {
        if (claimId <= 0) return false;

        final String lockClaimSql = "SELECT slot_id, status FROM claims WHERE id = ? FOR UPDATE";
        final String cancelSql = "UPDATE claims SET status = 'CANCELLED', cancelled_at = CURRENT_TIMESTAMP WHERE id = ? AND status = 'CLAIMED'";
        final String reopenSlotSql = "UPDATE slots SET is_available = TRUE WHERE id = ? AND is_available = FALSE";

        try (Connection connection = DBConnection.getConnection()) {
            connection.setAutoCommit(false);
            try {
                int slotId;
                try (PreparedStatement ps = connection.prepareStatement(lockClaimSql)) {
                    ps.setInt(1, claimId);
                    try (ResultSet rs = ps.executeQuery()) {
                        if (!rs.next() || !"CLAIMED".equalsIgnoreCase(rs.getString("status"))) {
                            connection.rollback();
                            return false;
                        }
                        slotId = rs.getInt("slot_id");
                    }
                }

                try (PreparedStatement ps = connection.prepareStatement(cancelSql)) {
                    ps.setInt(1, claimId);
                    if (ps.executeUpdate() != 1) {
                        connection.rollback();
                        return false;
                    }
                }

                try (PreparedStatement ps = connection.prepareStatement(reopenSlotSql)) {
                    ps.setInt(1, slotId);
                    if (ps.executeUpdate() != 1) {
                        connection.rollback();
                        return false;
                    }
                }

                connection.commit();
                return true;
            } catch (SQLException e) {
                try { connection.rollback(); } catch (SQLException ignored) { }
                e.printStackTrace();
                return false;
            } finally {
                try { connection.setAutoCommit(true); } catch (SQLException ignored) { }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Claim> getClaimsByUserId(int userId) {
        List<Claim> claims = new ArrayList<>();
        String sql = "SELECT * FROM claims WHERE user_id = ? ORDER BY id DESC";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) claims.add(map(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return claims;
    }

    @Override
    public List<Claim> getAllClaims() {
        List<Claim> claims = new ArrayList<>();
        String sql = "SELECT * FROM claims ORDER BY id DESC";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) claims.add(map(rs));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return claims;
    }

    @Override
    public Claim getClaimById(int claimId) {
        String sql = "SELECT * FROM claims WHERE id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, claimId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return map(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean isSlotAlreadyClaimed(int userId, int slotId) {
        String sql = "SELECT COUNT(*) FROM claims WHERE user_id = ? AND slot_id = ? AND status = 'CLAIMED'";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.setInt(2, slotId);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next() && rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private Claim map(ResultSet rs) throws SQLException {
        Claim claim = new Claim();
        claim.setId(rs.getInt("id"));
        claim.setUserId(rs.getInt("user_id"));
        claim.setSlotId(rs.getInt("slot_id"));
        claim.setStatus(rs.getString("status"));
        if (rs.getTimestamp("claimed_at") != null) {
            claim.setClaimedAt(rs.getTimestamp("claimed_at").toLocalDateTime());
        }
        if (rs.getTimestamp("cancelled_at") != null) {
            claim.setCancelledAt(rs.getTimestamp("cancelled_at").toLocalDateTime());
        }
        return claim;
    }
}
