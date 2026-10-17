<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*,com.db.DBConnection" %>

<%
int id = Integer.parseInt(request.getParameter("id"));

Connection con = DBConnection.getConnection();
PreparedStatement ps = con.prepareStatement("SELECT * FROM bookings WHERE id=?");
ps.setInt(1, id);
ResultSet rs = ps.executeQuery();
rs.next();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Booking</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    background: url('images/images.jpg') no-repeat center center fixed;
    background-size: cover;
}

.overlay {
    background: rgba(0,0,0,0.7);
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
}

.form-box {
    width: 500px;
    padding: 30px;
    border-radius: 20px;
    backdrop-filter: blur(15px);
    background: rgba(255,255,255,0.1);
    color: white;
}
</style>

</head>

<body>

<div class="overlay">

<div class="form-box">

<h3 class="text-center mb-4">Edit Booking</h3>

<form action="UpdateServlet" method="post">

<input type="hidden" name="id" value="<%= rs.getInt("id") %>">

<select name="service" class="form-control mb-2">
<%
String[] services = {"Barber","Mechanic","Tutor","Electrician","Plumber","Car Wash","AC Repair","Home Cleaning","Salon","Doctor"};
for(String s : services){
%>
<option <%= rs.getString("service").equals(s) ? "selected" : "" %>><%= s %></option>
<% } %>
</select>

<input type="text" name="phone" class="form-control mb-2" value="<%= rs.getString("phone") %>">

<input type="date" name="date" class="form-control mb-2" value="<%= rs.getString("booking_date") %>">

<select name="time" class="form-control mb-3">
<%
String[] times = {
"09:00 AM - 10:00 AM","10:00 AM - 11:00 AM","11:00 AM - 12:00 PM",
"12:00 PM - 01:00 PM","02:00 PM - 03:00 PM","03:00 PM - 04:00 PM",
"04:00 PM - 05:00 PM","05:00 PM - 06:00 PM","06:00 PM - 07:00 PM",
"07:00 PM - 08:00 PM"
};

for(String t : times){
%>
<option <%= rs.getString("time_slot").equals(t) ? "selected" : "" %>><%= t %></option>
<% } %>
</select>

<button class="btn btn-primary w-100">Update Booking</button>

</form>

</div>

</div>

</body>
</html>