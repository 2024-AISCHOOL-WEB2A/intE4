package com.WCLProject.model.DTO;

import java.sql.Timestamp;

public class Makeup {
    private String makeupId;
    private String makeupBrand;
    private String makeupConcept;
    private String makeupPrice;
    private String makeupContent;
    private Timestamp makeupDate;
    private String vendorId;
    private String photoPath;
    private String makeupTitle;

    // Getters and setters
    public String getMakeupId() {
        return makeupId;
    }

    public void setMakeupId(String makeupId) {
        this.makeupId = makeupId;
    }

    public String getMakeupBrand() {
        return makeupBrand;
    }

    public void setMakeupBrand(String makeupBrand) {
        this.makeupBrand = makeupBrand;
    }

    public String getMakeupConcept() {
        return makeupConcept;
    }

    public void setMakeupConcept(String makeupConcept) {
        this.makeupConcept = makeupConcept;
    }

    public String getMakeupPrice() {
        return makeupPrice;
    }

    public void setMakeupPrice(String makeupPrice) {
        this.makeupPrice = makeupPrice;
    }

    public String getMakeupContent() {
        return makeupContent;
    }

    public void setMakeupContent(String makeupContent) {
        this.makeupContent = makeupContent;
    }

    public Timestamp getMakeupDate() {
        return makeupDate;
    }

    public void setMakeupDate(Timestamp makeupDate) {
        this.makeupDate = makeupDate;
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
    
    public String getMakeupTitle() {
        return makeupTitle;
    }

    public void setMakeupTitle(String makeupTitle) {
        this.makeupTitle = makeupTitle;
    }
}
