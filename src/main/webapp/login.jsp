<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- ICONS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<%
String error = request.getParameter("error");
if(error != null){
%>

<div class="alert alert-danger text-center" 
     style="position:absolute; top:20px; width:300px; left:50%; transform:translateX(-50%);">
    ❌ Invalid Username or Password
</div>

<%
}
%>
<script>
setTimeout(() => {
    let alert = document.querySelector('.alert');
    if(alert) alert.style.display = 'none';
}, 3000);
</script>
<style>
body {
    margin:0;
    height:100vh;
    background: url('<%=request.getContextPath()%>/images/zenitsu.png') no-repeat center center/cover;
    display:flex;
    justify-content:center;
    align-items:center;
    font-family: Arial;
}

.login-box {
    animation: slideUp 1s ease;
}

@keyframes slideUp {
    from { transform: translateY(50px); opacity:0; }
    to { transform: translateY(0); opacity:1; }
}
/* DARK OVERLAY */
body::before {
    content:"";
    position:absolute;
    width:100%;
    height:100%;
    background: rgba(0,0,0,0.6);
}

/* LOGIN BOX */
.login-box {
    position:relative;
    width:350px;
    padding:30px;
    background: rgba(0,0,0,0.7);
    border-radius:10px;
    color:white;
    text-align:center;
}

/* TITLE */
.login-box h2 {
    margin-bottom:20px;
    letter-spacing:2px;
}

/* INPUT GROUP */
.input-box {
    position:relative;
    margin-bottom:15px;
}

.input-box i {
    position:absolute;
    top:12px;
    left:10px;
    color:#aaa;
}

.input-box input {
    width:100%;
    padding:10px 10px 10px 35px;
    border:none;
    outline:none;
}

/* BUTTON */
.btn-login {
    width:100%;
    background:#2563eb;
    border:none;
    padding:10px;
    color:white;
    font-weight:bold;
}

.btn-login:hover {
    background:#1d4ed8;
}

/* LINKS */
.links {
    font-size:12px;
    margin-top:10px;
}

.links a {
    color:#ccc;
    text-decoration:none;
}

.links a:hover {
    color:white;
}
</style>

</head>

<body>

<div class="login-box">

<h2>LOGIN</h2>

<form action="LoginServlet" method="post">

<div class="input-box">
<i class="fa fa-user"></i>
<input type="text" name="username" placeholder="Username" required>
</div>

<div class="input-box">
<i class="fa fa-lock"></i>
<input type="password" name="password" placeholder="Password" required>
</div>

<div class="form-check text-start mb-2">
<input type="checkbox" class="form-check-input">
<label class="form-check-label">Keep me logged in</label>
</div>

<button class="btn-login">LOG IN</button>

</form>

<div class="links mt-3">
<a href="#">Forgot password?</a> |
<a href="register.jsp">Register</a>
</div>

</div>

</body>
</html>