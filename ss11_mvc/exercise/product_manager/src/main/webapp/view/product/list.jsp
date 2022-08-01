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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

</head>
<body>
<div class="container">
    <a href="/product" style="text-decoration: none; color: black"><h1>PRODUCT LIST</h1></a>



<button class="btn btn-primary" type="button" onclick="location.href='/product?action=add';">ADD NEW PRODUCT</button>
<form action="/product?action=searchName" method="post" class="mt-3">
    Search the product name: <input type="text" name="name">
    <button class="btn btn-primary" type="submit">SEARCH</button>
<%--    <button type="button" class="btn btn-primary" onclick="location.href='/product';">RETURN HOMEPAGE</button>--%>
</form>
<form action="/product?action=searchId" method="post">
    Show product details by ID <input type="number" name="id">
    <button class="btn btn-primary" type="submit">SUBMIT</button>
<%--    <button class="btn btn-primary" type="button" onclick="location.href='/product';">RETURN HOMEPAGE</button>--%>
</form>
<h3 style="color: red">${message}</h3>

<table class="table table-hover">
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
            <td><a class="btn btn-primary" href="/product?action=update&id=${productList.id}">UPDATE</a></td>
            <td>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#idModal-${productList.id}">DELETE</button>
                    <div class="modal fade" id="idModal-${productList.id}" tabindex="-1" aria-labelledby="exampleModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">CONFIRM</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    Are you sure to delete this product: ${productList.name}
                                </div>
                                <div class="modal-footer">
                                    <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                    <a href="/product?action=delete&id=${productList.id}" class="btn btn-danger">
                                        Confirm
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
            </td>

        </tr>
    </c:forEach>

</table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
</body>
</html>
