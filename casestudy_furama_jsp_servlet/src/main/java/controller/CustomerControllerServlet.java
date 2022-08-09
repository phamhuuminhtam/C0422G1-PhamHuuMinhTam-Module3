package controller;

import model.CustomerValidate;
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
import java.util.Map;

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
            case "editCustomer":
                editCustomerById(request,response);
                break;
        }

    }

    private void editCustomerById(HttpServletRequest request, HttpServletResponse response) {
        int pId = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String dayOfBirth = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        String personalCode = request.getParameter("id_card");
        String phoneNumber= request.getParameter("phone");
        String email= request.getParameter("email");
        String typeOfGuest = request.getParameter("customer_type_id");
        String address = request.getParameter("address");
        CustomerValidate customerValidate = new CustomerValidate(name,dayOfBirth,gender,personalCode,phoneNumber,email,typeOfGuest,address);
        Map<String, String> mapErrors = customerService.edit(customerValidate,pId);


//        List<Customer> customerList = customerService.findAll();
//        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/list.jsp");
//        request.setAttribute("message",message);
//        request.setAttribute("customerList",customerList);
//        try {
//            requestDispatcher.forward(request,response);
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }

        String message="";
        RequestDispatcher requestDispatcher;

        List<GuestType> guestTypeList = customerService.getGuestTypeList();
        if(mapErrors.size()>0){
            for (Map.Entry<String, String> entry: mapErrors.entrySet()) {
                request.setAttribute(entry.getKey(), entry.getValue());}
            request.setAttribute("pId",pId);
            request.setAttribute("customer",customerValidate);
            request.setAttribute("guestTypeList",guestTypeList);
            requestDispatcher = request.getRequestDispatcher("view/customer/edit.jsp");
        }else {
            message="Tạo mới thành công";
            List<Customer> customerList = customerService.findAll();
            requestDispatcher = request.getRequestDispatcher("view/customer/list.jsp");
            request.setAttribute("message",message);
            request.setAttribute("guestTypeList",guestTypeList);
            request.setAttribute("customerList",customerList);
        }
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void deleteCustomerById(HttpServletRequest request, HttpServletResponse response) {
      boolean check;
        int id = Integer.parseInt(request.getParameter("personid"));
     check= customerService.delete(id);
//        String message="";
//        if(check){
//            message="Xóa thành công";
//        }else message="Xóa thất bại";
        List<Customer> customerList = customerService.findAll();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/list.jsp");
//        request.setAttribute("message",message);
        request.setAttribute("customerList",customerList);
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }


    private void addNewCustomer(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String dayOfBirth = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        String personalCode = request.getParameter("id_card");
        String phoneNumber= request.getParameter("phone");
        String email= request.getParameter("email");
        String typeOfGuest = request.getParameter("customer_type_id");
        String address = request.getParameter("address");
        CustomerValidate customerValidate = new CustomerValidate(name,dayOfBirth,gender,personalCode,phoneNumber,email,typeOfGuest,address);
        Map<String, String> mapErrors = customerService.add(customerValidate);
        String message="";
        RequestDispatcher requestDispatcher;

        List<GuestType> guestTypeList = customerService.getGuestTypeList();
        if(mapErrors.size()>0){
            for (Map.Entry<String, String> entry: mapErrors.entrySet()) {
                request.setAttribute(entry.getKey(), entry.getValue());}
            request.setAttribute("customerValidate",customerValidate);
            request.setAttribute("guestTypeList",guestTypeList);
             requestDispatcher = request.getRequestDispatcher("view/customer/add.jsp");
        }else {
            message="Tạo mới thành công";
            List<Customer> customerList = customerService.findAll();
         requestDispatcher = request.getRequestDispatcher("view/customer/list.jsp");
        request.setAttribute("message",message);
            request.setAttribute("guestTypeList",guestTypeList);
                request.setAttribute("customerList",customerList);
        }
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    private void displayEditCustomer(HttpServletRequest request, HttpServletResponse response) {
        CustomerRepository customerRepository = new CustomerRepositoryImpl();
        int pId = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.searchCustomer(pId);
        List<GuestType> guestTypeList = customerRepository.getGuestTypeList();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/edit.jsp");
        request.setAttribute("customer",customer);
        request.setAttribute("pId",pId);
        request.setAttribute("guestTypeList",guestTypeList);
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
        List<GuestType> guestTypeList=customerService.getGuestTypeList();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/list.jsp");
        request.setAttribute("customerList",customerList);
        request.setAttribute("guestTypeList",guestTypeList);

        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
