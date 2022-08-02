<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: WSWINDOWS
  Date: 07/29/2022
  Time: 10:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>UPDATE FORM</title>
</head>
<body>
<h1>UPDATE PRODUCT INFO</h1>

<form action="/product?action=update&id=${product.id}" method="post">
    <table>
        <tr>
            <td>Enter Product Name</td>
            <td><input type="text" name="name" value = "${product.name}"></td>
        </tr>
        <tr>
            <td>Enter Product Price</td>
<%--            <td><fmt:formatNumber value = "${product.price}" type = "number" maxFractionDigits = "1" var="formatPrice"/>--%>
<%--              <td>  <input type="number" name="price" value = "${#numbers.formatDecimal(product.price,0,'comma',0,'POINT') }" ></td>--%>
           <td><fmt:setLocale value="en"/>
               <fmt:formatNumber type="number"
                              pattern="0" value="${product.price}"
                              var="myNum"/>
            <input type="number" min="0" name="price" pattern="0"
                   step="0.01" required
                   value="${myNum}"/></td>
        </tr>
        <tr>
            <td>Enter Product Describe</td>
            <td><input type="text" name="describe" value = "${product.describe}"></td>
        </tr>
        <tr>
            <td>Enter Producer</td>
            <td><input type="text" name="producer" value = "${product.producer}"></td>
        </tr>
    </table>

    <button type="submit">SUBMIT</button>
    <button type="button" onclick="location.href='/product';">RETURN HOMEPAGE</button>
</form>
</body>
</html>
