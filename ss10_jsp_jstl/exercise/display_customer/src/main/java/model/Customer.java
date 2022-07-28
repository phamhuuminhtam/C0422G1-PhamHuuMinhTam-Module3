package model;

import java.time.LocalDate;

public class Customer {
   private String name;
   private LocalDate dayOfBirth;
   private String address;
   private String img;

    public Customer() {
    }

    public Customer(String name, LocalDate dayOfBirth, String address, String img) {
        this.name = name;
        this.dayOfBirth = dayOfBirth;
        this.address = address;
        this.img = img;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getDayOfBirth() {
        return dayOfBirth;
    }

    public void setDayOfBirth(LocalDate dayOfBirth) {
        this.dayOfBirth = dayOfBirth;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "name='" + name + '\'' +
                ", dayOfBirth=" + dayOfBirth +
                ", address='" + address + '\'' +
                ", img='" + img + '\'' +
                '}';
    }
}
