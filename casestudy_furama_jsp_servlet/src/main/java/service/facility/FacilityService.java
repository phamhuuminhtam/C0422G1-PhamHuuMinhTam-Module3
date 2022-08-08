package service.facility;

import model.RentalType;
import model.ServiceType;
import model.facility.Facility;

import java.util.List;
import java.util.Map;

public interface FacilityService {

    Map<String, String> add(Facility facility);

    Map<String, String> edit(Facility facility, int id);

    boolean delete(int id);

    List<Facility> search();
    List<Facility> findAll();
    Facility searchFacility(int id_search);
    List<ServiceType> getServiceTypeList();
    List<RentalType> getRentalTypeList();
}
