package com.WCLProject.model.DTO;

import java.sql.Timestamp;

public class Studio {
    private String studioId;
    private String studioBrand;
    private String studioConcept;
    private int studioPrice;
    private String studioContent;
    private Timestamp studioDate;
    private String vendorId;
    private String photoPath;
    private String studioTitle;
    
    public Studio() {}
    
    public Studio(String photoPath, String studioConcept, int studioPrice, String studioTitle, String studioContent, Timestamp studioDate, String studioId) {
		this.photoPath = photoPath;
		this.studioConcept = studioConcept;
		this.studioPrice = studioPrice;
		this.studioTitle = studioTitle;
		this.studioContent = studioContent;
		this.studioDate = studioDate;
		this.studioId = studioId;
    }

    public Studio(String id, String concept, int price, String title, String content, String photoPath,
			String vendorId, String brand) {
		this.studioId = id;
		this.studioConcept = concept;
		this.studioPrice = price;
		this.studioTitle = title;
		this.studioContent = content;
		this.photoPath = photoPath;
		this.vendorId = vendorId;
		this.studioBrand = brand;
	}

	public Studio(String id, String photoPath, String concept, int price, String title, String content) {
		this.studioId = id;
		this.photoPath = photoPath;
		this.studioConcept = concept;
		this.studioPrice = price;
		this.studioTitle = title;
		this.studioContent = content;
	}

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

    public int getStudioPrice() {
        return studioPrice;
    }

    public void setStudioPrice(int studioPrice) {
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
