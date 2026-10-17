
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>

<%
String status = request.getParameter("status");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Service</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Flatpickr -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/themes/dark.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<style>
body {
    background: url('images/images.jpg') no-repeat center center fixed;
    background-size: cover;
    font-family: 'Poppins', sans-serif;
}

/* OVERLAY */
.overlay {
    background: rgba(0,0,0,0.75);
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
}

/* FORM BOX */
.form-box {
    width: 400px;
    padding: 30px;
    border-radius: 20px;
    backdrop-filter: blur(20px);
    background: rgba(255,255,255,0.08);
    color: white;
    box-shadow: 0 0 25px rgba(0,0,0,0.6);
    animation: float 4s ease-in-out infinite;
}

h3 {
    font-weight: bold;
}

/* INPUT */
input, select {
    margin-bottom: 15px;
    border-radius: 12px !important;
    background: rgba(255,255,255,0.1) !important;
    border: 1px solid rgba(255,255,255,0.2) !important;
    color: white !important;
}

/* FIX DROPDOWN */
select option {
    background: #111;
    color: white;
}

/* FOCUS */
input:focus, select:focus {
    border: 1px solid #3b82f6 !important;
    box-shadow: 0 0 10px #3b82f6;
}

/* BUTTON */
button {
    border-radius: 30px !important;
    background: linear-gradient(45deg,#3b82f6,#2563eb);
    border: none;
    box-shadow: 0 0 15px #2563eb;
}

button:hover {
    transform: scale(1.05);
    box-shadow: 0 0 25px #3b82f6;
}

/* FLOAT */
@keyframes float {
    0%,100% { transform: translateY(0); }
    50% { transform: translateY(-10px); }
}

/* POPUP */
#popup {
    position: fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background: rgba(0,0,0,0.7);
    display:none;
    align-items:center;
    justify-content:center;
    z-index:9999;
}

.popup-box {
    background: rgba(20,20,20,0.95);
    padding: 30px;
    border-radius: 20px;
    text-align:center;
    color:white;
    animation: scaleUp 0.4s ease;
}

.tick {
    font-size: 40px;
    color: #22c55e;
}

@keyframes scaleUp {
    from {transform:scale(0.5); opacity:0;}
    to {transform:scale(1); opacity:1;}
}

/* FLATPICKR STYLE */
.flatpickr-calendar {
    background: rgba(20,20,20,0.95) !important;
    border-radius: 15px;
}

.flatpickr-day.selected {
    background: #3b82f6 !important;
}
</style>

</head>

<body>

<div class="overlay">

<div class="form-box">

<h3 class="text-center mb-4">Book a Service</h3>

<form action="BookingServlet2" method="post">

<input type="text" name="firstName" class="form-control" placeholder="First Name" required>

<input type="text" name="lastName" class="form-control" placeholder="Last Name" required>

<input type="tel" name="phone" pattern="[0-9]{10}" class="form-control" placeholder="Phone number" required>

<select name="service" class="form-control" required>
<option value="" disabled selected hidden>Choose a service...</option>
<option>Barber</option>
<option>Mechanic</option>
<option>Tutor</option>
<option>Electrician</option>
<option>Plumber</option>
<option>Car Wash</option>
<option>AC Repair</option>
<option>Home Cleaning</option>
<option>Salon</option>
<option>Doctor</option>
</select>

<!-- ✅ FIXED DATE PICKER -->
<input type="text" id="datePicker" name="date" class="form-control" placeholder="Select Date" required>

<select name="time" class="form-control">
<option>09:00 AM - 10:00 AM</option>
<option>10:00 AM - 11:00 AM</option>
<option>11:00 AM - 12:00 PM</option>
<option>12:00 PM - 01:00 PM</option>
<option>02:00 PM - 03:00 PM</option>
<option>03:00 PM - 04:00 PM</option>
<option>04:00 PM - 05:00 PM</option>
<option>05:00 PM - 06:00 PM</option>
<option>06:00 PM - 07:00 PM</option>
<option>07:00 PM - 08:00 PM</option>
</select>

<button class="btn w-100 mt-2">Book Now</button>

</form>

</div>

</div>

<!-- POPUP -->
<div id="popup">
    <div class="popup-box">
        <div class="tick">✔</div>
        <h3>Booking Successful</h3>
        <p>Your service is confirmed</p>
    </div>
</div>

<!-- SCRIPT -->
<script>
flatpickr("#datePicker", {
    dateFormat: "Y-m-d", // ✅ FIXED
    minDate: "today"
});

let status = "<%= status %>";

if(status === "success"){
    document.getElementById("popup").style.display = "flex";

    setTimeout(() => {
        document.getElementById("popup").style.display = "none";
        window.location.href = "viewBookings.jsp";
    }, 2500);
}
</script>

</body>
</html>