<%@ page import="com.example.superm.UserNow" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%
    UserNow.setRole(0);
    UserNow.user.setNom("");
    UserNow.user.setRole(0);
%>
<html lang="fr">
<head>
    <title>Connexion - ElectroShop</title>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a81368914c.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        :root {
            --primary-glow: #4f46e5;
            --secondary-glow: #7c3aed;
            --accent-glow: #ec4899;
            --background-start: #0f172a;
            --background-end: #1e293b;
            --text-primary: #ffffff;
            --text-secondary: #94a3b8;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        @keyframes gradientBG {
            0% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
            100% {
                background-position: 0% 50%;
            }
        }

        @keyframes float {
            0% {
                transform: translateY(0px);
            }
            50% {
                transform: translateY(-10px);
            }
            100% {
                transform: translateY(0px);
            }
        }

        @keyframes pulse {
            0% {
                transform: scale(1);
                opacity: 0.8;
            }
            50% {
                transform: scale(1.05);
                opacity: 1;
            }
            100% {
                transform: scale(1);
                opacity: 0.8;
            }
        }

        body {
            font-family: 'Outfit', sans-serif;
            min-height: 100vh;
            background: linear-gradient(-45deg, var(--background-start), var(--background-end));
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
            display: flex;
            justify-content: center;
            align-items: center;
            line-height: 1.5;
        }

        .container {
            width: 90%;
            max-width: 480px;
            background: rgba(255, 255, 255, 0.03);
            padding: 3rem;
            border-radius: 2rem;
            box-shadow:
                    0 0 20px rgba(79, 70, 229, 0.15),
                    0 0 40px rgba(79, 70, 229, 0.1),
                    inset 0 0 80px rgba(79, 70, 229, 0.05);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            position: relative;
            overflow: hidden;
        }

        .glow-effect {
            position: absolute;
            width: 150px;
            height: 150px;
            background: radial-gradient(circle, var(--primary-glow) 0%, transparent 70%);
            filter: blur(20px);
            opacity: 0.15;
            animation: pulse 4s ease-in-out infinite;
        }

        .glow-top-right {
            top: -75px;
            right: -75px;
        }

        .glow-bottom-left {
            bottom: -75px;
            left: -75px;
            background: radial-gradient(circle, var(--secondary-glow) 0%, transparent 70%);
        }

        .logo-container {
            text-align: center;
            margin-bottom: 2.5rem;
            animation: float 6s ease-in-out infinite;
        }

        .logo-container img {
            width: 80px;
            height: 80px;
            object-fit: contain;
            filter: drop-shadow(0 0 10px rgba(79, 70, 229, 0.5));
        }

        h1 {
            color: var(--text-primary);
            font-size: 2.2rem;
            font-weight: 600;
            text-align: center;
            margin-bottom: 2rem;
            background: linear-gradient(to right, #fff, #a5b4fc);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            letter-spacing: -0.5px;
            text-shadow: 0 0 30px rgba(79, 70, 229, 0.3);
        }

        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
            z-index: 1;
        }

        .form-group i {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            left: 1.25rem;
            color: var(--text-secondary);
            transition: all 0.3s ease;
        }

        .input-field {
            width: 100%;
            padding: 1.2rem 1.2rem 1.2rem 3rem;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 1.2rem;
            font-size: 1rem;
            font-weight: 400;
            color: var(--text-primary);
            transition: all 0.3s ease;
            letter-spacing: 0.5px;
        }

        .input-field::placeholder {
            color: var(--text-secondary);
        }

        .input-field:focus {
            outline: none;
            border-color: var(--primary-glow);
            box-shadow:
                    0 0 15px rgba(79, 70, 229, 0.2),
                    inset 0 0 10px rgba(79, 70, 229, 0.1);
            background: rgba(255, 255, 255, 0.08);
        }

        .input-field:focus + i {
            color: var(--primary-glow);
            text-shadow: 0 0 10px var(--primary-glow);
        }

        .submit-btn {
            width: 100%;
            padding: 1.2rem;
            background: linear-gradient(135deg, var(--primary-glow), var(--secondary-glow));
            color: var(--text-primary);
            border: none;
            border-radius: 1.2rem;
            font-size: 1.1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            letter-spacing: 1px;
            text-transform: uppercase;
            box-shadow: 0 0 20px rgba(79, 70, 229, 0.3);
        }

        .submit-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(
                    120deg,
                    transparent,
                    rgba(255, 255, 255, 0.3),
                    transparent
            );
            transition: 0.6s;
        }

        .submit-btn:hover::before {
            left: 100%;
        }

        .submit-btn:hover {
            transform: translateY(-3px);
            box-shadow:
                    0 5px 25px rgba(79, 70, 229, 0.4),
                    0 0 40px rgba(79, 70, 229, 0.2);
        }

        .links {
            margin-top: 2.5rem;
            text-align: center;
            display: flex;
            justify-content: center;
            gap: 2rem;
            position: relative;
            z-index: 1;
        }

        .links a {
            color: var(--text-secondary);
            text-decoration: none;
            font-size: 1rem;
            font-weight: 400;
            transition: all 0.3s ease;
            position: relative;
            padding: 0.5rem 1rem;
            border-radius: 0.8rem;
        }

        .links a:hover {
            color: var(--text-primary);
            text-shadow: 0 0 10px var(--primary-glow);
            background: rgba(255, 255, 255, 0.05);
        }

        @media (max-width: 640px) {
            .container {
                padding: 2rem;
                width: 95%;
            }

            h1 {
                font-size: 1.8rem;
            }

            .input-field {
                padding: 1rem 1rem 1rem 2.75rem;
            }

            .links {
                flex-direction: column;
                gap: 1rem;
            }
        }

        /* Animations améliorées */
        @keyframes fadeInScale {
            from {
                opacity: 0;
                transform: scale(0.95) translateY(10px);
            }
            to {
                opacity: 1;
                transform: scale(1) translateY(0);
            }
        }

        .form-group {
            animation: fadeInScale 0.6s ease-out forwards;
            opacity: 0;
        }

        .form-group:nth-child(1) {
            animation-delay: 0.2s;
        }

        .form-group:nth-child(2) {
            animation-delay: 0.4s;
        }

        .submit-btn {
            animation: fadeInScale 0.6s ease-out forwards;
            animation-delay: 0.6s;
            opacity: 0;
        }

        .links {
            animation: fadeInScale 0.6s ease-out forwards;
            animation-delay: 0.8s;
            opacity: 0;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="glow-effect glow-top-right"></div>
    <div class="glow-effect glow-bottom-left"></div>
    <div class="logo-container">
        <img src="images/logo.svg" alt="">
    </div>
    <h1>Bienvenue</h1>
    <form method="post" action="loginServlet">
        <div class="form-group">
            <input type="email" name="email" class="input-field" placeholder="Adresse email" required>
            <i class="fas fa-envelope"></i>
        </div>
        <div class="form-group">
            <input type="password" name="password" class="input-field" placeholder="Mot de passe" required>
            <i class="fas fa-lock"></i>
        </div>
        <button type="submit" class="submit-btn">Se connecter</button>
        <div class="links">
            <a href="forgotpass.jsp">Mot de passe oublié ?</a>
            <a href="register.jsp">Créer un compte</a>
        </div>
    </form>
</div>
</body>
</html>