package com.WCLProject.model.DTO;

import java.sql.Timestamp;

public class Dress {
    // 데이터베이스 컬럼명에 맞춘 클래스 변수명
    private String dressId;
    private String dressBrand;
    private String dressFabric;
    private String dressLine;
    private String dressStyle;
    private String dressPrice;
    private String dressContent;
    private Timestamp dressDate;
    private String vendorId;
    private String photoPath;

    // Getters and setters
    public String getDressId() {
        return dressId;
    }

    public void setDressId(String dressId) {
        this.dressId = dressId;
    }

    public String getDressBrand() {
        return dressBrand;
    }

    public void setDressBrand(String dressBrand) {
        this.dressBrand = dressBrand;
    }

    public String getDressFabric() {
        return dressFabric;
    }

    public void setDressFabric(String dressFabric) {
        this.dressFabric = dressFabric;
    }

    public String getDressLine() {
        return dressLine;
    }

    public void setDressLine(String dressLine) {
        this.dressLine = dressLine;
    }

    public String getDressStyle() {
        return dressStyle;
    }

    public void setDressStyle(String dressStyle) {
        this.dressStyle = dressStyle;
    }

    public String getDressPrice() {
        return dressPrice;
    }

    public void setDressPrice(String dressPrice) {
        this.dressPrice = dressPrice;
    }

    public String getDressContent() {
        return dressContent;
    }

    public void setDressContent(String dressContent) {
        this.dressContent = dressContent;
    }

    public Timestamp getDressDate() {
        return dressDate;
    }

    public void setDressDate(Timestamp dressDate) {
        this.dressDate = dressDate;
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
}
