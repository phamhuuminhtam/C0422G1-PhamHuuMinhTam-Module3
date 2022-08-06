package repository.customer;

import model.GuestType;
import model.person.Customer;

import java.util.List;

public interface CustomerRepository {
        List<Customer> showAll();

        boolean add(Customer customer);

        boolean edit(Customer customer,int id);

        boolean delete(int id);

        List<Customer> search();
        List<GuestType> getGuestTypeList();
        Customer searchCustomer(int id_search);
}

