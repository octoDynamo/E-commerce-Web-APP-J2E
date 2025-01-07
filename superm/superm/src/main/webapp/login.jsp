<%@ page import="com.example.superm.UserNow" %>
<!DOCTYPE html>
<%
    UserNow.setRole(0);
    UserNow.user.setNom("");
    UserNow.user.setRole(0);
%>
<html>
<head>
    <title>Login</title>
    <link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a81368914c.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f8e8ff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            width: 100%;
            max-width: 400px;
            background: #fff;
            padding: 3rem;
            border-radius: 10px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            height: 450px; /* Set a specific height for the container */
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .container img {
            display: block;
            margin: 0 auto 1.5rem;
            width: 80px;
        }
        .container h2 {
            text-align: center;
            font-size: 1.8rem;
            color: #a659b5;
            margin-bottom: 1.5rem;
        }
        .input-div {
            position: relative;
            margin-bottom: 1.5rem;
        }
        .input-div .i {
            position: absolute;
            top: 10px;
            left: 10px;
            color: #a659b5;
        }
        .input-div input {
            width: 100%;
            padding: 10px 10px 10px 40px;
            border: 1px solid #d8bfd8;
            border-radius: 5px;
            font-size: 1rem;
        }

        .btn {
            width: 100%;
            height: 60px;
            background: #a659b5;
            color: #fff;
            padding: 0.8rem; /* Increased padding for taller button */
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
            margin-top: 1rem;
            transition: background 0.3s;
        }

        .btn:hover {
            background: #9448a3;
        }

        a {
            text-decoration: none;
            font-size: 0.9rem;
            color: #a659b5;
            display: block;
            text-align: center;
            margin-top: 0.5rem;
        }
        a:hover {
            color: #9448a3;
        }
    </style>
</head>
<body>
<div class="container">
    <img src="images/man.svg" alt="User Icon">
    <h2>Login</h2>
    <form method="post" action="loginServlet">
        <div class="input-div">
            <div class="i">
                <i class="fas fa-user"></i>
            </div>
            <input type="email" name="email" placeholder="Email">
        </div>
        <div class="input-div">
            <div class="i">
                <i class="fas fa-lock"></i>
            </div>
            <input type="password" name="password" placeholder="Password">
        </div>
        <input type="submit" class="btn" value="Login">
        <a href="forgotpass.jsp">Forgot Password?</a>
        <a href="register.jsp">Register?</a>
    </form>
</div>
</body>
</html>
