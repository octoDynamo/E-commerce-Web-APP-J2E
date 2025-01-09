<%@ page import="java.util.List" %>
<%@ page import="Entity.Commande" %>
<%@ page import="Entity.Produit" %>
<%@ page import="com.example.superm.Command" %>
<%@ page import="DataAccessObject.ProduitDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Commande> commandeList = Command.get();
    double sum = 0;
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mon Panier - ElectroShop</title>
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
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
        }

        header {
            text-align: center;
            padding: 3rem 0;
            position: relative;
        }

        h1 {
            font-size: 2.5rem;
            font-weight: 600;
            background: linear-gradient(to right, #fff, #a5b4fc);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 1rem;
            text-shadow: 0 0 30px rgba(79, 70, 229, 0.3);
        }

        .card {
            background: var(--card-bg);
            border-radius: 1.5rem;
            backdrop-filter: blur(20px);
            border: 1px solid var(--border-color);
            box-shadow:
                    0 0 20px rgba(79, 70, 229, 0.15),
                    0 0 40px rgba(79, 70, 229, 0.1);
            margin-bottom: 2rem;
            position: relative;
            overflow: hidden;
        }

        .card-header {
            background: rgba(79, 70, 229, 0.1);
            padding: 1.5rem;
            border-bottom: 1px solid var(--border-color);
        }

        .card-title {
            font-size: 1.5rem;
            color: var(--text-primary);
            margin: 0;
        }

        .card-body {
            padding: 1.5rem;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 1rem;
        }

        th, td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid var(--border-color);
        }

        th {
            color: var(--text-secondary);
            font-weight: 500;
            text-transform: uppercase;
            font-size: 0.875rem;
            letter-spacing: 0.05em;
        }

        tr:hover {
            background: rgba(255, 255, 255, 0.02);
        }

        .btn {
            display: inline-block;
            padding: 0.75rem 1.5rem;
            border-radius: 0.75rem;
            border: none;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 1rem;
            font-family: 'Outfit', sans-serif;
        }

        .btn-danger {
            background: linear-gradient(135deg, #ef4444, #dc2626);
            color: white;
            padding: 0.5rem 1rem;
            font-size: 0.875rem;
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--primary-glow), var(--secondary-glow));
            color: white;
            box-shadow: 0 0 20px rgba(79, 70, 229, 0.3);
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(79, 70, 229, 0.4);
        }

        .total-section {
            text-align: right;
            padding: 2rem;
            background: var(--card-bg);
            border-radius: 1.5rem;
            border: 1px solid var(--border-color);
            margin-top: 2rem;
        }

        .total-amount {
            font-size: 1.5rem;
            margin-bottom: 1.5rem;
        }

        .payment-buttons {
            display: flex;
            gap: 1rem;
            justify-content: flex-end;
            flex-wrap: wrap;
        }

        .glow-effect {
            position: absolute;
            width: 200px;
            height: 200px;
            background: radial-gradient(circle, var(--primary-glow) 0%, transparent 70%);
            filter: blur(40px);
            opacity: 0.15;
        }

        .top-right {
            top: -100px;
            right: -100px;
        }

        .bottom-left {
            bottom: -100px;
            left: -100px;
            background: radial-gradient(circle, var(--secondary-glow) 0%, transparent 70%);
        }

        footer {
            text-align: center;
            padding: 2rem;
            color: var(--text-secondary);
            border-top: 1px solid var(--border-color);
            margin-top: 3rem;
        }

        @media (max-width: 768px) {
            .container {
                padding: 1rem;
            }

            table {
                display: block;
                overflow-x: auto;
            }

            .payment-buttons {
                flex-direction: column;
            }

            .btn {
                width: 100%;
                margin-bottom: 0.5rem;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <header>
        <h1>Mon Panier</h1>
    </header>

    <div class="card">
        <div class="glow-effect top-right"></div>
        <div class="glow-effect bottom-left"></div>

        <div class="card-header">
            <h2 class="card-title">Détails du Panier</h2>
        </div>

        <div class="card-body">
            <table>
                <thead>
                <tr>
                    <th>Produit</th>
                    <th>Quantité</th>
                    <th>Prix Unitaire (MAD)</th>
                    <th>Total (MAD)</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <%
                    for (Commande cmd : commandeList) {
                        Produit produit = new ProduitDAO().getById(cmd.getProduit_id());
                        if (produit != null) {
                            double prix = produit.getPrix();
                            double total = prix * cmd.getQuantite();
                %>

                <tr>
                    <td><%= produit.getNom() %></td>
                    <td><%= cmd.getQuantite() %></td>
                    <td><%= String.format("%.2f", prix) %> MAD</td>
                    <td><%= String.format("%.2f", total) %> MAD</td>
                </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
            <p>Total: <%= String.format("%.2f", sum) %> MAD</p>
        </div>
    </div>

    <div class="total-section">
        <div class="total-amount">
            Total : <strong><%= String.format("%.2f", sum) %> MAD</strong>
        </div>
        <div class="payment-buttons">
            <form action="paiementcard.jsp" method="post">
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-credit-card"></i> Paiement par Carte
                </button>
            </form>

            <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                <input type="hidden" name="cmd" value="_xclick">
                <input type="hidden" name="business" value="workoutaiman@hotmail.com">
                <input type="hidden" name="item_name" value="ElectroShop Cart Total">
                <input type="hidden" name="amount" value="<%= String.format("%.2f", sum / 10) %>">
                <input type="hidden" name="currency_code" value="EUR">
                <button type="submit" class="btn btn-primary">
                    <i class="fab fa-paypal"></i> Payer avec PayPal
                </button>
            </form>
        </div>
    </div>

    <footer>
        <p>&copy; 2025 ElectroShop. Tous droits réservés.</p>
    </footer>
</div>
</body>
</html>