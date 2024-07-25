package com.WCLProject.model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.WCLProject.model.DTO.ReservationDTO;

public class ReservationDAO {
    // 데이터베이스 연결 정보
    private String url = "jdbc:oracle:thin:@project-db-stu3.smhrd.com:1524:xe";
    private String user = "Insa5_SpringA_hacksim_3";
    private String password = "aishcool3";

    // 데이터베이스 연결 객체
    private Connection conn = null;
    // SQL 구문 실행 객체
    private PreparedStatement pstmt = null;

    // 데이터베이스 연결 메서드
    private void connect() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(url, user, password);
            System.out.println("DB 연결 성공");
        } catch (ClassNotFoundException e) {
            System.out.println("드라이버 로드 실패");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("DB 연결 실패");
            e.printStackTrace();
        }
    }

    // 데이터베이스 연결 해제 메서드
    private void disconnect() {
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // 예약 추가 메서드
    public void addReservation(ReservationDTO reservation) throws SQLException {
        connect(); // 데이터베이스 연결
        String sql = "INSERT INTO RESERVATION (RESERVATION_ID, USER_ID, ITEM_ID, VENDOR_CATEGORY, RESERVATION_DATE, RESERVATION_STATE, ITEM_PRICE) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, reservation.getReservationId());
            pstmt.setString(2, reservation.getUserId());
            pstmt.setString(3, reservation.getItemId());
            pstmt.setString(4, reservation.getVendorCategory());
            pstmt.setString(5, reservation.getReservationDate());
            pstmt.setString(6, reservation.getReservationState());
            pstmt.setDouble(7, reservation.getItemPrice());

            int result = pstmt.executeUpdate(); // SQL 실행
            if (result > 0) {
                System.out.println("예약 추가 성공");
            } else {
                System.out.println("예약 추가 실패");
            }
        } catch (SQLException e) {
            System.out.println("예약 추가 실패");
            e.printStackTrace();
            throw e;
        } finally {
            disconnect(); // 데이터베이스 연결 해제
        }
    }
}
