package com.WCLProject.model.DTO;

import java.sql.Timestamp;

public class Makeup {
    private String makeupId;
    private String makeupBrand;
    private String makeupConcept;
    private int makeupPrice;
    private String makeupContent;
    private Timestamp makeupDate;
    private String vendorId;
    private String photoPath;
    private String makeupTitle;

    public Makeup() {}
    
    public Makeup(String photoPath, String makeupConcept, int makeupPrice, String makeupTitle, String makeupContent, Timestamp makeupDate, String makeupId) {
		this.photoPath = photoPath;
		this.makeupConcept = makeupConcept;
		this.makeupPrice = makeupPrice;
		this.makeupTitle = makeupTitle;
		this.makeupContent = makeupContent;
		this.makeupDate = makeupDate;
		this.makeupId = makeupId;
    }
    
    public Makeup(String id, String concept, int price, String title, String content, String photoPath,
			String vendorId, String brand) {
		this.makeupId = id;
		this.makeupConcept = concept;
		this.makeupPrice = price;
		this.makeupTitle = title;
		this.makeupContent = content;
		this.photoPath = photoPath;
		this.vendorId = vendorId;
		this.makeupBrand = brand;
	}

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

    public int getMakeupPrice() {
        return makeupPrice;
    }

    public void setMakeupPrice(int makeupPrice) {
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
