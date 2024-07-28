package com.WCLProject.model.DTO;

import java.sql.Timestamp;

public class Studio {
    private String studioId;
    private String studioBrand;
    private String studioConcept;
    private String studioPrice;
    private String studioContent;
    private Timestamp studioDate;
    private String vendorId;
    private String photoPath;
    private String studioTitle;

    // Getters and setters
    public String getStudioId() {
        return studioId;
    }

    public void setStudioId(String studioId) {
        this.studioId = studioId;
    }

    public String getStudioBrand() {
        return studioBrand;
    }

    public void setStudioBrand(String studioBrand) {
        this.studioBrand = studioBrand;
    }

    public String getStudioConcept() {
        return studioConcept;
    }

    public void setStudioConcept(String studioConcept) {
        this.studioConcept = studioConcept;
    }

    public String getStudioPrice() {
        return studioPrice;
    }

    public void setStudioPrice(String studioPrice) {
        this.studioPrice = studioPrice;
    }

    public String getStudioContent() {
        return studioContent;
    }

    public void setStudioContent(String studioContent) {
        this.studioContent = studioContent;
    }

    public Timestamp getStudioDate() {
        return studioDate;
    }

    public void setStudioDate(Timestamp studioDate) {
        this.studioDate = studioDate;
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
    
    public String getStudioTitle() {
        return studioTitle;
    }

    public void setStudioTitle(String studioTitle) {
        this.studioTitle = studioTitle;
    }
}
