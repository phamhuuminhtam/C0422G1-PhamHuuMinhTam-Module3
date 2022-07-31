<%--
  Created by IntelliJ IDEA.
  User: WSWINDOWS
  Date: 07/29/2022
  Time: 9:17 PM
  To change this template use File | Settings | File Templates.
--%>

<%--{--%>
<%--return  id +","+ name  +","+price  +","+describe  +","+producer ;--%>
<%--}--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>

</head>
<body>
<h1>ADD NEW PRODUCT</h1>
<form action="/product?action=add" method="post">
    <table>
        <tr>
            <td>Enter Product Name</td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>Enter Product Name</td>
            <td> <input type="number" name="price"></td>
        </tr>
        <tr>
            <td>Enter Product Describe </td>
            <td><input type="text" name="describe"></td>
        </tr>
        <tr>
            <td>Enter Producer</td>
            <td><input type="text" name="producer"></td>
        </tr>
    </table>

<button type="submit">SUBMIT</button>
    <button type="button" onclick="location.href='/product';">RETURN HOMEPAGE</button>

</form>
</body>
</html>
