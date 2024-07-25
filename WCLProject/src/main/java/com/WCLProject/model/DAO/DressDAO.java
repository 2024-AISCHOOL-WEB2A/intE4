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

	public List<Dress> getDresses(int page, int pageSize) {
		List<Dress> dresses = new ArrayList<>();
		int startRow = (page - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;

		try {
			conn = DBUtil.getConnection();
			String sql = "SELECT * FROM (SELECT DRESS.*, ROWNUM AS RNUM FROM (SELECT DRESS_ID, DRESS_BRAND, DRESS_FABRIC, DRESS_LINE, DRESS_STYLE, DRESS_PRICE, DRESS_CONTENT, DRESS_DATE, VENDOR_ID, PHOTO_PATH, DRESS_TITLE FROM DRESS ORDER BY DRESS_ID) DRESS WHERE ROWNUM <= ?) WHERE RNUM >= ?";
			pst = conn.prepareStatement(sql);
			pst.setInt(1, endRow);
			pst.setInt(2, startRow);
			rs = pst.executeQuery();

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

	// 특정 ID의 드레스 가져오기
	// 특정 ID의 드레스 가져오기
	public Dress getDressById(String dressId) {
		Dress dress = null;
		String sql = "SELECT * FROM DRESS WHERE DRESS_ID = ?";

		try {
			conn = DBUtil.getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, dressId);
			rs = pst.executeQuery();
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
				dress.setDressTitle(rs.getString("DRESS_TITLE")); // 추가된 컬럼
			}

		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConnection(rs, pst, conn);
		}

		return dress;
	}

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
				// 필요한 다른 필드들도 설정
				dresses.add(dress);

			}
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return dresses;
	}
}
