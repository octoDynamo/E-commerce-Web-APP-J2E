<!DOCTYPE html>
<html>
<head>
    <title>${product != null ? 'Edit' : 'Add'} Product</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>
<div class="container">
    <h1>${product != null ? 'Edit' : 'Add'} Product</h1>
    <form method="post"
          action="${pageContext.request.contextPath}/admin/products${product != null ? '/update' : '/insert'}">
        <c:if test="${product != null}">
            <input type="hidden" name="id" value="${product.id}" />
        </c:if>
        <div class="form-group">
            <label>Name</label>
            <input type="text" name="nom" value="${product.nom}" required>
        </div>
        <div class="form-group">
            <label>Description</label>
            <textarea name="description" required>${product.description}</textarea>
        </div>
        <div class="form-group">
            <label>Price</label>
            <input type="number" step="0.01" name="prix" value="${product.prix}" required>
        </div>
        <div class="form-group">
            <label>Image URL</label>
            <input type="text" name="image" value="${product.image}" required>
        </div>
        <div class="form-actions">
            <button type="submit">Save</button>
            <a href="${pageContext.request.contextPath}/admin/products">Cancel</a>
        </div>
    </form>
</div>
</body>
</html>