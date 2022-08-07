package service.facility.impl;

import model.RentalType;
import model.ServiceType;
import model.facility.Facility;
import repository.facility.FacilityRepository;
import repository.facility.impl.FacilityRepositoryImpl;
import service.facility.FacilityService;

import java.util.List;

public class FacilityServiceImpl implements FacilityService {
    FacilityRepository facilityRepository = new FacilityRepositoryImpl();
    @Override
    public boolean add(Facility facility) {
        return facilityRepository.add(facility);
    }

    @Override
    public boolean edit(Facility facility, int id) {
        return facilityRepository.edit(facility,id);
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
}
