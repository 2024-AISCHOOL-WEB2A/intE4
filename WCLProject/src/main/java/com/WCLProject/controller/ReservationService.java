package com.WCLProject.controller;

import java.io.IOException;
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

@WebServlet("/ReservationService")
public class ReservationService extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // DAO 인스턴스 생성
        ReservationDAO reservationDAO = new ReservationDAO();

        // 클라이언트로부터 전달된 파라미터 값 가져오기
        String userId = request.getParameter("user_id");
        String itemId = request.getParameter("item_id");
        String vendorCategory = request.getParameter("vendor_category");
        String reservationDate = request.getParameter("reservation_date") + " " + request.getParameter("reservation_time");
        String reservationState = request.getParameter("reservation_state");
        int itemPrice = Integer.parseInt(request.getParameter("item_price"));
        String reservationId = java.util.UUID.randomUUID().toString();
        String photoPath = request.getParameter("photo_path");
        String itemBrand = request.getParameter("item_brand"); 

        // 예약 객체 생성 및 설정
        ReservationDTO reservation = new ReservationDTO(userId, itemId, vendorCategory, reservationDate, reservationState, itemPrice, reservationId, photoPath, itemBrand);

        try {
            // 데이터베이스에 저장
            reservationDAO.addReservation(reservation);

            // 세션에 예약 정보 저장
            HttpSession session = request.getSession();
            List<ReservationDTO> reservations = (List<ReservationDTO>) session.getAttribute("reservations");
            if (reservations == null) {
                reservations = new ArrayList<>();
            }
            reservations.add(reservation);
            session.setAttribute("reservations", reservations);

            // 디버깅용 로그 메시지
            System.out.println("예약이 성공적으로 추가되었습니다. 세션에 저장된 예약 목록: " + reservations);

            request.setAttribute("reservation", reservation);
            RequestDispatcher dispatcher = request.getRequestDispatcher("orderSummary.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "예약 처리 중 오류가 발생했습니다.");
        }
    }
}
