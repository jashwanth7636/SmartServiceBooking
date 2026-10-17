<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<meta charset="UTF-8">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Success</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    background: #dbeafe; /* light blue */
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

.card-box {
    background: white;
    padding: 40px;
    border-radius: 20px;
    text-align: center;
    width: 350px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.2);
}

.circle {
    width: 70px;
    height: 70px;
    background: #2563eb; /* blue */
    border-radius: 50%;
    margin: -70px auto 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    color: white;
    font-size: 30px;
}

.btn-custom {
    background: #2563eb; /* blue button */
    color: white;
    border-radius: 10px;
}

.btn-custom:hover {
    background: #1d4ed8;
}
</style>

</head>

<body>

<div class="card-box">

<div class="circle">✓</div>

<h3>All done!</h3>
<h2>Thank you!</h2>
<p> All set and ready to start</p>

<a href="dashboard.jsp" class="btn btn-custom">Go to Dashboard</a>

</div>

</body>
</html>