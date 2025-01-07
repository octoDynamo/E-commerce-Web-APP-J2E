<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="container">
    <h1>Admin Dashboard</h1>
    <nav>
        <a href="${pageContext.request.contextPath}/admin/products">Manage Products</a>
        <a href="${pageContext.request.contextPath}/admin/users">Manage Users</a>
    </nav>
</div>
</body>
</html>