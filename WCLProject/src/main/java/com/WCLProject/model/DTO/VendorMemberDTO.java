package com.WCLProject.model.DTO;

public class VendorMemberDTO {
    private String id;
    private String pw;
    private String name;
    private String tel;
    private String email;
    private String address;
    private String license;
    private String category;
    private String licenseImage;
    private String logoImage;
    private String intro;
    private String siteUrl;

    public VendorMemberDTO() {}

    public VendorMemberDTO(String id, String pw, String name, String tel, String email, String address,
                           String license, String category, String licenseImage, String logoImage,
                           String intro, String siteUrl) {
        this.id = id;
        this.pw = pw;
        this.name = name;
        this.tel = tel;
        this.email = email;
        this.address = address;
        this.license = license;
        this.category = category;
        this.licenseImage = licenseImage;
        this.logoImage = logoImage;
        this.intro = intro;
        this.siteUrl = siteUrl;
    }

    // Getters and Setters for all fields
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPw() {
        return pw;
    }

    public void setPw(String pw) {
        this.pw = pw;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLicense() {
        return license;
    }

    public void setLicense(String license) {
        this.license = license;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getLicenseImage() {
        return licenseImage;
    }

    public void setLicenseImage(String licenseImage) {
        this.licenseImage = licenseImage;
    }

    public String getLogoImage() {
        return logoImage;
    }

    public void setLogoImage(String logoImage) {
        this.logoImage = logoImage;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getSiteUrl() {
        return siteUrl;
    }

    public void setSiteUrl(String siteUrl) {
        this.siteUrl = siteUrl;
    }
}
