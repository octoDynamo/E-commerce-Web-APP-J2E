<%@ page import="java.util.List" %>
<%@ page import="Entity.Utilisateur" %>
<%@ page import="DataAccessObject.UtilisateurDAO" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<%
    List<Utilisateur> utilisateurs = null;
    try {
        UtilisateurDAO utilisateurDAO = new UtilisateurDAO();
        utilisateurs = utilisateurDAO.getAll();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Utilisateurs - Admin</title>
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

        .search-bar {
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
            width: 250px;
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

        .role-badge {
            display: inline-block;
            padding: 0.35rem 0.75rem;
            border-radius: 2rem;
            font-size: 0.85rem;
            font-weight: 500;
        }

        .role-admin {
            background: rgba(79, 70, 229, 0.2);
            color: #818cf8;
        }

        .role-user {
            background: rgba(16, 185, 129, 0.2);
            color: #34d399;
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

            .search-bar {
                width: 100%;
            }

            .search-bar input {
                width: 100%;
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
        <h1>Gestion des Utilisateurs</h1>
        <div class="search-bar">
            <i class="fas fa-search"></i>
            <input type="text" placeholder="Rechercher un utilisateur..." id="searchInput">
        </div>
    </div>

    <div class="card">
        <div class="glow-effect glow-1"></div>
        <div class="glow-effect glow-2"></div>

        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Prénom</th>
                <th>Email</th>
                <th>Rôle</th>
            </tr>
            </thead>
            <tbody>
            <% if (utilisateurs != null && !utilisateurs.isEmpty()) { %>
            <% for (Utilisateur utilisateur : utilisateurs) { %>
            <tr>
                <td><%= utilisateur.getId() %></td>
                <td><%= utilisateur.getNom() %></td>
                <td><%= utilisateur.getPrenom() %></td>
                <td><%= utilisateur.getEmail() %></td>
                <td>
                                    <span class="role-badge <%= utilisateur.getRole() == 1 ? "role-admin" : "role-user" %>">
                                        <%= utilisateur.getRole() == 1 ? "Admin" : "Utilisateur" %>
                                    </span>
                </td>
            </tr>
            <% } %>
            <% } else { %>
            <tr>
                <td colspan="5">
                    <div class="empty-state">
                        <i class="fas fa-users-slash"></i>
                        <p>Aucun utilisateur trouvé</p>
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