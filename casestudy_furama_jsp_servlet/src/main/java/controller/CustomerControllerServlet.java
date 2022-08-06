package controller;

import model.GuestType;
import model.person.Customer;
import repository.customer.CustomerRepository;
import repository.customer.impl.CustomerRepositoryImpl;
import service.customer.CustomerService;
import service.customer.impl.CustomerServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(name = "CustomerControllerServlet", value = "/customer")
public class CustomerControllerServlet extends HttpServlet {
  private   CustomerService customerService = new CustomerServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if(action==null){
            action="";
        }
        switch (action){
            case "displayAddCustomer":
                displayAddCustomer(request, response);
                break;
            case "displayEditCustomer":
                displayEditCustomer(request, response);
                break;
            default:
                displayCustomerList(request,response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if(action==null){
            action="";
        }
        switch (action){
            case "addNewCustomer":
                addNewCustomer(request,response);
                break;
            case "deleteCustomer":
                deleteCustomerById(request,response);
                break;

        }

    }

    private void deleteCustomerById(HttpServletRequest request, HttpServletResponse response) {
      boolean check;
        int id = Integer.parseInt(request.getParameter("personid"));
     check= customerService.delete(id);
        String message="";
        if(check){
            message="Xóa thành công";
        }else message="Xóa thất bại";
        List<Customer> customerList = customerService.findAll();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/list.jsp");
        request.setAttribute("message",message);
        request.setAttribute("customerList",customerList);
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    //    public Customer(String name, LocalDate dayOfBirth, String gender, String personalCode, String phoneNumber, String email, String typeOfGuest, String address) {
    private void addNewCustomer(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        LocalDate dayOfBirth = LocalDate.parse(request.getParameter("birthday"));
        int gender = Integer.parseInt(request.getParameter("gender"));

        String personalCode = request.getParameter("id_card");
        String phoneNumber= request.getParameter("phone");
        String email= request.getParameter("email");
        String typeOfGuest = request.getParameter("customer_type_id");
        String address = request.getParameter("address");
        Customer customer = new Customer(name,dayOfBirth,gender+"",personalCode,phoneNumber,email,typeOfGuest,address);
        boolean check =customerService.add(customer);

        String message="";
        if(check){
            message="Tạo mới thành công";
        }else message="Tạo mới thất bại";

        List<Customer> customerList = customerService.findAll();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/list.jsp");
        request.setAttribute("message",message);
        request.setAttribute("customerList",customerList);
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    private void displayEditCustomer(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/edit.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void displayAddCustomer(HttpServletRequest request, HttpServletResponse response) {
        CustomerRepository customerRepository = new CustomerRepositoryImpl();
        List<GuestType> guestTypeList = customerRepository.getGuestTypeList();

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/add.jsp");
        request.setAttribute("guestTypeList",guestTypeList);
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void displayCustomerList(HttpServletRequest request, HttpServletResponse response) {

        List<Customer> customerList = customerService.findAll();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/list.jsp");
        request.setAttribute("customerList",customerList);
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
