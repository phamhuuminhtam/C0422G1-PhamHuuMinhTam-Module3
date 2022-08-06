package service.customer;

import model.person.Customer;

import java.util.List;

public interface CustomerService {
    boolean add(Customer customer);
    void edit();
    boolean delete(int id);
    List<Customer> search();
    List<Customer> findAll();
}
