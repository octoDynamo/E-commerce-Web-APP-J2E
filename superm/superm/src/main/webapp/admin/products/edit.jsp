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
    <title>Edit Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2>Edit Product</h2>

    <form action="../admin/products/update" method="POST" class="needs-validation" novalidate>
        <input type="hidden" name="id" value="${product.id}">

        <div class="mb-3">
            <label for="nom" class="form-label">Product Name</label>
            <input type="text" class="form-control" id="nom" name="nom"
                   value="${product.nom}" required>
            <div class="invalid-feedback">
                Please provide a product name.
            </div>
        </div>

        <div class="mb-3">
            <label for="description" class="form-label">Description</label>
            <textarea class="form-control" id="description" name="description"
                      rows="3" required>${product.description}</textarea>
            <div class="invalid-feedback">
                Please provide a description.
            </div>
        </div>

        <div class="mb-3">
            <label for="prix" class="form-label">Price</label>
            <input type="number" class="form-control" id="prix" name="prix"
                   value="${product.prix}" step="0.01" required>
            <div class="invalid-feedback">
                Please provide a valid price.
            </div>
        </div>

        <div class="mb-3">
            <label for="image" class="form-label">Image URL</label>
            <input type="text" class="form-control" id="image" name="image"
                   value="${product.image}" required>
            <div class="invalid-feedback">
                Please provide an image URL.
            </div>
        </div>

        <div class="mb-3">
            <button type="submit" class="btn btn-primary">Update Product</button>
            <a href="list.jsp" class="btn btn-secondary">Cancel</a>
        </div>
    </form>

    <div class="mt-4">
        <h4>Current Image Preview</h4>
        <img src="../${product.image}" alt="${product.nom}"
             class="img-thumbnail" style="max-width: 200px;">
    </div>
</div>

<script>
    // Form validation
    (function () {
        'use strict'
        var forms = document.querySelectorAll('.needs-validation')
        Array.prototype.slice.call(forms)
            .forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    form.classList.add('was-validated')
                }, false)
            })
    })()
</script>
</body>
</html>