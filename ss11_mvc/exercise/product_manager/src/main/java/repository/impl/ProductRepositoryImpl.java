package repository.impl;

import model.Product;
import repository.ProductRepository;
import repository.read_and_write.ReadAndWrite;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import static repository.read_and_write.ReadAndWrite.*;

public class ProductRepositoryImpl implements ProductRepository {
    @Override
    public List<Product> findAll() {
        List<Product> productList=ReadAndWrite.readProductFromCsv(PRODUCT_PATH_FILE);
        return productList;
    }

    @Override
    public void add(Product product) {
        List<Product> productList = new ArrayList<>();
        productList.add(product);
        ReadAndWrite.writeProductToCsv(productList, PRODUCT_PATH_FILE, true);
    }

    @Override
    public void update(Product product) {
        List<Product> productList = readProductFromCsv(PRODUCT_PATH_FILE);
        for (Product p:productList){
            if(product.getId() == p.getId()){
                p.setName(product.getName());
                p.setPrice(product.getPrice());
                p.setDescribe(product.getDescribe());
                p.setProducer(product.getProducer());
                break;
            }

        }
        writeProductToCsv(productList,PRODUCT_PATH_FILE,false);
    }

    @Override
    public void deleteById(int id) {
        List<Product> productList = readProductFromCsv(PRODUCT_PATH_FILE);
        for (Product p:productList){
            if(p.getId()==id){
                productList.remove(p);
                break;
            }
        }
        writeProductToCsv(productList,PRODUCT_PATH_FILE,false);
    }

    @Override
    public Product display(int id) {
        Product product=null;
        List<Product> productList = readProductFromCsv(PRODUCT_PATH_FILE);
        for (Product p:productList) {
            if (p.getId() == id) {
                product=p;
                break;
            }
        }
        return product;
    }

    @Override
    public List<Product> searchByName(String name) {
        List<Product> product=new ArrayList<>();
        List<Product> productList = readProductFromCsv(PRODUCT_PATH_FILE);
        for (Product p:productList) {
            if (p.getName().toLowerCase().contains(name.toLowerCase())) {
                product.add(p);

            }
        }
        return product;
    }
}
