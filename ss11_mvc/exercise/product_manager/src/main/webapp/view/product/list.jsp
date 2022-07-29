<%--
  Created by IntelliJ IDEA.
  User: WSWINDOWS
  Date: 07/29/2022
  Time: 5:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>List Product</title>
</head>
<body>
<h1>PRODUCT LIST</h1>


<button type="button" onclick="location.href='/product?action=add';">ADD NEW PRODUCT</button>
<button type="button" onclick="location.href='/product?action=searchId';">DISPLAY PRODUCT DETAILS</button>
<button type="button" onclick="location.href='/product?action=searchName';">SEARCH PRODUCT BY NAME</button>

<h3 style="color: red">${message}</h3>
<table>
    <tr>
        <th>ID</th>
        <th>Product Name</th>
        <th>Product Price</th>
        <th>Describe</th>
        <th>Producer</th>
    </tr>

    <c:forEach var="productList" varStatus="status" items="${productList}">
        <tr>
            <td>${productList.id}</td>
            <td>${productList.name}</td>
            <td><fmt:formatNumber value = "${productList.price}" type = "number" pattern = "###,###"/></td>
            <td>${productList.describe}</td>
            <td>${productList.producer}</td>
            <td><a href="/product?action=update&id=${productList.id}">UPDATE</a></td>
            <td><a href="/product?action=delete&id=${productList.id}">DELETE</a></td>

        </tr>
    </c:forEach>
</table>


</body>
</html>
