# Last Minute Slot Booking

Java Servlet + JSP + JDBC + MySQL web application for finding and booking last-minute time slots.

## Flow
1. Home page
2. Login / Registration
3. Role selection
4. User: search available slots -> claim slot -> My Claims -> cancel booking -> logout
5. Admin: dashboard -> add slot -> edit/delete slot -> monitor availability and recent claims -> logout

## Added functionality
- Role-based access control for USER and ADMIN
- Admin dashboard with slot/booking statistics
- Add, edit and delete slots
- Search slots by event and location
- Future-date validation for slots
- User booking and cancellation
- My Claims page with slot details and booking status
- Admin recent-claims monitoring
- Better session checks and invalid-ID handling
- MySQL schema and demo users

## Technology
Java 17, Jakarta Servlet 6, JSP, JDBC, MySQL 8+, Maven, Tomcat 10.1+

## Setup
1. Open `database/last_minute_slot_booking.sql` in MySQL and run it.
2. Update database username/password in `src/main/java/com/lastminuteslotbooking/util/DBConnection.java`.
3. Run `mvn clean package`.
4. Deploy `target/LastMinuteSlotBooking.war` to Tomcat 10.1+.
5. Demo admin: `admin@slotbooking.com` / `admin123`.
6. Demo user: `user@slotbooking.com` / `user123`.

For production, passwords should be hashed and secrets should be stored outside source code.
