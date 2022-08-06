package model.person;

import java.time.LocalDate;

public abstract class Person {
    private String pId; // mã khách hàng
    private String name;
    private LocalDate dayOfBirth;
    private String gender;
    private String personalCode; // số chứn minh nhân dân
    private  String phoneNumber;
    private  String email;

    public Person() {
    }

    public Person(String name, LocalDate dayOfBirth, String gender, String personalCode, String phoneNumber, String email) {
        this.name = name;
        this.dayOfBirth = dayOfBirth;
        this.gender = gender;
        this.personalCode = personalCode;
        this.phoneNumber = phoneNumber;
        this.email = email;
    }

    public Person(String id, String name, LocalDate dayOfBirth, String gender, String personalCode, String phoneNumber, String email) {
        this.pId = id;
        this.name = name;
        this.dayOfBirth = dayOfBirth;
        this.gender = gender;
        this.personalCode = personalCode;
        this.phoneNumber = phoneNumber;
        this.email = email;
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

    public LocalDate getDayOfBirth() {
        return dayOfBirth;
    }

    public void setDayOfBirth(LocalDate dayOfBirth) {
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

    @Override
    public String toString() {
        return "ID='" + pId + '\'' +
                ", name='" + name + '\'' +
                ", dayOfBirth=" + dayOfBirth +
                ", gender=" + gender +
                ", personalCode=" + personalCode +
                ", phoneNumber=" + phoneNumber +
                ", email='" + email ;
    }
}
