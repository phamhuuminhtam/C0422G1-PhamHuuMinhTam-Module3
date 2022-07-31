<%--
  Created by IntelliJ IDEA.
  User: WSWINDOWS
  Date: 07/30/2022
  Time: 12:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>PRODUCT DETAILS</title>
</head>
<body>

    <button type="button" onclick="location.href='/product';">RETURN HOMEPAGE</button>
<h2>${message}</h2>
<table>
    <tr>
        <th>ID</th>
        <th>Product Name</th>
        <th>Product Price</th>
        <th>Describe</th>
        <th>Producer</th>
    </tr>
    <tr>
        <td>${product.id}</td>
        <td>${product.name}</td>
        <td><fmt:formatNumber value = "${product.price}" type = "number" pattern = "###,###"/></td>
        <td>${product.describe}</td>
        <td>${product.producer}</td>
    </tr>

</table>
</body>
</html>
