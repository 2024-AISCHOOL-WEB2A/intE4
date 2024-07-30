package com.WCLProject.model.Service;

import com.WCLProject.model.DAO.DBUtil;
import com.WCLProject.model.DTO.ReservationDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/OrderService")
public class OrderService extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 한글 인코딩 설정
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId");

        //DAO - DB
        List<ReservationDTO> reservations = new ArrayList<>();
        Connection conn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            String sql = "SELECT * FROM reservations WHERE user_id = ?";
            pst = conn.prepareStatement(sql);
            pst.setString(1, userId);
            rs = pst.executeQuery();

            while (rs.next()) {
                ReservationDTO reservation = new ReservationDTO();
                reservation.setReservationId(rs.getString("reservation_id"));
                reservation.setUserId(rs.getString("user_id"));
                reservation.setItemId(rs.getString("item_id"));
                reservation.setVendorCategory(rs.getString("vendor_category"));
                reservation.setReservationDate(rs.getString("reservation_date"));
                reservation.setReservationState(rs.getString("reservation_state"));
                reservation.setItemPrice(rs.getInt("item_price"));
                reservations.add(reservation);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DBUtil.closeConnection(rs, pst, conn);
        }

        session.setAttribute("reservations", reservations);
        response.sendRedirect("orderSummary.jsp");
    }
}
