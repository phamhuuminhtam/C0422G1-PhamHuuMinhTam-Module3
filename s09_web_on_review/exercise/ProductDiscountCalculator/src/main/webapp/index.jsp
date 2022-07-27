<%--
  Created by IntelliJ IDEA.
  User: WSWINDOWS
  Date: 07/27/2022
  Time: 5:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/calcu" method="post">
    <p>Mô tả của sản phẩm</p><input type="text" name="Product"><br>
    <p> Giá niêm yết của sản phẩm</p><input type="text" name="ListPrice"><br>
    <p>Tỷ lệ chiết khấu</p><input type="text" name="DiscountPercent"><br>
    <button type="submit">Calculate Discount</button>

  </form>
  </body>
</html>
