package com.WCLProject.model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.WCLProject.model.DTO.VendorMemberDTO;

public class VendorDAO {
    private Connection conn;
    private PreparedStatement pst;
    private ResultSet rs;

    public void connect() {
        try {
        	 Class.forName("oracle.jdbc.driver.OracleDriver");
             String url = "jdbc:oracle:thin:@project-db-stu3.smhrd.com:1524:xe";
             String user = "Insa5_SpringA_hacksim_3";
             String password = "aishcool3";
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("DB 연결 성공!");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void close() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public VendorMemberDTO login(String id, String pw) {
        VendorMemberDTO member = null;
        connect();
        String sql = "SELECT * FROM VENDOR WHERE VENDOR_ID = ? AND VENDOR_PW = ?";
        try {
            pst = conn.prepareStatement(sql);
            pst.setString(1, id);
            pst.setString(2, pw);
            rs = pst.executeQuery();
            if (rs.next()) {
                member = new VendorMemberDTO(
                    rs.getString("VENDOR_ID"),
                    rs.getString("VENDOR_PW"),
                    rs.getString("VENDOR_NAME"),
                    rs.getString("VENDOR_TEL"),
                    rs.getString("VENDOR_EMAIL"),
                    rs.getString("VENDOR_ADDRESS"),
                    rs.getString("VENDOR_LICENSE"),
                    rs.getString("VENDOR_CATEGORY"),
                    rs.getString("VENDOR_LICENSE_IMAGE"),
                    rs.getString("VENDOR_LOGO_IMAGE"),
                    rs.getString("VENDOR_INTRO"),
                    rs.getString("VENDOR_SITE_URL")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return member;
    }

    // 회원 탈퇴 메서드 추가
    public boolean deleteVendor(String id, String pw) {
        connect();
        boolean result = false;
        String sql = "DELETE FROM VENDOR WHERE VENDOR_ID = ? AND VENDOR_PW = ?";
        try {
            pst = conn.prepareStatement(sql);
            pst.setString(1, id);
            pst.setString(2, pw);
            int count = pst.executeUpdate();
            result = (count > 0);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return result;
    }
}
