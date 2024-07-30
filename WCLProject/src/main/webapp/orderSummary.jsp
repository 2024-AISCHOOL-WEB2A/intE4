<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.WCLProject.model.DAO.ReservationDAO" %>
<%@ page import="com.WCLProject.model.DTO.ReservationDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Summary</title>
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
        .category {
            margin-bottom: 40px;
        }
        .category h3 {
            margin-bottom: 20px;
        }
        .item {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }
        .item img {
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
        .total-price {
            text-align: right;
            font-size: 1.5em;
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
    </style>
</head>
<body>
    <div class="container">
        <h2>Order Summary</h2>
        <%
            HttpSession userSession = request.getSession();
            String userId = (String) session.getAttribute("userId");
            if (userId == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            ReservationDAO reservationDAO = new ReservationDAO();
            List<ReservationDTO> reservations = reservationDAO.getReservationsByUserId(userId);

            Map<String, List<ReservationDTO>> categorizedReservations = new HashMap<>();
            for (ReservationDTO reservation : reservations) {
                String category = reservation.getVendorCategory();
                if (!categorizedReservations.containsKey(category)) {
                    categorizedReservations.put(category, new ArrayList<ReservationDTO>());
                }
                categorizedReservations.get(category).add(reservation);
            }

            double totalPrice = 0;
            for (Map.Entry<String, List<ReservationDTO>> entry : categorizedReservations.entrySet()) {
                String category = entry.getKey();
                List<ReservationDTO> categoryItems = entry.getValue();
        %>
        <div class="category">
            <h3><%= category %></h3>
            <%
                for (ReservationDTO item : categoryItems) {
                    totalPrice += item.getItemPrice();
            %>
            <div class="item">
                <img src="<%= request.getContextPath() %>/upload/dress/<%= item.getPhotoPath() %>" alt="<%= item.getItemId() %>">
                <div class="item-details">
                    <p><strong>Item ID:</strong> <%= item.getItemId() %></p>
                    <p><strong>Reservation Date:</strong> <%= item.getReservationDate() %></p>
                    <p><strong>Price:</strong> <span class="item-price"><%= item.getItemPrice() %>원</span></p>
                </div>
            </div>
            <%
                }
            %>
        </div>
        <%
            }
        %>
        <div class="total-price">
            총 가격: <%= totalPrice %>원
        </div>
        <div class="button-group">
            <button type="button" onclick="placeOrder()">주문</button>
            <button type="button" class="cancel" onclick="cancelOrder()">취소</button>
        </div>
    </div>

    <script>
        function placeOrder() {
            alert("Order placed successfully!");
            // 실제 주문 처리를 구현합니다.
        }

        function cancelOrder() {
            alert("Order canceled.");
            // 실제 주문 취소 처리를 구현합니다.
        }
    </script>
</body>
</html>
