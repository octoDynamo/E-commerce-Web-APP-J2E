<%@ page import="com.example.superm.UserNow" %>
<%@ page import="DataAccessObject.ProduitDAO" %>
<%@ page import="Entity.Produit" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %>

<%
    List<Produit> produitList = new ArrayList<>();
    try {
        produitList = new ProduitDAO().getAll();
    } catch (SQLException e) {
        throw new RuntimeException(e);
    }
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ElectroShop - Votre boutique électronique</title>
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
            background: linear-gradient(-45deg, var(--background-start), var(--background-end));
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
            color: var(--text-primary);
            min-height: 100vh;
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .navbar {
            background: rgba(255, 255, 255, 0.03);
            backdrop-filter: blur(20px);
            border-bottom: 1px solid var(--border-color);
            padding: 1rem 0;
        }

        .navbar .container {
            max-width: 1200px; /* Restrict navbar width */
            margin: 0 auto; /* Center the navbar horizontally */
            padding: 0 1rem; /* Horizontal padding for spacing */
            display: flex; /* Flexbox layout */
            align-items: center; /* Align items vertically */
            justify-content: space-between; /* Align items to left and right */
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 1rem;
        }

        .nav-brand {
            font-size: 1.5rem;
            font-weight: 600;
            background: linear-gradient(to right, #fff, #a5b4fc);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .nav-links {
            display: flex;
            gap: 2rem;
            align-items: center;
        }

        .nav-link {
            color: var(--text-secondary);
            text-decoration: none;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .nav-link:hover {
            color: var(--text-primary);
            text-shadow: 0 0 10px var(--primary-glow);
        }
        .navbar .user-info {
            display: flex; /* Flex layout for user info */
            align-items: center; /* Align vertically */
            gap: 1rem; /* Space between icon and text */
        }

        .navbar .user-icon {
            font-size: 1.5rem; /* Icon size */
            color: #4f46e5; /* Primary color for icon */
        }

        .navbar .user-name {
            font-size: 1rem; /* Font size for user name */
            color: #ffffff; /* Text color */
            font-weight: 500; /* Medium font weight */
        }

        .navbar .logout-link {
            font-size: 0.9rem; /* Font size for logout link */
            color: rgba(255, 255, 255, 0.8); /* Subtle text color */
            text-decoration: none; /* Remove underline */
            transition: color 0.3s ease; /* Smooth transition */
        }

        .navbar .logout-link:hover {
            color: #ffffff; /* Highlighted color on hover */
            text-shadow: 0 0 10px rgba(79, 70, 229, 0.7); /* Glow effect */
        }

        .banner-section {
            padding: 4rem 0;
            position: relative;
            overflow: hidden;
        }

        .banner-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 2rem;
        }

        .banner-card {
            background: var(--card-bg);
            border-radius: 1.5rem;
            padding: 2rem;
            position: relative;
            overflow: hidden;
            border: 1px solid var(--border-color);
            backdrop-filter: blur(20px);
            transition: transform 0.3s ease;
        }

        .banner-card:hover {
            transform: translateY(-5px);
        }

        .glow-effect {
            position: absolute;
            width: 200px;
            height: 200px;
            filter: blur(40px);
            opacity: 0.15;
        }

        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 2rem;
            padding: 2rem 0;
        }

        .product-card {
            background: var(--card-bg);
            border-radius: 1.5rem;
            padding: 1.5rem;
            border: 1px solid var(--border-color);
            backdrop-filter: blur(20px);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .product-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        .product-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 1rem;
            margin-bottom: 1rem;
        }

        .product-title {
            font-size: 1.1rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: var(--text-primary);
        }

        .product-price {
            font-size: 1.2rem;
            color: #10b981;
            font-weight: 600;
            margin-bottom: 1rem;
        }

        .add-to-cart {
            width: 100%;
            padding: 0.8rem;
            background: linear-gradient(135deg, var(--primary-glow), var(--secondary-glow));
            border: none;
            border-radius: 0.8rem;
            color: var(--text-primary);
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .add-to-cart:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(79, 70, 229, 0.4);
        }

        .quantity-input {
            width: 60px;
            padding: 0.5rem;
            border: 1px solid var(--border-color);
            border-radius: 0.5rem;
            background: rgba(255, 255, 255, 0.05);
            color: var(--text-primary);
            margin-right: 0.5rem;
        }

        footer {
            border-top: 1px solid var(--border-color);
            padding: 2rem 0;
            margin-top: 4rem;
            text-align: center;
            color: var(--text-secondary);
        }

        @media (max-width: 768px) {
            .banner-grid {
                grid-template-columns: 1fr;
            }

            .products-grid {
                grid-template-columns: repeat(auto-fill, minmax(180px, 1fr));
            }
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .product-card {
            animation: fadeIn 0.5s ease-out forwards;
        }
    </style>
</head>
<body>
<nav class="navbar">
    <div class="container">
        <!-- Left: Navigation Links -->
        <div class="nav-brand">ElectroShop</div>
        <div class="nav-links">
            <a href="index.jsp" class="nav-link">Accueil</a>
            <a href="panier.jsp" class="nav-link">Panier</a>
        </div>

        <!-- Right: User Info -->
        <div class="user-info">
            <%
                Entity.Utilisateur user = (Entity.Utilisateur) session.getAttribute("user");
                if (user != null) {
            %>
            <i class="fa-solid fa-user user-icon"></i>
            <span class="user-name">
                    Bienvenue, <%= user.getNom() %> <%= user.getPrenom() %>!
                </span>
            <a href="logout.jsp" class="logout-link">(Déconnexion)</a>
            <% } else { %>
            <a href="login.jsp" class="login-link">Connexion</a>
            <% } %>
        </div>
    </div>
</nav>
<section class="banner-section">
    <div class="container">
        <div class="banner-grid">
            <div class="banner-card">
                <div class="glow-effect" style="background: radial-gradient(circle, var(--primary-glow) 0%, transparent 70%);"></div>
                <h2>Offres Spéciales</h2>
                <p>Jusqu'à 30% de réduction sur une sélection de produits</p>
                <button class="add-to-cart">Découvrir</button>
            </div>
            <div class="banner-card">
                <div class="glow-effect" style="background: radial-gradient(circle, var(--secondary-glow) 0%, transparent 70%);"></div>
                <h2>Nouveautés</h2>
                <p>Découvrez nos derniers produits électroniques</p>
                <button class="add-to-cart">Voir plus</button>
            </div>
        </div>
    </div>
</section>

<section class="products-section">
    <div class="container">
        <h2 class="section-title">Nos Produits</h2>
        <div class="products-grid">
            <% for(Produit P : produitList) { %>
            <div class="product-card">
                <div class="glow-effect" style="background: radial-gradient(circle, var(--primary-glow) 0%, transparent 70%);"></div>
                <img src="<%= P.getImage() %>" alt="<%= P.getNom() %>" class="product-image">
                <h3 class="product-title"><%= P.getNom() %></h3>
                <p class="product-description"><%= P.getDescription() %></p>
                <div class="product-price"><%= P.getPrix() %> MAD</div>
                <form action="addpanier" method="post" class="add-to-cart-form">
                    <input type="hidden" name="id" value="<%= P.getId() %>">
                    <input type="number" name="quantite" value="1" min="1" class="quantity-input">
                    <button type="submit" class="add-to-cart">
                        <i class="fas fa-cart-plus"></i> Ajouter
                    </button>
                </form>
            </div>
            <% } %>
        </div>
    </div>
</section>

<footer>
    <div class="container">
        <p>&copy; 2025 ElectroShop. Tous droits réservés.</p>
    </div>
</footer>
</body>
</html>