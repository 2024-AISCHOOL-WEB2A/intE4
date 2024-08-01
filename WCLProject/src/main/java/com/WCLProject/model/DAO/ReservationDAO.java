package com.WCLProject.model.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.WCLProject.model.DTO.ReservationDTO;

public class ReservationDAO {
    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;

    // 예약 추가 메서드
    public void addReservation(ReservationDTO reservation) {
        String sql = "INSERT INTO reservation (reservation_id, user_id, item_id, vendor_category, reservation_date, reservation_state, item_price, photo_path, item_brand) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, reservation.getReservationId());
            pstmt.setString(2, reservation.getUserId());
            pstmt.setString(3, reservation.getItemId());
            pstmt.setString(4, reservation.getVendorCategory());
            pstmt.setString(5, reservation.getReservationDate());
            pstmt.setString(6, reservation.getReservationState());
            pstmt.setInt(7, reservation.getItemPrice());
            pstmt.setString(8, reservation.getPhotoPath());
            pstmt.setString(9, reservation.getItemBrand()); // Set itemBrand

            pstmt.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            // 예외 발생 시 사용자에게 메시지를 전달하거나 로그를 남길 수 있습니다.
        }
    }

    // 특정 사용자의 예약을 가져오는 메서드
    public ArrayList<ReservationDTO> getReservationsByUserId(String userId) {
        ArrayList<ReservationDTO> reservations = new ArrayList<>();
        String sql = "SELECT * FROM reservation WHERE user_id = ?";

        try (Connection conn = DBUtil.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, userId);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    ReservationDTO reservation = new ReservationDTO();
                    reservation.setReservationId(rs.getString("reservation_id"));
                    reservation.setUserId(rs.getString("user_id"));
                    reservation.setItemId(rs.getString("item_id"));
                    reservation.setVendorCategory(rs.getString("vendor_category"));
                    reservation.setReservationDate(rs.getString("reservation_date"));
                    reservation.setReservationState(rs.getString("reservation_state"));
                    reservation.setItemPrice(rs.getInt("item_price"));
                    reservation.setPhotoPath(rs.getString("photo_path"));
                    reservation.setItemBrand(rs.getString("item_brand")); // Retrieve itemBrand
                    reservations.add(reservation);
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            // 예외 발생 시 사용자에게 메시지를 전달하거나 로그를 남길 수 있습니다.
        }

        return reservations;
    }

    // 특정 예약 ID로 예약 삭제 메서드
    public int deleteReservationById(String reservationId) {
        int cnt = 0;
        try {
            // 데이터베이스 연결
            conn = DBUtil.getConnection();
            // SQL 문 작성
            String sql = "DELETE FROM reservation WHERE reservation_id = ?";
            pstmt = conn.prepareStatement(sql);
            // SQL 문에 예약 ID를 바인딩
            pstmt.setString(1, reservationId);
            // SQL 실행 및 삭제된 행의 수 반환
            cnt = pstmt.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            // 예외 발생 시 스택 트레이스 출력
            e.printStackTrace();
        } finally {
            // 리소스 닫기
            DBUtil.closeConnection(rs, pstmt, conn);
        }
        return cnt;
    }
}
