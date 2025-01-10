<%@ page import="java.util.List" %>
<%@ page import="Entity.Commande" %>
<%@ page import="DataAccessObject.CommandeDAO" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
  List<Commande> commandes = null;
  try {
    CommandeDAO commandeDAO = new CommandeDAO();
    commandes = commandeDAO.getAll();
  } catch (SQLException e) {
    e.printStackTrace();
  }
%>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Gestion des Commandes - Admin</title>
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
      --success: #10b981;
      --warning: #f59e0b;
      --danger: #ef4444;
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

    .header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 2rem;
    }

    h1 {
      font-size: 2.2rem;
      font-weight: 600;
      background: linear-gradient(to right, #fff, #a5b4fc);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }

    .filters {
      display: flex;
      gap: 1rem;
      margin-bottom: 2rem;
    }

    .search-bar {
      flex: 1;
      display: flex;
      align-items: center;
      gap: 1rem;
      background: var(--card-bg);
      padding: 0.75rem 1.25rem;
      border-radius: 1rem;
      border: 1px solid var(--border-color);
    }

    .search-bar input {
      background: none;
      border: none;
      color: var(--text-primary);
      font-size: 0.95rem;
      outline: none;
      width: 100%;
    }

    .search-bar i {
      color: var(--text-secondary);
    }

    .card {
      background: var(--card-bg);
      border-radius: 1rem;
      border: 1px solid var(--border-color);
      backdrop-filter: blur(10px);
      overflow: hidden;
      position: relative;
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
      white-space: nowrap;
    }

    td {
      padding: 1rem;
      border-top: 1px solid var(--border-color);
      color: var(--text-primary);
    }

    tr:hover td {
      background: rgba(255, 255, 255, 0.02);
    }

    .status-badge {
      display: inline-flex;
      align-items: center;
      gap: 0.5rem;
      padding: 0.35rem 0.75rem;
      border-radius: 2rem;
      font-size: 0.85rem;
      font-weight: 500;
    }

    .status-pending {
      background: rgba(245, 158, 11, 0.2);
      color: #fcd34d;
    }

    .status-completed {
      background: rgba(16, 185, 129, 0.2);
      color: #34d399;
    }

    .status-cancelled {
      background: rgba(239, 68, 68, 0.2);
      color: #f87171;
    }

    .empty-state {
      text-align: center;
      padding: 3rem;
      color: var(--text-secondary);
    }

    .empty-state i {
      font-size: 3rem;
      margin-bottom: 1rem;
      opacity: 0.5;
    }

    .actions {
      display: flex;
      gap: 0.5rem;
    }

    .btn {
      display: inline-flex;
      align-items: center;
      gap: 0.5rem;
      padding: 0.5rem;
      border-radius: 0.5rem;
      color: var(--text-primary);
      background: rgba(255, 255, 255, 0.1);
      border: none;
      cursor: pointer;
      transition: all 0.3s ease;
    }

    .btn:hover {
      background: rgba(255, 255, 255, 0.2);
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

    .card {
      animation: fadeIn 0.5s ease-out forwards;
    }

    @media (max-width: 768px) {
      body {
        padding: 1rem;
      }

      .header {
        flex-direction: column;
        gap: 1rem;
      }

      .filters {
        flex-direction: column;
      }

      table {
        display: block;
        overflow-x: auto;
      }

      td, th {
        min-width: 120px;
      }
    }
  </style>
</head>
<body>
<div class="container">
  <div class="header">
    <h1>Gestion des Commandes</h1>
  </div>

  <div class="filters">
    <div class="search-bar">
      <i class="fas fa-search"></i>
      <input type="text" placeholder="Rechercher une commande..." id="searchInput">
    </div>
  </div>

  <div class="card">
    <div class="glow-effect glow-1"></div>
    <div class="glow-effect glow-2"></div>

    <table>
      <thead>
      <tr>
        <th>
          <i class="fas fa-hashtag"></i>
          ID
        </th>
        <th>
          <i class="fas fa-user"></i>
          Utilisateur
        </th>
        <th>
          <i class="fas fa-box"></i>
          Produit
        </th>
        <th>
          <i class="fas fa-shopping-cart"></i>
          Quantité
        </th>
        <th>
          <i class="fas fa-calendar"></i>
          Date
        </th>
        <th>Actions</th>
      </tr>
      </thead>
      <tbody>
      <% if (commandes != null && !commandes.isEmpty()) { %>
      <% for (Commande commande : commandes) { %>
      <tr>
        <td>#<%= commande.getId() %></td>
        <td><%= commande.getUtilisateur_id() %></td>
        <td><%= commande.getProduit_id() %></td>
        <td><%= commande.getQuantite() %></td>
        <td><%= commande.getDate() %></td>
        <td>
          <div class="actions">
            <button class="btn" title="Voir les détails">
              <i class="fas fa-eye"></i>
            </button>
            <button class="btn" title="Modifier">
              <i class="fas fa-edit"></i>
            </button>
          </div>
        </td>
      </tr>
      <% } %>
      <% } else { %>
      <tr>
        <td colspan="6">
          <div class="empty-state">
            <i class="fas fa-shopping-cart"></i>
            <p>Aucune commande trouvée</p>
          </div>
        </td>
      </tr>
      <% } %>
      </tbody>
    </table>
  </div>
</div>

<script>
  // Recherche en temps réel
  const searchInput = document.getElementById('searchInput');
  const tableRows = document.querySelectorAll('tbody tr');

  searchInput.addEventListener('input', function() {
    const searchTerm = this.value.toLowerCase();

    tableRows.forEach(row => {
      const text = row.textContent.toLowerCase();
      row.style.display = text.includes(searchTerm) ? '' : 'none';
    });
  });
</script>
</body>
</html>