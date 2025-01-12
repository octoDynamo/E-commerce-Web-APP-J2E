<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un Produit - ElectroShop</title>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary: #4f46e5;
            --primary-dark: #4338ca;
            --secondary: #7c3aed;
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
            color: var(--text-primary);
            min-height: 100vh;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .header {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
            margin-bottom: 2rem;
        }

        .form-container {
            position: relative;
            overflow: hidden;
        }

        .glow-effect {
            position: absolute;
            width: 200px;
            height: 200px;
            filter: blur(90px);
            opacity: 0.15;
            pointer-events: none;
        }

        .glow-1 {
            background: radial-gradient(circle, var(--primary) 0%, transparent 70%);
            top: -100px;
            right: -100px;
        }

        .glow-2 {
            background: radial-gradient(circle, var(--secondary) 0%, transparent 70%);
            bottom: -100px;
            left: -100px;
        }
        .dashboard {
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar styles from previous template */
        .sidebar {
            width: 280px;
            background: var(--card-bg);
            backdrop-filter: blur(10px);
            border-right: 1px solid var(--border-color);
            padding: 2rem;
            position: fixed;
            height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* Brand and nav styles remain the same */
        .brand {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 1rem;
            margin-bottom: 2rem;
        }

        .brand-icon {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
        }

        .brand-text {
            font-size: 1.5rem;
            font-weight: 600;
            background: linear-gradient(to right, #fff, #a5b4fc);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        /* Navigation styles remain the same */
        .nav-menu {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        .nav-link {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 1rem;
            color: var(--text-secondary);
            text-decoration: none;
            border-radius: 1rem;
            transition: all 0.3s ease;
        }

        .nav-link:hover {
            background: rgba(255, 255, 255, 0.05);
            color: var(--text-primary);
        }

        .nav-link.active {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white;
        }

        /* Main content area */
        .main-content {
            flex: 1;
            margin-left: 280px;
            padding: 2rem;
        }

        /* Form specific styles */
        .form-container {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: 1rem;
            padding: 2rem;
            backdrop-filter: blur(10px);
            animation: fadeIn 0.5s ease-out forwards;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: var(--text-secondary);
            font-size: 0.95rem;
        }

        .form-control {
            width: 100%;
            padding: 0.75rem 1rem;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--border-color);
            border-radius: 0.5rem;
            color: var(--text-primary);
            font-family: 'Outfit', sans-serif;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary);
            background: rgba(255, 255, 255, 0.1);
        }

        textarea.form-control {
            resize: vertical;
            min-height: 100px;
        }

        .file-upload {
            position: relative;
            padding: 1rem;
            border: 2px dashed var(--border-color);
            border-radius: 0.5rem;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .file-upload:hover {
            border-color: var(--primary);
        }

        .submit-btn {
            background: linear-gradient(135deg, var(--primary), var(--secondary));
            color: white;
            border: none;
            padding: 1rem 2rem;
            border-radius: 0.5rem;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.3s ease;
        }

        .submit-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(79, 70, 229, 0.3);
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

        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-100%);
            }
            .main-content {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>


    <!-- Main Content -->
    <div class="container">  <!-- Add container for centering -->
        <div class="header">
            <h1>Ajouter un Produit</h1>
            <p class="text-secondary">Créez un nouveau produit dans votre catalogue</p>
        </div>

        <div class="form-container">
            <div class="glow-effect glow-1"></div>
            <div class="glow-effect glow-2"></div>
            <form action="${pageContext.request.contextPath}/admin/ProductServlet" method="post" enctype="multipart/form-data">
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
                    <i class="fas fa-save"></i>
                    Enregistrer le produit
                </button>
            </form>
        </div>
    </main>
</div>
</body>
</html>