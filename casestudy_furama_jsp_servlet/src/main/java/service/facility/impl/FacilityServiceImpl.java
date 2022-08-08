package service.facility.impl;

import model.CustomerValidate;
import model.RentalType;
import model.ServiceType;
import model.facility.Facility;
import repository.facility.FacilityRepository;
import repository.facility.impl.FacilityRepositoryImpl;
import service.facility.FacilityService;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FacilityServiceImpl implements FacilityService {
    FacilityRepository facilityRepository = new FacilityRepositoryImpl();
    @Override
    public Map<String, String> add(Facility facility) {
        Map<String, String> mapErrors = validate(facility);
        if(mapErrors.isEmpty())  facilityRepository.add(facility);
        return mapErrors;
    }

    @Override
    public Map<String, String> edit(Facility facility, int id) {
        Map<String, String> mapErrors = validate(facility);
        if (mapErrors.isEmpty()) facilityRepository.edit(facility,id);
        return mapErrors;
    }

    @Override
    public boolean delete(int id) {
        return facilityRepository.delete(id);
    }

    @Override
    public List<Facility> search() {
        return null;
    }

    @Override
    public List<Facility> findAll() {
        return facilityRepository.findAll();
    }

    @Override
    public Facility searchFacility(int id_search) {
        return facilityRepository.searchFacility(id_search);
    }

    @Override
    public List<ServiceType> getServiceTypeList() {
        return facilityRepository.getServiceTypeList();
    }

    @Override
    public List<RentalType> getRentalTypeList() {
        return facilityRepository.getRentalTypeList();
    }


    public Map<String, String> validate(Facility facility) {
        Map<String, String> mapErrors = new HashMap<>();
        if (!facility.getServiceName().isEmpty()) {
            if (!facility.getServiceName().matches("^[A-ZĐ][a-zỳọáầảấờễàạằệếýộậốũứĩõúữịỗìềểẩớặòùồợãụủíỹắẫựỉỏừỷởóéửỵẳẹèẽổẵẻỡơôưăêâ0-9]+( [A-ZĐ][a-zỳọáầảấờễàạằệếýộậốũứĩõúữịỗìềểẩớặòùồợãụủíỹắẫựỉỏừỷởóéửỵẳẹèẽổẵẻỡơôưăêâ0-9]*)+$")) {
                mapErrors.put("name", "Please input right format!");
            }
        } else {
            mapErrors.put("name", "Please input name!");
        }

        if (facility.getCost()<0) {
             mapErrors.put("cost", "Please input right format!");
            }


        if (facility.getSquareUse()<0) {
           mapErrors.put("useSquare", "Please input right format!");
            }


        if (facility.getPoolArea()<0) {
            mapErrors.put("poolArea", "Please input right format!");
        }

        if (facility.getNumberOfFloors()<0||facility.getNumberOfFloors()%1!=0) {
            mapErrors.put("numberOfFloors", "Please input right format!");
        }

        if (facility.getNumberOfPeople()<0||facility.getNumberOfPeople()%1!=0) {
            mapErrors.put("numberOfPeople", "Please input right format!");
        }

        return mapErrors;
    }
}
