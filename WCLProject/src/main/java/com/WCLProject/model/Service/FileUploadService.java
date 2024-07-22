package com.WCLProject.model.Service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/FileUploadService")
@MultipartConfig
public class FileUploadService extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();  // 디렉토리가 없으면 생성
        }

        // 사업자등록증 이미지 처리
        Part vendorLicenseFilePart = request.getPart("vendor_license_file");
        String vendorLicenseFilePath = null;
        if (vendorLicenseFilePart != null && vendorLicenseFilePart.getSize() > 0) {
            File licenseDir = new File(uploadPath + File.separator + "license");
            if (!licenseDir.exists()) {
                licenseDir.mkdir();
            }
            String vendorLicenseFileName = Paths.get(vendorLicenseFilePart.getSubmittedFileName()).getFileName().toString();
            vendorLicenseFilePart.write(licenseDir.getAbsolutePath() + File.separator + vendorLicenseFileName);
            vendorLicenseFilePath = "uploads/license/" + vendorLicenseFileName;  // 상대 경로 반환
            request.setAttribute("vendorLicenseFilePath", vendorLicenseFilePath);
        }

        // 기업 로고 이미지 처리
        Part vendorLogoFilePart = request.getPart("vendor_logo_file");
        String vendorLogoFilePath = null;
        if (vendorLogoFilePart != null && vendorLogoFilePart.getSize() > 0) {
            File logoDir = new File(uploadPath + File.separator + "logo");
            if (!logoDir.exists()) {
                logoDir.mkdir();
            }
            String vendorLogoFileName = Paths.get(vendorLogoFilePart.getSubmittedFileName()).getFileName().toString();
            vendorLogoFilePart.write(logoDir.getAbsolutePath() + File.separator + vendorLogoFileName);
            vendorLogoFilePath = "uploads/logo/" + vendorLogoFileName;  // 상대 경로 반환
            request.setAttribute("vendorLogoFilePath", vendorLogoFilePath);
        }

        // 파일 경로를 클라이언트에게 응답으로 반환
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"vendorLicenseFile\":\"" + vendorLicenseFilePath + "\", \"vendorLogoFile\":\"" + vendorLogoFilePath + "\"}");
    }
}
