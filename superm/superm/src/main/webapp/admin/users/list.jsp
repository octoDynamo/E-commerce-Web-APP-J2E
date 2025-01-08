<%--
  Created by IntelliJ IDEA.
  User: mahdi
  Date: 08/01/2025
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin - Users Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <div class="row mb-3">
        <div class="col">
            <h2>Users Management</h2>
        </div>
        <div class="col text-end">
            <a href="../dashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
        </div>
    </div>

    <div class="table-responsive">
        <table class="table table-striped table-hover">
            <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Role</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="user" items="${users}">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.prenom}</td>
                    <td>${user.nom}</td>
                    <td>${user.email}</td>
                    <td>
                                <span class="badge ${user.role == 1 ? 'bg-danger' : 'bg-primary'}">
                                        ${user.role == 1 ? 'Admin' : 'User'}
                                </span>
                    </td>
                    <td>
                        <c:if test="${user.role != 1}">
                            <button type="button"
                                    class="btn btn-warning btn-sm"
                                    data-bs-toggle="modal"
                                    data-bs-target="#changeRoleModal${user.id}">
                                Change Role
                            </button>
                            <button type="button"
                                    class="btn btn-danger btn-sm"
                                    data-bs-toggle="modal"
                                    data-bs-target="#deleteUserModal${user.id}">
                                Delete
                            </button>
                        </c:if>
                    </td>
                </tr>

                <!-- Change Role Modal -->
                <div class="modal fade" id="changeRoleModal${user.id}" tabindex="-1">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Change User Role</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">
                                <p>Are you sure you want to change the role for user ${user.prenom} ${user.nom}?</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                <form action="../admin/users/changerole" method="POST" style="display: inline;">
                                    <input type="hidden" name="userId" value="${user.id}">
                                    <input type="hidden" name="newRole" value="${user.role == 1 ? 2 : 1}">
                                    <button type="submit" class="btn btn-warning">Confirm</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Delete User Modal -->
                <div class="modal fade" id="deleteUserModal${user.id}" tabindex="-1">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Delete User</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">
                                <p>Are you sure you want to delete user ${user.prenom} ${user.nom}?</p>
                                <p class="text-danger">This action cannot be undone!</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                <form action="../admin/users/delete" method="POST" style="display: inline;">
                                    <input type="hidden" name="userId" value="${user.id}">
                                    <button type="submit" class="btn btn-danger">Delete</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- Bootstrap JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>