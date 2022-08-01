<%--
  Created by IntelliJ IDEA.
  User: WSWINDOWS
  Date: 08/01/2022
  Time: 3:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <h1 class="text-center" >User Management</h1>
    <h2>
        <a class="btn btn-info" href="/users?action=create">Add New User</a>
    </h2>


<form action="/users?action=search" method="post">
    Enter Country want to find <input type="text" name="country">
    <button class="btn btn-info" type="submit">Search</button>

</form>
</div>
<div class="container">
    <table class="table">
        <h2>List of Users</h2>
        <tr>
            <th>ID</th>
            <th>Name <button class="btn btn-light" onclick="location.href='/users?action=sortbyname';">^</button>
                <button class="btn btn-light" onclick="location.href='users?action=users';">v</button>
            </th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <a href="/users?action=edit&id=${user.id}" class="btn btn-info">Edit</a>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#idModal-${user.id}">DELETE</button>
                    <div class="modal fade" id="idModal-${user.id}" tabindex="-1" aria-labelledby="exampleModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">CONFIRM</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    Are you sure to delete: ${user.name}
                                </div>
                                <div class="modal-footer">
                                    <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                    <a href="/users?action=delete&id=${user.id}" class="btn btn-danger">
                                        Confirm
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

</body>
</html>
