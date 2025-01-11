<%@ page import="Entity.Produit" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Ruptures de Stock - ElectroShop</title>
  <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Outfit', sans-serif;
      background: linear-gradient(-45deg, #0f172a, #1e293b);
      color: #ffffff;
      min-height: 100vh;
      padding: 2rem;
    }

    .container {
      max-width: 900px;
      margin: 0 auto;
      background: rgba(255, 255, 255, 0.03);
      padding: 2rem;
      border-radius: 1rem;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
    }

    h1 {
      text-align: center;
      margin-bottom: 2rem;
      font-size: 2rem;
      color: #ffffff;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 2rem;
    }

    th, td {
      padding: 1rem;
      text-align: left;
      border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    }

    th {
      color: #94a3b8;
    }

    .out-of-stock {
      color: #ef4444;
      font-weight: bold;
    }

    .btn-replenish {
      padding: 0.5rem 1rem;
      border: none;
      background-color: #4f46e5;
      color: #ffffff;
      border-radius: 0.5rem;
      cursor: pointer;
    }

    .btn-replenish:hover {
      background-color: #4338ca;
    }
  </style>
</head>
<body>
<div class="container">
  <h1>Produits en Rupture de Stock</h1>
  <table>
    <thead>
    <tr>
      <th>ID</th>
      <th>Nom</th>
      <th>Description</th>
      <th>Quantité</th>
      <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <%
      // Retrieve products with low or zero stock from the DAO
      DataAccessObject.ProduitDAO produitDAO = new DataAccessObject.ProduitDAO();
      List<Produit> produits = produitDAO.getAll();

      for (Entity.Produit produit : produits) {
        if (produit.getQuantite() <= 0) {
    %>
    <tr>
      <td><%= produit.getId() %></td>
      <td><%= produit.getNom() %></td>
      <td><%= produit.getDescription() %></td>
      <td class="out-of-stock">Rupture</td>
      <td>
        <form action="${pageContext.request.contextPath}/admin/ReplenishStockServlet" method="post">
          <input type="hidden" name="id" value="<%= produit.getId() %>">
          <button type="submit" class="btn-replenish">Réapprovisionner</button>
        </form>
      </td>
    </tr>
    <%
        }
      }
    %>
    </tbody>
  </table>
</div>
</body>
</html>
