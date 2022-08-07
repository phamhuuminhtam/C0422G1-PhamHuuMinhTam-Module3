package model.facility;

public class Facility {
    private String serviceCode;
    private String serviceName;
    private  double squareUse;
    private   double cost;
    private  int numberOfPeople;
    private  int rentalTypeCode;
    private  int serviceTypeCode;
    private String roomStandard;
    private String descriptionOtherConvenience;
    private double poolArea;
    private  int numberOfFloors;
    private String freeServiceAdd;


    public Facility() {
    }

    public Facility(String serviceCode, String serviceName, double squareUse, double cost, int numberOfPeople, int rentalTypeCode, int serviceTypeCode, String roomStandard, String descriptionOtherConvenience, double poolArea, int numberOfFloors, String freeServiceAdd) {
        this.serviceCode = serviceCode;
        this.serviceName = serviceName;
        this.squareUse = squareUse;
        this.cost = cost;
        this.numberOfPeople = numberOfPeople;
        this.rentalTypeCode = rentalTypeCode;
        this.serviceTypeCode = serviceTypeCode;
        this.roomStandard = roomStandard;
        this.descriptionOtherConvenience = descriptionOtherConvenience;
        this.poolArea = poolArea;
        this.numberOfFloors = numberOfFloors;
        this.freeServiceAdd = freeServiceAdd;
    }
    public Facility( String serviceName, double squareUse, double cost, int numberOfPeople, int rentalTypeCode, int serviceTypeCode, String roomStandard, String descriptionOtherConvenience, double poolArea, int numberOfFloors, String freeServiceAdd) {
        this.serviceName = serviceName;
        this.squareUse = squareUse;
        this.cost = cost;
        this.numberOfPeople = numberOfPeople;
        this.rentalTypeCode = rentalTypeCode;
        this.serviceTypeCode = serviceTypeCode;
        this.roomStandard = roomStandard;
        this.descriptionOtherConvenience = descriptionOtherConvenience;
        this.poolArea = poolArea;
        this.numberOfFloors = numberOfFloors;
        this.freeServiceAdd = freeServiceAdd;
    }

    public String getServiceCode() {
        return serviceCode;
    }

    public void setServiceCode(String serviceCode) {
        this.serviceCode = serviceCode;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public double getSquareUse() {
        return squareUse;
    }

    public void setSquareUse(double squareUse) {
        this.squareUse = squareUse;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public int getNumberOfPeople() {
        return numberOfPeople;
    }

    public void setNumberOfPeople(int numberOfPeople) {
        this.numberOfPeople = numberOfPeople;
    }

    public int getRentalTypeCode() {
        return rentalTypeCode;
    }

    public void setRentalTypeCode(int rentalTypeCode) {
        this.rentalTypeCode = rentalTypeCode;
    }

    public int getServiceTypeCode() {
        return serviceTypeCode;
    }

    public void setServiceTypeCode(int serviceTypeCode) {
        this.serviceTypeCode = serviceTypeCode;
    }

    public String getRoomStandard() {
        return roomStandard;
    }

    public void setRoomStandard(String roomStandard) {
        this.roomStandard = roomStandard;
    }

    public String getDescriptionOtherConvenience() {
        return descriptionOtherConvenience;
    }

    public void setDescriptionOtherConvenience(String descriptionOtherConvenience) {
        this.descriptionOtherConvenience = descriptionOtherConvenience;
    }

    public double getPoolArea() {
        return poolArea;
    }

    public void setPoolArea(double poolArea) {
        this.poolArea = poolArea;
    }

    public int getNumberOfFloors() {
        return numberOfFloors;
    }

    public void setNumberOfFloors(int numberOfFloors) {
        this.numberOfFloors = numberOfFloors;
    }

    public String getFreeServiceAdd() {
        return freeServiceAdd;
    }

    public void setFreeServiceAdd(String freeServiceAdd) {
        this.freeServiceAdd = freeServiceAdd;
    }
}
