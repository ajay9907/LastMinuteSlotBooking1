package com.lastminuteslotbooking.model;

import java.time.LocalDateTime;

public class Slot {

	private int id;
	private String eventName;
	private String location;
	private LocalDateTime slotTime;
	private int duration;
	private double price;
	private boolean available;
	private int createdBy;
    private String imageUrl;
    private byte[] imageData;
    private String imageContentType;

	public Slot() {
	}

	public Slot(int id, String eventName, String location, LocalDateTime slotTime, int duration, double price,
			boolean available, int createdBy) {

		this.id = id;
		this.eventName = eventName;
		this.location = location;
		this.slotTime = slotTime;
		this.duration = duration;
		this.price = price;
		this.available = available;
		this.createdBy = createdBy;
	}

	public Slot(String eventName, String location, LocalDateTime slotTime, int duration, double price,
			boolean available, int createdBy) {

		this.eventName = eventName;
		this.location = location;
		this.slotTime = slotTime;
		this.duration = duration;
		this.price = price;
		this.available = available;
		this.createdBy = createdBy;
	}

	public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    public byte[] getImageData() { return imageData; }
    public void setImageData(byte[] imageData) { this.imageData = imageData; }
    public String getImageContentType() { return imageContentType; }
    public void setImageContentType(String imageContentType) { this.imageContentType = imageContentType; }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEventName() {
		return eventName;
	}

	public void setEventName(String eventName) {
		this.eventName = eventName;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public LocalDateTime getSlotTime() {
		return slotTime;
	}

	public void setSlotTime(LocalDateTime slotTime) {
		this.slotTime = slotTime;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public boolean isAvailable() {
		return available;
	}

	public void setAvailable(boolean available) {
		this.available = available;
	}

	public int getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}

	@Override
	public String toString() {
		return "Slot [id=" + id + ", eventName=" + eventName + ", location=" + location + ", slotTime=" + slotTime
				+ ", duration=" + duration + ", price=" + price + ", available=" + available + ", createdBy="
				+ createdBy + "]";
	}
}