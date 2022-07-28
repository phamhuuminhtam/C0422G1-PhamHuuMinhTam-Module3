import model.Calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/CalculatorServlet")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double firstOperand = Double.parseDouble(request.getParameter("firstOperand"));
        double secondOperand = Double.parseDouble(request.getParameter("secondOperand"));
        String operator = request.getParameter("operator");

        String result = Calculator.calculate(firstOperand,secondOperand,operator);
    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
    request.setAttribute("result",result);
    request.setAttribute("firstOperand",firstOperand);
    request.setAttribute("secondOperand",secondOperand);
    request.setAttribute("operator",operator);

    requestDispatcher.forward(request,response);
    }
}
