package com.WCLProject.model.Service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.WCLProject.model.DAO.ReservationDAO;

@WebServlet("/OrderRemove")
public class OrderRemove extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 선택된 예약 ID 가져오기
		String[] reservationIds = request.getParameterValues("reservationIds");

		if (reservationIds != null && reservationIds.length > 0) {
			ReservationDAO reservationDAO = new ReservationDAO();

			// 각 예약 ID에 대해 삭제 처리 (String으로 직접 전달)
			for (String reservationId : reservationIds) {
				System.out.println("삭제할 예약 ID: " + reservationId);
				reservationDAO.deleteReservationById(reservationId);
			}
		} else {
			System.out.println("삭제할 예약 ID가 전달되지 않았습니다.");
		}
		// 삭제 후 주문서 페이지로 리다이렉트
		response.sendRedirect("orderSummary.jsp");
	}

	// doPost 방식도 지원할 수 있도록 추가 (GET 방식과 동일하게 처리)
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
