package controller;

import model.RentalType;
import model.ServiceType;
import model.facility.Facility;
import service.facility.FacilityService;
import service.facility.impl.FacilityServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ControllerServlet", value = "/facility")
public class FacilityControllerServlet extends HttpServlet {
    FacilityService facilityService = new FacilityServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if(action ==null) action ="";
        switch (action){

            case "displayAddService":
                displayAddService(request, response);
                break;
            case "displayEditService":
                displayEditService(request, response);
                break;
            default:
                displayServiceList(request,response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if(action ==null) action ="";
        switch (action){

            case "AddService":
                addService(request, response);
                break;
            case "DeleteService":
                deleteService(request, response);
                break;
            case "EditService":
                editService(request, response);
                break;
            default:
                displayServiceList(request,response);
        }
    }

    private void editService(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String serviceName=request.getParameter("name");
        double squareUse= Double.parseDouble(request.getParameter("area"));
        double cost= Double.parseDouble(request.getParameter("cost"));
        int numberOfPeople = Integer.parseInt(request.getParameter("max_people"));
        int rentalTypeCode = Integer.parseInt(request.getParameter("rentalType"));
        int serviceTypeCode = Integer.parseInt(request.getParameter("serviceType"));
        String  roomStandard =request.getParameter("standard_room") ;
        String descriptionOtherConvenience =request.getParameter("description_other_convenience") ;
        double poolArea;
        if(request.getParameter("pool_area")==""){
            poolArea=0;
        }else
            poolArea= Double.parseDouble(request.getParameter("pool_area"));
        int numberOfFloors;
        if(request.getParameter("number_of_floors")==""){
            numberOfFloors=0;
        }else numberOfFloors = Integer.parseInt(request.getParameter("number_of_floors"));
        String freeServiceAdd = request.getParameter("facility_free");
        Facility facility = new Facility(serviceName,squareUse,cost,numberOfPeople,rentalTypeCode,serviceTypeCode,roomStandard,descriptionOtherConvenience,poolArea,numberOfFloors,freeServiceAdd);
        boolean check= facilityService.edit(facility,id);

        String message="";
        if(check){
            message="Tạo mới thành công";
        }else message="Tạo mới thất bại";
        request.setAttribute("message",message);
        displayServiceList(request,response);
    }

    private void deleteService(HttpServletRequest request, HttpServletResponse response) {
        boolean check;
        int id = Integer.parseInt(request.getParameter("personid"));
        check = facilityService.delete(id);
        displayServiceList(request,response);
    }

    //    public Facility( String serviceName, double squareUse, double cost, int numberOfPeople,
//    int rentalTypeCode, int serviceTypeCode, String roomStandard, String descriptionOtherConvenience,
//    double poolArea, int numberOfFloors, String freeServiceAdd) {
    private void addService(HttpServletRequest request, HttpServletResponse response) {
        String serviceName=request.getParameter("name");
        double squareUse= Double.parseDouble(request.getParameter("area"));
        double cost= Double.parseDouble(request.getParameter("cost"));
        int numberOfPeople = Integer.parseInt(request.getParameter("max_people"));
        int rentalTypeCode = Integer.parseInt(request.getParameter("rentalType"));
        int serviceTypeCode = Integer.parseInt(request.getParameter("serviceType"));
        String  roomStandard =request.getParameter("standard_room") ;
        String descriptionOtherConvenience =request.getParameter("description_other_convenience") ;
        double poolArea;
        if(request.getParameter("pool_area")==""){
             poolArea=0;
        }else
         poolArea= Double.parseDouble(request.getParameter("pool_area"));
        int numberOfFloors;
        if(request.getParameter("number_of_floors")==""){
            numberOfFloors=0;
        }else numberOfFloors = Integer.parseInt(request.getParameter("number_of_floors"));
        String freeServiceAdd = request.getParameter("facility_free");
        Facility facility = new Facility(serviceName,squareUse,cost,numberOfPeople,rentalTypeCode,serviceTypeCode,roomStandard,descriptionOtherConvenience,poolArea,numberOfFloors,freeServiceAdd);
        boolean check= facilityService.add(facility);

        String message="";
        if(check){
            message="Tạo mới thành công";
        }else message="Tạo mới thất bại";
        request.setAttribute("message",message);
        displayServiceList(request,response);

    }


    private void displayEditService(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/facility/edit.jsp");
        int pId = Integer.parseInt(request.getParameter("id"));
        Facility facility = facilityService.searchFacility(pId);
        List<RentalType> rentalTypeList = facilityService.getRentalTypeList();
        List<ServiceType> serviceTypes = facilityService.getServiceTypeList();
        request.setAttribute("rentalTypeList",rentalTypeList);
        request.setAttribute("serviceTypes",serviceTypes);
        request.setAttribute("facility",facility);
        request.setAttribute("pId",pId);
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void displayAddService(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/facility/add.jsp");
        List<RentalType> rentalTypeList = facilityService.getRentalTypeList();
        List<ServiceType> serviceTypes = facilityService.getServiceTypeList();
        request.setAttribute("rentalTypeList",rentalTypeList);
        request.setAttribute("serviceTypes",serviceTypes);
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void displayServiceList(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/facility/list.jsp");
        List<Facility> facilityList = facilityService.findAll();
        List<RentalType> rentalTypeList = facilityService.getRentalTypeList();
        List<ServiceType> serviceTypes = facilityService.getServiceTypeList();
        request.setAttribute("facilityList",facilityList);
        request.setAttribute("rentalTypeList",rentalTypeList);
        request.setAttribute("serviceTypes",serviceTypes);
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void displayhome(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/home.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


}
