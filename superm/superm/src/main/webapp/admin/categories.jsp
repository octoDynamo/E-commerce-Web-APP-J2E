<%@ page import="java.util.List" %>
<%@ page import="Entity.Categorie" %>
<%@ page import="DataAccessObject.CategorieDAO" %>
<%
  // Fetch categories from the database
  CategorieDAO categorieDAO = new CategorieDAO();
  List<Categorie> categories = categorieDAO.getAllCategories();
%>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Gestion des catégories - Admin</title>
  <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
  <style>
    :root {
      /* Couleurs */
      --primary: #4f46e5;
      --primary-dark: #4338ca;
      --secondary: #7c3aed;
      --background-start: #0f172a;
      --background-end: #1e293b;
      --text-primary: #ffffff;
      --text-secondary: #94a3b8;
      --card-bg: rgba(255, 255, 255, 0.03);
      --border-color: rgba(255, 255, 255, 0.1);
      --success: #10b981;
      --danger: #ef4444;

      /* Effets */
      --shadow-sm: 0 2px 4px rgba(0, 0, 0, 0.1);
      --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      --shadow-lg: 0 10px 15px rgba(0, 0, 0, 0.1);
      --shadow-glow: 0 0 15px rgba(79, 70, 229, 0.3);
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
      line-height: 1.6;
      padding: 2rem;
    }

    .container {
      max-width: 1200px;
      margin: 0 auto;
    }

    /* En-tête */
    .header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 2rem;
    }

    .header h1 {
      font-size: 2.2rem;
      font-weight: 600;
      background: linear-gradient(to right, #fff, #a5b4fc);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      margin: 0;
    }

    /* Carte formulaire */
    .card {
      background: var(--card-bg);
      border-radius: 1rem;
      border: 1px solid var(--border-color);
      padding: 2rem;
      margin-bottom: 2rem;
      backdrop-filter: blur(10px);
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

    .form-group {
      margin-bottom: 1.5rem;
    }

    .form-label {
      display: block;
      color: var(--text-secondary);
      margin-bottom: 0.5rem;
      font-weight: 500;
    }

    .form-control {
      width: 100%;
      padding: 0.75rem 1rem;
      background: rgba(255, 255, 255, 0.05);
      border: 1px solid var(--border-color);
      border-radius: 0.5rem;
      color: var(--text-primary);
      transition: all 0.3s ease;
    }

    .form-control:focus {
      outline: none;
      border-color: var(--primary);
      box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.2);
    }

    textarea.form-control {
      min-height: 100px;
      resize: vertical;
    }

    /* Boutons */
    .btn {
      display: inline-flex;
      align-items: center;
      gap: 0.5rem;
      padding: 0.75rem 1.5rem;
      border-radius: 0.5rem;
      font-weight: 500;
      cursor: pointer;
      transition: all 0.3s ease;
      border: none;
    }

    .btn-primary {
      background: linear-gradient(135deg, var(--primary), var(--secondary));
      color: white;
    }

    .btn-primary:hover {
      transform: translateY(-2px);
      box-shadow: var(--shadow-glow);
    }

    .btn-icon {
      padding: 0.5rem;
      border-radius: 0.375rem;
    }

    .btn-danger {
      background: var(--danger);
      color: white;
    }

    /* Table */
    .table-container {
      background: var(--card-bg);
      border-radius: 1rem;
      border: 1px solid var(--border-color);
      overflow: hidden;
      backdrop-filter: blur(10px);
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    th {
      background: rgba(255, 255, 255, 0.05);
      padding: 1.25rem 1rem;
      text-align: left;
      font-weight: 500;
      color: var(--text-secondary);
    }

    td {
      padding: 1rem;
      border-top: 1px solid var(--border-color);
      color: var(--text-primary);
    }

    tr:hover td {
      background: rgba(255, 255, 255, 0.02);
    }

    /* Actions */
    .actions {
      display: flex;
      gap: 0.5rem;
    }

    /* Animations */
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

    .card, .table-container {
      animation: fadeIn 0.5s ease-out forwards;
    }

    /* Responsive */
    @media (max-width: 768px) {
      body {
        padding: 1rem;
      }

      .header {
        flex-direction: column;
        gap: 1rem;
        text-align: center;
      }

      .table-container {
        overflow-x: auto;
      }

      .form-control, .btn {
        font-size: 16px; /* Meilleure expérience mobile */
      }
    }
  </style>
</head>
<body>
<div class="container">
  <!-- En-tête -->
  <div class="header">
    <h1>Gestion des catégories</h1>
  </div>

  <!-- Formulaire d'ajout -->
  <div class="card">
    <div class="glow-effect glow-1"></div>
    <div class="glow-effect glow-2"></div>

    <form action="addCategory" method="post">
      <div class="form-group">
        <label for="name" class="form-label">Nom de la catégorie</label>
        <input type="text" id="name" name="name" class="form-control" required
               placeholder="Saisissez le nom de la catégorie">
      </div>

      <div class="form-group">
        <label for="description" class="form-label">Description</label>
        <textarea id="description" name="description" class="form-control"
                  placeholder="Description détaillée de la catégorie"></textarea>
      </div>

      <button type="submit" class="btn btn-primary">
        <i class="fas fa-plus"></i>
        Ajouter une catégorie
      </button>
    </form>
  </div>

  <!-- Table des catégories -->
  <div class="table-container">
    <table>
      <thead>
      <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Description</th>
        <th>Actions</th>
      </tr>
      </thead>
      <tbody>
      <% for (Categorie categorie : categories) { %>
      <tr>
        <td><%= categorie.getId() %></td>
        <td><%= categorie.getName() %></td>
        <td><%= categorie.getDescription() %></td>
        <td>
          <div class="actions">
            <form action="deleteCategory" method="post" style="display: inline;">
              <input type="hidden" name="id" value="<%= categorie.getId() %>">
              <button type="submit" class="btn btn-danger btn-icon"
                      title="Supprimer la catégorie">
                <i class="fas fa-trash-alt"></i>
              </button>
            </form>
          </div>
        </td>
      </tr>
      <% } %>
      </tbody>
    </table>
  </div>
</div>
</body>
</html>