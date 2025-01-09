<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscription - ElectroShop</title>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a81368914c.js"></script>
    <style>
        :root {
            --primary-glow: #4f46e5;
            --secondary-glow: #7c3aed;
            --background-start: #0f172a;
            --background-end: #1e293b;
            --text-primary: #ffffff;
            --text-secondary: #94a3b8;
            --error-color: #ef4444;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
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
            padding: 2rem;
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .container {
            width: 100%;
            max-width: 800px;
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
            width: 200px;
            height: 200px;
            background: radial-gradient(circle, var(--primary-glow) 0%, transparent 70%);
            filter: blur(30px);
            opacity: 0.15;
            animation: pulse 4s ease-in-out infinite;
        }

        @keyframes pulse {
            0% { transform: scale(1); opacity: 0.15; }
            50% { transform: scale(1.1); opacity: 0.2; }
            100% { transform: scale(1); opacity: 0.15; }
        }

        .glow-top-right {
            top: -100px;
            right: -100px;
        }

        .glow-bottom-left {
            bottom: -100px;
            left: -100px;
            background: radial-gradient(circle, var(--secondary-glow) 0%, transparent 70%);
        }

        h1 {
            color: var(--text-primary);
            font-size: 2.2rem;
            font-weight: 600;
            text-align: center;
            margin-bottom: 2.5rem;
            background: linear-gradient(to right, #fff, #a5b4fc);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 0 0 30px rgba(79, 70, 229, 0.3);
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1.5rem;
        }

        .form-group {
            position: relative;
            animation: fadeInUp 0.5s ease-out forwards;
            opacity: 0;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .form-group label {
            display: block;
            color: var(--text-secondary);
            margin-bottom: 0.5rem;
            font-size: 0.9rem;
            font-weight: 500;
        }

        .input-field {
            width: 100%;
            padding: 1rem 1rem 1rem 2.5rem;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 1rem;
            font-size: 1rem;
            color: var(--text-primary);
            transition: all 0.3s ease;
        }

        .input-field:focus {
            outline: none;
            border-color: var(--primary-glow);
            box-shadow: 0 0 15px rgba(79, 70, 229, 0.2);
            background: rgba(255, 255, 255, 0.08);
        }

        .form-group i {
            position: absolute;
            left: 1rem;
            top: 2.3rem;
            color: var(--text-secondary);
            transition: all 0.3s ease;
        }

        .radio-group {
            display: flex;
            gap: 1.5rem;
            padding: 0.5rem 0;
        }

        .radio-container {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--text-secondary);
            cursor: pointer;
        }

        .radio-container input[type="radio"] {
            appearance: none;
            width: 1.2rem;
            height: 1.2rem;
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: 50%;
            position: relative;
            cursor: pointer;
        }

        .radio-container input[type="radio"]:checked {
            border-color: var(--primary-glow);
        }

        .radio-container input[type="radio"]:checked::after {
            content: '';
            position: absolute;
            width: 0.6rem;
            height: 0.6rem;
            background: var(--primary-glow);
            border-radius: 50%;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            box-shadow: 0 0 10px var(--primary-glow);
        }

        .submit-btn {
            width: 100%;
            padding: 1.2rem;
            background: linear-gradient(135deg, var(--primary-glow), var(--secondary-glow));
            color: var(--text-primary);
            border: none;
            border-radius: 1rem;
            font-size: 1.1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-top: 1rem;
            box-shadow: 0 0 20px rgba(79, 70, 229, 0.3);
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 25px rgba(79, 70, 229, 0.4);
        }

        .login-link {
            text-align: center;
            margin-top: 1.5rem;
        }

        .login-link a {
            color: var(--text-secondary);
            text-decoration: none;
            font-size: 0.95rem;
            transition: all 0.3s ease;
            padding: 0.5rem 1rem;
            border-radius: 0.8rem;
        }

        .login-link a:hover {
            color: var(--text-primary);
            background: rgba(255, 255, 255, 0.05);
            text-shadow: 0 0 10px var(--primary-glow);
        }

        @media (max-width: 768px) {
            .container {
                padding: 2rem;
                margin: 1rem;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            h1 {
                font-size: 1.8rem;
            }
        }

        .form-group {
            animation-fill-mode: both;
        }

        .form-group:nth-child(1) { animation-delay: 0.1s; }
        .form-group:nth-child(2) { animation-delay: 0.2s; }
        .form-group:nth-child(3) { animation-delay: 0.3s; }
        .form-group:nth-child(4) { animation-delay: 0.4s; }
        .form-group:nth-child(5) { animation-delay: 0.5s; }
        .form-group:nth-child(6) { animation-delay: 0.6s; }
        .submit-btn { animation: fadeInUp 0.5s ease-out 0.7s forwards; opacity: 0; }
        .login-link { animation: fadeInUp 0.5s ease-out 0.8s forwards; opacity: 0; }
    </style>
</head>
<body>
<div class="container">
    <div class="glow-effect glow-top-right"></div>
    <div class="glow-effect glow-bottom-left"></div>

    <h1>Créer un compte</h1>

    <form method="post" action="RegisterServlet">
        <div class="form-grid">
            <div class="form-group">
                <label>Prénom</label>
                <i class="fas fa-user"></i>
                <input type="text" name="first_name" class="input-field" required>
            </div>

            <div class="form-group">
                <label>Nom</label>
                <i class="fas fa-user"></i>
                <input type="text" name="last_name" class="input-field" required>
            </div>

            <div class="form-group">
                <label>Date de naissance</label>
                <i class="fas fa-calendar"></i>
                <input type="date" name="birthday" class="input-field" required>
            </div>

            <div class="form-group">
                <label>Genre</label>
                <div class="radio-group">
                    <label class="radio-container">
                        <input type="radio" name="gender" value="Male" checked>
                        Homme
                    </label>
                    <label class="radio-container">
                        <input type="radio" name="gender" value="Female">
                        Femme
                    </label>
                </div>
            </div>

            <div class="form-group">
                <label>Email</label>
                <i class="fas fa-envelope"></i>
                <input type="email" name="email" class="input-field" required>
            </div>

            <div class="form-group">
                <label>Téléphone</label>
                <i class="fas fa-phone"></i>
                <input type="tel" name="phone" class="input-field" required>
            </div>

            <div class="form-group">
                <label>Mot de passe</label>
                <i class="fas fa-lock"></i>
                <input type="password" name="password" class="input-field" required>
            </div>

            <div class="form-group">
                <label>Confirmer le mot de passe</label>
                <i class="fas fa-lock"></i>
                <input type="password" name="confirmpassword" class="input-field" required>
            </div>
        </div>

        <button type="submit" class="submit-btn">S'inscrire</button>

        <div class="login-link">
            <a href="login.jsp">Déjà inscrit ? Se connecter</a>
        </div>
    </form>
</div>
</body>
</html>