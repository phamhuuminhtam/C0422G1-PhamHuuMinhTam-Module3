<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: WSWINDOWS
  Date: 07/30/2022
  Time: 12:55 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>SEARCH</title>
</head>
<body>
<form action="/product?action=searchName" method="post">
    Enter Name <input type="text" name="name">
    <button type="submit">SUBMIT</button>
    <button type="button" onclick="location.href='/product';">RETURN HOMEPAGE</button>
</form>
<table>
    <tr>
        <th>ID</th>
        <th>Product Name</th>
        <th>Product Price</th>
        <th>Describe</th>
        <th>Producer</th>
    </tr>
    <c:forEach var="product" varStatus="status" items="${productList}">
    <tr>
        <td>${product.id}</td>
        <td>${product.name}</td>
        <td><fmt:formatNumber value = "${product.price}" type = "number" pattern = "###,###"/></td>
        <td>${product.describe}</td>
        <td>${product.producer}</td>
    </tr>
    </c:forEach>
</table>
</body>
</html>
