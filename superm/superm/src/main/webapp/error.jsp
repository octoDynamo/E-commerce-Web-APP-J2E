<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Erreur 404 - Page non trouvée</title>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-glow: #4f46e5;
            --secondary-glow: #7c3aed;
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

        body {
            font-family: 'Outfit', sans-serif;
            min-height: 100vh;
            background: linear-gradient(-45deg, var(--background-start), var(--background-end));
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: var(--text-primary);
            padding: 2rem;
            overflow: hidden;
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .error-content {
            text-align: center;
            position: relative;
            z-index: 1;
        }

        h1 {
            font-size: 2.5rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            background: linear-gradient(to right, #fff, #a5b4fc);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 0 0 30px rgba(79, 70, 229, 0.3);
        }

        .message {
            font-size: 1.1rem;
            color: var(--text-secondary);
            max-width: 600px;
            margin: 0 auto 3rem;
            line-height: 1.6;
        }

        .error-numbers {
            font-size: 8rem;
            font-weight: 700;
            display: flex;
            gap: 1rem;
            margin: 2rem 0;
            position: relative;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-20px); }
        }

        .number {
            background: linear-gradient(135deg, var(--primary-glow), var(--secondary-glow));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 0 0 30px rgba(79, 70, 229, 0.3);
            animation: float 3s ease-in-out infinite;
            position: relative;
        }

        .number:nth-child(2) {
            animation-delay: 0.2s;
        }

        .number:nth-child(3) {
            animation-delay: 0.4s;
        }

        .glow-effect {
            position: fixed;
            width: 300px;
            height: 300px;
            filter: blur(100px);
            opacity: 0.15;
            pointer-events: none;
        }

        .glow-1 {
            top: -150px;
            right: -150px;
            background: radial-gradient(circle, var(--primary-glow) 0%, transparent 70%);
            animation: float 6s ease-in-out infinite;
        }

        .glow-2 {
            bottom: -150px;
            left: -150px;
            background: radial-gradient(circle, var(--secondary-glow) 0%, transparent 70%);
            animation: float 8s ease-in-out infinite reverse;
        }

        .back-button {
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            padding: 1rem 2rem;
            border-radius: 1rem;
            color: var(--text-primary);
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
            margin-top: 2rem;
        }

        .back-button:hover {
            background: rgba(255, 255, 255, 0.1);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(79, 70, 229, 0.4);
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .error-content > * {
            animation: fadeIn 0.6s ease-out forwards;
        }

        h1 { animation-delay: 0.2s; }
        .message { animation-delay: 0.4s; }
        .error-numbers { animation-delay: 0.6s; }
        .back-button { animation-delay: 0.8s; opacity: 0; }

        @media (max-width: 768px) {
            .error-numbers {
                font-size: 5rem;
            }

            h1 {
                font-size: 2rem;
            }

            .message {
                font-size: 1rem;
                padding: 0 1rem;
            }
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
        }
    </style>
</head>
<body>
<div class="glow-effect glow-1"></div>
<div class="glow-effect glow-2"></div>

<div class="error-content">
    <h1>Page non trouvée</h1>

    <p class="message">
        <b>Mahdi & Hajar :</b> On a fait un effort et donné tout ce qu'on a,
        mais on n'a pas réussi à finir dans les temps.
    </p>

    <div class="error-numbers">
        <span class="number">4</span>
        <span class="number">0</span>
        <span class="number">4</span>
    </div>

    <a href="dashboard.jsp" class="back-button">
        Retour au tableau de bord
    </a>
</div>
</body>
</html>