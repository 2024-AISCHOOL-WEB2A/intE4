package com.WCLProject.model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.WCLProject.model.DTO.ReservationDTO;

public class ReservationDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// 예약 추가 메서드
	public void addReservation(ReservationDTO reservation) {
		try {
			conn = DBUtil.getConnection();
			String sql = "INSERT INTO reservations (reservation_id, user_id, item_id, vendor_category, reservation_date, reservation_state, item_price, photo_path) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reservation.getReservationId());
			pstmt.setString(2, reservation.getUserId());
			pstmt.setString(3, reservation.getItemId());
			pstmt.setString(4, reservation.getVendorCategory());
			pstmt.setString(5, reservation.getReservationDate());
			pstmt.setString(6, reservation.getReservationState());
			pstmt.setDouble(7, reservation.getItemPrice());
			pstmt.setString(8, reservation.getPhotoPath());
			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConnection(rs, pstmt, conn);
		}
	}

	// 특정 사용자의 예약을 가져오는 메서드
	public List<ReservationDTO> getReservationsByUserId(String userId) {
		ArrayList<ReservationDTO> reservations = new ArrayList<>();
		try {
			conn = DBUtil.getConnection();
			String sql = "SELECT * FROM reservations WHERE user_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ReservationDTO reservation = new ReservationDTO();
				reservation.setReservationId(rs.getString("reservation_id"));
				reservation.setUserId(rs.getString("user_id"));
				reservation.setItemId(rs.getString("item_id"));
				reservation.setVendorCategory(rs.getString("vendor_category"));
				reservation.setReservationDate(rs.getString("reservation_date"));
				reservation.setReservationState(rs.getString("reservation_state"));
				reservation.setItemPrice(rs.getInt("item_price"));
				reservation.setPhotoPath(rs.getString("photo_path")); // 디비에 없어서 이미지경로 못 불러옴. sql에 추가 try,catch
				reservations.add(reservation);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.closeConnection(rs, pstmt, conn);
		}
		return reservations;
	}

}
