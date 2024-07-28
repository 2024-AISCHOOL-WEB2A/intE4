<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .reservation-form {
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 300px;
        margin-bottom: 20px;
    }
    .reservation-form h2 {
        margin-bottom: 20px;
    }
    .form-group {
        margin-bottom: 15px;
    }
    .form-group label {
        display: block;
        margin-bottom: 5px;
    }
    .form-group input, .form-group select {
        width: 100%;
        padding: 8px;
        box-sizing: border-box;
    }
    .form-group button {
        width: 100%;
        padding: 10px;
        background-color: #5cb85c;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    .form-group button:hover {
        background-color: #4cae4c;
    }
    .item-image {
        max-width: 100%;
        height: auto;
        border-radius: 5px;
        margin-bottom: 20px;
    }
</style>
</head>
<body>
    <div class="container">
        <div class="reservation-form">
            <h2>예약</h2>
            <%
                // 세션에서 회원 ID 가져오기
                HttpSession userSession = request.getSession();
                String userId = (String) userSession.getAttribute("userId");
                
                // 전달된 파라미터 값 가져오기
                String itemId = request.getParameter("item_id");
                String itemBrand = request.getParameter("item_brand");                      
                String fabric = request.getParameter("fabric");
                String line = request.getParameter("line");
                String style = request.getParameter("style");
                String itemPrice = request.getParameter("item_price");
                String itemContent = request.getParameter("item_content");
                String photoPath = request.getParameter("photo_path");
                String category = request.getParameter("category");
            %>
            <img src="<%= request.getContextPath() %>/upload/dress/<%= photoPath %>" alt="Item Image" class="item-image"/>
            <!-- 예약 폼 시작 -->
            <form action="ReservationService" method="get">
                <!-- 회원 ID 입력 필드 -->
                <div class="form-group">
                    <label for="user_id">회원 ID:</label>
                    <input type="text" id="user_id" name="user_id" value="<%= userId %>" readonly>
                </div>
                <!-- 아이템 ID 입력 필드 -->
                <div class="form-group">
                    <label for="item_id">아이템 ID:</label>
                    <input type="text" id="item_id" name="item_id" value="<%= itemId %>" readonly>
                </div>
                <!-- 카테고리 선택 필드 -->
                <div class="form-group">
                    <label for="vendor_category">카테고리:</label>
                    <input type="text" id="vendor_category" name="vendor_category" value="<%= category %>" readonly>
                </div>
                <!-- 브랜드 입력 필드 -->
                <div class="form-group">
                    <label for="item_brand">브랜드:</label>
                    <input type="text" id="item_brand" name="item_brand" value="<%= itemBrand %>" readonly>
                </div>
                <!-- Fabric 입력 필드 -->
                <div class="form-group">
                    <label for="fabric">Fabric:</label>
                    <input type="text" id="fabric" name="fabric" value="<%= fabric %>" readonly>
                </div>
                <!-- Line 입력 필드 -->
                <div class="form-group">
                    <label for="line">Line:</label>
                    <input type="text" id="line" name="line" value="<%= line %>" readonly>
                </div>
                <!-- Style 입력 필드 -->
                <div class="form-group">
                    <label for="style">Style:</label>
                    <input type="text" id="style" name="style" value="<%= style %>" readonly>
                </div>
                <!-- 가격 입력 필드 -->
                <div class="form-group">
                    <label for="item_price">가격:</label>
                    <input type="text" id="item_price" name="item_price" value="<%= itemPrice %>" readonly>
                </div>
                <!-- 예약 날짜 입력 필드 -->
                <div class="form-group">
                    <label for="reservation_date">예약 날짜:</label>
                    <input type="date" id="reservation_date" name="reservation_date" required>
                </div>
                <!-- 예약 시간 입력 필드 -->
                <div class="form-group">
                    <label for="reservation_time">예약 시간:</label>
                    <input type="time" id="reservation_time" name="reservation_time" required>
                </div>
                <!-- 예약 상태 입력 필드 (읽기 전용) -->
                <div class="form-group">
                    <label for="reservation_state">예약 상태:</label>
                    <input type="text" id="reservation_state" name="reservation_state" value="예약대기중" readonly>
                </div>
                <!-- 예약 버튼 -->
                <div class="form-group">
                    <button type="submit">예약</button>
                </div>
            </form>
        </div>
        <!-- 주문서로 이동 버튼 -->
        <button onclick="window.location.href='orderSummary.jsp';">주문서로 이동</button>
    </div>
</body>
</html>
