package com.WCLProject.model.Service;

import java.io.IOException;
import java.util.List;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.WCLProject.model.DAO.ReservationDAO;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String[] reservationIds = request.getParameterValues("reservationId");
		for(int i = 0; i < reservationIds.length; i++) {
			System.out.println(reservationIds[i]);
		}
		
		if (reservationIds == null || reservationIds.length == 0) {
			response.getWriter().write("주문할 항목을 선택하세요.");
			return;
		}

		ReservationDAO dao = new ReservationDAO();
		List<String> selectedReservationIds = Arrays.asList(reservationIds);
		int cnt = 0;

		for (String reservation : selectedReservationIds) {
			cnt = dao.deleteReservationByItemId(reservation);
		}

		if (cnt > 0) {
			response.getWriter().write("성공적으로 삭제되었습니다.");
		} else {
			response.getWriter().write("삭제 과정에서 일부 오류가 발생했습니다.");
		}
	}
}
