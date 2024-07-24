package com.WCLProject.model.Service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/testUploadService")
public class testUploadService extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 실제 프로젝트 경로 설정
        String projectPath = "C:/Users/USER/git/intE4/WCLProject/src/main/webapp/upload"; // 경로를 프로젝트의 원하는 폴더로 설정
        int uploadFileSizeLimit = 5 * 1024 * 1024; // 5MB
        String encType = "UTF-8";
        
        // 파일 저장 디렉토리 확인 및 생성
        File saveDir = new File(projectPath);
        if (!saveDir.exists()) {
            saveDir.mkdirs();  // 디렉토리 생성
        }

        try {
            MultipartRequest multi = new MultipartRequest(request, projectPath, uploadFileSizeLimit, encType, new DefaultFileRenamePolicy());

            String vendorId = multi.getParameter("vendorId");
            System.out.println("Received vendorId: " + vendorId);

            HttpSession session = request.getSession();
            
            String licenseFileName = multi.getFilesystemName("vendor_license_image_file");
            if (licenseFileName != null) {
                String licenseImagePath = handleFile(projectPath, vendorId, "license", licenseFileName);
                session.setAttribute("licenseImagePath", licenseImagePath);
            } else {
                System.out.println("license 파일 업로드 실패");
            }

            String logoFileName = multi.getFilesystemName("vendor_logo_image_file");
            if (logoFileName != null) {
                String logoImagePath = handleFile(projectPath, vendorId, "logo", logoFileName);
                session.setAttribute("logoImagePath", logoImagePath);
            } else {
                System.out.println("logo 파일 업로드 실패 또는 logo 파일이 없음");
            }

            response.getWriter().write("File upload successful");
            
        } catch (Exception e) {
            System.out.println("예외 발생: " + e);
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"" + e.getMessage() + "\"}");
        }
    }

    private String handleFile(String projectPath, String vendorId, String fileType, String originalFileName) {
        // 파일 확장자 추출
        String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));

        // 날짜와 랜덤값 생성
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String datePart = sdf.format(new Date());
        String uuid = UUID.randomUUID().toString().replace("-", "");

        // 새로운 파일 이름 생성
        String newFileName = vendorId + "_" + datePart + "_" + uuid + fileExtension;

        // 디렉토리 설정
        String subDirPath = fileType;
        File fileDir = new File(projectPath + File.separator + subDirPath);
        if (!fileDir.exists()) {
            fileDir.mkdirs(); // 디렉토리 생성
        }

        File oldFile = new File(projectPath + File.separator + originalFileName);
        File newFile = new File(fileDir, newFileName);

        // 파일 이름 변경
        boolean renamed = oldFile.renameTo(newFile);
        if (renamed) {
            System.out.println(fileType + " 파일 업로드 및 이름 변경 성공: " + newFileName);
            // 웹 접근 경로 반환
            return "/upload/" + subDirPath + "/" + newFileName; // 웹 접근 가능 경로 반환
        } else {
            System.out.println(fileType + " 파일 이름 변경 실패");
            return null;
        }
    }
}
