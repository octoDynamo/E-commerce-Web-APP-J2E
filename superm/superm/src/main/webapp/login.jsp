<%@ page import="com.example.superm.UserNow" %>
<!DOCTYPE html>
<%
    UserNow.setRole(0);
    UserNow.user.setNom("");
    UserNow.user.setRole(0);
%>
<html>
<head>
    <title>Animated Login Form</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a81368914c.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<div class="container">
    <div class="img">
        <img src="images/login.svg">
    </div>
    <div class="login-content">
        <form method="post" action="loginServlet">
            <img src="images/man.svg">
            <h2 class="title">Login</h2>
            <div class="input-div one">
                <div class="i">
                    <i class="fas fa-user"></i>
                </div>
                <div class="div">
                    <h5>Email</h5>
                    <input type="email" class="input" name="email">
                </div>
            </div>
            <div class="input-div pass">
                <div class="i">
                    <i class="fas fa-lock"></i>
                </div>
                <div class="div">
                    <h5>Password</h5>
                    <input type="password" class="input" name="password">
                </div>
            </div>
            <a href="forgotpass.jsp">Forgot Password?</a>
            <input type="submit" class="btn" value="Login">
            <a href="register.jsp">Register ?</a>

        </form>
    </div>
</div>
<script type="text/javascript" src="js/main.js"></script>


</body>
</html>
