package com.WCLProject.model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import com.WCLProject.model.DTO.WeddingHall;

public class WeddingHallDAO {
    private static final Logger logger = Logger.getLogger(WeddingHallDAO.class.getName());

    // 각 VENDOR_ID별로 첫 번째 대표 이미지를 가져오는 메서드
    public List<WeddingHall> getWeddingHallsByVendor(int page, int pageSize) {
        List<WeddingHall> weddingHalls = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int startRow = (page - 1) * pageSize + 1;
        int endRow = startRow + pageSize - 1;

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT * FROM (SELECT A.*, ROWNUM AS RNUM FROM (SELECT VENDOR_ID, MIN(WEDDING_HALL_ID) AS MIN_ID FROM WEDDING_HALL GROUP BY VENDOR_ID) B JOIN WEDDING_HALL A ON A.WEDDING_HALL_ID = B.MIN_ID WHERE ROWNUM <= ?) WHERE RNUM >= ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, endRow);
            pstmt.setInt(2, startRow);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                WeddingHall weddingHall = new WeddingHall();
                weddingHall.setWeddingHallId(rs.getString("WEDDING_HALL_ID"));
                weddingHall.setWeddingHallBrand(rs.getString("WEDDING_HALL_BRAND"));
                weddingHall.setWeddingHallMealCost(rs.getString("WEDDING_HALL_MEAL_COST"));
                weddingHall.setWeddingHallAssurance(rs.getString("WEDDING_HALL_ASSURANCE"));
                weddingHall.setWeddingHallType(rs.getString("WEDDING_HALL_TYPE"));
                weddingHall.setWeddingHallPrice(rs.getString("WEDDING_HALL_PRICE"));
                weddingHall.setWeddingHallContent(rs.getString("WEDDING_HALL_CONTENT"));
                weddingHall.setWeddingHallDate(rs.getTimestamp("WEDDING_HALL_DATE"));
                weddingHall.setVendorId(rs.getString("VENDOR_ID"));
                weddingHall.setPhotoPath(rs.getString("PHOTO_PATH"));
                weddingHall.setWeddingHallTitle(rs.getString("WEDDING_HALL_TITLE"));
                weddingHalls.add(weddingHall);
            }
        } catch (SQLException | ClassNotFoundException e) {
            logger.severe("Error fetching wedding halls by vendor: " + e.getMessage());
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(conn);
        }

        logger.info("Fetched " + weddingHalls.size() + " wedding halls by vendor");

        return weddingHalls;
    }

    // 전체 웨딩홀 개수를 반환하는 메서드
    public int getTotalWeddingHallCount() {
        int count = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT COUNT(DISTINCT VENDOR_ID) FROM WEDDING_HALL";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException | ClassNotFoundException e) {
            logger.severe("Error fetching total wedding hall count: " + e.getMessage());
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(conn);
        }

        logger.info("Total wedding hall count: " + count);

        return count;
    }
}
