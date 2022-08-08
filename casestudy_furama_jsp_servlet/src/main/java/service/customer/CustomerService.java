package service.customer;

import model.CustomerValidate;
import model.GuestType;
import model.person.Customer;

import java.util.List;
import java.util.Map;

public interface CustomerService {
    Map<String, String> add(CustomerValidate customerValidate);
    Map<String, String> edit(CustomerValidate customerValidate ,int id);
    boolean delete(int id);
    List<Customer> search();
    List<Customer> findAll();
    Customer searchCustomer(int id_search);
     List<GuestType> getGuestTypeList();

    }
