USE last_minute_slot_booking;

-- Run once on an existing database. This keeps existing slots and bookings.
ALTER TABLE slots
    ADD COLUMN image_data MEDIUMBLOB NULL AFTER image_url,
    ADD COLUMN image_content_type VARCHAR(100) NULL AFTER image_data;

-- Verify the new columns.
DESCRIBE slots;
