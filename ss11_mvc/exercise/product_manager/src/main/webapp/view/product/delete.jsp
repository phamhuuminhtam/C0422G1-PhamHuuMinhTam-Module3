<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: WSWINDOWS
  Date: 07/30/2022
  Time: 12:00 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>DELETE CONFIRM</title>
</head>
<body>
<h1>DELETE CONFIRM</h1>
<form action="/product?action=delete&id=${id}" method="post">
<table>
    <tr>
        <th>ID</th>
        <th>Tên Sản phẩm</th>
        <th>Giá Sản Phẩm</th>
        <th>Mô Tả Sản Phẩm</th>
        <th>Nhà Sản Xuất</th>
    </tr>
        <tr>
            <td>${product.id}</td>
            <td>${produc.name}</td>
            <td><fmt:formatNumber value = "${product.price}" type = "number" pattern = "###,###"/></td>
            <td>${product.describe}</td>
            <td>${product.producer}</td>
     </tr>

</table>
<button type="submit">SUBMIT</button>
<button type="button" onclick="location.href='/product';">RETURN HOMEPAGE</button>
</form>
</body>
</html>
