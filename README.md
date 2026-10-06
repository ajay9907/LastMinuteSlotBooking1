Last Minute Slot Booking
A Java-based web application for finding, booking, cancelling, and managing last-minute activity/event slots.
📌 Project Overview
Last Minute Slot Booking is a role-based web application developed using Java, JSP, Servlet, JDBC, MySQL, HTML, CSS, JavaScript, Maven, and Apache Tomcat.
The application allows users to discover available slots such as cricket grounds, badminton courts, football grounds, tennis courts, swimming pools, and other activities. Users can claim available slots and manage their bookings. Administrators can create, update, delete, and monitor slots and booking activity.
The project follows a layered architecture using:
JSP → Servlet/Controller → Service → DAO → JDBC → MySQL
🎯 Problem Statement
Users may need to find activity or event slots at the last minute, but availability is often difficult to track through manual processes.
This project provides a centralized platform where:
- Users can register and log in.
- Users can view available slots.
- Users can search for slots.
- Users can view slot details and images.
- Users can claim/book available slots.
- Users can view their bookings.
- Users can cancel their bookings.
- Admins can manage slots.
- Admins can monitor booking activity.
🎯 Objectives
- Build a simple and user-friendly slot booking platform.
- Implement user registration and login.
- Implement role-based USER and ADMIN access.
- Allow users to search and view available slots.
- Allow users to claim/book slots.
- Allow users to cancel bookings.
- Allow users to view their claims.
- Allow admins to add, edit, and delete slots.
- Allow admins to upload slot images.
- Store application data in MySQL.
- Use JDBC for database communication.
- Follow a clean layered architecture.
- Maintain consistent booking and slot availability.
👥 User Roles
👤 USER
Users can:
- Register an account.
- Login and logout.
- View available slots.
- Search slots.
- View slot details.
- View slot images.
- Claim/book a slot.
- View My Claims.
- Cancel an active booking.
👑 ADMIN
Admins can:
- Login to the Admin Dashboard.
- View slot statistics.
- Add new slots.
- Upload slot images.
- Add an image URL.
- Edit existing slots.
- Delete slots.
- View available/booked status.
- View recent claims.
- Logout.
🛠️ Technology Stack
Technology	Purpose
Java 17	Core programming, OOP and application logic
JSP	Dynamic web pages
Jakarta Servlet	HTTP request/response handling
JDBC	Java-MySQL database connectivity
MySQL	Relational database
HTML5	Web page structure
CSS3	UI styling and responsive design
JavaScript	Client-side interaction and validation
Maven	Build and dependency management
Apache Tomcat 10.1	Web application server
Eclipse IDE	Development environment


🏗️ System Architecture
The application follows a layered architecture.
                    USER / ADMIN
                         |
                         v
                  JSP / HTML / CSS
                    JavaScript
                         |
                         v
                    CONTROLLER
                     SERVLETS
                         |
                         v
                      SERVICE
                   Business Logic
                         |
                         v
                       DAO
                 DAO Interface Layer
                         |
                         v
                  DAO IMPLEMENTATION
                         |
                         v
                       JDBC
                         |
                         v
                      MySQL
Layer Responsibilities
1. Model Layer
Represents application entities/data.
Main models:
- User
- Slot
- Claim
2. Controller Layer
Handles browser requests and responses.
Main responsibilities:
- Login
- Registration
- Logout
- Slot management
- Booking
- Cancellation
- Admin dashboard
- Image serving
3. Service Layer
Contains business logic and coordinates controllers with DAOs.
Main services:
- UserService
- SlotService
- ClaimService
4. DAO Layer
Defines database operations.
Main DAOs:
- UserDAO
- SlotDAO
- ClaimDAO
5. DAO Implementation Layer
Contains actual JDBC and SQL implementation.
- UserDAOImpl
- SlotDAOImpl
- ClaimDAOImpl
6. Utility Layer
Contains common application utilities.
- DBConnection
- TestDBConnection
📂 Complete Project Structure
LastMinuteSlotBooking/
│
├── database/
│   ├── last_minute_slot_booking.sql
│   └── upgrade_add_slot_images.sql
│
├── src/
│   └── main/
│       │
│       ├── java/
│       │   └── com/
│       │       └── lastminuteslotbooking/
│       │           │
│       │           ├── controller/
│       │           │   ├── AddSlotServlet.java
│       │           │   ├── AdminDashboardServlet.java
│       │           │   ├── CancelServlet.java
│       │           │   ├── ClaimServlet.java
│       │           │   ├── DeleteSlotServlet.java
│       │           │   ├── EditSlotServlet.java
│       │           │   ├── LoginServlet.java
│       │           │   ├── LogoutServlet.java
│       │           │   ├── MyClaimsServlet.java
│       │           │   ├── RegisterServlet.java
│       │           │   ├── RoleServlet.java
│       │           │   ├── SlotImageServlet.java
│       │           │   └── SlotServlet.java
│       │           │
│       │           ├── dao/
│       │           │   ├── ClaimDAO.java
│       │           │   ├── SlotDAO.java
│       │           │   └── UserDAO.java
│       │           │
│       │           ├── daoimpl/
│       │           │   ├── ClaimDAOImpl.java
│       │           │   ├── SlotDAOImpl.java
│       │           │   └── UserDAOImpl.java
│       │           │
│       │           ├── model/
│       │           │   ├── Claim.java
│       │           │   ├── Slot.java
│       │           │   └── User.java
│       │           │
│       │           ├── service/
│       │           │   ├── ClaimService.java
│       │           │   ├── SlotService.java
│       │           │   └── UserService.java
│       │           │
│       │           └── util/
│       │               ├── DBConnection.java
│       │               └── TestDBConnection.java
│       │
│       └── webapp/
│           ├── index.jsp
│           ├── login.jsp
│           ├── register.jsp
│           ├── role.jsp
│           ├── admin.jsp
│           ├── add-slot.jsp
│           ├── edit-slot.jsp
│           ├── slots.jsp
│           ├── my-claims.jsp
│           └── about.jsp
│
├── pom.xml
├── README.md
└── SLOT_IMAGES_SETUP.md
The exact filenames can vary slightly depending on the current Eclipse project version, but the architecture remains the same.

🖥️ Application Pages
Home Page
index.jsp
Provides:
- Project introduction.
- Login navigation.
- Registration navigation.
- Main application entry point.
Login Page
login.jsp
Used for:
- USER login.
- ADMIN login.
Registration Page
register.jsp
Used to create a new user account.
Role Page
role.jsp
Handles role-based navigation between USER and ADMIN functionality.
Available Slots
slots.jsp
Displays:
- Event name.
- Location.
- Date and time.
- Duration.
- Price.
- Slot image.
- Availability.
- Claim button.
My Claims
my-claims.jsp
Displays the user's:
- Claimed slots.
- Booking status.
- Claim date/time.
- Cancel action.
Admin Dashboard
admin.jsp
Displays:
- Total slots.
- Available slots.
- Booked slots.
- Active claims.
- Slot management table.
- Recent claims.
Add Slot
add-slot.jsp
Admin can enter:
- Event name.
- Location.
- Date/time.
- Duration.
- Price.
- Slot image.
- Image URL.
Edit Slot
edit-slot.jsp
Admin can update existing slot information and change the slot image.
About Page
about.jsp
Provides project information.
🔄 Application Flow
USER FLOW
Home
  ↓
Register / Login
  ↓
Role Selection
  ↓
USER
  ↓
Available Slots
  ↓
Search Slot
  ↓
View Slot
  ↓
Claim Slot
  ↓
My Claims
  ↓
Cancel Booking
  ↓
Logout
ADMIN FLOW
Home
  ↓
Login
  ↓
Role Selection
  ↓
ADMIN
  ↓
Admin Dashboard
  ↓
Add New Slot
  ↓
Upload Image
  ↓
Manage Slots
  ↓
Edit / Delete Slot
  ↓
View Claims
  ↓
Logout
➕ Add Slot Flow
Admin
  ↓
Add New Slot
  ↓
Enter Slot Information
  ↓
Select Image
  ↓
Image Validation
  ↓
AddSlotServlet
  ↓
SlotService
  ↓
SlotDAO
  ↓
JDBC
  ↓
MySQL
  ↓
Slot Created
🎫 Booking Flow
User
  ↓
Available Slots
  ↓
Claim Slot
  ↓
ClaimServlet
  ↓
ClaimService
  ↓
ClaimDAO
  ↓
Check Slot Availability
  ↓
Create Claim
  ↓
Update Slot Status
  ↓
MySQL
  ↓
Booking Confirmed
❌ Cancellation Flow
User
  ↓
My Claims
  ↓
Cancel
  ↓
CancelServlet
  ↓
ClaimService
  ↓
ClaimDAO
  ↓
Update Claim Status
  ↓
Update Slot Availability
  ↓
MySQL
  ↓
Booking Cancelled
🖼️ Slot Image Feature
The project supports slot images.
Supported formats:
- JPG
- JPEG
- PNG
- GIF
- WEBP
Maximum upload size:
2 MB
Images can be:
1. Uploaded from the computer.
2. Added using an image URL.
Image flow
Admin
  ↓
Add/Edit Slot
  ↓
Choose Image
  ↓
Validate Image
  ↓
Store Image
  ↓
MySQL
  ↓
SlotImageServlet
  ↓
Display Image
Uploaded image information is stored using a MEDIUMBLOB column, while the image content type is stored separately.
🗄️ Database Design
Database name:
last_minute_slot_booking
Main tables:
users
slots
claims
Users Table
users
Column	Purpose
id	Primary key
name	User name
email	Login email
password	User password
role	USER / ADMIN
created_at	Registration timestamp


Slots Table
slots
Column	Purpose
id	Primary key
event_name	Event/activity name
location	Slot location
slot_time	Date and time
duration	Duration in minutes
price	Slot price
is_available	Availability status
created_by	Admin who created slot
image_url	Optional image URL
image_data	Uploaded image
image_content_type	Image MIME type
created_at	Creation timestamp


Claims Table
claims
Column	Purpose
id	Primary key
user_id	User who booked
slot_id	Booked slot
status	CLAIMED / CANCELLED
claimed_at	Booking time
cancelled_at	Cancellation time


🔗 Database Relationships
users
  |
  | 1
  |
  |------< claims >------|
                         |
                         |
                       slots
Relationships:
claims.user_id → users.id

claims.slot_id → slots.id

slots.created_by → users.id
🔐 Security and Validation
The project uses:
- Session-based authentication.
- USER/ADMIN role separation.
- PreparedStatement for SQL queries.
- Input validation.
- Database foreign keys.
- Transaction-based booking/cancellation operations.
- Image file type validation.
- Image size validation.
Important
Never commit your real MySQL password to GitHub.
For example, avoid uploading:
String password = "myRealPassword";
Use environment variables or a separate local configuration for production.
🧩 Main Servlets
Servlet	Responsibility
LoginServlet	Login
RegisterServlet	Registration
LogoutServlet	Logout
RoleServlet	Role navigation
SlotServlet	Display/search slots
AddSlotServlet	Add slot
EditSlotServlet	Edit slot
DeleteSlotServlet	Delete slot
ClaimServlet	Book/claim slot
CancelServlet	Cancel booking
MyClaimsServlet	User claims
AdminDashboardServlet	Admin dashboard
SlotImageServlet	Display uploaded images


🧱 Main Java Classes
Models
User.java
Slot.java
Claim.java
DAO Interfaces
UserDAO.java
SlotDAO.java
ClaimDAO.java
DAO Implementations
UserDAOImpl.java
SlotDAOImpl.java
ClaimDAOImpl.java
Services
UserService.java
SlotService.java
ClaimService.java
Utilities
DBConnection.java
TestDBConnection.java
📦 Maven
The project uses Maven for:
- Dependency management.
- Build management.
- Project configuration.
- Packaging as a WAR application.
Main file:
pom.xml
🚀 Installation and Setup
Prerequisites
Install:
- JDK 17 or later.
- Eclipse IDE for Java/Web development.
- MySQL Server.
- MySQL Workbench.
- Apache Tomcat 10.1.
- Maven.
Step 1: Clone GitHub Repository
git clone YOUR_GITHUB_REPOSITORY_URL
Example:
git clone https://github.com/YOUR_USERNAME/LastMinuteSlotBooking.git
Step 2: Import into Eclipse
Eclipse
 ↓
File
 ↓
Import
 ↓
Maven
 ↓
Existing Maven Projects
 ↓
Select project folder
 ↓
Finish
Step 3: Create Database
Open MySQL Workbench.
Run:
CREATE DATABASE last_minute_slot_booking;
Then run the project's SQL file:
database/last_minute_slot_booking.sql
Step 4: Image Database Upgrade
If you already have an existing database and the image columns are missing, run:
ALTER TABLE slots
ADD COLUMN image_url VARCHAR(2048) NULL;

ALTER TABLE slots
ADD COLUMN image_data MEDIUMBLOB NULL;

ALTER TABLE slots
ADD COLUMN image_content_type VARCHAR(100) NULL;
If a column already exists, do not add it again.
Check with:
DESCRIBE slots;
Step 5: Configure MySQL Connection
Open:
DBConnection.java
Update your local MySQL credentials.
Example:
private static final String URL =
    "jdbc:mysql://localhost:3306/last_minute_slot_booking";

private static final String USER = "root";

private static final String PASSWORD = "YOUR_PASSWORD";
Step 6: Maven Update
In Eclipse:
Right Click Project
    ↓
Maven
    ↓
Update Project
Step 7: Configure Tomcat
Add:
Apache Tomcat 10.1
Then add the project to the server.
Step 8: Run
Right Click Project
    ↓
Run As
    ↓
Run on Server
Application URL:
http://localhost:8080/LastMinuteSlotBooking/
The exact context path may differ depending on your Eclipse/Tomcat configuration.
🧪 Testing Checklist
Authentication
- [ ] User registration works.
- [ ] User login works.
- [ ] Admin login works.
- [ ] Invalid login is rejected.
- [ ] Logout works.
User
- [ ] Available slots display.
- [ ] Slot images display.
- [ ] Search works.
- [ ] Claim works.
- [ ] My Claims works.
- [ ] Cancellation works.
Admin
- [ ] Dashboard opens.
- [ ] Statistics display.
- [ ] Add Slot works.
- [ ] Image upload works.
- [ ] Image URL works.
- [ ] Edit Slot works.
- [ ] Delete Slot works.
- [ ] Recent Claims display.
Database
- [ ] Users are stored.
- [ ] Slots are stored.
- [ ] Claims are stored.
- [ ] Cancellation updates booking status.
- [ ] Slot availability is updated correctly.
📝 Resume Description
Last Minute Slot Booking Platform
Technologies: Java, JSP, Servlet, JDBC, MySQL, HTML, CSS, JavaScript, Maven, Tomcat
- Developed a role-based web application for managing and booking last-minute activity/event slots.
- Implemented user registration, login, slot search, booking, cancellation, and My Claims functionality.
- Developed an admin dashboard with slot creation, editing, deletion, availability monitoring, and claims management.
- Implemented slot image upload with support for JPG, PNG, GIF, and WEBP images.
- Used layered architecture with Controller, Service, DAO, DAO Implementation, Model, and Utility layers.
- Used JDBC and MySQL for database management with prepared statements and transactional booking operations.
🎤 Interview Project Explanation
Short Answer
My project is a Last Minute Slot Booking web application developed using Java, JSP, Servlet, JDBC and MySQL. It allows users to find available activity slots, view slot details and images, book slots, and cancel their bookings. The application also has an Admin role where the admin can add, edit, delete and manage slots and monitor booking activity. I used a layered architecture consisting of Controller, Service, DAO, DAO Implementation, Model and Utility layers. MySQL is used for data storage and JDBC is used for database communication.

❓ Common Interview Questions
1. Why did you use Java Servlet?
Servlet is used to handle HTTP requests and responses between the browser and backend.
2. Why JSP?
JSP is used to create dynamic web pages and display backend data.
3. Why JDBC?
JDBC provides connectivity between Java and the MySQL database.
4. Why DAO?
DAO separates database access code from business logic and improves maintainability.
5. Why Service Layer?
The Service layer contains business logic and keeps controllers and database code separated.
6. Why MySQL?
MySQL is a relational database suitable for structured data such as users, slots and claims.
7. What is PreparedStatement?
PreparedStatement is used to execute parameterized SQL queries and helps protect against SQL injection.
8. What is the purpose of the Claims table?
The Claims table stores which user booked which slot and maintains booking status.
9. How does Admin add a slot?
Admin
→ Add Slot JSP
→ AddSlotServlet
→ SlotService
→ SlotDAO
→ JDBC
→ MySQL
10. How does booking work?
User
→ Claim button
→ ClaimServlet
→ ClaimService
→ ClaimDAO
→ Check availability
→ Create claim
→ Update slot
→ MySQL
📈 Future Enhancements
Possible future improvements:
- Online payment integration.
- Email confirmation.
- SMS notifications.
- Advanced search and filters.
- Google Maps/location integration.
- Password encryption/hashing.
- Forgot password functionality.
- User profile management.
- Admin user management.
- Booking history reports.
- Revenue reports.
- Cloud deployment.
- Docker support.
- AWS deployment.
- Better responsive/mobile UI.
- Real-time notifications using WebSocket.
👨‍💻 Developer
Ajay Agwan
Project
Last Minute Slot Booking
Purpose
Java Developer / Full Stack Learning Project
Technologies
Java • JSP • Servlet • JDBC • MySQL • HTML • CSS • JavaScript • Maven • Tomcat
⭐ Project Highlights
✔ Role-Based Authentication
✔ User Registration & Login
✔ Admin Dashboard
✔ Slot Management
✔ Slot Search
✔ Slot Booking
✔ Booking Cancellation
✔ My Claims
✔ Slot Image Upload
✔ Image URL Support
✔ MySQL Database
✔ JDBC
✔ DAO Pattern
✔ Service Layer
✔ MVC/Layered Architecture
✔ Maven
✔ Apache Tomcat
✔ Eclipse
