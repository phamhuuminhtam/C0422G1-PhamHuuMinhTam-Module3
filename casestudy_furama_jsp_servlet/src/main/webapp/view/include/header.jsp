<%--
  Created by IntelliJ IDEA.
  User: WSWINDOWS
  Date: 08/05/2022
  Time: 9:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>

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
<div class="container-fluid">
    <div class="row header">
        <div class="row">
            <div class="col-lg-3 d-flex justify-content-center">
                <img  src="https://furamavietnam.com/wp-content/uploads/2018/08/logo.png" alt="logo ">
            </div>

            <div class="col-lg-9 d-flex justify-content-end align-items-center">
                <button class="btn btn-success me-3"  data-bs-toggle="modal" data-bs-target="#exampleModal" style="height: 40px">Login</button>
                <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal" style="height: 40px">Register</button>
            </div>
        </div>
    </div>
</div>

<nav class="navbar navbar-expand-lg navbar-light bg-success sticky-top" >
    <div class="container-fluid">

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto  mb-lg-0">

                <li class="nav-item">
                    <a class="nav-link active text-white" aria-current="page" onclick="location.href='/ControllerServlet'">Home</a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link text-white" href="/employee?action=displayEmployeeList"  role="button"  aria-expanded="false">
                        Employee
                    </a>

                </li>

                <li class="nav-item dropdown ">
                    <a class="nav-link dropdown-toggle text-white"  href="#"  role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Customer
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" onclick="location.href='/customer'">Danh sách khách hàng</a></li>
                        <li><a class="dropdown-item" onclick="location.href='/customer?action=displayAddCustomer'">Thêm mới khách hàng</a></li>
                    </ul>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle text-white" href="#"  role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Service
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" onclick="location.href='/facility'">Danh sách dịch vụ</a></li>
                        <li><a class="dropdown-item" onclick="location.href='/facility?action=displayAddService'">Thêm mới dịch vụ</a></li>

                    </ul>
                </li>

                <li class="nav-item ">
                    <a class="nav-link text-white" href="/contract?action=displayContractList" id="navbarDropdown" role="button"  aria-expanded="false">
                        Contract
                    </a>
                </li>

            </ul>

            <form class="d-flex align-content-center mb-0">
                <input class="form-control " type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>



</body>
</html>
