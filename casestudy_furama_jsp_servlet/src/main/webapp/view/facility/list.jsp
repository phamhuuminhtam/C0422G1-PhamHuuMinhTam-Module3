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
    <h2 CLASS="text-center">DANH SÁCH DỊCH VỤ</h2>
    <div class="row main mt-2 ">
        <table class="table table-striped">
            <tr>
                <th>STT</th>
                <th>Tên dịch vụ</th>
                <th>Diện tích sử dụng</th>
                <th>Chi phí thuê </th>
                <th>Số lượng người tối đa</th>
                <th>Kiểu thuê</th>
                <th>Tiêu chuẩn phòng</th>
                <th>Tiện nghi</th>
                <th>Diện tích hồ bơi</th>
                <th>Số tầng</th>
                <th>Dịch vụ miễn phí</th>

                <th>Hành động</th>
            </tr>
            <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td>7</td>
                <td>8</td>
                <td>9</td>
                <td>9</td>
                <td>9</td>
                <td>
                    <button type="button" class="btn btn-primary" onclick="location.href='/facility?action=displayEditService'">
                        Sửa
                    </button>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="showModalControl('a','b','c')">
                        Xóa
                    </button>
                </td>

            </tr>
        </table>

    </div>

    <div class="row footer ">
        <div class="col-lg-12 bg-success d-flex justify-content-center" style="height: 100px">
            <p class="mt-2"> © 2018 Furama Resort Danang.</p>
        </div>
    </div>
</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="" method="">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Xác nhận</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body container-fluid">
                    Bạn xác nhận muốn xóa: <span id="delete_modal"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Xóa</button>

                </div>
            </div>
        </form>
    </div>
</div>

<script>
    function showModalControl(a,b,c) {
    }
</script>

<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/bootstrap/js/jquery-3.6.0.min.js"></script>
</body>
</html>