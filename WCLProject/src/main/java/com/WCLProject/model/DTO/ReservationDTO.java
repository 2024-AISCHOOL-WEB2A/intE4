package com.WCLProject.model.DTO;

public class ReservationDTO {
    private String reservationId;
    private String userId;
    private String itemId;
    private String vendorCategory;
    private String reservationDate;
    private String reservationState;
    private int itemPrice;
    private String photoPath;
    private String itemBrand;  // 새로운 필드 추가

    // 기본 생성자
    public ReservationDTO() {}

    // 모든 필드를 포함한 생성자
    public ReservationDTO(String userId, String itemId, String vendorCategory, String reservationDate,
                          String reservationState, int itemPrice, String reservationId, String photoPath, String itemBrand) {
        this.userId = userId;
        this.itemId = itemId;
        this.vendorCategory = vendorCategory;
        this.reservationDate = reservationDate;
        this.reservationState = reservationState;
        this.itemPrice = itemPrice;
        this.reservationId = reservationId;
        this.photoPath = photoPath;
        this.itemBrand = itemBrand;  // 필드 초기화
    }

    // Getters and Setters
    public String getReservationId() {
        return reservationId;
    }

    public void setReservationId(String reservationId) {
        this.reservationId = reservationId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getItemId() {
        return itemId;
    }

    public void setItemId(String itemId) {
        this.itemId = itemId;
    }

    public String getVendorCategory() {
        return vendorCategory;
    }

    public void setVendorCategory(String vendorCategory) {
        this.vendorCategory = vendorCategory;
    }

    public String getReservationDate() {
        return reservationDate;
    }

    public void setReservationDate(String reservationDate) {
        this.reservationDate = reservationDate;
    }

    public String getReservationState() {
        return reservationState;
    }

    public void setReservationState(String reservationState) {
        this.reservationState = reservationState;
    }

    public int getItemPrice() {
        return itemPrice;
    }

    public void setItemPrice(int itemPrice) {
        if (itemPrice < 0) {
            throw new IllegalArgumentException("Item price cannot be negative");
        }
        this.itemPrice = itemPrice;
    }

    public String getPhotoPath() {
        return photoPath;
    }

    public void setPhotoPath(String photoPath) {
        this.photoPath = photoPath;
    }

    public String getItemBrand() {
        return itemBrand;
    }

    public void setItemBrand(String itemBrand) {
        this.itemBrand = itemBrand;
    }

    @Override
    public String toString() {
        return "ReservationDTO{" +
                "reservationId='" + reservationId + '\'' +
                ", userId='" + userId + '\'' +
                ", itemId='" + itemId + '\'' +
                ", vendorCategory='" + vendorCategory + '\'' +
                ", reservationDate='" + reservationDate + '\'' +
                ", reservationState='" + reservationState + '\'' +
                ", itemPrice=" + itemPrice +
                ", photoPath='" + photoPath + '\'' +
                ", itemBrand='" + itemBrand + '\'' +  // 새로운 필드 추가
                '}';
    }
}

