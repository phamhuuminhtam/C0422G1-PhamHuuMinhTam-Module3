package model;

public class ServiceType {
    private int serviceTypeCode;
    private String serviceTypeName;

    public ServiceType() {
    }

    public ServiceType(int serviceTypeCode, String serviceTypeName) {
        this.serviceTypeCode = serviceTypeCode;
        this.serviceTypeName = serviceTypeName;
    }

    public int getServiceTypeCode() {
        return serviceTypeCode;
    }

    public void setServiceTypeCode(int serviceTypeCode) {
        this.serviceTypeCode = serviceTypeCode;
    }

    public String getServiceTypeName() {
        return serviceTypeName;
    }

    public void setServiceTypeName(String serviceTypeName) {
        this.serviceTypeName = serviceTypeName;
    }
}
