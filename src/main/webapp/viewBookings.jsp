
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*,com.db.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Bookings</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">

<style>

/* 🌌 BACKGROUND */
body {
    background: url('images/images.jpg') no-repeat center center fixed;
    background-size: cover;
    font-family: 'Segoe UI', sans-serif;
}

/* 🌑 OVERLAY */
.overlay {
    background: rgba(0,0,0,0.75);
    min-height: 100vh;
    padding: 40px;
}

/* 🔄 LOADER */
.loader {
    position: fixed;
    width: 100%;
    height: 100%;
    background: black;
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 9999;
}

.loader div {
    width: 50px;
    height: 50px;
    border: 5px solid white;
    border-top: 5px solid transparent;
    border-radius: 50%;
    animation: spin 1s linear infinite;
}

@keyframes spin {
    100% { transform: rotate(360deg); }
}

/* 🎯 TITLE */
.title {
    color: white;
    text-align: center;
    margin-bottom: 30px;
    font-weight: bold;
}

/* 🔍 SEARCH */
.search-box {
    max-width: 400px;
    margin: auto;
}

.search-box input {
    background: rgba(255,255,255,0.1);
    border: none;
    color: white;
}

.search-box input:focus {
    box-shadow: 0 0 10px #3b82f6;
    border: 1px solid #3b82f6;
}

/* 🎴 GLASS CARD */
.booking-card {
    background: rgba(255,255,255,0.1);
    border-radius: 20px;
    padding: 20px;
    margin-bottom: 20px;
    backdrop-filter: blur(15px);
    color: white;
    box-shadow: 0 8px 32px rgba(0,0,0,0.5);

    opacity: 0;
    transform: translateY(30px);
    animation: fadeUp 0.6s forwards;
    animation-delay: calc(var(--i) * 0.05s);
}

/* 🔥 HOVER EFFECT */
.booking-card:hover {
    transform: scale(1.03);
    box-shadow: 0 0 25px rgba(59,130,246,0.6);
}

/* 🔥 ANIMATION */
@keyframes fadeUp {
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* 🏷 SERVICE BADGE */
.badge-service {
    background: linear-gradient(45deg,#3b82f6,#22c55e);
    padding: 5px 10px;
    border-radius: 10px;
    box-shadow: 0 0 10px #3b82f6;
}

/* 🔘 BUTTONS */
.btn {
    border-radius: 10px;
    transition: 0.3s;
}

.btn-warning {
    box-shadow: 0 0 10px orange;
}

.btn-danger {
    box-shadow: 0 0 10px red;
}

.btn-warning:hover,
.btn-danger:hover {
    transform: scale(1.05);
}

/* ✨ CLICK RIPPLE */
.btn:after {
    content: "";
    position: absolute;
    width: 0;
    height: 0;
    background: rgba(255,255,255,0.4);
    border-radius: 50%;
    opacity: 0;
    transition: 0.6s;
}

.btn:active:after {
    width: 200px;
    height: 200px;
    opacity: 1;
    transition: 0s;
}

/* PAGINATION */
.btn-light {
    background: rgba(255,255,255,0.2);
    color: white;
    border: none;
}

</style>

</head>

<body>

<!-- 🔄 LOADING -->
<div class="loader" id="loader">
    <div></div>
</div>

<div class="overlay">

<h2 class="title">My Bookings</h2>

<!-- 🔍 SEARCH -->
<form method="get" class="search-box mb-4 d-flex">
<input type="text" name="search" class="form-control me-2"
placeholder="Search..."
value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">

<button class="btn btn-light">Search</button>
</form>

<%
Connection con = DBConnection.getConnection();
String search = request.getParameter("search");

int currentPage = 1;
int recordsPerPage = 5;

if(request.getParameter("page") != null){
    try {
        currentPage = Integer.parseInt(request.getParameter("page"));
    } catch(Exception e){
        currentPage = 1;
    }
}

int start = (currentPage - 1) * recordsPerPage;

PreparedStatement ps;

if(search != null && !search.trim().equals("")){
    ps = con.prepareStatement(
    "SELECT * FROM bookings WHERE first_name LIKE ? OR last_name LIKE ? OR service LIKE ? OR phone LIKE ? LIMIT ?,?"
    );

    for(int i=1;i<=4;i++){
        ps.setString(i, "%" + search + "%");
    }

    ps.setInt(5, start);
    ps.setInt(6, recordsPerPage);

}else{
    ps = con.prepareStatement("SELECT * FROM bookings LIMIT ?,?");
    ps.setInt(1, start);
    ps.setInt(2, recordsPerPage);
}

ResultSet rs = ps.executeQuery();

int i = 1;

while(rs.next()){
%>

<div class="booking-card" style="--i:<%= i++ %>">

<h5>
<%= rs.getString("first_name") %> <%= rs.getString("last_name") %>
<span class="badge-service"><%= rs.getString("service") %></span>
</h5>

<p><i class="bi bi-calendar"></i> <%= rs.getString("booking_date") %></p>
<p><i class="bi bi-clock"></i> <%= rs.getString("time_slot") %></p>
<p><i class="bi bi-phone"></i> <%= rs.getString("phone") %></p>

<div>
<a href="editBooking.jsp?id=<%= rs.getInt("id") %>" class="btn btn-warning btn-sm me-2">
<i class="bi bi-pencil"></i> Edit
</a>

<a href="DeleteServlet?id=<%= rs.getInt("id") %>"
onclick="return confirm('Are you sure to delete?')"
class="btn btn-danger btn-sm">Delete</a>
</div>

</div>

<%
}
%>

<!-- 🔄 PAGINATION -->
<div class="text-center mt-4">

<%
String queryParam = (search != null && !search.trim().equals("")) ? "&search=" + search : "";

if(currentPage > 1){
%>
<a href="viewBookings.jsp?page=<%=currentPage-1%><%=queryParam%>" class="btn btn-light me-2">⬅ Prev</a>
<%
}
%>

<a href="viewBookings.jsp?page=<%=currentPage+1%><%=queryParam%>" class="btn btn-light">Next ➡</a>

</div>

</div>

<!-- 🔥 SCRIPT -->
<script>
window.onload = function(){
    document.getElementById("loader").style.display = "none";
}
</script>

</body>
</html>