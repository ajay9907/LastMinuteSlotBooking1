CREATE DATABASE IF NOT EXISTS last_minute_slot_booking;
USE last_minute_slot_booking;

CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('USER','ADMIN') NOT NULL DEFAULT 'USER',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS slots (
    id INT PRIMARY KEY AUTO_INCREMENT,
    event_name VARCHAR(150) NOT NULL,
    location VARCHAR(150) NOT NULL,
    slot_time DATETIME NOT NULL,
    duration INT NOT NULL,
    price DECIMAL(10,2) NOT NULL DEFAULT 0,
    is_available BOOLEAN NOT NULL DEFAULT TRUE,
    created_by INT NOT NULL,
    image_url VARCHAR(2048) NULL,
    image_data MEDIUMBLOB NULL,
    image_content_type VARCHAR(100) NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_slots_admin FOREIGN KEY (created_by) REFERENCES users(id),
    INDEX idx_slot_time(slot_time),
    INDEX idx_slot_available(is_available)
);

CREATE TABLE IF NOT EXISTS claims (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    slot_id INT NOT NULL,
    status ENUM('CLAIMED','CANCELLED') NOT NULL DEFAULT 'CLAIMED',
    claimed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cancelled_at TIMESTAMP NULL,
    CONSTRAINT fk_claim_user FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT fk_claim_slot FOREIGN KEY (slot_id) REFERENCES slots(id),
    INDEX idx_claim_user(user_id),
    INDEX idx_claim_slot(slot_id),
    INDEX idx_claim_status(status)
);

-- Demo admin. Change the password before production use.
INSERT INTO users(name,email,password,role)
SELECT 'System Admin','admin@slotbooking.com','admin123','ADMIN'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email='admin@slotbooking.com');

-- Demo user.
INSERT INTO users(name,email,password,role)
SELECT 'Demo User','user@slotbooking.com','user123','USER'
WHERE NOT EXISTS (SELECT 1 FROM users WHERE email='user@slotbooking.com');
