import service.CalculatorService;

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
       String result;
        double firstOperand=0;
        double secondOperand=0;
        String operator = request.getParameter("operator");
        try {
            firstOperand = Double.parseDouble(request.getParameter("firstOperand"));
            secondOperand = Double.parseDouble(request.getParameter("secondOperand"));
             result = CalculatorService.calculate(firstOperand,secondOperand,operator);
       } catch (Exception e){
            e.printStackTrace();
           result="Dữ liệu không đúng định dạng";
       }



    RequestDispatcher requestDispatcher = request.getRequestDispatcher("/index.jsp");
    request.setAttribute("result",result);
    request.setAttribute("firstOperand",firstOperand);
    request.setAttribute("secondOperand",secondOperand);
    request.setAttribute("operator",operator);

    requestDispatcher.forward(request,response);
    }
}
