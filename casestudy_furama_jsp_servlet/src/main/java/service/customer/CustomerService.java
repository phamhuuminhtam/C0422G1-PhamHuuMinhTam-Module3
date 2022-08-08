package service.customer;

import model.GuestType;
import model.person.Customer;

import java.util.List;

public interface CustomerService {
    boolean add(Customer customer);
    boolean edit(Customer customer,int id);
    boolean delete(int id);
    List<Customer> search();
    List<Customer> findAll();
    Customer searchCustomer(int id_search);
     List<GuestType> getGuestTypeList();

    }
