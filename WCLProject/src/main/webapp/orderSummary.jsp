<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.WCLProject.model.DAO.ReservationDAO"%>
<%@ page import="com.WCLProject.model.DTO.ReservationDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문서 요약</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	padding: 20px;
}

.container {
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
}

h2 {
	text-align: center;
	margin-bottom: 30px;
}

.reservation-item {
	display: flex;
	align-items: center;
	margin-bottom: 15px;
}

.reservation-item img {
	max-width: 100px;
	height: auto;
	border-radius: 5px;
	margin-right: 20px;
}

.item-details {
	flex: 1;
}

.item-details p {
	margin: 0;
	margin-bottom: 5px;
}

.item-price {
	font-weight: bold;
}

.button-group {
	text-align: center;
	margin-top: 20px;
}

.button-group button {
	padding: 10px 20px;
	margin: 0 10px;
	background-color: #5cb85c;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.button-group button.cancel {
	background-color: #d9534f;
}

.button-group button.cancel:hover {
	background-color: #c9302c;
}

.button-group button:hover {
	background-color: #4cae4c;
}

.category-title {
	margin-top: 20px;
	font-size: 1.2em;
	font-weight: bold;
	color: #333;
}

.checkbox {
	margin-right: 10px;
}
</style>
</head>
<body>
	<div class="container">
		<h2>주문 요약</h2>
		<form id="orderForm" method="post" action="OrderRemoveServlet">
			<%
			String userId = (String) session.getAttribute("userId");
			if (userId == null) {
				response.sendRedirect("loginPage.jsp");
				return;
			}

			// 데이터베이스에서 예약 정보 가져오기
			ReservationDAO reservationDAO = new ReservationDAO();
			List<ReservationDTO> reservations = reservationDAO.getReservationsByUserId(userId);

			if (reservations == null || reservations.isEmpty()) {
				out.println("<p>예약된 항목이 없습니다.</p>");
			} else {
				// 카테고리별로 예약을 그룹화하기 위해 Map 사용
				Map<String, List<ReservationDTO>> categorizedReservations = new HashMap<>();
				for (ReservationDTO reservation : reservations) {
					String category = reservation.getVendorCategory();
					if (!categorizedReservations.containsKey(category)) {
				categorizedReservations.put(category, new ArrayList<>());
					}
					categorizedReservations.get(category).add(reservation);
				}

				// 카테고리별로 예약 정보 출력
				for (Map.Entry<String, List<ReservationDTO>> entry : categorizedReservations.entrySet()) {
					String category = entry.getKey();
					List<ReservationDTO> categoryReservations = entry.getValue();
			%>
			<div class="category-title"><%=category%></div>
			<%
			for (ReservationDTO reservation : categoryReservations) {
				// 카테고리에 따라 이미지 경로를 동적으로 설정
				String imagePath = "";
				if ("드레스".equals(category)) {
					imagePath = "dress";
				} else if ("스튜디오".equals(category)) {
					imagePath = "studio";
				} else if ("웨딩홀".equals(category)) {
					imagePath = "weddinghall";
				} else if ("메이크업".equals(category)) {
					imagePath = "makeup";
				}
				String photoPath = reservation.getPhotoPath();
			%>
			<div class="reservation-item">
				<input type="checkbox" class="checkbox" name="reservationIds"
					value="<%=reservation.getReservationId()%>"> <img
					src="<%=request.getContextPath()%>/upload/<%=imagePath%>/<%=photoPath%>"
					alt="Item Image">
				<div class="item-details">
					<p>
						<strong>아이템 ID:</strong>
						<%=reservation.getItemId()%></p>
					<p>
						<strong>카테고리:</strong>
						<%=reservation.getVendorCategory()%></p>
					<p>
						<strong>예약 날짜:</strong>
						<%=reservation.getReservationDate()%></p>
					<p>
						<strong>가격:</strong> <span class="item-price"><%=reservation.getItemPrice()%>원</span>
					</p>
				</div>
			</div>
			<%
			}
			}
			}
			%>
			<div class="button-group">
				<button type="submit" class="cancel">선택 삭제</button>
				<button type="button" onclick="window.location.href='payment.jsp'">결제하기</button>
			</div>
		</form>
	</div>
</body>
</html>
