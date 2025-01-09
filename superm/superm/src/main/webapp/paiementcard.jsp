<%@ page import="java.util.List" %>
<%@ page import="Entity.Commande" %>
<%@ page import="com.example.superm.Command" %>
<%@ page import="DataAccessObject.ProduitDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<%
    List<Commande> commandeList = Command.get();
    double sum = 0;
    for (Commande cmd : commandeList) {
        sum += cmd.getQuantite() * (new ProduitDAO().getById(cmd.getProduit_id()).getPrix());
    }
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Paiement - ElectroShop</title>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-glow: #4f46e5;
            --secondary-glow: #7c3aed;
            --background-start: #0f172a;
            --background-end: #1e293b;
            --text-primary: #ffffff;
            --text-secondary: #94a3b8;
            --card-bg: rgba(255, 255, 255, 0.03);
            --border-color: rgba(255, 255, 255, 0.1);
            --success: #10b981;
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
            color: var(--text-primary);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .payment-card {
            width: 100%;
            max-width: 500px;
            background: var(--card-bg);
            border-radius: 2rem;
            backdrop-filter: blur(20px);
            border: 1px solid var(--border-color);
            box-shadow:
                    0 0 20px rgba(79, 70, 229, 0.15),
                    0 0 40px rgba(79, 70, 229, 0.1);
            position: relative;
            overflow: hidden;
            padding: 2.5rem;
        }

        .glow-effect {
            position: absolute;
            width: 200px;
            height: 200px;
            filter: blur(40px);
            opacity: 0.15;
        }

        .glow-top-right {
            top: -100px;
            right: -100px;
            background: radial-gradient(circle, var(--primary-glow) 0%, transparent 70%);
        }

        .glow-bottom-left {
            bottom: -100px;
            left: -100px;
            background: radial-gradient(circle, var(--secondary-glow) 0%, transparent 70%);
        }

        .header {
            text-align: center;
            margin-bottom: 2.5rem;
        }

        .header h2 {
            font-size: 2rem;
            font-weight: 600;
            background: linear-gradient(to right, #fff, #a5b4fc);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 1rem;
        }

        .total {
            font-size: 1.25rem;
            color: var(--text-secondary);
        }

        .total strong {
            color: var(--success);
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 1.5rem;
            position: relative;
        }

        .form-group label {
            display: block;
            color: var(--text-secondary);
            margin-bottom: 0.5rem;
            font-size: 0.9rem;
        }

        .input-field {
            width: 100%;
            padding: 1rem 1rem 1rem 2.5rem;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--border-color);
            border-radius: 1rem;
            color: var(--text-primary);
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .input-field:focus {
            outline: none;
            border-color: var(--primary-glow);
            box-shadow: 0 0 15px rgba(79, 70, 229, 0.2);
        }

        .form-group i {
            position: absolute;
            left: 1rem;
            top: 2.3rem;
            color: var(--text-secondary);
            transition: all 0.3s ease;
        }

        .input-field:focus + i {
            color: var(--primary-glow);
        }

        .form-row {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr;
            gap: 1rem;
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
            margin-top: 1rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            box-shadow: 0 0 20px rgba(79, 70, 229, 0.3);
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(79, 70, 229, 0.4);
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

        .form-group {
            animation: fadeInUp 0.5s ease-out forwards;
            opacity: 0;
        }

        .form-group:nth-child(1) { animation-delay: 0.1s; }
        .form-group:nth-child(2) { animation-delay: 0.2s; }
        .form-group:nth-child(3) { animation-delay: 0.3s; }
        .submit-btn { animation: fadeInUp 0.5s ease-out 0.4s forwards; opacity: 0; }

        @media (max-width: 640px) {
            .payment-card {
                padding: 1.5rem;
            }

            .form-row {
                grid-template-columns: 1fr;
            }

            .header h2 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
<div class="payment-card">
    <div class="glow-effect glow-top-right"></div>
    <div class="glow-effect glow-bottom-left"></div>

    <div class="header">
        <h2>Paiement Sécurisé</h2>
        <div class="total">
            Total: <strong><%= String.format("%.2f", sum) %> MAD</strong>
        </div>
    </div>

    <form action="" method="post">
        <div class="form-group">
            <label for="cardName">Nom sur la carte</label>
            <input type="text" id="cardName" class="input-field" placeholder="Ex: Jean Dupont" required>
            <i class="fas fa-user"></i>
        </div>

        <div class="form-group">
            <label for="cardNumber">Numéro de carte</label>
            <input type="text" id="cardNumber" class="input-field" placeholder="1234 5678 9012 3456" required>
            <i class="fas fa-credit-card"></i>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label for="cardNumber">Date d'expiration</label>
                <input type="text" id="expiry" class="input-field" placeholder="MM/AA" required>
                <i class="fas fa-calendar"></i>
            </div>

            <div class="form-group">
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" class="input-field" placeholder="123" required>
                <i class="fas fa-lock"></i>
            </div>
        </div>

        <button type="submit" class="submit-btn">
            <i class="fas fa-shield-alt"></i> Payer maintenant
        </button>
    </form>
</div>
</body>
</html>