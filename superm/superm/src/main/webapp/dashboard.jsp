<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Administrateur - ElectroShop</title>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-glow: #4f46e5;
            --secondary-glow: #7c3aed;
            --background-dark: #0f172a;
            --sidebar-bg: rgba(79, 70, 229, 0.1);
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
            background: linear-gradient(to right, var(--background-dark), #1e293b);
            color: var(--text-primary);
            min-height: 100vh;
        }

        .dashboard {
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 280px;
            background: var(--sidebar-bg);
            backdrop-filter: blur(20px);
            border-right: 1px solid var(--border-color);
            padding: 2rem 1rem;
            position: fixed;
            height: 100vh;
            overflow-y: auto;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 2rem;
            padding: 0 1rem;
        }

        .brand-icon {
            font-size: 1.5rem;
            color: var(--primary-glow);
        }

        .brand-text {
            font-size: 1.5rem;
            font-weight: 600;
            background: linear-gradient(45deg, var(--primary-glow), var(--secondary-glow));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .nav-menu {
            list-style: none;
        }

        .nav-item {
            margin-bottom: 0.5rem;
        }

        .nav-link {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 1rem;
            color: var(--text-secondary);
            text-decoration: none;
            border-radius: 0.5rem;
            transition: all 0.3s ease;
        }

        .nav-link:hover, .nav-link.active {
            background: rgba(255, 255, 255, 0.05);
            color: var(--text-primary);
        }

        .nav-link i {
            width: 20px;
            text-align: center;
        }

        /* Main Content Styles */
        .main-content {
            flex: 1;
            margin-left: 280px;
            padding: 2rem;
        }

        .top-bar {
            background: var(--card-bg);
            padding: 1rem 2rem;
            border-radius: 1rem;
            backdrop-filter: blur(20px);
            border: 1px solid var(--border-color);
            margin-bottom: 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        /* Form Styles */
        .form-container {
            background: var(--card-bg);
            backdrop-filter: blur(20px);
            border: 1px solid var(--border-color);
            border-radius: 1rem;
            padding: 2rem;
            max-width: 800px;
            margin: 0 auto;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            color: var(--text-secondary);
            margin-bottom: 0.5rem;
            font-size: 0.9rem;
        }

        .form-control {
            width: 100%;
            padding: 0.75rem 1rem;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--border-color);
            border-radius: 0.5rem;
            color: var(--text-primary);
            font-size: 1rem;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary-glow);
            box-shadow: 0 0 0 2px rgba(79, 70, 229, 0.1);
        }

        .file-upload {
            padding: 1rem;
            border: 2px dashed var(--border-color);
            border-radius: 0.5rem;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .file-upload:hover {
            border-color: var(--primary-glow);
        }

        .submit-btn {
            background: linear-gradient(45deg, var(--primary-glow), var(--secondary-glow));
            color: var(--text-primary);
            border: none;
            padding: 1rem 2rem;
            border-radius: 0.5rem;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            width: 100%;
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(79, 70, 229, 0.4);
        }

        /* Footer Styles */
        .footer {
            text-align: center;
            padding: 2rem;
            color: var(--text-secondary);
            border-top: 1px solid var(--border-color);
            margin-top: 2rem;
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 0;
                position: fixed;
                z-index: 1;
            }

            .main-content {
                margin-left: 0;
            }

            .form-container {
                padding: 1rem;
            }
        }
    </style>
</head>
<body>
<div class="dashboard">
    <!-- Sidebar -->
    <aside class="sidebar">
        <div class="brand">
            <i class="fas fa-landmark brand-icon"></i>
            <span class="brand-text">Admin</span>
        </div>

        <ul class="nav-menu">
            <li class="nav-item">
                <a href="index.jsp" class="nav-link active">
                    <i class="fas fa-tachometer-alt"></i>
                    <span>Produits</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="admin/users.jsp" class="nav-link">
                    <i class="fas fa-users"></i>
                    <span>Utilisateurs</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="admin/categories.jsp" class="nav-link">
                    <i class="fas fa-tags"></i>
                    <span>Catégories</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="admin/orders.jsp" class="nav-link">
                    <i class="fas fa-shopping-cart"></i>
                    <span>Commandes</span>
                </a>
            </li>
        </ul>
    </aside>

    <!-- Main Content -->
    <main class="main-content">
        <div class="top-bar">
            <h1>Ajouter un produit</h1>
            <div class="user-menu">
                <i class="fas fa-user"></i>
            </div>
        </div>

        <div class="form-container">
            <form action="ProductServlet" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="name">Nom du produit</label>
                    <input type="text" id="name" name="name" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea id="description" name="description" class="form-control" rows="3" required></textarea>
                </div>

                <div class="form-group">
                    <label for="price">Prix</label>
                    <input type="number" id="price" name="price" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="quantity">Quantité</label>
                    <input type="number" id="quantity" name="quantity" class="form-control" min="1" required>
                </div>

                <div class="form-group">
                    <label for="category">Catégorie</label>
                    <select id="category" name="category" class="form-control" required>
                        <option value="electronic">Électronique</option>
                        <option value="clothing">Vêtements</option>
                        <option value="sport">Sport</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="image">Image du produit</label>
                    <div class="file-upload">
                        <input type="file" id="image" name="image" accept="image/*" required>
                    </div>
                </div>

                <button type="submit" class="submit-btn">
                    <i class="fas fa-save"></i> Enregistrer le produit
                </button>
            </form>
        </div>

        <footer class="footer">
            <p>&copy; 2025 ElectroShop Admin. Tous droits réservés.</p>
        </footer>
    </main>
</div>
</body>
</html>