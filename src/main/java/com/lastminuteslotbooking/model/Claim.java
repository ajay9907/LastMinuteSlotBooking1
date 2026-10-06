package com.lastminuteslotbooking.model;

import java.time.LocalDateTime;

public class Claim {

	private int id;
	private int userId;
	private int slotId;
	private String status;
	private LocalDateTime claimedAt;
	private LocalDateTime cancelledAt;

	public Claim() {
	}

	public Claim(int id, int userId, int slotId, String status, LocalDateTime claimedAt, LocalDateTime cancelledAt) {

		this.id = id;
		this.userId = userId;
		this.slotId = slotId;
		this.status = status;
		this.claimedAt = claimedAt;
		this.cancelledAt = cancelledAt;
	}

	public Claim(int userId, int slotId, String status) {
		this.userId = userId;
		this.slotId = slotId;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getSlotId() {
		return slotId;
	}

	public void setSlotId(int slotId) {
		this.slotId = slotId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public LocalDateTime getClaimedAt() {
		return claimedAt;
	}

	public void setClaimedAt(LocalDateTime claimedAt) {
		this.claimedAt = claimedAt;
	}

	public LocalDateTime getCancelledAt() {
		return cancelledAt;
	}

	public void setCancelledAt(LocalDateTime cancelledAt) {
		this.cancelledAt = cancelledAt;
	}

	@Override
	public String toString() {
		return "Claim [id=" + id + ", userId=" + userId + ", slotId=" + slotId + ", status=" + status + ", claimedAt="
				+ claimedAt + ", cancelledAt=" + cancelledAt + "]";
	}
}