USE last_minute_slot_booking;

-- Safe to run on an existing project. Existing slots/claims are preserved.
ALTER TABLE slots
    ADD COLUMN IF NOT EXISTS image_url VARCHAR(2048) NULL,
    ADD COLUMN IF NOT EXISTS image_data MEDIUMBLOB NULL,
    ADD COLUMN IF NOT EXISTS image_content_type VARCHAR(100) NULL;

DESCRIBE slots;
