package com.WCLProject.model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductDAO {
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;

	public int deleteProduct(String productId) {
		int cnt = 0;
		String sql = "";
		// 상품 ID의 접두사에 따라 SQL 문을 달리 작성
		if (productId.startsWith("DRESS")) {
			sql = "DELETE FROM DRESS WHERE DRESS_ID = ?";
		} else if (productId.startsWith("STUDIO")) {
			sql = "DELETE FROM STUDIO WHERE STUDIO_ID = ?";
		} else if (productId.startsWith("MAKEUP")) {
			sql = "DELETE FROM MAKEUP WHERE MAKEUP_ID = ?";
		} else if (productId.startsWith("WEDDING_HALL")) {
			sql = "DELETE FROM WEDDING_HALL WHERE WEDDING_HALL_ID = ?";
		} else {
			throw new IllegalArgumentException("Unknown product type: " + productId);
		}
		System.out.println("Executing SQL: " + sql);
		try {
			conn = DBUtil.getConnection();
			pst = conn.prepareStatement(sql);
			pst.setString(1, productId);
			
			cnt = pst.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConnection(rs, pst, conn);
		}
		
		return cnt;
	}

}
