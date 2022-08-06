
<%--
  Created by IntelliJ IDEA.
  User: WSWINDOWS
  Date: 08/05/2022
  Time: 9:40 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">

    <style>
        .main {
            background-image: url(https://furamavietnam.com/wp-content/uploads/2018/08/BG2.jpg) ;
            background-position: right bottom;
            background-size: contain;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
    </style>
</head>
<body>
<%@include file="/view/include/header.jsp"%>
<div class="container-fluid">
    <p>${message}</p>
<h2 CLASS="text-center">DANH SÁCH KHÁCH HÀNG</h2>
    <div class="row main mt-2 ">
        <table class="table table-striped"  id="tableCustomer">
            <tr>
                <th>STT</th>
                <th>Họ tên</th>
                <th>Ngày sinh</th>
                <th>Giới tính  </th>
                <th>Số CMND </th>
                <th>Số Điện Thoại</th>
                <th>Email </th>
                <th>Loại khách</th>
                <th>Địa chỉ </th>
                <th>Hành động</th>
            </tr>

<%--            Customer(String ID, String name, LocalDate dayOfBirth, String gender, String personalCode, String phoneNumber, String email, String typeOfGuest, String address) {--%>

            <c:forEach var="customerList" items="${customerList}"  varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${customerList.name}</td>
                <td>${customerList.dayOfBirth}</td>
                <td>${customerList.gender}</td>
                <td>${customerList.personalCode}</td>
                <td>${customerList.phoneNumber}</td>
                <td>${customerList.email}</td>
                <td>${customerList.typeOfGuest}</td>
                <td>${customerList.address}</td>
                <td>
                    <a type="button" class="btn btn-primary" href="/customer?action=displayEditCustomer&id=${customerList.pId}">
                        Sửa
                    </a>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="showModalDelete('${customerList.pId}','${customerList.name}')">
                        Xóa
                    </button>
                </td>
            </tr>
            </c:forEach>
        </table>

    </div>

</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/customer?action=deleteCustomer" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Xác nhận</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body container-fluid">
                    Bạn xác nhận muốn xóa khách hàng: <span id="delete_modal"></span>
                    <input type="hidden" id="sendId" name="personid">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="submit" class="btn btn-danger" data-bs-dismiss="modal">Xóa</button>

                </div>
            </div>
        </form>
    </div>
</div>

<script>
    function showModalDelete(a,b) {
        document.getElementById("delete_modal").innerText=b;
        document.getElementById("sendId").value=a;

    }
</script>



<%@include file="/view/include/footer.jsp"%>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/bootstrap/js/jquery-3.6.0.min.js"></script>

</body>
</html>
