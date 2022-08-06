package repository.customer.impl;

import model.GuestType;
import model.person.Customer;
import repository.base_connection.BaseConnection;
import repository.customer.CustomerRepository;

import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
//public Customer(String id, String name, LocalDate dayOfBirth, String gender, String personalCode, String phoneNumber, String email, String typeOfGuest, String address) {
public class CustomerRepositoryImpl implements CustomerRepository {

    private final String INSERT_CUSTOMER = "insert into khach_hang(ma_loai_khach,ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi) values(?,?,?,?,?,?,?,?);";
    private final String SELECT_TYPE_OF_GUEST_NAME = "select * from loai_khach";

    public List<GuestType> getGuestTypeList(){
        List<GuestType> guestTypeList = new ArrayList<>();
        Connection connection =BaseConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_TYPE_OF_GUEST_NAME);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int id = rs.getInt(1);
                String guestTypeName = rs.getString(2);
                guestTypeList.add(new GuestType(id,guestTypeName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return  guestTypeList;
    }

    @Override
    public boolean add(Customer customer) {
        int check;
        Connection connection =BaseConnection.getConnection();
        List<GuestType> guestTypeList = getGuestTypeList();
        int guestTypeId=0;
        for (GuestType g : guestTypeList){
            if(customer.getTypeOfGuest().equals(g.getGuestTypeName())){
                guestTypeId=g.getGuestTypeId();
            }
        }
        int gender= Integer.parseInt(customer.getGender());

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CUSTOMER);
            preparedStatement.setInt(1,guestTypeId);
            preparedStatement.setString(2,customer.getName());
            preparedStatement.setDate(3, Date.valueOf(customer.getDayOfBirth()));
            preparedStatement.setInt(4,gender);
            preparedStatement.setString(5,customer.getPersonalCode());
            preparedStatement.setString(6,customer.getPhoneNumber());
            preparedStatement.setString(7,customer.getEmail());
            preparedStatement.setString(8,customer.getAddress());
           check= preparedStatement.executeUpdate();
           return check==1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public void edit() {

    }

    @Override
    public boolean delete(int id) {
        int check;
        Connection connection = BaseConnection.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall("call detete_customer(?)");
            callableStatement.setInt(1,id);
          check=  callableStatement.executeUpdate();
          return check==1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Customer> search() {
        return null;
    }

    @Override
    public List<Customer> showAll() {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseConnection.getConnection();
        try {
            String SELECT_ALL = "select * from khach_hang;";
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()){
                String id =rs.getString(1);
                String name =rs.getString(3);
                LocalDate dayOfBirth = LocalDate.parse(rs.getString(4), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                String gender;
                if(rs.getInt(5)==0) {
                    gender = "Nữ";
                }else  gender ="Nam";
                String personalCode = rs.getString(6);
                String phoneNumber = rs.getString(7);
                String email = rs.getString(8);
                String address = rs.getString(9);
                String typeOfGuest=rs.getString(2);
                Customer customer = new Customer(id,name,dayOfBirth,gender,personalCode,phoneNumber,email,typeOfGuest,address);
                customerList.add(customer);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return customerList;
    }

    public Customer searchCustomer(int id_search){
        Connection connection=BaseConnection.getConnection();
        Customer customer=null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from khach_hang where ma_khach_hang =?;");
            preparedStatement.setInt(1,id_search);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                String id =rs.getString(1);
                String name =rs.getString(3);
                LocalDate dayOfBirth = LocalDate.parse(rs.getString(4), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                String gender;
                if(rs.getInt(5)==0) {
                    gender = "Nữ";
                }else  gender ="Nam";
                String personalCode = rs.getString(6);
                String phoneNumber = rs.getString(7);
                String email = rs.getString(8);
                String address = rs.getString(9);
                String typeOfGuest=rs.getString(2);
               customer = new Customer(id,name,dayOfBirth,gender,personalCode,phoneNumber,email,typeOfGuest,address);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return customer;
    }
}
