<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: WSWINDOWS
  Date: 08/04/2022
  Time: 10:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ADD</title>
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
</head>
<body>

<%@include file="/view/include/header.jsp"%>

<div class="container w-50 mt-2 p-2" style="border: 1px solid grey; border-radius: 15px">
    <h3 align="center">THÊM MỚI DỊCH VỤ</h3>
    <form class="row g-3" action="/facility?action=AddService" method="post">
        <div class="col-md-12">
            <label class="form-label">Loại dịch vụ</label>
            <select name="serviceType"  class="form-select" onchange="showServiceInput(this)">
                <option value="None" disabled selected>Chọn loại dịch vụ</option>
                <c:forEach items="${serviceTypes}" var="serviceTypes">
                <option value="${serviceTypes.serviceTypeCode}" >${serviceTypes.serviceTypeName}</option>
                </c:forEach>
            </select>
        </div>

        <div class="col-md-12">
            <label for="name" class="form-label">Tên dịch vụ</label>
            <input type="text" class="form-control" id="name" name="name">
        </div>
        <div class="col-md-12">
            <label for="area" class="form-label">Diện tích sử dụng</label>
            <input type="text" class="form-control" id="area" name="area">
        </div>
        <div class="col-md-12">
            <label for="cost" class="form-label">Chi phí thuê</label>
            <input type="text" class="form-control" id="cost"  name="cost" >
        </div>
        <div class="col-md-12">
            <label for="max_people" class="form-label">Số lượng người tối đa </label>
            <input type="text" class="form-control" id="max_people"  name="max_people" >
        </div>
        <div class="col-md-12">
            <label  class="form-label">Kiểu thuê</label>
            <select name="rentalType"  class="form-select">
                <option value="None" disabled selected>Chọn kiểu thuê</option>
                <c:forEach items="${rentalTypeList}" var="rentalTypeList">
                    <option value="${rentalTypeList.rentalTypeCode}" >${rentalTypeList.rentalTypeName}</option>
                </c:forEach>
            </select>
        </div>
        <div class="col-md-12 " id="s1" style="display: none">
            <label for="standard_room" class="form-label">Tiêu chuẩn phòng </label>
            <input type="text" class="form-control" id="standard_room" name="standard_room">
        </div>

        <div class="col-md-12 " id="s2" style="display: none">
            <label for="description_other_convenience" class="form-label">Mô tả tiện nghi khác</label>
            <input type="text" class="form-control" id="description_other_convenience" name="description_other_convenience">
        </div>

        <div class="col-md-12 " id="s3" style="display: none">
            <label for="pool_area" class="form-label">Diện tích hồ bơi  </label>
            <input type="text" class="form-control" id="pool_area" name="pool_area">
        </div>

        <div class="col-md-12" id="s4" style="display: none">
            <label for="number_of_floors" class="form-label">Số tầng </label>
            <input type="text" class="form-control" id="number_of_floors" name="number_of_floors">
        </div>

        <div class="col-md-12 " id="s5" style="display: none">
            <label for="facility_free" class="form-label">Dịch vụ miễn phí đi kèm </label>
            <input type="text" class="form-control" id="facility_free" name="facility_free">
        </div>

        <div class="col-12 ">
            <button type="submit" class="btn btn-primary">Gửi</button>
        </div>
    </form>
</div>



<script>
    function showServiceInput(value) {
        var v = value.value;
        switch (v) {
            case 'None':
                document.getElementById("s1").style.display="none";
                document.getElementById("s2").style.display="none";
                document.getElementById("s3").style.display="none";
                document.getElementById("s4").style.display="none";
                document.getElementById("s5").style.display="none";
                break;
            case "1":
                document.getElementById("s1").style.display="block";
                document.getElementById("s2").style.display="block";
                document.getElementById("s3").style.display="block";
                document.getElementById("s4").style.display="block";
                document.getElementById("s5").style.display="none";
                break;
            case "2":
                document.getElementById("s1").style.display="block";
                document.getElementById("s2").style.display="block";
                document.getElementById("s4").style.display="block";
                document.getElementById("s5").style.display="none";
                document.getElementById("s3").style.display="none";
                break;
            case "3":
                document.getElementById("s1").style.display="none";
                document.getElementById("s2").style.display="none";
                document.getElementById("s3").style.display="none";
                document.getElementById("s4").style.display="none";
                document.getElementById("s5").style.display="block";
                break;
        }
    }
</script>
<%@include file="/view/include/footer.jsp"%>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/bootstrap/js/jquery-3.6.0.min.js"></script>
</body>
</html>
