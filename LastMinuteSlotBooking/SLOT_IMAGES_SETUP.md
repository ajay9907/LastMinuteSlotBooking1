# Slot Images Setup

## 1. Existing database
Run `database/upgrade_add_slot_images.sql` once.

The update adds:
- `image_url VARCHAR(2048)` for a public image URL
- `image_data MEDIUMBLOB` for an uploaded image
- `image_content_type VARCHAR(100)` for the uploaded MIME type

It does not delete existing slots or claims.

## 2. Upload from the Admin page
Admin -> Add Slot -> Slot Image -> Choose File.

Accepted types: JPG, PNG, GIF, WEBP. Maximum upload size: 2 MB.

## 3. Image URL option
If you do not upload a local file, you can enter an `http://` or `https://` image URL.

## 4. Existing sample slot
You can add a slot normally from the Admin dashboard. The image is stored in MySQL and displayed through `/slot-image?id=<slotId>`.

## 5. Database connection
Update `src/main/java/com/lastminuteslotbooking/util/DBConnection.java` if your MySQL username/password is different from:
- user: root
- password: root
