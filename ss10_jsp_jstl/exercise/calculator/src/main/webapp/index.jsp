<%--
  Created by IntelliJ IDEA.
  User: WSWINDOWS
  Date: 07/28/2022
  Time: 3:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>

  </head>
  <body>
  <h1>Simple Calculator</h1>
  <form action="/CalculatorServlet" method="post">
    <fieldset  style="width: 300px">
    <legend>Calculator</legend>
    <table >
      <tr>
        <td> First Operand </td>
        <td><input type="text" name="firstOperand"></td>
      </tr>
      <tr>
        <td>Operator</td>
        <td><select name="operator">
          <option value="+">Addition</option>
          <option value="-">Subtraction</option>
          <option value="*">Multiplication</option>
          <option value="/">Division</option>
        </select></td>
      </tr>
      <tr>
        <td>Second Operand</td>
        <td><input type="text" name="secondOperand"></td>
      </tr>
    </table>
     </fieldset>
  </form>
  <button type="submit">Calculate</button>
  <h1>RESULT:</h1>
  <p> ${result}</p>
  </body>
</html>
