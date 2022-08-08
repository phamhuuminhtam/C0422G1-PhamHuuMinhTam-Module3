package service.customer.impl;

import model.CustomerValidate;
import model.GuestType;
import model.person.Customer;
import repository.customer.CustomerRepository;
import repository.customer.impl.CustomerRepositoryImpl;
import service.customer.CustomerService;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerServiceImpl implements CustomerService {
    CustomerRepository customerRepository = new CustomerRepositoryImpl();

    //    public Customer(String name, LocalDate dayOfBirth, String gender, String personalCode, String phoneNumber, String email, String typeOfGuest, String address)
    @Override
    public Map<String, String> add(CustomerValidate customerValidate) {
        Map<String, String> mapErrors = validate(customerValidate);
        Customer customer;
        if (mapErrors.size() == 0) {
            customer = new Customer(customerValidate.getName(), LocalDate.parse(customerValidate.getDayOfBirth()), customerValidate.getGender(),
                    customerValidate.getPersonalCode(), customerValidate.getPhoneNumber(), customerValidate.getEmail(), customerValidate.getTypeOfGuest(), customerValidate.getAddress());
            customerRepository.add(customer);
        }
        return mapErrors;
    }

    @Override
    public Map<String, String> edit(CustomerValidate customerValidate, int id) {
        Map<String, String> mapErrors = validate(customerValidate);
        Customer customer;
        if (mapErrors.size() == 0) {
            customer = new Customer(customerValidate.getName(), LocalDate.parse(customerValidate.getDayOfBirth()), customerValidate.getGender(),
                    customerValidate.getPersonalCode(), customerValidate.getPhoneNumber(), customerValidate.getEmail(), customerValidate.getTypeOfGuest(), customerValidate.getAddress());
            customerRepository.edit(customer,id);
        }
        return mapErrors;

    }

    @Override
    public boolean delete(int id) {
        return customerRepository.delete(id);
    }

    @Override
    public List<Customer> search() {
        return null;
    }

    @Override
    public List<Customer> findAll() {

        return customerRepository.showAll();
    }

    @Override
    public Customer searchCustomer(int id_search) {
        return customerRepository.searchCustomer(id_search);
    }

    public List<GuestType> getGuestTypeList() {
        return customerRepository.getGuestTypeList();
    }

    public Map<String, String> validate(CustomerValidate customerValidate) {
        Map<String, String> mapErrors = new HashMap<>();
        if (!customerValidate.getName().isEmpty()) {
            if (!customerValidate.getName().matches("^[A-ZĐ][a-zỳọáầảấờễàạằệếýộậốũứĩõúữịỗìềểẩớặòùồợãụủíỹắẫựỉỏừỷởóéửỵẳẹèẽổẵẻỡơôưăêâ]+( [A-ZĐ][a-zỳọáầảấờễàạằệếýộậốũứĩõúữịỗìềểẩớặòùồợãụủíỹắẫựỉỏừỷởóéửỵẳẹèẽổẵẻỡơôưăêâ]*)+$")) {
                mapErrors.put("name", "Please input right format!");
            }
        } else {
            mapErrors.put("name", "Please input name!");
        }

        if (!customerValidate.getPhoneNumber().isEmpty()) {
            if (!customerValidate.getPhoneNumber().matches("^(090|091|\\(84\\)\\+90|\\(84\\)\\+91)[0-9]{7}$")) {
                mapErrors.put("phone", "Please input right format!");
            }
        } else {
            mapErrors.put("phone", "Please input phone!");
        }

        if (!customerValidate.getEmail().isEmpty()) {
            if (!customerValidate.getEmail().matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
                mapErrors.put("email", "Please input right format!");
            }
        } else {
            mapErrors.put("email", "Please input email!");
        }

        if (!customerValidate.getPersonalCode().isEmpty()) {
            if (!customerValidate.getPersonalCode().matches("^[0-9]{9}$")) {
                mapErrors.put("personalCode", "Please input right format!");
            }
        } else {
            mapErrors.put("personalCode", "Please input personal code!");
        }

        LocalDate dayOfBirth = null;
        if (!customerValidate.getDayOfBirth().isEmpty()) {
            try {
                dayOfBirth = LocalDate.parse(customerValidate.getDayOfBirth(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            } catch (Exception e) {
                mapErrors.put("dayOfBirth", "Please input right format!");
            }
        } else {
            mapErrors.put("dayOfBirth", "Please input day of birth!");
        }

        return mapErrors;
    }

}
