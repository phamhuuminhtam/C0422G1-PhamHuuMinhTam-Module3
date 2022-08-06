package service.customer.impl;

import model.person.Customer;
import repository.customer.CustomerRepository;
import repository.customer.impl.CustomerRepositoryImpl;
import service.customer.CustomerService;

import java.util.List;

public class CustomerServiceImpl implements CustomerService{
    CustomerRepository customerRepository = new CustomerRepositoryImpl();
    @Override
    public boolean add(Customer customer) {
       return customerRepository.add(customer);
    }

    @Override
    public void edit() {

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
}
