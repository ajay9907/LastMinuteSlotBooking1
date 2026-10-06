<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.lastminuteslotbooking.model.Slot"%>
<%@ page import="com.lastminuteslotbooking.model.Claim"%>
<%
    List<Slot> slots = (List<Slot>) request.getAttribute("slots");
    List<Claim> claims = (List<Claim>) request.getAttribute("claims");
    if (slots == null) slots = new ArrayList<Slot>();
    if (claims == null) claims = new ArrayList<Claim>();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin Dashboard | Last Minute Slot Booking</title>
<style>
*{box-sizing:border-box}
body{margin:0;font-family:"Segoe UI",Arial,sans-serif;background:#f4f7fb;color:#13213b}
.nav{height:68px;background:#071d3d;color:#fff;padding:0 6%;display:flex;align-items:center;justify-content:space-between}
.brand{font-size:21px;font-weight:800}.brand span{color:#38bdf8}
.nav a{color:#fff;text-decoration:none;margin-left:20px;font-size:14px}.logout{border:1px solid #5c7294;padding:9px 14px;border-radius:8px}
.wrap{width:90%;max-width:1250px;margin:34px auto}
.hero{display:flex;justify-content:space-between;align-items:center;margin-bottom:25px}.hero h1{margin:0;font-size:31px}.hero p{color:#64748b;margin:6px 0}
.btn{display:inline-block;background:#1167d9;color:#fff;padding:11px 17px;border-radius:9px;text-decoration:none;font-weight:700;border:0;cursor:pointer}.green{background:#0f9d58}.danger{background:#ef3340}
.stats{display:grid;grid-template-columns:repeat(4,1fr);gap:16px;margin-bottom:25px}
.stat{background:#fff;border:1px solid #e2e8f0;border-radius:14px;padding:20px;box-shadow:0 6px 20px #0f172a0b}.stat small{color:#64748b}.stat b{display:block;font-size:30px;margin-top:7px}
.panel{background:#fff;border:1px solid #e2e8f0;border-radius:15px;overflow:hidden;margin-bottom:24px}
.panel-head{padding:17px 20px;border-bottom:1px solid #e5e7eb;display:flex;justify-content:space-between;align-items:center}.panel-head h2{font-size:18px;margin:0}
.table-wrap{overflow:auto}table{width:100%;border-collapse:collapse;min-width:950px}th,td{padding:13px 15px;border-bottom:1px solid #edf1f5;text-align:left;font-size:14px}th{background:#f8fafc;color:#475569}
.slot-image{width:80px;height:55px;object-fit:cover;border-radius:8px;border:1px solid #e2e8f0}.badge{padding:5px 9px;border-radius:20px;font-size:12px;font-weight:700}.ok{background:#dcfce7;color:#166534}.booked{background:#fee2e2;color:#991b1b}
.actions{display:flex;gap:7px}.actions a,.actions button{font-size:12px;padding:7px 10px;border-radius:7px}.empty{padding:30px;text-align:center;color:#64748b}
@media(max-width:850px){.stats{grid-template-columns:repeat(2,1fr)}.hero{gap:15px;align-items:flex-start;flex-direction:column}}
@media(max-width:500px){.stats{grid-template-columns:1fr}.nav{padding:0 4%}.nav a{margin-left:8px}}
</style>
</head>
<body>
<nav class="nav">
    <div class="brand">Last Minute <span>Slot Booking</span></div>
    <div>
        <a href="index.jsp">Home</a>
        <a href="add-slot.jsp">Add Slot</a>
        <a href="slots">User View</a>
        <a class="logout" href="logout">Logout</a>
    </div>
</nav>

<main class="wrap">
<div class="hero">
    <div><h1>Admin Dashboard</h1><p>Manage slots, availability and booking activity from one place.</p></div>
    <a class="btn green" href="add-slot.jsp">+ Add New Slot</a>
</div>

<% if ("1".equals(request.getParameter("added"))) { %>
<div style="background:#dcfce7;color:#166534;padding:12px 15px;border-radius:9px;margin-bottom:18px">Slot added successfully.</div>
<% } %>
<% if ("1".equals(request.getParameter("updated"))) { %>
<div style="background:#dcfce7;color:#166534;padding:12px 15px;border-radius:9px;margin-bottom:18px">Slot updated successfully.</div>
<% } %>
<% if ("0".equals(request.getParameter("deleted"))) { %>
<div style="background:#fee2e2;color:#991b1b;padding:12px 15px;border-radius:9px;margin-bottom:18px">Slot could not be deleted. A booked slot may have related claims.</div>
<% } %>
<% if ("1".equals(request.getParameter("error"))) { %>
<div style="background:#fee2e2;color:#991b1b;padding:12px 15px;border-radius:9px;margin-bottom:18px">The requested operation could not be completed.</div>
<% } %>

<div class="stats">
    <div class="stat"><small>Total Slots</small><b><%= request.getAttribute("totalSlots") == null ? 0 : request.getAttribute("totalSlots") %></b></div>
    <div class="stat"><small>Available</small><b><%= request.getAttribute("availableSlots") == null ? 0 : request.getAttribute("availableSlots") %></b></div>
    <div class="stat"><small>Booked</small><b><%= request.getAttribute("bookedSlots") == null ? 0 : request.getAttribute("bookedSlots") %></b></div>
    <div class="stat"><small>Active Claims</small><b><%= request.getAttribute("activeClaims") == null ? 0 : request.getAttribute("activeClaims") %></b></div>
</div>

<section class="panel">
<div class="panel-head"><h2>Manage Slots</h2><span><%= slots.size() %> records</span></div>
<div class="table-wrap">
<table>
<tr><th>ID</th><th>Image</th><th>Event</th><th>Location</th><th>Date &amp; Time</th><th>Duration</th><th>Price</th><th>Status</th><th>Action</th></tr>
<% if (slots.isEmpty()) { %>
<tr><td colspan="9" class="empty">No slots available. Add your first slot.</td></tr>
<% } else { for (Slot s : slots) { %>
<tr>
<td>#<%= s.getId() %></td>
<td>
<% if (s.getImageData() != null && s.getImageData().length > 0) { %>
<img class="slot-image" src="slot-image?id=<%= s.getId() %>" alt="Slot image">
<% } else if (s.getImageUrl() != null && !s.getImageUrl().trim().isEmpty()) { %>
<img class="slot-image" src="<%= s.getImageUrl().replace("&", "&amp;").replace("\"", "&quot;") %>" alt="Slot image" onerror="this.style.display='none'">
<% } else { %>
<span>No image</span>
<% } %>
</td>
<td><b><%= s.getEventName() %></b></td>
<td><%= s.getLocation() %></td>
<td><%= s.getSlotTime() == null ? "-" : s.getSlotTime().toString().replace('T',' ') %></td>
<td><%= s.getDuration() %> min</td>
<td>₹ <%= String.format("%.2f", s.getPrice()) %></td>
<td><span class="badge <%= s.isAvailable() ? "ok" : "booked" %>"><%= s.isAvailable() ? "Available" : "Booked" %></span></td>
<td>
<div class="actions">
<a class="btn" href="edit-slot?id=<%= s.getId() %>">Edit</a>
<form action="delete-slot" method="post" onsubmit="return confirm('Delete this slot?');">
<input type="hidden" name="id" value="<%= s.getId() %>">
<button class="btn danger" type="submit">Delete</button>
</form>
</div>
</td>
</tr>
<% }} %>
</table>
</div>
</section>

<section class="panel">
<div class="panel-head"><h2>Recent Claims</h2><span><%= claims.size() %> total</span></div>
<div class="table-wrap">
<table>
<tr><th>Claim ID</th><th>User ID</th><th>Slot ID</th><th>Status</th><th>Claimed At</th><th>Cancelled At</th></tr>
<% if (claims.isEmpty()) { %>
<tr><td colspan="6" class="empty">No claims yet.</td></tr>
<% } else { int count = 0; for (Claim c : claims) { if (count++ >= 10) break; %>
<tr>
<td>#<%= c.getId() %></td>
<td><%= c.getUserId() %></td>
<td><%= c.getSlotId() %></td>
<td><span class="badge <%= "CLAIMED".equalsIgnoreCase(c.getStatus()) ? "ok" : "booked" %>"><%= c.getStatus() %></span></td>
<td><%= c.getClaimedAt() == null ? "-" : c.getClaimedAt().toString().replace('T',' ') %></td>
<td><%= c.getCancelledAt() == null ? "-" : c.getCancelledAt().toString().replace('T',' ') %></td>
</tr>
<% }} %>
</table>
</div>
</section>
</main>
</body>
</html>
