<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="container">
    <h1>Bienvenue, Administrateur</h1>
    <nav>
        <ul>
            <li><a href="${pageContext.request.contextPath}/admin/users.jsp">Gérer les Utilisateurs</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/orders.jsp">Gérer les Commandes</a></li>
            <li><a href="${pageContext.request.contextPath}/admin/products.jsp">Gérer les Produits</a></li>
        </ul>
    </nav>
</div>
</body>
</html>