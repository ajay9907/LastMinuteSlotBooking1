<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.lastminuteslotbooking.model.Slot"%>
<% Slot s=(Slot)request.getAttribute("slot"); String dt=s.getSlotTime().toString(); %>
<!DOCTYPE html>
<html><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>Edit Slot</title>
<style>
*{box-sizing:border-box}body{margin:0;font-family:Segoe UI,Arial;background:#f3f7fc;color:#14213d}.nav{height:68px;background:#071d3d;color:#fff;padding:0 7%;display:flex;align-items:center;justify-content:space-between}.nav a{color:#fff;text-decoration:none;margin-left:18px}.box{max-width:700px;margin:55px auto;background:#fff;padding:30px;border-radius:18px;box-shadow:0 12px 35px #0f172a12}.box h1{margin-top:0}.grid{display:grid;grid-template-columns:1fr 1fr;gap:15px}label{font-size:13px;font-weight:700;color:#475569;display:block}input{width:100%;padding:12px;margin-top:6px;border:1px solid #cbd5e1;border-radius:9px;font-size:14px}.full{grid-column:1/-1}small{display:block;color:#64748b;margin-top:7px}.btn{margin-top:20px;background:#1268da;color:#fff;border:0;padding:12px 20px;border-radius:9px;font-weight:700;cursor:pointer}.back{margin-left:10px;color:#1268da;text-decoration:none}@media(max-width:650px){.grid{grid-template-columns:1fr}.full{grid-column:auto}}
</style></head>
<body>
<nav class="nav"><b>Last Minute Slot Booking</b><div><a href="admin">Dashboard</a><a href="logout">Logout</a></div></nav>
<div class="box"><h1>Edit Slot</h1><p style="color:#64748b">Update slot information. The booking status is preserved.</p>
<form action="edit-slot" method="post" enctype="multipart/form-data">
<input type="hidden" name="id" value="<%=s.getId()%>">
<div class="grid">
<div><label>Event Name</label><input name="eventName" value="<%=s.getEventName()%>" required></div>
<div><label>Location</label><input name="location" value="<%=s.getLocation()%>" required></div>
<div><label>Date & Time</label><input type="datetime-local" name="slotTime" value="<%=dt%>" required></div>
<div><label>Duration (minutes)</label><input type="number" name="duration" min="1" max="1440" value="<%=s.getDuration()%>" required></div>
<div><label>Price (₹)</label><input type="number" name="price" min="0" step="0.01" value="<%=s.getPrice()%>" required></div>
<div class="full">
<label>Upload New Slot Image (optional)</label>
<input type="file" name="imageFile" accept="image/jpeg,image/png,image/gif,image/webp" onchange="previewImage(event)">
<small>JPG, PNG, GIF or WEBP. Maximum 2 MB. Leave empty to keep the current uploaded image.</small>
<% if(s.getImageData()!=null && s.getImageData().length>0){ %>
<img src="slot-image?id=<%=s.getId()%>" style="width:100%;max-height:220px;object-fit:cover;border-radius:12px;margin-top:12px" alt="Current slot image">
<% } %>
<img id="preview" style="display:none;width:100%;max-height:220px;object-fit:cover;border-radius:12px;margin-top:12px" alt="New image preview">
</div>
<div class="full">
<label>Or Image URL (optional)</label>
<input type="url" name="imageUrl" placeholder="https://example.com/cricket-ground.jpg" value="<%=s.getImageUrl()==null?"":s.getImageUrl().replace("&","&amp;").replace("\"","&quot;").replace("<","&lt;").replace(">","&gt;")%>">
<small>You can use a public image URL instead of uploading a file.</small>
</div>
</div>
<button class="btn" type="submit">Save Changes</button><a class="back" href="admin">Cancel</a>
</form></div>
<script>function setMinDateTime(){const x=document.querySelector("input[name=slotTime]");if(x){const d=new Date(Date.now()+60000);const z=n=>String(n).padStart(2,"0");x.min=d.getFullYear()+"-"+z(d.getMonth()+1)+"-"+z(d.getDate())+"T"+z(d.getHours())+":"+z(d.getMinutes());}}window.addEventListener("load",setMinDateTime);</script><script>function previewImage(e){const f=e.target.files[0],p=document.getElementById('preview');if(!f){p.style.display='none';return;}p.src=URL.createObjectURL(f);p.style.display='block';}</script>
</body></html>
