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

		String sql = "INSERT INTO claims (user_id, slot_id, status) VALUES (?, ?, ?)";

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement ps = connection.prepareStatement(sql)) {

			ps.setInt(1, claim.getUserId());
			ps.setInt(2, claim.getSlotId());
			ps.setString(3, claim.getStatus());

			int rows = ps.executeUpdate();

			return rows > 0;

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean cancelClaim(int claimId) {

		String sql = "UPDATE claims SET status = 'CANCELLED', cancelled_at = CURRENT_TIMESTAMP WHERE id = ?";

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement ps = connection.prepareStatement(sql)) {

			ps.setInt(1, claimId);

			return ps.executeUpdate() > 0;

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

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

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

				claims.add(claim);
			}

		} catch (SQLException e) {

			System.out.println("========== CLAIM DATABASE ERROR ==========");
			e.printStackTrace();
			System.out.println("==========================================");

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
			while (rs.next()) {
				Claim claim = new Claim();
				claim.setId(rs.getInt("id"));
				claim.setUserId(rs.getInt("user_id"));
				claim.setSlotId(rs.getInt("slot_id"));
				claim.setStatus(rs.getString("status"));
				if (rs.getTimestamp("claimed_at") != null) claim.setClaimedAt(rs.getTimestamp("claimed_at").toLocalDateTime());
				if (rs.getTimestamp("cancelled_at") != null) claim.setCancelledAt(rs.getTimestamp("cancelled_at").toLocalDateTime());
				claims.add(claim);
			}
		} catch (SQLException e) { e.printStackTrace(); }
		return claims;
	}

	@Override
	public Claim getClaimById(int claimId) {

		String sql = "SELECT * FROM claims WHERE id = ?";

		try (Connection connection = DBConnection.getConnection();
				PreparedStatement ps = connection.prepareStatement(sql)) {

			ps.setInt(1, claimId);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

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

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				return rs.getInt(1) > 0;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}
}