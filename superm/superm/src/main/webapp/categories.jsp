<%@ page import="DataAccessObject.CategorieDAO" %>
<%@ page import="Entity.Categorie" %>
<%@ page import="java.util.List" %>
<%
  CategorieDAO categorieDAO = new CategorieDAO();
  List<Categorie> categories = categorieDAO.getAllCategories();
%>

<!DOCTYPE html>
<html>
<head>
  <title>Categories Management</title>
  <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
  <h1>Manage Categories</h1>
  <form action="addCategory" method="post" class="mb-4">
    <div class="mb-3">
      <label for="name" class="form-label">Category Name</label>
      <input type="text" id="name" name="name" class="form-control" required>
    </div>
    <div class="mb-3">
      <label for="description" class="form-label">Description</label>
      <textarea id="description" name="description" class="form-control" rows="3"></textarea>
    </div>
    <button type="submit" class="btn btn-primary">Add Category</button>
  </form>

  <h2>Existing Categories</h2>
  <table class="table table-striped">
    <thead>
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Description</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <% for (Categorie categorie : categories) { %>
    <tr>
      <td><%= categorie.getId() %></td>
      <td><%= categorie.getName() %></td>
      <td><%= categorie.getDescription() %></td>
      <td>
        <form action="deleteCategory" method="post" style="display:inline;">
          <input type="hidden" name="id" value="<%= categorie.getId() %>">
          <button type="submit" class="btn btn-danger btn-sm">Delete</button>
        </form>
      </td>
    </tr>
    <% } %>
    </tbody>
  </table>
</div>
</body>
</html>
