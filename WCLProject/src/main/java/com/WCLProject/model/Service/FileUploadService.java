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

import org.json.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/FileUploadService")
public class FileUploadService extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 상대 경로를 설정
        String relativeSavePath = "/upload";
        int uploadFileSizeLimit = 5 * 1024 * 1024; // 5MB
        String encType = "UTF-8";
        
        // 웹 애플리케이션의 루트 경로를 기준으로 실제 경로 얻기
        String realPath = getServletContext().getRealPath(relativeSavePath);
        System.out.println("서버 상의 실제 디렉토리 : " + realPath);
        
        // 디렉토리 존재 여부 확인 및 생성
        File saveDir = new File(realPath);
        if (!saveDir.exists()) {
            saveDir.mkdirs();  // 디렉토리 생성
        }

        try {
            MultipartRequest multi = new MultipartRequest(request, realPath, uploadFileSizeLimit, encType, new DefaultFileRenamePolicy());

            String vendorId = multi.getParameter("vendorId");
            System.out.println("Received vendorId: " + vendorId);

            HttpSession session = request.getSession();
            
            String licenseFileName = multi.getFilesystemName("vendor_license_image_file");
            if (licenseFileName != null) {
                String licenseImagePath = handleFile(realPath, vendorId, "license", licenseFileName);
                session.setAttribute("licenseImagePath", licenseImagePath);
            } else {
                System.out.println("license 파일 업로드 실패");
            }

            String logoFileName = multi.getFilesystemName("vendor_logo_image_file");
            if (logoFileName != null) {
                String logoImagePath = handleFile(realPath, vendorId, "logo", logoFileName);
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

    // 파일 이름 변경 및 저장 처리
    private String handleFile(String realPath, String vendorId, String fileType, String originalFileName) {
        // 파일 확장자 추출
        String fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));

        // 날짜와 랜덤값 생성
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String datePart = sdf.format(new Date());
        String uuid = UUID.randomUUID().toString().replace("-", "");

        // 새로운 파일 이름 생성
        String newFileName = vendorId + "_" + datePart + "_" + uuid + fileExtension;

        // 디렉토리 설정
        String subDirPath = File.separator + fileType;
        File fileDir = new File(realPath + subDirPath);
        if (!fileDir.exists()) {
            fileDir.mkdirs(); // 디렉토리 생성
        }

        File oldFile = new File(realPath + File.separator + originalFileName);
        File newFile = new File(fileDir, newFileName);

        // 파일 이름 변경
        boolean renamed = oldFile.renameTo(newFile);
        if (renamed) {
            System.out.println(fileType + " 파일 업로드 및 이름 변경 성공: " + newFileName);
            return subDirPath + File.separator + newFileName; // 변경된 파일 경로 반환
        } else {
            System.out.println(fileType + " 파일 이름 변경 실패");
            return null;
        }
    }
}
