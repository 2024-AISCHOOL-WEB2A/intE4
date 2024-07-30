package com.WCLProject.controller;

import java.io.IOException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.WCLProject.model.DAO.ReservationDAO;
import com.WCLProject.model.DTO.ReservationDTO;
import com.WCLProject.model.DTO.Studio;
import com.WCLProject.model.DTO.Dress;
import com.WCLProject.model.DTO.Makeup;
import com.WCLProject.model.DTO.WeddingHall;

@WebServlet("/ReservationService")
public class ReservationService extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // DAO 인스턴스 생성
        ReservationDAO reservationDAO = new ReservationDAO();
        // 예약 목록을 담을 리스트 생성
        List<ReservationDTO> reservations = new ArrayList<>();

        // 클라이언트로부터 전달된 파라미터 값 가져오기
        String userId = request.getParameter("user_id");
        String itemId = request.getParameter("item_id");
        String vendorCategory = request.getParameter("vendor_category");
        String reservationDate = request.getParameter("reservation_date") + " " + request.getParameter("reservation_time");
        String reservationState = request.getParameter("reservation_state");
        double itemPrice = Double.parseDouble(request.getParameter("item_price"));
        String reservationId = java.util.UUID.randomUUID().toString();
        String photoPath = request.getParameter("photo_path");

        // vendorCategory가 null인지 확인
        if (vendorCategory == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Vendor category is required.");
            return;
        }

        // 영어로 입력된 vendor_category를 한국어로 변환 -> 이 부분 체크해보기
        switch (vendorCategory) {
            case "Dress":
                vendorCategory = "드레스";
                break;
            case "Makeup":
                vendorCategory = "메이크업";
                break;
            case "Studio":
                vendorCategory = "스튜디오";
                break;
            case "WeddingHall":
                vendorCategory = "웨딩홀";
                break;
        }

        // 예약 객체 생성 및 설정
        ReservationDTO reservation = new ReservationDTO();
        reservation.setReservationId(reservationId);
        reservation.setUserId(userId);
        reservation.setItemId(itemId);
        reservation.setVendorCategory(vendorCategory);
        reservation.setReservationDate(reservationDate);
        reservation.setReservationState(reservationState);
        reservation.setItemPrice(itemPrice);
        reservation.setPhotoPath(photoPath);

        // 예약 목록에 추가
        reservations.add(reservation);

        // 데이터베이스에 저장
        try {
            reservationDAO.addReservation(reservation);
            // 세션에 예약 정보 저장
            HttpSession session = request.getSession();
            session.setAttribute("reservations", reservations);

            // 디버깅용 로그 메시지
            System.out.println("예약이 성공적으로 추가되었습니다. 세션에 저장된 예약 목록: " + reservations);

            RequestDispatcher dispatcher = request.getRequestDispatcher("orderSummary.jsp");
            dispatcher.forward(request, response);
        } catch (SQLIntegrityConstraintViolationException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Reservation could not be processed.");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An unexpected error occurred.");
        }
    }
}
