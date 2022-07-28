import model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "DisplayCustomerServlet", value = "/DisplayCustomerServlet")
public class DisplayCustomerServlet extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();

    @Override
    public void init() throws ServletException {
        customerList.add(new Customer("Mai Văn Hoàn",LocalDate.parse("1983-08-20") ,"Hà Nội","img/20220728_133027.jpg"));
        customerList.add(new Customer("Nguyễn Văn Nam", LocalDate.parse("1983-08-21"),"Bắc Giang","img/20220728_133031.jpg"));
        customerList.add(new Customer("Nguyễn Thái Hòa", LocalDate.parse("1983-08-22"),"Nam Định","img/20220728_133035.jpg"));
        customerList.add(new Customer("Trần Đăng Khoa", LocalDate.parse("1983-08-17"),"Hà Tây","img/20220728_133037.jpg"));
        customerList.add(new Customer("Nguyễn Đình Thi", LocalDate.parse("1983-08-19"),"Hà Nội","img/20220728_133040.jpg"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/result.jsp");
        request.setAttribute("customerList",customerList);
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
