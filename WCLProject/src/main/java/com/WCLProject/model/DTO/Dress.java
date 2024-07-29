package com.WCLProject.model.DTO;

import java.sql.Timestamp;

public class Dress extends ProductDTO {
    // 데이터베이스 컬럼명에 맞춘 클래스 변수명
    private String dressBrand;
    private String dressFabric;
    private String dressLine;
    private String dressStyle;
    private int dressPrice;
    private String dressContent;
    private Timestamp dressDate;
    private String vendorId;
    private String photoPath;
    private String dressTitle; 
    
    public Dress() {
    	
    }
    
    
    public Dress(String id, String dressBrand, String dressFabric, String dressLine, String dressStyle, int dressPrice,
			String dressContent, String vendorId, String photoPath, String dressTitle) {
		super();
	    this.setId(id); // ProductDTO의 id 필드를 설정
		this.dressBrand = dressBrand;
		this.dressFabric = dressFabric;
		this.dressLine = dressLine;
		this.dressStyle = dressStyle;
		this.dressPrice = dressPrice;
		this.dressContent = dressContent;
		this.vendorId = vendorId;
		this.photoPath = photoPath;
		this.dressTitle = dressTitle;
	}
    
	public Dress(String dressBrand, String dressFabric, String dressLine, String dressStyle, int dressPrice,
			String dressContent, String vendorId, String photoPath, String dressTitle) {
		super();
		this.dressBrand = dressBrand;
		this.dressFabric = dressFabric;
		this.dressLine = dressLine;
		this.dressStyle = dressStyle;
		this.dressPrice = dressPrice;
		this.dressContent = dressContent;
		this.vendorId = vendorId;
		this.photoPath = photoPath;
		this.dressTitle = dressTitle;
	}

	public Dress(String photoPath, String dressTitle, int dressPrice, String dressFabric, String dressLine, String dressStyle, Timestamp dressDate, String id) {
		this.photoPath = photoPath;
		this.dressTitle = dressTitle;
		this.dressPrice = dressPrice;
		this.dressFabric = dressFabric;
		this.dressLine = dressLine;
		this.dressStyle = dressStyle;
		this.dressDate = dressDate;
		this.setId(id);
	}
	
	// Getters and setters
	@Override
	public String getId() {
		return super.getId();
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

    public int getDressPrice() {
        return dressPrice;
    }

    public void setDressPrice(int dressPrice) {
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
    
    public String getDressTitle() {
        return dressTitle;
    }

    public void setDressTitle(String dressTitle) {
        this.dressTitle = dressTitle;
    }
}
