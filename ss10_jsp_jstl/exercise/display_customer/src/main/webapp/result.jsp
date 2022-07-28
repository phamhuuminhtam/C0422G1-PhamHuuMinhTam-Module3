<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: WSWINDOWS
  Date: 07/28/2022
  Time: 2:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        table {
            box-shadow: 1px 2px 1px 2px greenyellow;
            height: 700px;
            width: 1000px;

        }
    </style>
</head>
<body>
<div align="center">
<h2 style="text-align: center">DANH SÁCH KHÁCH HÀNG</h2>
<div class="container">
<table class="table table-bordered" border="1">
    <tr>
        <th>Tên</th>
        <th>Ngày Sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach items="${customerList}" var="customer" varStatus="status">
    <tr>
        <td>${customer.name}</td>
        <td>${customer.dayOfBirth}</td>
        <td>${customer.address}</td>
        <td><img src="${customer.img}" style="height: 100px; width: 100px" alt="ảnh load được đâu mà xem :(("></td>

    </tr>
    </c:forEach>
</table>
</div>

</div>
</body>
</html>
