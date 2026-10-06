# Slot Image Upload

The project now supports **real image uploads from the Admin Add/Edit Slot pages**. Images are stored in MySQL, so you do not need to keep image files inside the Tomcat project folder.

## Existing database
Run `database/upgrade_add_slot_images.sql` once.

## New database
Run `database/last_minute_slot_booking.sql`; the image columns are already included.

## Admin
1. Login as ADMIN.
2. Open Add New Slot or Edit Slot.
3. Choose a JPG, PNG, GIF or WEBP image.
4. Maximum file size: 2 MB.
5. Save.

The image is then displayed in Admin Manage Slots and the User Available Slots page.

An optional public image URL is also supported for slots where you prefer not to upload a file.
