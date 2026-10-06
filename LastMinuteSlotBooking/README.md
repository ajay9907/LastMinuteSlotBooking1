# Last Minute Slot Booking

Java Servlet/JSP + JDBC + MySQL web application for booking last-minute slots.

## Stack
- Java 17
- JSP / Servlet (Jakarta)
- Tomcat 10.1+
- JDBC
- MySQL
- Maven

## Main flow
Home -> Login/Register -> Role Selection -> User/Admin dashboard.

## Admin
- Add slots
- Upload JPG/PNG/GIF/WEBP slot images (2 MB max)
- Use an image URL instead
- Edit slots
- Delete slots
- View availability and recent claims

## User
- Search available slots
- View slot images
- Claim a slot
- View My Claims
- Cancel a claim

## Database
1. Run `database/last_minute_slot_booking.sql` for a fresh database.
2. If the database already exists, run `database/upgrade_add_slot_images.sql`.

## MySQL connection
Edit `src/main/java/com/lastminuteslotbooking/util/DBConnection.java` if required.
The default configuration is localhost:3306, database `last_minute_slot_booking`, user `root`, password `root`.

## Demo accounts
Admin: `admin@slotbooking.com` / `admin123`
User: `user@slotbooking.com` / `user123`

## Eclipse / Tomcat
Import as an existing Maven project, use Tomcat 10.1+, update Maven dependencies, and run the project on the server.
