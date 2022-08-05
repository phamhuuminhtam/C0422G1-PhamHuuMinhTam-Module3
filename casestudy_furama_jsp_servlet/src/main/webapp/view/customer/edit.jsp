<%--
  Created by IntelliJ IDEA.
  User: WSWINDOWS
  Date: 08/04/2022
  Time: 10:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit</title>
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
</head>
<body>

<%@include file="/view/include/header.jsp"%>

<div class="container w-50 mt-4 p-2 mb-4" style="border: 1px solid grey; border-radius: 15px">
    <h3 align="center">SỬA THÔNG TIN KHÁCH HÀNG</h3>
    <form class="row g-3" action="" method="post">


        <div class="col-md-12">
            <label for="name" class="form-label">Họ tên</label>
            <input type="text" class="form-control" id="name" name="name">
        </div>
        <div class="col-md-12">
            <label for="birhtday" class="form-label">Ngày sinh </label>
            <input type="date" class="form-control" id="birhtday" name="birhtday">
        </div>
        <div class="col-md-12">
            <label  class="form-label me-4">Giới tính </label>
            <input type="radio"  class="form-check-input" name="gender" > <span class="me-3">Nam</span>
            <input type="radio" class="form-check-input" name="gender">Nữ
        </div>
        <div class="col-md-12">
            <label for="id_card" class="form-label">Số CMND</label>
            <input type="text" class="form-control" id="id_card"  name="id_card" >
        </div>
        <div class="col-md-12">
            <label for="phone" class="form-label">Số Điện Thoại</label>
            <input type="text" class="form-control" id="phone" name="phone">
        </div>
        <div class="col-md-12 " id="s1" >
            <label for="email" class="form-label">Email </label>
            <input type="text" class="form-control" id="email" name="email">
        </div>

        <div class="col-md-12">
            <label class="form-label">Loại khách </label>
            <select name="customer_type_id"  class="form-select" >
                <option value="None" >Chọn loại khách</option>
                <option value="1" >Diamond</option>
                <option value="2" >Platinium</option>
                <option value="3" >Gold</option>
                <option value="4" >Silver</option>
                <option value="5" >Member</option>
            </select>
        </div>

        <div class="col-md-12 " id="s2" >
            <label for="address" class="form-label">Địa chỉ </label>
            <input type="text" class="form-control" id="address" name="address">
        </div>


        <div class="col-12 ">
            <button type="submit" class="btn btn-primary">Gửi</button>
        </div>
    </form>
</div>

<%@include file="/view/include/footer.jsp"%>

<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/bootstrap/js/jquery-3.6.0.min.js"></script>
</body>
</html>
