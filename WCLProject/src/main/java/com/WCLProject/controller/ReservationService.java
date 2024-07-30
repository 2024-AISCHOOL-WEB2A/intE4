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
        // 클라이언트로부터 전달된 파라미터 값 가져오기
        String userId = request.getParameter("user_id");
        String itemId = request.getParameter("item_id");
        String vendorCategory = request.getParameter("vendor_category");
        String reservationDate = request.getParameter("reservation_date") + " " + request.getParameter("reservation_time");
        String reservationState = request.getParameter("reservation_state");
        String itemPriceStr = request.getParameter("item_price");
        String reservationId = java.util.UUID.randomUUID().toString();
        String photoPath = request.getParameter("photo_path");

        int itemPrice = Integer.parseInt(itemPriceStr);
        
        // vendorCategory가 null인지 확인
        if (vendorCategory == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Vendor category is required.");
            return;
        }

        // DAO 인스턴스 생성
        ReservationDAO dao = new ReservationDAO();        
        ReservationDTO reservation = new ReservationDTO(userId, itemId, vendorCategory, reservationDate, reservationState, itemPrice, reservationId, photoPath);

        
      
    }
}
