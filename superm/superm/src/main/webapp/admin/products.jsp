<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Management</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="container">
    <h1>Product Management</h1>
    <div class="actions">
        <a href="${pageContext.request.contextPath}/admin/products/new" class="btn">Add New Product</a>
    </div>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${products}">
            <tr>
                <td><c:out value="${product.id}" /></td>
                <td><c:out value="${product.nom}" /></td>
                <td><c:out value="${product.description}" /></td>
                <td><c:out value="${product.prix}" /></td>
                <td>
                    <a href="products/edit?id=${product.id}">Edit</a>
                    <a href="products/delete?id=${product.id}"
                       onclick="return confirm('Are you sure?')">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>