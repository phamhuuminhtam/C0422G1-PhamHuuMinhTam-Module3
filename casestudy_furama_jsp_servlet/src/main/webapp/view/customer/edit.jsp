<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <form class="row g-3" action="/customer?action=editCustomer&id=${pId}" method="post">
<%--        public Customer(String id, String name, LocalDate dayOfBirth, String gender, String personalCode, String phoneNumber, String email, String typeOfGuest, String address)--%>

        <div class="col-md-12">
            <label for="name" class="form-label">Họ tên</label>
            <input type="text" class="form-control" id="name" name="name" value="${customer.name}">
        </div>
        <div class="col-md-12">
            <label for="birthday" class="form-label">Ngày sinh </label>
            <input type="date" class="form-control" id="birthday" name="birthday" value="${customer.dayOfBirth}">
        </div>
        <div class="col-md-12">
            <label  class="form-label me-4">Giới tính </label>
            <c:if test="${customer.gender=='Nam'}">
            <input type="radio"  class="form-check-input" name="gender" value="1" checked> Nam
                <input type="radio" class="form-check-input" name="gender" value="0" >Nữ
            </c:if>
            <c:if test="${customer.gender=='Nữ'}">
                <input type="radio"  class="form-check-input" name="gender" value="1" > Nam
            <input type="radio" class="form-check-input" name="gender" value="0" checked>Nữ</c:if>

        </div>
        <div class="col-md-12">
            <label for="id_card" class="form-label">Số CMND</label>
            <input type="text" class="form-control" id="id_card"  name="id_card" value="${customer.personalCode}" >
        </div>
        <div class="col-md-12">
            <label for="phone" class="form-label">Số Điện Thoại</label>
            <input type="text" class="form-control" id="phone" name="phone" value="${customer.phoneNumber}">
        </div>
        <div class="col-md-12 " id="s1" >
            <label for="email" class="form-label">Email </label>
            <input type="text" class="form-control" id="email" name="email" value="${customer.email}">
        </div>

        <div class="col-md-12">
            <label class="form-label">Loại khách </label>
            <select name="customer_type_id" id="mySelect" class="form-select" >
                <option value="0" disabled >Chọn loại khách</option>
                <c:forEach var="guestTypeList" items="${guestTypeList}">
                    <c:choose>
                        <c:when test="${customer.typeOfGuest==guestTypeList.guestTypeId}">
                            <option value="${guestTypeList.guestTypeId}" selected>${guestTypeList.guestTypeName}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${guestTypeList.guestTypeId}" >${guestTypeList.guestTypeName}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select >

        </div>

        <div class="col-md-12 " id="s2" >
            <label for="address" class="form-label">Địa chỉ </label>
            <input type="text" class="form-control" id="address" name="address" value="${customer.address}">
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
