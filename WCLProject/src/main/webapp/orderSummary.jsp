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
    <title>주문</title>
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
        .button-group button.delete {
            background-color: #d9534f;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>주문</h2>
        <%
            HttpSession userSession = request.getSession();
            String userId = (String) userSession.getAttribute("userId");
            if (userId == null) {
                response.sendRedirect("loginPage.jsp");
                return;
            }
            ReservationDAO reservationDAO = new ReservationDAO();
            List<ReservationDTO> reservations = reservationDAO.getReservationsByUserId(userId);

            if (reservations.isEmpty()) {
                out.println("<p>예약된 항목이 없습니다.</p>");
            } else {
                Map<String, List<ReservationDTO>> categorizedReservations = new HashMap<>();
                for (ReservationDTO reservation : reservations) {
                    String category = reservation.getVendorCategory();
                    if (!categorizedReservations.containsKey(category)) {
                        categorizedReservations.put(category, new ArrayList<ReservationDTO>());
                    }
                    categorizedReservations.get(category).add(reservation);
                }
        %>
        <form id="orderForm" method="get" action="OrderServlet" accept-charset="UTF-8">
            <%
                for (Map.Entry<String, List<ReservationDTO>> entry : categorizedReservations.entrySet()) {
                    String category = entry.getKey();
                    List<ReservationDTO> categoryItems = entry.getValue();
            %>
            <div class="category">
                <h3><%= category %></h3>
                <%
                    for (ReservationDTO item : categoryItems) {
                %>
                <div class="item">
                    <input type="checkbox" class="item-checkbox" name="reservationId" value="<%= item.getReservationId() %>" data-price="<%= item.getItemPrice() %>">
                    <img src="./upload/dress/<%= item.getPhotoPath() %>" alt="<%= item.getItemId() %>">
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
                총 가격: <span id="totalPrice">0</span>원
            </div>
            <div class="button-group">
                <button type="button" onclick="submitOrder()">주문하기</button>
                <button type="button" class="cancel" onclick="cancelOrder()">취소</button>
                <button type="button" class="delete" onclick="deleteSelected()">삭제</button>
            </div>
        </form>
        <%
            }
        %>
    </div>

    <script>
        document.querySelectorAll('.item-checkbox').forEach(function(checkbox) {
            checkbox.addEventListener('change', function() {
                updateTotalPrice();
            });
        });

        // 가격 토탈
        function updateTotalPrice() {
            let totalPrice = 0;
            document.querySelectorAll('.item-checkbox:checked').forEach(function(checkbox) {
                totalPrice += parseFloat(checkbox.getAttribute('data-price'));
            });
            document.getElementById('totalPrice').textContent = totalPrice.toLocaleString();
        }

        // 주문 전송
        function submitOrder() {
            const form = document.getElementById('orderForm');
            const formData = new FormData(form);
            fetch('OrderServlet', {
                method: 'POST',
                body: formData
            })
            .then(response => response.text())
            .then(data => {
                alert("주문성공: " + data);
                window.location.href = 'orderSummary.jsp';
            })
            .catch(error => {
                alert("주문실패: " + error);
            });
        }

        // 주문 취소
        function cancelOrder() {
            alert("주문이 취소되었습니다.");
            // 실제 주문 취소 처리를 구현합니다.
        }

        
        // 선택 상품 삭제
        function deleteSelected() {
            const selectedItems = [];
            document.querySelectorAll('.item-checkbox:checked').forEach(function(checkbox) {
                selectedItems.push(checkbox.value);
            });
            if (selectedItems.length === 0) {
                alert("삭제할 항목을 선택하세요.");
                return;
            }

            const formData = new FormData();
            selectedItems.forEach(item => formData.append('itemIds', item));

            fetch('OrderServlet', {
                method: 'POST',
                body: formData
            })
            .then(response => response.text())
            .then(data => {
                alert("삭제성공: " + data);
                selectedItems.forEach(itemId => {
                    const checkbox = document.querySelector(`input[value="${itemId}"]`);
                    const itemDiv = checkbox.closest('.item');
                    itemDiv.remove();
                });
                updateTotalPrice();
            })
            .catch(error => {
                alert("삭제실패: " + error);
            });
        }
    </script>
</body>
</html>
