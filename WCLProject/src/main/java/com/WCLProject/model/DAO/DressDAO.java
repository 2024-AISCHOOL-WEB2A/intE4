package com.WCLProject.model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.WCLProject.model.DTO.Dress;

public class DressDAO {
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;

	// 페이징(페이지 단위로 드레스 목록을 가져오는 메서드)
	public List<Dress> getDresses(int page, int pageSize) {
		List<Dress> dresses = new ArrayList<>();
		// page : 현재 페이지 번호, pageSize : 한 페이지에 표시할 개수
		int startRow = (page - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;

		try {
			conn = DBUtil.getConnection();
			// 내부 서브쿼리 : 컬럼 선택하여 DRESS_ID로 정렬(컬럼을 하나만 빼도 출력이 안되는 오류가 발생했음)
			// 중간 서브쿼리 ROWNUM 각 행의 고유 번호를 매김
			String sql = "SELECT * FROM (SELECT DRESS.*, ROWNUM AS RNUM FROM (SELECT DRESS_ID, DRESS_BRAND, DRESS_FABRIC, DRESS_LINE, DRESS_STYLE, DRESS_PRICE, DRESS_CONTENT, DRESS_DATE, VENDOR_ID, PHOTO_PATH, DRESS_TITLE FROM DRESS ORDER BY DRESS_ID) DRESS WHERE ROWNUM <= ?) WHERE RNUM >= ?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, endRow);
			pst.setInt(2, startRow);
			rs = pst.executeQuery();

			// 불필요한 부분은 수정 예정
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
			DBUtil.closeConnection(rs, pst, conn);
		}

		return dresses;
	}
	
	// 페이징
	// 드레스의 총 개수를 가져오는 메서드
	public int getDressCount() {
		int count = 0;

		try {
			conn = DBUtil.getConnection();
			String sql = "SELECT COUNT(*) FROM DRESS";
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConnection(rs, pst, conn);
		}

		return count;
	}

	// 특정 ID의 드레스를 가져오는 메서드
	// 드레스 ID로 드레스 상세정보 페이지를 출력하기 위해 사용 
	public Dress getDressById(String dressId) {
		Dress dress = null;
		String sql = "SELECT * FROM DRESS WHERE DRESS_ID = ?";

		try {
			conn = DBUtil.getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, dressId);
			rs = pst.executeQuery();
			// 불필요한 부분은 수정 예정
			if (rs.next()) {
				dress = new Dress();
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
			}

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConnection(rs, pst, conn);
		}

		return dress;
	}
	
	// 특정 브랜드의 드레스를 가져오는 메서드
	// 상세페이지에서 해당 브랜드가 가지고 있는 드레스들을 모두 출력하기 위해 사용
	public List<Dress> getDressesByBrand(String brand) {
		List<Dress> dresses = new ArrayList<>();
		String sql = "SELECT * FROM DRESS WHERE DRESS_BRAND = ?";

		try {
			conn = DBUtil.getConnection();
			pst = conn.prepareStatement(sql);

			pst.setString(1, brand);
			rs = pst.executeQuery();

			while (rs.next()) {
				Dress dress = new Dress();
				dress.setDressId(rs.getString("DRESS_ID"));
				dress.setDressBrand(rs.getString("DRESS_BRAND"));
				dress.setPhotoPath(rs.getString("PHOTO_PATH"));
				dresses.add(dress);

			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return dresses;
	}
}