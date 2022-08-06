package model;

public class GuestType {
    private int guestTypeId;
    private String guestTypeName;

    public GuestType() {
    }

    public GuestType(int guestTypeId, String guestTypeName) {
        this.guestTypeId = guestTypeId;
        this.guestTypeName = guestTypeName;
    }

    public int getGuestTypeId() {
        return guestTypeId;
    }

    public void setGuestTypeId(int guestTypeId) {
        this.guestTypeId = guestTypeId;
    }

    public String getGuestTypeName() {
        return guestTypeName;
    }

    public void setGuestTypeName(String guestTypeName) {
        this.guestTypeName = guestTypeName;
    }
}
