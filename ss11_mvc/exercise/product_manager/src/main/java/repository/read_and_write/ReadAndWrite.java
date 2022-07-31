package repository.read_and_write;

import model.Product;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class ReadAndWrite {
    public static final String PRODUCT_PATH_FILE = "D:\\repository\\C0422G1-PhamHuuMinhTam-Module3\\ss11_mvc\\exercise\\product_manager\\src\\main\\java\\repository\\data\\Product.csv";

    public static List<String> readFileFromCSV(String pathFile){
        List<String>  stringList = new ArrayList<>();
        BufferedReader bufferedReader =null;

        try {
            String str="";
            bufferedReader = new BufferedReader(new FileReader(pathFile));
            while ((str =bufferedReader.readLine())!=null){
                stringList.add(str);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            try {
                bufferedReader.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return stringList;
    }

    public static void writeToCSV(List<String> list,String pathFile, boolean appends){
        BufferedWriter bufferedWriter = null;
        try {
            bufferedWriter = new BufferedWriter(new FileWriter(pathFile,appends));
                for(String s:list){
            bufferedWriter.write(s);
            bufferedWriter.newLine();
                }
        } catch (IOException e) {
            e.printStackTrace();
        }
        finally {
            try {
                bufferedWriter.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public static void writeProductToCsv(List<Product> productList, String pathFile,boolean appends){
        List<String> stringList = new ArrayList<>();
        for(Product p : productList ){
            stringList.add(p.getInfo());
        }
        writeToCSV(stringList,pathFile,appends);
    }
    public static List<Product> readProductFromCsv(String pathFile){
        List<Product> productList = new ArrayList<>();
        List<String> stringList = readFileFromCSV(pathFile);
        String[] arr;
        for(String s: stringList){
            arr = s.split(",");
           productList.add(new Product(Integer.parseInt(arr[0]),arr[1],Double.parseDouble(arr[2]),arr[3],arr[4]));
        }
            return productList;
    }

}
