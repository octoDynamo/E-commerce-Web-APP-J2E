<%@ page import="java.util.List" %>
<%@ page import="Entity.Commande" %>
<%@ page import="com.example.superm.Command" %>
<%@ page import="DataAccessObject.ProduitDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Commande> commandeList = Command.get();
    double sum = 0;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panier</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f0fc;
            font-family: 'Arial', sans-serif;
        }
        header {
            background: linear-gradient(90deg, #d8bfd8, #dda0dd);
        }
        header h1 {
            font-size: 2rem;
            font-weight: bold;
        }
        .btn-danger {
            color: #fff;
            background-color: #dda0dd;
            border-color: #c080c0;
            font-weight: bold;
        }
        .btn-danger:hover {
            background-color: #c080c0;
            border-color: #a060a0;
        }
        .btn-primary {
            background-color: #dda0dd;
            border-color: #c080c0;
        }
        .btn-primary:hover {
            background-color: #c080c0;
            border-color: #a060a0;
        }
        .btn-success {
            background-color: #dda0dd;
            border-color: #c080c0;
        }
        .btn-success:hover {
            background-color: #c080c0;
            border-color: #a060a0;
        }
        .table thead {
            background-color: #dda0dd;
            color: white;
        }
        .card-header {
            background-color: #dda0dd;
            color: white;
        }
        footer {
            background-color: #f8f0fc;
            border-top: 2px solid #dda0dd;
        }
    </style>
</head>
<body>

<!-- Header Section -->
<header class="container-fluid text-white p-3 text-center">
    <h1>Votre Panier</h1>
</header>

<!-- Main Container -->
<div class="container mt-5">
    <!-- Product Table -->
    <div class="card shadow-sm">
        <div class="card-header text-white">
            <h4 class="mb-0">Détails du Panier</h4>
        </div>
        <div class="card-body">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>Produit</th>
                    <th>Quantité</th>
                    <th>Prix (MAD)</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <% for (Commande cmd : commandeList) {
                    double prix = new ProduitDAO().getById(cmd.getProduit_id()).getPrix();
                    sum += cmd.getQuantite() * prix;
                %>
                <tr>
                    <td><%= new ProduitDAO().getById(cmd.getProduit_id()).getNom() %></td>
                    <td><%= cmd.getQuantite() %></td>
                    <td><%= String.format("%.2f", prix) %></td>
                    <td>
                        <form method="post" action="deleteCommande.jsp">
                            <input type="hidden" name="id" value="<%= cmd.getId() %>">
                            <button type="submit" class="btn btn-danger btn-sm">Supprimer</button>
                        </form>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Summary and Payment Section -->
    <div class="mt-4 text-right">
        <h5 class="mb-4">Total : <strong><%= String.format("%.2f", sum) %> MAD</strong></h5>
        <form action="paiementcard.jsp" method="post" class="d-inline-block">
            <button class="btn btn-primary">Paiement par Carte (MAD)</button>
        </form>
        <form action="https://www.paypal.com/cgi-bin/webscr" method="post" class="d-inline-block">
            <input type="hidden" name="cmd" value="_xclick">
            <input type="hidden" name="business" value="workoutaiman@hotmail.com">
            <input type="hidden" name="item_name" value="aimht">
            <input type="hidden" name="amount" value="<%= String.format("%.2f", sum / 10) %>">
            <input type="hidden" name="currency_code" value="EUR">
            <button type="submit" class="btn btn-success">Payez avec PayPal</button>
        </form>
    </div>
</div>

<!-- Footer Section -->
<footer class="container-fluid text-center py-3 mt-5">
    <p class="mb-0">&copy; 2025 Votre Boutique. Tous droits réservés.</p>
</footer>

<!-- Bootstrap JavaScript -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
