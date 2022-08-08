package model;

import java.time.LocalDate;

public class CustomerValidate {
    private String pId; // mã khách hàng
    private String name;
    private String dayOfBirth;
    private String gender;
    private String personalCode; // số chứn minh nhân dân
    private  String phoneNumber;
    private  String email;
    private String typeOfGuest;
    private  String address;

    public CustomerValidate() {
    }

    public CustomerValidate(String pId, String name, String dayOfBirth, String gender, String personalCode, String phoneNumber, String email, String typeOfGuest, String address) {
        this.pId = pId;
        this.name = name;
        this.dayOfBirth = dayOfBirth;
        this.gender = gender;
        this.personalCode = personalCode;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.typeOfGuest = typeOfGuest;
        this.address = address;
    }

    public CustomerValidate( String name, String dayOfBirth, String gender, String personalCode, String phoneNumber, String email, String typeOfGuest, String address) {

        this.name = name;
        this.dayOfBirth = dayOfBirth;
        this.gender = gender;
        this.personalCode = personalCode;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.typeOfGuest = typeOfGuest;
        this.address = address;
    }
    public String getpId() {
        return pId;
    }

    public void setpId(String pId) {
        this.pId = pId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDayOfBirth() {
        return dayOfBirth;
    }

    public void setDayOfBirth(String dayOfBirth) {
        this.dayOfBirth = dayOfBirth;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPersonalCode() {
        return personalCode;
    }

    public void setPersonalCode(String personalCode) {
        this.personalCode = personalCode;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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
}
