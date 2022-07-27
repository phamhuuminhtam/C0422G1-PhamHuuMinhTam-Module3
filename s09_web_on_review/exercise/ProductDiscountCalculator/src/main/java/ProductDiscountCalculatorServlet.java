import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ProductDiscountCalculatorServlet", urlPatterns = "/calcu")
public class ProductDiscountCalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String product = request.getParameter("Product");
        double price = Double.parseDouble(request.getParameter("ListPrice"));
        int discountPercent = Integer.parseInt(request.getParameter("DiscountPercent"));
        double discountAmount = price*discountPercent*0.01;
        double discountPrice = price - discountAmount;

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("result.jsp");
        request.setAttribute("name", product);
        request.setAttribute("discountamount", discountAmount);
        request.setAttribute("discountprice", discountPrice);
        requestDispatcher.forward(request,response);
    }
}
