package common;

import model.Product;
import repository.ReadAndWrite.ReadAndWrite;

import java.util.List;

import static repository.ReadAndWrite.ReadAndWrite.PRODUCT_PATH_FILE;

public class IncreaseID {

    public static int increaseID() {
        List<Product> list = ReadAndWrite.readProductFromCsv(PRODUCT_PATH_FILE);
        int number;
        if (list.isEmpty()) number = 1;
        else {
            boolean flag;
            do {
                flag = false;
                number = list.get(list.size() - 1).getId() + 1;
                for (Product b : list) {
                    if (b.getId() == number) {
                        number++;
                        flag = true;
                    }
                }
            } while (flag);
        }
        return number;
    }
}
