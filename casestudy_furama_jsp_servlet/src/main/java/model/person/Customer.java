package model.person;

import java.time.LocalDate;

public class Customer extends Person{
    private String typeOfGuest;
    private  String address;

    public Customer() {
    }

    public Customer(String id, String name, LocalDate dayOfBirth, String gender, String personalCode, String phoneNumber, String email, String typeOfGuest, String address) {
        super(id, name, dayOfBirth, gender, personalCode, phoneNumber, email);
        this.typeOfGuest = typeOfGuest;
        this.address = address;
    }

    public Customer(String name, LocalDate dayOfBirth, String gender, String personalCode, String phoneNumber, String email, String typeOfGuest, String address) {
        super(name, dayOfBirth, gender, personalCode, phoneNumber, email);
        this.typeOfGuest = typeOfGuest;
        this.address = address;
    }



    public String getTypeOfGuest() {
        return typeOfGuest;
    }

    public void setTypeOfGuest(String typeOfGuest) {
        this.typeOfGuest = typeOfGuest;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "Customer" + super.toString() +
                ", typeOfGuest='" + typeOfGuest + '\'' +
                ", address='" + address + '\'' ;
    }
}
