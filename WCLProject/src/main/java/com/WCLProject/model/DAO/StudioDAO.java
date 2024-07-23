package com.WCLProject.model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import com.WCLProject.model.DTO.Studio;

public class StudioDAO {
    private static final Logger logger = Logger.getLogger(StudioDAO.class.getName());

    // 각 VENDOR_ID별로 첫 번째 대표 이미지를 가져오는 메서드
    public List<Studio> getStudiosByVendor(int page, int pageSize) {
        List<Studio> studios = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int startRow = (page - 1) * pageSize + 1;
        int endRow = startRow + pageSize - 1;

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT * FROM (SELECT A.*, ROWNUM AS RNUM FROM (SELECT VENDOR_ID, MIN(STUDIO_ID) AS MIN_ID FROM STUDIO GROUP BY VENDOR_ID) B JOIN STUDIO A ON A.STUDIO_ID = B.MIN_ID WHERE ROWNUM <= ?) WHERE RNUM >= ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, endRow);
            pstmt.setInt(2, startRow);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Studio studio = new Studio();
                studio.setStudioId(rs.getString("STUDIO_ID"));
                studio.setStudioBrand(rs.getString("STUDIO_BRAND"));
                studio.setStudioConcept(rs.getString("STUDIO_CONCEPT"));
                studio.setStudioPrice(rs.getString("STUDIO_PRICE"));
                studio.setStudioContent(rs.getString("STUDIO_CONTENT"));
                studio.setStudioDate(rs.getTimestamp("STUDIO_DATE"));
                studio.setVendorId(rs.getString("VENDOR_ID"));
                studio.setPhotoPath(rs.getString("PHOTO_PATH"));
                studios.add(studio);
            }
        } catch (SQLException | ClassNotFoundException e) {
            logger.severe("Error fetching studios by vendor: " + e.getMessage());
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(conn);
        }

        logger.info("Fetched " + studios.size() + " studios by vendor");

        return studios;
    }

    // 전체 스튜디오 개수를 반환하는 메서드
    public int getTotalStudioCount() {
        int count = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT COUNT(DISTINCT VENDOR_ID) FROM STUDIO";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException | ClassNotFoundException e) {
            logger.severe("Error fetching total studio count: " + e.getMessage());
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(conn);
        }

        logger.info("Total studio count: " + count);

        return count;
    }
}