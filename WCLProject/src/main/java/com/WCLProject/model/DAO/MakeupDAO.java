package com.WCLProject.model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import com.WCLProject.model.DTO.Makeup;

public class MakeupDAO {
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	
    private static final Logger logger = Logger.getLogger(MakeupDAO.class.getName());

    // 각 VENDOR_ID별로 첫 번째 대표 이미지를 가져오는 메서드
    public List<Makeup> getMakeupsByVendor(int page, int pageSize) {
        List<Makeup> makeups = new ArrayList<>();

        int startRow = (page - 1) * pageSize + 1;
        int endRow = startRow + pageSize - 1;

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT * FROM (SELECT A.*, ROWNUM AS RNUM FROM (SELECT VENDOR_ID, MIN(MAKEUP_ID) AS MIN_ID FROM MAKEUP GROUP BY VENDOR_ID) B JOIN MAKEUP A ON A.MAKEUP_ID = B.MIN_ID WHERE ROWNUM <= ?) WHERE RNUM >= ?";
            pst = conn.prepareStatement(sql);
            pst.setInt(1, endRow);
            pst.setInt(2, startRow);
            rs = pst.executeQuery();

            while (rs.next()) {
                Makeup makeup = new Makeup();
                makeup.setMakeupId(rs.getString("MAKEUP_ID"));
                makeup.setMakeupBrand(rs.getString("MAKEUP_BRAND"));
                makeup.setMakeupConcept(rs.getString("MAKEUP_CONCEPT"));
                makeup.setMakeupPrice(rs.getString("MAKEUP_PRICE"));
                makeup.setMakeupContent(rs.getString("MAKEUP_CONTENT"));
                makeup.setMakeupDate(rs.getTimestamp("MAKEUP_DATE"));
                makeup.setVendorId(rs.getString("VENDOR_ID"));
                makeup.setPhotoPath(rs.getString("PHOTO_PATH"));
                makeup.setMakeupTitle(rs.getString("MAKEUP_TITLE"));
                makeups.add(makeup);
            }
        } catch (SQLException | ClassNotFoundException e) {
            logger.severe("Error fetching makeups by vendor: " + e.getMessage());
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(rs, pst, conn);
        }

        logger.info("Fetched " + makeups.size() + " makeups by vendor");

        return makeups;
    }

    // 전체 메이크업 개수를 반환하는 메서드
    public int getTotalMakeupCount() {
        int count = 0;

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT COUNT(DISTINCT VENDOR_ID) FROM MAKEUP";
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException | ClassNotFoundException e) {
            logger.severe("Error fetching total makeup count: " + e.getMessage());
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(rs, pst, conn);
        }

        logger.info("Total makeup count: " + count);

        return count;
    }
    
    // 특정 ID의 메이크업 가져오기
    public Makeup getMakeupById(String makeupId) {
        Makeup makeup = null;
        String sql = "SELECT * FROM MAKEUP WHERE MAKEUP_ID = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {

            pst.setString(1, makeupId);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    makeup = new Makeup();
                    makeup.setMakeupId(rs.getString("MAKEUP_ID"));
                    makeup.setMakeupBrand(rs.getString("MAKEUP_BRAND"));
                    makeup.setMakeupConcept(rs.getString("MAKEUP_CONCEPT"));
                    makeup.setMakeupPrice(rs.getString("MAKEUP_PRICE"));
                    makeup.setMakeupContent(rs.getString("MAKEUP_CONTENT"));
                    makeup.setMakeupDate(rs.getTimestamp("MAKEUP_DATE"));
                    makeup.setVendorId(rs.getString("VENDOR_ID"));
                    makeup.setPhotoPath(rs.getString("PHOTO_PATH"));
                    makeup.setMakeupTitle(rs.getString("MAKEUP_TITLE"));
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            logger.severe("Error fetching makeup by ID: " + e.getMessage());
            e.printStackTrace();
        }

        return makeup;
    }

    // 특정 브랜드의 메이크업 목록 가져오기
    public List<Makeup> getMakeupsByBrand(String brand) {
        List<Makeup> makeups = new ArrayList<>();
        String sql = "SELECT * FROM MAKEUP WHERE MAKEUP_BRAND = ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            
            pst.setString(1, brand);
            try (ResultSet rs = pst.executeQuery()) {
                while (rs.next()) {
                    Makeup makeup = new Makeup();
                    makeup.setMakeupId(rs.getString("MAKEUP_ID"));
                    makeup.setMakeupBrand(rs.getString("MAKEUP_BRAND"));
                    makeup.setPhotoPath(rs.getString("PHOTO_PATH"));
                    // 필요한 다른 필드들도 설정
                    makeups.add(makeup);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            logger.severe("Error fetching makeups by brand: " + e.getMessage());
            e.printStackTrace();
        }
        return makeups;
    }
}
