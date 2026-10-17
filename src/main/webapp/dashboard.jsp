<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%
String user = (String) session.getAttribute("username");
if(user == null){
    user = "Guest";
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    margin: 0;
    font-family: 'Poppins', sans-serif;
}

/* HERO */
.hero {
    height: 100vh;
    background: url('<%=request.getContextPath()%>/images/zenitsu.png') no-repeat center center/cover;
    position: relative;
}

.hero::before {
    content: "";
    position: absolute;
    width:100%;
    height:100%;
    background: rgba(0,0,0,0.75);
}

/* NAVBAR */
.navbar {
    position: absolute;
    width: 100%;
    z-index: 3;
}

.navbar a {
    color: white !important;
    margin-right: 20px;
    position: relative;
    transition: 0.3s;
}

/* NAV HOVER */
.navbar a:hover {
    color: #3b82f6 !important;
}

.navbar a::after {
    content: "";
    position: absolute;
    width: 0%;
    height: 2px;
    background: #3b82f6;
    bottom: -3px;
    left: 0;
    transition: 0.3s;
}

.navbar a:hover::after {
    width: 100%;
}

/* LOGO */
.logo-text {
    font-size: 22px;
    font-weight: bold;
    background: linear-gradient(45deg,#3b82f6,#22c55e);
    -webkit-background-clip: text;
    color: transparent;
}

.logo-sub {
    font-size: 14px;
    color: #aaa;
}

/* CONTENT */
.content {
    position: relative;
    z-index: 2;
    color: white;
    padding: 120px 100px;
    max-width: 600px;
    animation: float 4s ease-in-out infinite;
}

h1 {
    font-size: 55px;
    font-weight: bold;
    animation: fadeUp 1s ease;
}

/* BUTTON */
.btn-custom {
    border-radius: 30px;
    padding: 10px 25px;
}

.btn-primary {
    box-shadow: 0 0 15px #2563eb;
}

.btn-success {
    box-shadow: 0 0 15px #22c55e;
}

.btn:hover {
    transform: scale(1.05);
}

/* PROFILE BUTTON */
.profile-btn {
    background: rgba(255,255,255,0.1);
    border: none;
    padding: 8px 15px;
    border-radius: 10px;
    color: white;
    backdrop-filter: blur(10px);
    transition: 0.3s;
}

.profile-btn:hover {
    background: rgba(255,255,255,0.2);
}

/* DROPDOWN */
.dropdown-menu {
    background: rgba(0,0,0,0.9);
    border-radius: 10px;
}

.dropdown-item {
    color: white;
}

.dropdown-item:hover {
    background: rgba(255,255,255,0.1);
}

/* ANIMATIONS */
@keyframes fadeUp {
    from {opacity:0; transform:translateY(30px);}
    to {opacity:1; transform:translateY(0);}
}

@keyframes float {
    0%,100% {transform:translateY(0);}
    50% {transform:translateY(-10px);}
}
</style>

</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg">
<div class="container">

<a class="navbar-brand fw-bold">
<span class="logo-text">ReadySet</span><br>
<span class="logo-sub">Services</span>
</a>

<div>

<a href="dashboard.jsp">𝐇𝐨𝐦𝐞</a>
<a href="book.jsp">𝐬𝐜𝐡𝐞𝐝𝐮𝐥𝐞 𝐲𝐨𝐮𝐫 𝐬𝐞𝐫𝐯𝐢𝐜𝐞</a>
<a href="viewBookings.jsp">𝐌𝐲 𝐁𝐨𝐨𝐤𝐢𝐧𝐠𝐬</a>

<!-- PROFILE -->
<div class="dropdown d-inline">

<button class="profile-btn dropdown-toggle" data-bs-toggle="dropdown">
 <%= user %>
</button>

<ul class="dropdown-menu dropdown-menu-end">

<li class="dropdown-item text-center fw-bold">
 <%= user %>
</li>

<li><hr class="dropdown-divider"></li>


<li>
<a class="dropdown-item text-danger" href="logout.jsp">Logout</a>
</li>

</ul>

</div>

</div>

</div>
</nav>

<!-- HERO -->
<div class="hero">

<div class="content">

<p>Smart Service Booking System</p>

<h1>𝑺𝒕𝒐𝒑 𝑺𝒆𝒂𝒓𝒄𝒉𝒊𝒏𝒈 <br>𝑺𝒕𝒂𝒓𝒕 𝑩𝒐𝒐𝒌𝒊𝒏𝒈.</h1>

<p>𝕊𝕜𝕚𝕡 𝕥𝕙𝕖 𝕨𝕒𝕚𝕥 𝕒𝕟𝕕 𝕤𝕖𝕔𝕦𝕣𝕖 𝕪𝕠𝕦𝕣 𝕤𝕡𝕠𝕥 𝕚𝕟 𝕤𝕖𝕔𝕠𝕟𝕕𝕤 𝕨𝕚𝕥𝕙 𝕠𝕦𝕣 𝕤𝕖𝕒𝕞𝕝𝕖𝕤𝕤 𝕤𝕪𝕤𝕥𝕖𝕞.</p>

<br>

<a href="book.jsp" class="btn btn-primary btn-custom">Book Now</a>
<a href="viewBookings.jsp" class="btn btn-success btn-custom">View Bookings</a>

</div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>