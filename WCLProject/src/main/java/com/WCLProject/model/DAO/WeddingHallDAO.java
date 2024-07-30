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
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	
    private static final Logger logger = Logger.getLogger(WeddingHallDAO.class.getName());

    // VENDOR_ID별로 첫 번째 대표 이미지를 가져오는 메서드
    public List<WeddingHall> getWeddingHallsByVendor(int page, int pageSize) {
        List<WeddingHall> weddingHalls = new ArrayList<>();
        
        // page : 현재 페이지 번호, pageSize : 한 페이지에 표시할 개수
        int startRow = (page - 1) * pageSize + 1;
        int endRow = startRow + pageSize - 1;

        try {
            conn = DBUtil.getConnection();
            // VENDOR_ID 별로 첫 번째 대표 이미지를 가져오기 + 페이징 쿼리문
            // 수정 시 오류 발생하여 시간이 남으면 좀 더 쉽게 수정 예정
            String sql = "SELECT * FROM (SELECT A.*, ROWNUM AS RNUM FROM (SELECT VENDOR_ID, MIN(WEDDING_HALL_ID) AS MIN_ID FROM WEDDING_HALL GROUP BY VENDOR_ID) B JOIN WEDDING_HALL A ON A.WEDDING_HALL_ID = B.MIN_ID WHERE ROWNUM <= ?) WHERE RNUM >= ?";
            pst = conn.prepareStatement(sql);
            pst.setInt(1, endRow);
            pst.setInt(2, startRow);
            rs = pst.executeQuery();

            while (rs.next()) {
            	// 불필요한 부분은 수정 예정
                WeddingHall weddingHall = new WeddingHall();
                weddingHall.setWeddingHallId(rs.getString("WEDDING_HALL_ID"));
                weddingHall.setWeddingHallBrand(rs.getString("WEDDING_HALL_BRAND"));
                weddingHall.setWeddingHallMealCost(rs.getInt("WEDDING_HALL_MEAL_COST"));
                weddingHall.setWeddingHallAssurance(rs.getString("WEDDING_HALL_ASSURANCE"));
                weddingHall.setWeddingHallType(rs.getString("WEDDING_HALL_TYPE"));
                weddingHall.setWeddingHallPrice(rs.getInt("WEDDING_HALL_PRICE"));
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
            DBUtil.closeConnection(rs, pst, conn);
        }

        logger.info("Fetched " + weddingHalls.size() + " wedding halls by vendor");

        return weddingHalls;
    }

    // 페이징
    // 웨딩홀의 총 개수를 가져오는 메서드
    public int getTotalWeddingHallCount() {
        int count = 0;

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT COUNT(DISTINCT VENDOR_ID) FROM WEDDING_HALL";
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException | ClassNotFoundException e) {
            logger.severe("Error fetching total wedding hall count: " + e.getMessage());
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(rs, pst, conn);
        }

        logger.info("Total wedding hall count: " + count);

        return count;
    }
    
    // 특정 ID의 웨딩홀을 가져오는 메서드
   	// 웨딩홀 ID로 스튜디오 상세정보 페이지를 출력하기 위해 사용 
    public WeddingHall getWeddingHallById(String weddingHallId) {
        WeddingHall weddingHall = null;
        String sql = "SELECT * FROM WEDDING_HALL WHERE WEDDING_HALL_ID = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {

            pst.setString(1, weddingHallId);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                	// 불필요한 부분은 수정 예정
                    weddingHall = new WeddingHall();
                    weddingHall.setWeddingHallId(rs.getString("WEDDING_HALL_ID"));
                    weddingHall.setWeddingHallBrand(rs.getString("WEDDING_HALL_BRAND"));
                    weddingHall.setWeddingHallMealCost(rs.getInt("WEDDING_HALL_MEAL_COST"));
                    weddingHall.setWeddingHallAssurance(rs.getString("WEDDING_HALL_ASSURANCE"));
                    weddingHall.setWeddingHallType(rs.getString("WEDDING_HALL_TYPE"));
                    weddingHall.setWeddingHallPrice(rs.getInt("WEDDING_HALL_PRICE"));
                    weddingHall.setWeddingHallContent(rs.getString("WEDDING_HALL_CONTENT"));
                    weddingHall.setWeddingHallDate(rs.getTimestamp("WEDDING_HALL_DATE"));
                    weddingHall.setVendorId(rs.getString("VENDOR_ID"));
                    weddingHall.setPhotoPath(rs.getString("PHOTO_PATH"));
                    weddingHall.setWeddingHallTitle(rs.getString("WEDDING_HALL_TITLE"));
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            logger.severe("Error fetching wedding hall by ID: " + e.getMessage());
            e.printStackTrace();
        }

        return weddingHall;
    }

    // 특정 브랜드의 웨딩홀을 가져오는 메서드
   	// 상세페이지에서 해당 브랜드가 가지고 있는 웨딩홀을 모두 출력하기 위해 사용
    public List<WeddingHall> getWeddingHallsByBrand(String brand) {
        List<WeddingHall> weddingHalls = new ArrayList<>();
        String sql = "SELECT * FROM WEDDING_HALL WHERE WEDDING_HALL_BRAND = ?";
        
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pst = conn.prepareStatement(sql)) {
            
            pst.setString(1, brand);
            try (ResultSet rs = pst.executeQuery()) {
                while (rs.next()) {
                    WeddingHall weddingHall = new WeddingHall();
                    weddingHall.setWeddingHallId(rs.getString("WEDDING_HALL_ID"));
                    weddingHall.setWeddingHallBrand(rs.getString("WEDDING_HALL_BRAND"));
                    weddingHall.setPhotoPath(rs.getString("PHOTO_PATH"));
                    weddingHalls.add(weddingHall);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            logger.severe("Error fetching wedding halls by brand: " + e.getMessage());
            e.printStackTrace();
        }
        return weddingHalls;
    }
    
    // 웨딩홀 상품 ID 생성
	public String generateWeddingHallId() {
		String id = null;
		
		String sql = "SELECT 'WEDDING_HALL' || LPAD(wedding_hall_seq.NEXTVAL, 5, '0') AS new_wedding_hall_id FROM dual";
		try {
			conn = DBUtil.getConnection();
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();

			if (rs.next()) {
	            id = rs.getString("new_wedding_hall_id");
	            System.out.println("Generated ID: " + id);
	        } else {
	            System.out.println("No ID returned from query.");
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

	// 웨딩홀 상품 조회
	public ArrayList<WeddingHall> getProductWeddingHall(String id) {
		ArrayList<WeddingHall> weddingHalls = new ArrayList<WeddingHall>();
		
		String sql = "";
		
		try {
			conn = DBUtil.getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery();

			while (rs.next()) {
				WeddingHall weddingHall = new WeddingHall();
				weddingHall.setPhotoPath(rs.getString("PHOTO_PATH"));
				weddingHall.setWeddingHallBrand(rs.getString("WEDDING_HALL_BRAND"));
				weddingHall.setWeddingHallType(rs.getString("WEDDING_HALL_TYPE"));
				weddingHall.setWeddingHallPrice(rs.getInt("WEDDING_HALL_PRICE"));
				weddingHall.setWeddingHallMealCost(rs.getInt("WEDDING_HALL_MEAL_COST"));
				weddingHall.setWeddingHallAssurance(rs.getString("WEDDING_HALL_ASSURANCE"));
				weddingHall.setWeddingHallContent(rs.getString("WEDDING_HALL_CONTENT"));
				weddingHall.setWeddingHallDate(rs.getTimestamp("WEDDING_HALL_DATE"));
				weddingHall.setWeddingHallId(rs.getString("WEDDING_HALL_ID"));
				weddingHalls.add(weddingHall);
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

		return weddingHalls;
	}
}
