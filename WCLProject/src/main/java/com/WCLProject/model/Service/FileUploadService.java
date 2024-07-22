package com.WCLProject.model.Service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.Part;

public class FileUploadService {
	public String uploadFile(Part filePart, String vendorId, String fileType, String uploadPath) throws IOException, ServletException {
	    String fileName = getSubmittedFileName(filePart);
	    String fileExtension = fileName.substring(fileName.lastIndexOf("."));
	    
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	    String datePart = sdf.format(new Date());
	    
	    String newFileName = vendorId + "_" + fileType + "_image_" + datePart + fileExtension;
	    
	    String fullUploadPath = uploadPath + File.separator + fileType + File.separator;
	    System.out.println("Full upload path: " + fullUploadPath);

	    File uploadDir = new File(fullUploadPath);
	    if (!uploadDir.exists()) {
	        boolean created = uploadDir.mkdirs();
	        System.out.println("Directory created: " + created);
	    }
	    
	    String fullFilePath = fullUploadPath + newFileName;
	    try (InputStream input = filePart.getInputStream();
	         OutputStream output = new FileOutputStream(fullFilePath)) {
	        byte[] buffer = new byte[1024];
	        int length;
	        while ((length = input.read(buffer)) > 0) {
	            output.write(buffer, 0, length);
	        }
	    }
	    
	    System.out.println("File written: " + fullFilePath);
	    
	    // 파일이 실제로 존재하는지 확인
	    File writtenFile = new File(fullFilePath);
	    if (writtenFile.exists()) {
	        System.out.println("File exists and its size is: " + writtenFile.length() + " bytes");
	    } else {
	        System.out.println("File does not exist after writing!");
	    }
	    
	    return newFileName;
	}
    
    private String getSubmittedFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1);
            }
        }
        return null;
    }
}