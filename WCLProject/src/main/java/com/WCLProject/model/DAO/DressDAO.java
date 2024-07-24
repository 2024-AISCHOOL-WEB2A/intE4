package com.WCLProject.model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.WCLProject.model.DTO.Dress;

public class DressDAO {

    public List<Dress> getDresses(int page, int pageSize) {
        List<Dress> dresses = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int startRow = (page - 1) * pageSize + 1;
        int endRow = startRow + pageSize - 1;

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT * FROM (SELECT DRESS.*, ROWNUM AS RNUM FROM (SELECT DRESS_ID, DRESS_BRAND, DRESS_FABRIC, DRESS_LINE, DRESS_STYLE, DRESS_PRICE, DRESS_CONTENT, DRESS_DATE, VENDOR_ID, PHOTO_PATH, DRESS_TITLE FROM DRESS ORDER BY DRESS_ID) DRESS WHERE ROWNUM <= ?) WHERE RNUM >= ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, endRow);
            pstmt.setInt(2, startRow);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Dress dress = new Dress();
                dress.setDressId(rs.getString("DRESS_ID"));
                dress.setDressBrand(rs.getString("DRESS_BRAND"));
                dress.setDressFabric(rs.getString("DRESS_FABRIC"));
                dress.setDressLine(rs.getString("DRESS_LINE"));
                dress.setDressStyle(rs.getString("DRESS_STYLE"));
                dress.setDressPrice(rs.getString("DRESS_PRICE"));
                dress.setDressContent(rs.getString("DRESS_CONTENT"));
                dress.setDressDate(rs.getTimestamp("DRESS_DATE"));
                dress.setVendorId(rs.getString("VENDOR_ID"));
                dress.setPhotoPath(rs.getString("PHOTO_PATH"));
                dress.setDressTitle(rs.getString("DRESS_TITLE"));
                dresses.add(dress);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(conn);
        }

        return dresses;
    }

    public int getDressCount() {
        int count = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT COUNT(*) FROM DRESS";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(conn);
        }

        return count;
    }
}
