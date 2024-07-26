package com.WCLProject.model.DTO;

public class ReservationDTO {
    private String reservationId; // 예약 ID
    private String userId; // 회원 ID
    private String itemId; // 아이템 ID
    private String vendorCategory; // 기업 카테고리 (드레스, 메이크업, 스튜디오, 웨딩홀)
    private String reservationDate; // 예약 날짜
    private String reservationState; // 예약 상태
    private double itemPrice; // 아이템 가격
    private Dress dress; // 드레스 정보
    private Makeup makeup; // 메이크업 정보
    private Studio studio; // 스튜디오 정보
    private WeddingHall weddingHall; // 웨딩홀 정보

    // Getters and setters
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

    public double getItemPrice() {
        return itemPrice;
    }

    public void setItemPrice(double itemPrice) {
        this.itemPrice = itemPrice;
    }

    public Dress getDress() {
        return dress;
    }

    public void setDress(Dress dress) {
        this.dress = dress;
    }

    public Makeup getMakeup() {
        return makeup;
    }

    public void setMakeup(Makeup makeup) {
        this.makeup = makeup;
    }

    public Studio getStudio() {
        return studio;
    }

    public void setStudio(Studio studio) {
        this.studio = studio;
    }

    public WeddingHall getWeddingHall() {
        return weddingHall;
    }

    public void setWeddingHall(WeddingHall weddingHall) {
        this.weddingHall = weddingHall;
    }
}
