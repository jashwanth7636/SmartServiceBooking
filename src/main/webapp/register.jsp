<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- ICONS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

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

body::before {
    content:"";
    position:absolute;
    width:100%;
    height:100%;
    background: rgba(0,0,0,0.6);
}

.register-box {
    position:relative;
    width:350px;
    padding:30px;
    background: rgba(0,0,0,0.7);
    border-radius:10px;
    color:white;
    text-align:center;
}

.register-box h2 {
    margin-bottom:20px;
    letter-spacing:2px;
}

.input-box {
    position:relative;
    margin-bottom:15px;
}

.input-box i.fa-lock,
.input-box i.fa-user {
    position:absolute;
    top:12px;
    left:10px;
    color:#aaa;
}

.input-box i.fa-eye,
.input-box i.fa-eye-slash {
    position:absolute;
    top:12px;
    right:10px;
    cursor:pointer;
    color:#aaa;
}

.input-box input {
    width:100%;
    padding:10px 35px 10px 35px;
    border:none;
    outline:none;
}

.btn-register {
    width:100%;
    background:#2563eb;
    border:none;
    padding:10px;
    color:white;
    font-weight:bold;
}
.btn-register:hover {
    background:#1d4ed8;
}

#error {
    color:red;
    font-size:13px;
}

#strength {
    font-size:12px;
}

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

<script>
// 👁️ Toggle Password
function togglePassword(fieldId, icon){
    let input = document.getElementById(fieldId);

    if(input.type === "password"){
        input.type = "text";
        icon.classList.remove("fa-eye");
        icon.classList.add("fa-eye-slash");
    } else {
        input.type = "password";
        icon.classList.remove("fa-eye-slash");
        icon.classList.add("fa-eye");
    }
}

// 💪 Password Strength
function checkStrength(){
    let val = document.getElementById("password").value;
    let strength = document.getElementById("strength");

    if(val.length < 4){
        strength.innerHTML = "Weak 🔴";
        strength.style.color = "red";
    }
    else if(val.length < 8){
        strength.innerHTML = "Medium 🟡";
        strength.style.color = "orange";
    }
    else{
        strength.innerHTML = "Strong 🟢";
        strength.style.color = "lightgreen";
    }
}

// ✅ Confirm Password Validation
function validateForm() {
    let pass = document.getElementById("password").value;
    let confirm = document.getElementById("confirmPassword").value;
    let error = document.getElementById("error");

    if(pass !== confirm){
        error.innerHTML = "❌ Passwords do not match";
        return false;
    } else {
        error.innerHTML = "";
    }
    return true;
}
</script>

</head>

<body>

<div class="register-box">

<h2>REGISTER</h2>

<form action="RegisterServlet" method="post" onsubmit="return validateForm()">

<div class="input-box">
<i class="fa fa-user"></i>
<input type="text" name="username" placeholder="Username" required>
</div>

<div class="input-box">
<i class="fa fa-lock"></i>
<input type="password" id="password" name="password" placeholder="Password" onkeyup="checkStrength()" required>
<i class="fa fa-eye" onclick="togglePassword('password', this)"></i>
</div>

<small id="strength"></small>

<div class="input-box">
<i class="fa fa-lock"></i>
<input type="password" id="confirmPassword" placeholder="Confirm Password" required>
<i class="fa fa-eye" onclick="togglePassword('confirmPassword', this)"></i>
</div>

<p id="error"></p>

<button class="btn-register">REGISTER</button>

</form>

<div class="links mt-3">
Already have account? 
<a href="login.jsp">Login</a>
</div>

</div>

</body>
</html>