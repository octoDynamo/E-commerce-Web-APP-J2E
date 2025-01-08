<%--
  Created by IntelliJ IDEA.
  User: mahdi
  Date: 08/01/2025
  Time: 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin - Products Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <div class="row mb-3">
        <div class="col">
            <h2>Products Management</h2>
        </div>
        <div class="col text-end">
            <a href="products/add.jsp" class="btn btn-primary">Add New Product</a>
        </div>
    </div>

    <div class="table-responsive">
        <table class="table table-striped table-hover">
            <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Image</th>
                <th>Name</th>
                <th>Description</th>
                <th>Price</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="product" items="${products}">
                <tr>
                    <td>${product.id}</td>
                    <td>
                        <img src="../${product.image}" alt="${product.nom}"
                             class="img-thumbnail" style="max-width: 50px;">
                    </td>
                    <td>${product.nom}</td>
                    <td>${product.description}</td>
                    <td>$${product.prix}</td>
                    <td>
                        <a href="products/edit.jsp?id=${product.id}"
                           class="btn btn-warning btn-sm">Edit</a>
                        <a href="products/delete?id=${product.id}"
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('Are you sure you want to delete this product?')">
                            Delete
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
