package repository.facility.impl;

import model.GuestType;
import model.RentalType;
import model.ServiceType;
import model.facility.Facility;
import model.person.Customer;
import repository.base_connection.BaseConnection;
import repository.facility.FacilityRepository;

import java.sql.*;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepositoryImpl implements FacilityRepository {
    private final String INSERT_FACILITY ="insert into dich_vu(ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,ma_kieu_thue,ma_loai_dich_vu , " +
            "tieu_chuan_phong , mo_ta_tien_nghi_khac, dien_tich_ho_boi , so_tang , dich_vu_mien_phi_di_kem) values (?,?,?,?,?,?,?,?,?,?,?);";

    private final String UPDATE_FACILITY ="update dich_vu set ten_dich_vu =?,dien_tich=?,chi_phi_thue=?,so_nguoi_toi_da=?,ma_kieu_thue=?,ma_loai_dich_vu =?, " +
            "tieu_chuan_phong=? , mo_ta_tien_nghi_khac=?, dien_tich_ho_boi=? , so_tang=? , dich_vu_mien_phi_di_kem=? where ma_dich_vu=?;";
    @Override
    public boolean add(Facility facility) {
        int check;
        Connection connection = BaseConnection.getConnection();
        String facility_free =facility.getFreeServiceAdd();
        double pool_area=facility.getPoolArea();
        String roomStandard=facility.getRoomStandard();
        String descriptionOtherConvenience=facility.getDescriptionOtherConvenience();
        int numberOfFloors=facility.getNumberOfFloors();
        if(facility.getServiceTypeCode()==1) {
            facility_free = null;
        } else if(facility.getServiceTypeCode()==2) {
            facility_free = null;
            pool_area =0;
        }else {
            pool_area=0;
            roomStandard=null;
            descriptionOtherConvenience=null;
            numberOfFloors=0;
        }
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_FACILITY);
            preparedStatement.setString(1,facility.getServiceName());
            preparedStatement.setInt(2, (int) facility.getSquareUse());
            preparedStatement.setDouble(3,facility.getCost());
            preparedStatement.setInt(4,facility.getNumberOfPeople());
            preparedStatement.setInt(5,facility.getRentalTypeCode());
            preparedStatement.setInt(6,facility.getServiceTypeCode());
            preparedStatement.setString(7,roomStandard);
            preparedStatement.setString(8, descriptionOtherConvenience);
            preparedStatement.setDouble(9,pool_area);
            preparedStatement.setInt(10,numberOfFloors);
            preparedStatement.setString(11,facility_free);

            check =preparedStatement.executeUpdate();
            return check==1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean edit(Facility facility, int id) {
        int check;
        Connection connection = BaseConnection.getConnection();
        String facility_free =facility.getFreeServiceAdd();
        double pool_area=facility.getPoolArea();
        String roomStandard=facility.getRoomStandard();
        String descriptionOtherConvenience=facility.getDescriptionOtherConvenience();
        int numberOfFloors=facility.getNumberOfFloors();
        if(facility.getServiceTypeCode()==1) {
            facility_free = null;
        } else if(facility.getServiceTypeCode()==2) {
            facility_free = null;
            pool_area =0;
        }else {
            pool_area=0;
            roomStandard=null;
            descriptionOtherConvenience=null;
            numberOfFloors=0;
        }
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_FACILITY);
            preparedStatement.setString(1,facility.getServiceName());
            preparedStatement.setInt(2, (int) facility.getSquareUse());
            preparedStatement.setDouble(3,facility.getCost());
            preparedStatement.setInt(4,facility.getNumberOfPeople());
            preparedStatement.setInt(5,facility.getRentalTypeCode());
            preparedStatement.setInt(6,facility.getServiceTypeCode());
            preparedStatement.setString(7,roomStandard);
            preparedStatement.setString(8, descriptionOtherConvenience);
            preparedStatement.setDouble(9,pool_area);
            preparedStatement.setInt(10,numberOfFloors);
            preparedStatement.setString(11,facility_free);
            preparedStatement.setInt(12,id);

            check =preparedStatement.executeUpdate();
            return check==1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        int check;
        Connection connection = BaseConnection.getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall("call detete_facility(?)");
            callableStatement.setInt(1,id);
            check=  callableStatement.executeUpdate();
            return check==1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Facility> search() {
        return null;
    }


    public List<RentalType> getRentalTypeList(){
        List<RentalType> rentalTypeList = new ArrayList<>();
        Connection connection =BaseConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from kieu_thue");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int rentalTypeCode = rs.getInt(1);
                String rentalTypeName = rs.getString(2);
                rentalTypeList.add(new RentalType(rentalTypeCode,rentalTypeName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  rentalTypeList;
    }

    public List<ServiceType> getServiceTypeList(){
        List<ServiceType> serviceTypes = new ArrayList<>();
        Connection connection =BaseConnection.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from loai_dich_vu");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int serviceTypeCode = rs.getInt(1);
                String serviceTypeName = rs.getString(2);
                serviceTypes.add(new ServiceType(serviceTypeCode,serviceTypeName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  serviceTypes;
    }


    @Override
    public List<Facility> findAll() {
        Connection connection = BaseConnection.getConnection();
        List<Facility> facilityList = new ArrayList<>();
        try {
            String SELECT_ALL = "select * from dich_vu;";
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()){
                String serviceCode =rs.getString(1);
                String serviceName =rs.getString(2);
                int squareUse = rs.getInt(3);
                double cost =rs.getDouble(4);
                int numberOfPeople = rs.getInt(5);
                int rentalTypeCode = rs.getInt(6);
                int serviceTypeCode = rs.getInt(7);

                String roomStandard = rs.getString(8);
                String descriptionOtherConvenience = rs.getString(9);
                double poolArea =rs.getDouble(10);
                int numberOfFloors = rs.getInt(11);
                String freeServiceAdd = rs.getString(12);
                Facility facility = new Facility(serviceCode,serviceName,squareUse,cost,numberOfPeople,rentalTypeCode,
                        serviceTypeCode,roomStandard,descriptionOtherConvenience,poolArea,numberOfFloors,freeServiceAdd);

                facilityList.add(facility);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facilityList;

    }

//    public Facility(String serviceCode, String serviceName, double squareUse, double cost, int numberOfPeople,
//    int rentalTypeCode, int serviceTypeCode, String roomStandard, String descriptionOtherConvenience, double poolArea,
//    int numberOfFloors, String freeServiceAdd) {
    @Override
    public Facility searchFacility(int id_search) {
        Connection connection =BaseConnection.getConnection();
        Facility facility=null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from dich_vu where ma_dich_vu =?");
            preparedStatement.setInt(1,id_search);
            ResultSet rs =preparedStatement.executeQuery();
            while (rs.next()){
                String serviceCode =rs.getString(1);
                String serviceName=rs.getString(2);
                double squareUse=rs.getDouble(3);
                double cost=rs.getDouble(4);
                int numberOfPeople=rs.getInt(5);
                int rentalTypeCode=rs.getInt(6);
                int serviceTypeCode=rs.getInt(7);
                String roomStandard=rs.getString(8);
                String descriptionOtherConvenience=rs.getString(9);
                double poolArea=rs.getDouble(10);
                int numberOfFloors=rs.getInt(11);
                String freeServiceAdd=rs.getString(12);
                facility =new Facility(serviceCode,serviceName,squareUse,cost,numberOfPeople,rentalTypeCode,serviceTypeCode,roomStandard,descriptionOtherConvenience,poolArea,numberOfFloors,freeServiceAdd);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return facility;
    }
}
