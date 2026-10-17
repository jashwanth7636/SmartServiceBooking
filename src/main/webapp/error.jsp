<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    background: #ffd6d6;
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
    background: #ff4d4d;
    border-radius: 50%;
    margin: -70px auto 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    color: white;
    font-size: 30px;
}

.btn-custom {
    background: #ff4d4d;
    color: white;
    border-radius: 10px;
}
</style>

</head>

<body>

<div class="card-box">

<div class="circle">✖</div>

<h3>Oops!</h3>
<p>Something went wrong</p>

<a href="book.jsp" class="btn btn-custom">Try Again</a>

</div>

</body>
</html>