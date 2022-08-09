<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: WSWINDOWS
  Date: 08/04/2022
  Time: 10:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Service List</title>
    <link rel="stylesheet" href="/bootstrap520/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/datatables/css/dataTables.bootstrap5.min.css" />
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
<%--    <c:if test="${message!=null}">--%>
<%--        <p>${message}</p>--%>
<%--    </c:if>--%>

    <input value="${message}" id="message" hidden>
    <h2 CLASS="text-center">DANH SÁCH DỊCH VỤ</h2>
    <div class="row main mt-2 ">
        <table class="table table-striped" id="tableCustomer">
            <thead>
            <tr>
                <th>STT</th>
                <th>Tên dịch vụ</th>
                <th>Diện tích sử dụng</th>
                <th>Chi phí thuê </th>
                <th>Số lượng người tối đa</th>
                <th>Kiểu thuê</th>
                <th>Tên loại dịch vụ</th>
                <th>Tiêu chuẩn phòng</th>
                <th>Tiện nghi</th>
                <th>Diện tích hồ bơi</th>
                <th>Số tầng</th>
                <th>Dịch vụ miễn phí</th>
                <th>Hành động</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach var="facilityList" items="${facilityList}"  varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>${facilityList.serviceName}</td>
                    <td>${facilityList.squareUse}</td>
                    <td><fmt:formatNumber value = "${facilityList.cost}" type = "number" pattern = "###,###"/></td>
                    <td>${facilityList.numberOfPeople}</td>

                    <td>
                        <c:forEach items="${rentalTypeList}" var="rentalTypeList">
                            <c:if test="${rentalTypeList.rentalTypeCode==facilityList.rentalTypeCode}">
                                ${rentalTypeList.rentalTypeName}
                            </c:if>
                        </c:forEach>

                    </td>

                    <td>
                        <c:forEach items="${serviceTypes}" var="serviceTypes">
                            <c:if test="${serviceTypes.serviceTypeCode==facilityList.serviceTypeCode}">
                                ${serviceTypes.serviceTypeName}
                            </c:if>
                        </c:forEach>

                    </td>

                    <td>${facilityList.roomStandard}</td>

                    <td>${facilityList.descriptionOtherConvenience}</td>
                    <td>${facilityList.poolArea}</td>
                    <td>${facilityList.numberOfFloors}</td>
                    <td>${facilityList.freeServiceAdd}</td>
                    <td>
                        <a type="button" class="btn btn-primary" href="/facility?action=displayEditService&id=${facilityList.serviceCode}">
                            Sửa
                        </a>
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="showModalDelete('${facilityList.serviceCode}','${facilityList.serviceName}')">
                            Xóa
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

    </div>

</div>

    <div class="row footer ">
        <div class="col-lg-12 bg-success d-flex justify-content-center" style="height: 100px">
            <p class="mt-2 text-white" > © 2018 Furama Resort Danang.</p>
        </div>
    </div>
</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/facility?action=DeleteService" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Xác nhận</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body container-fluid">
                    Bạn xác nhận muốn xóa dịch vụ: <span id="delete_modal"></span>
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

<script src="/jquery/jquery-3.5.1.min.js"></script>
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/datatables/js/jquery.dataTables.min.js"></script>
<script src="/datatables/js/dataTables.bootstrap5.min.js"></script>



<script>
    $(document).ready(function() {
        $('#tableCustomer').dataTable( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        } );
    } );

    window.onload=function (){
        if (document.getElementById("message").value!="")
            alert(document.getElementById("message").value)
    }
</script>
</body>
</html>
