package repository;

import model.Product;

import java.util.List;

public interface ProductRepository {
    List<Product> findAll();
    void add(Product product);
    void update (Product product);
    void deleteById (int id);
    Product display(int id);
    List<Product> searchByName(String name);
}
