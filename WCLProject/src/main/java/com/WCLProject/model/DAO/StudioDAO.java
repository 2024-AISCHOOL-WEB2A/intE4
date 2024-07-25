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
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
    
    private static final Logger logger = Logger.getLogger(StudioDAO.class.getName());

    // 각 VENDOR_ID별로 첫 번째 대표 이미지를 가져오는 메서드
    public List<Studio> getStudiosByVendor(int page, int pageSize) {
        List<Studio> studios = new ArrayList<>();


        int startRow = (page - 1) * pageSize + 1;
        int endRow = startRow + pageSize - 1;

        try {
            conn = DBUtil.getConnection();
            // A : STUDIO 테이블의 별칭, B : 서브쿼리의 결과에 대한 별칭
            String sql = "SELECT * FROM (SELECT A.*, ROWNUM AS RNUM FROM (SELECT VENDOR_ID, MIN(STUDIO_ID) AS MIN_ID FROM STUDIO GROUP BY VENDOR_ID) B JOIN STUDIO A ON A.STUDIO_ID = B.MIN_ID WHERE ROWNUM <= ?) WHERE RNUM >= ?";
            pst = conn.prepareStatement(sql);
            pst.setInt(1, endRow);
            pst.setInt(2, startRow);
            rs = pst.executeQuery();

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
                studio.setStudioTitle(rs.getString("STUDIO_TITLE"));
                studios.add(studio);
            }
        } catch (SQLException | ClassNotFoundException e) {
            logger.severe("Error fetching studios by vendor: " + e.getMessage());
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(rs, pst, conn);
        }

        logger.info("Fetched " + studios.size() + " studios by vendor");

        return studios;
    }

    // 전체 스튜디오 개수를 반환하는 메서드
    public int getTotalStudioCount() {
        int count = 0;

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT COUNT(DISTINCT VENDOR_ID) FROM STUDIO";
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException | ClassNotFoundException e) {
            logger.severe("Error fetching total studio count: " + e.getMessage());
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(rs, pst, conn);
        }

        logger.info("Total studio count: " + count);

        return count;
    }
    
    // 특정 ID의 스튜디오 가져오기
    public Studio getStudioById(String studioId) {
        Studio studio = null;
        String sql = "SELECT * FROM STUDIO WHERE STUDIO_ID = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pst.setString(1, studioId);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    studio = new Studio();
                    studio.setStudioId(rs.getString("STUDIO_ID"));
                    studio.setStudioBrand(rs.getString("STUDIO_BRAND"));
                    studio.setStudioConcept(rs.getString("STUDIO_CONCEPT"));
                    studio.setStudioPrice(rs.getString("STUDIO_PRICE"));
                    studio.setStudioContent(rs.getString("STUDIO_CONTENT"));
                    studio.setStudioDate(rs.getTimestamp("STUDIO_DATE"));
                    studio.setVendorId(rs.getString("VENDOR_ID"));
                    studio.setPhotoPath(rs.getString("PHOTO_PATH"));
                    studio.setStudioTitle(rs.getString("STUDIO_TITLE"));
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return studio;
    }

    // 특정 브랜드의 스튜디오 목록 가져오기
    public List<Studio> getStudiosByBrand(String brand) {
        List<Studio> studios = new ArrayList<>();
        String sql = "SELECT * FROM STUDIO WHERE STUDIO_BRAND = ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            
            pst.setString(1, brand);
            try (ResultSet rs = pst.executeQuery()) {
                while (rs.next()) {
                    Studio studio = new Studio();
                    studio.setStudioId(rs.getString("STUDIO_ID"));
                    studio.setStudioBrand(rs.getString("STUDIO_BRAND"));
                    studio.setPhotoPath(rs.getString("PHOTO_PATH"));
                    // 필요한 다른 필드들도 설정
                    studios.add(studio);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return studios;
    }
}