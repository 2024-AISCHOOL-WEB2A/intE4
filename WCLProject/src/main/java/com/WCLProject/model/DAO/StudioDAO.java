package com.WCLProject.model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import com.WCLProject.model.DTO.Dress;
import com.WCLProject.model.DTO.Studio;

public class StudioDAO {
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
    
    private static final Logger logger = Logger.getLogger(StudioDAO.class.getName());

    // VENDOR_ID별로 첫 번째 대표 이미지를 가져오는 메서드
    public List<Studio> getStudiosByVendor(int page, int pageSize) {
        List<Studio> studios = new ArrayList<>();

     // page : 현재 페이지 번호, pageSize : 한 페이지에 표시할 개수
        int startRow = (page - 1) * pageSize + 1;
        int endRow = startRow + pageSize - 1;

        try {
            conn = DBUtil.getConnection();
            // VENDOR_ID 별로 첫 번째 대표 이미지를 가져오기 + 페이징 쿼리문
            // 수정 시 오류 발생하여 시간이 남으면 좀 더 쉽게 수정 예정
            // A : STUDIO 테이블의 별칭, B : 서브쿼리의 결과에 대한 별칭
            String sql = "SELECT * FROM (SELECT A.*, ROWNUM AS RNUM FROM (SELECT VENDOR_ID, MIN(STUDIO_ID) AS MIN_ID FROM STUDIO GROUP BY VENDOR_ID) B JOIN STUDIO A ON A.STUDIO_ID = B.MIN_ID WHERE ROWNUM <= ?) WHERE RNUM >= ?";
            pst = conn.prepareStatement(sql);
            pst.setInt(1, endRow);
            pst.setInt(2, startRow);
            rs = pst.executeQuery();

            while (rs.next()) {
            	// 불필요한 부분은 수정 예정
                Studio studio = new Studio();
                studio.setStudioId(rs.getString("STUDIO_ID"));
                studio.setStudioBrand(rs.getString("STUDIO_BRAND"));
                studio.setStudioConcept(rs.getString("STUDIO_CONCEPT"));
                studio.setStudioPrice(rs.getInt("STUDIO_PRICE"));
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

    // 페이징
    // 스튜디오의 총 개수를 가져오는 메서드
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
    
    // 특정 ID의 스튜디오를 가져오는 메서드
  	// 스튜디오 ID로 스튜디오 상세정보 페이지를 출력하기 위해 사용 
    public Studio getStudioById(String studioId) {
        Studio studio = null;
        String sql = "SELECT * FROM STUDIO WHERE STUDIO_ID = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {

            pst.setString(1, studioId);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                	// 불필요한 부분은 수정 예정
                    studio = new Studio();
                    studio.setStudioId(rs.getString("STUDIO_ID"));
                    studio.setStudioBrand(rs.getString("STUDIO_BRAND"));
                    studio.setStudioConcept(rs.getString("STUDIO_CONCEPT"));
                    studio.setStudioPrice(rs.getInt("STUDIO_PRICE"));
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

    // 특정 브랜드의 스튜디오를 가져오는 메서드
  	// 상세페이지에서 해당 브랜드가 가지고 있는 스튜디오를 모두 출력하기 위해 사용
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
                    studios.add(studio);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return studios;
    }

    // 스튜디오 상품 조회
	public ArrayList<Studio> getProductStudio(String id) {
		ArrayList<Studio> studios = new ArrayList<Studio>();
		
		String sql ="SELECT PHOTO_PATH, STUDIO_CONCEPT, STUDIO_PRICE, STUDIO_TITLE, STUDIO_CONTENT, STUDIO_DATE, STUDIO_ID FROM STUDIO WHERE VENDOR_ID = ?";
		
		try {
			conn = DBUtil.getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery();

			while (rs.next()) {
				Studio studio = new Studio();
				studio.setPhotoPath(rs.getString("PHOTO_PATH"));
				studio.setStudioConcept(rs.getString("STUDIO_CONCEPT"));
				studio.setStudioPrice(rs.getInt("STUDIO_PRICE"));
				studio.setStudioTitle(rs.getString("STUDIO_TITLE"));
				studio.setStudioContent(rs.getString("STUDIO_CONTENT"));
				studio.setStudioDate(rs.getTimestamp("STUDIO_DATE"));
				studio.setStudioId(rs.getString("STUDIO_ID"));
				studios.add(studio);
			}
		} catch (SQLException e) {
			System.err.println("SQL Error: " + e.getMessage());
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			System.err.println("Class Not Found Error: " + e.getMessage());
			e.printStackTrace();
		} finally {
			DBUtil.closeConnection(rs, pst, conn);
		}
		
		
		
		return studios;
	}

	// 스튜디오 상품 ID 생성
	public String generateStudioId() {
		String id = null;
		/*
		 * String sql =
		 * "SELECT COALESCE('STUDIO' || LPAD(NVL(MAX(TO_NUMBER(SUBSTR(STUDIO_ID, 6))) + 1, 1), 5, '0'), 'STUDIO00001') AS STUDIO_ID FROM STUDIO WHERE REGEXP_LIKE(SUBSTR(STUDIO_ID, 6), '^[0-9]+$')"
		 * ;
		 */
		
		String sql = "WITH max_id AS (" +
                "    SELECT MAX(TO_NUMBER(SUBSTR(STUDIO_ID, 6))) AS max_number" +
                "    FROM STUDIO" +
                "    WHERE REGEXP_LIKE(SUBSTR(STUDIO_ID, 6), '^[0-9]+$')" +
                "), new_id AS (" +
                "    SELECT COALESCE('STUDIO' || LPAD(NVL(max_id.max_number, 0) + 1, 5, '0'), 'STUDIO00001') AS new_studio_id" +
                "    FROM max_id" +
                ") " +
                "SELECT new_studio_id " +
                "FROM new_id " +
                "WHERE NOT EXISTS (" +
                "    SELECT 1 " +
                "    FROM STUDIO " +
                "    WHERE STUDIO_ID = new_id.new_studio_id" +
                ")";
		try {
			conn = DBUtil.getConnection();
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();

			if (rs.next()) {
				id = rs.getString("STUDIO_ID");
				System.out.println("Generated ID: " + id);
			} else {
				System.out.println("No data returned from query.");
			}
		} catch (SQLException e) {
			System.err.println("SQL Error: " + e.getMessage());
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			System.err.println("Class Not Found Error: " + e.getMessage());
			e.printStackTrace();
		} finally {
			DBUtil.closeConnection(rs, pst, conn);
		}

		return id;
	}

	// 스튜디오 상품 등록
	public int addStudio(Studio studio) {
		int cnt = 0;
		String sql = "INSERT INTO STUDIO(STUDIO_ID, STUDIO_CONCEPT, STUDIO_PRICE, STUDIO_CONTENT, STUDIO_DATE, VENDOR_ID, PHOTO_PATH, STUDIO_BRAND, STUDIO_TITLE) VALUES(?,?,?,?,?,?,?,?,?)"; 
			
		try {
			conn = DBUtil.getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, studio.getStudioId());
			pst.setString(2, studio.getStudioConcept());
			pst.setInt(3, studio.getStudioPrice());
			pst.setString(4, studio.getStudioContent());
			pst.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
			pst.setString(6, studio.getVendorId());
			pst.setString(7, studio.getPhotoPath());
			pst.setString(8, studio.getStudioBrand());
			pst.setString(9, studio.getStudioTitle());

			cnt = pst.executeUpdate();

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConnection(rs, pst, conn);
		}

		return cnt;
	}
}