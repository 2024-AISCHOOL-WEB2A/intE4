package com.WCLProject.model.DTO;

import java.sql.Timestamp;

public class WeddingHall {
    private String weddingHallId;
    private String weddingHallBrand;
    private String weddingHallMealCost;
    private String weddingHallAssurance;
    private String weddingHallType;
    private String weddingHallPrice;
    private String weddingHallContent;
    private Timestamp weddingHallDate;
    private String vendorId;
    private String photoPath;
    private String weddingHallTitle;

    // Getters and setters
    public String getWeddingHallId() {
        return weddingHallId;
    }

    public void setWeddingHallId(String weddingHallId) {
        this.weddingHallId = weddingHallId;
    }

    public String getWeddingHallBrand() {
        return weddingHallBrand;
    }

    public void setWeddingHallBrand(String weddingHallBrand) {
        this.weddingHallBrand = weddingHallBrand;
    }

    public String getWeddingHallMealCost() {
        return weddingHallMealCost;
    }

    public void setWeddingHallMealCost(String weddingHallMealCost) {
        this.weddingHallMealCost = weddingHallMealCost;
    }

    public String getWeddingHallAssurance() {
        return weddingHallAssurance;
    }

    public void setWeddingHallAssurance(String weddingHallAssurance) {
        this.weddingHallAssurance = weddingHallAssurance;
    }

    public String getWeddingHallType() {
        return weddingHallType;
    }

    public void setWeddingHallType(String weddingHallType) {
        this.weddingHallType = weddingHallType;
    }

    public String getWeddingHallPrice() {
        return weddingHallPrice;
    }

    public void setWeddingHallPrice(String weddingHallPrice) {
        this.weddingHallPrice = weddingHallPrice;
    }

    public String getWeddingHallContent() {
        return weddingHallContent;
    }

    public void setWeddingHallContent(String weddingHallContent) {
        this.weddingHallContent = weddingHallContent;
    }

    public Timestamp getWeddingHallDate() {
        return weddingHallDate;
    }

    public void setWeddingHallDate(Timestamp weddingHallDate) {
        this.weddingHallDate = weddingHallDate;
    }

    public String getVendorId() {
        return vendorId;
    }

    public void setVendorId(String vendorId) {
        this.vendorId = vendorId;
    }

    public String getPhotoPath() {
        return photoPath;
    }

    public void setPhotoPath(String photoPath) {
        this.photoPath = photoPath;
    }
    
    public String getweddingHallTitle() {
        return weddingHallTitle;
    }

    public void setWeddingHallTitle(String weddingHallTitle) {
        this.weddingHallTitle = weddingHallTitle;
    }
}
