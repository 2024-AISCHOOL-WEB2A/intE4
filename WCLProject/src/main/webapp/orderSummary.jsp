<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주문서</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .order-summary {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            margin-bottom: 20px;
        }
        .order-summary h2 {
            margin-bottom: 20px;
        }
        .order-detail {
            margin-bottom: 15px;
        }
        .order-detail label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .order-detail span {
            display: block;
            margin-bottom: 10px;
        }
        .button-group {
            display: flex;
            justify-content: space-between;
        }
        .button-group button {
            padding: 10px 20px;
            background-color: #5cb85c;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .button-group button:hover {
            background-color: #4cae4c;
        }
    </style>
</head>
<body>
    <div class="order-summary">
        <h2>주문서</h2>
        <%
            // 세션에서 예약 정보를 가져오기
            String userId = (String) session.getAttribute("userId");
            String itemId = request.getParameter("item_id");
            String itemBrand = request.getParameter("item_brand");
            String fabric = request.getParameter("fabric");
            String line = request.getParameter("line");
            String style = request.getParameter("style");
            String itemPrice = request.getParameter("item_price");
            String reservationDate = request.getParameter("reservation_date");
            String reservationTime = request.getParameter("reservation_time");
            String reservationState = "예약대기중";
        %>
        <div class="order-detail">
            <label>회원 ID:</label>
            <span><%= userId %></span>
        </div>
        <div class="order-detail">
            <label>아이템 ID:</label>
            <span><%= itemId %></span>
        </div>
        <div class="order-detail">
            <label>카테고리:</label>
            <span><%= request.getParameter("category") %></span>
        </div>
        <div class="order-detail">
            <label>브랜드:</label>
            <span><%= itemBrand %></span>
        </div>
        <div class="order-detail">
            <label>Fabric:</label>
            <span><%= fabric %></span>
        </div>
        <div class="order-detail">
            <label>Line:</label>
            <span><%= line %></span>
        </div>
        <div class="order-detail">
            <label>Style:</label>
            <span><%= style %></span>
        </div>
        <div class="order-detail">
            <label>가격:</label>
            <span><%= itemPrice %></span>
        </div>
        <div class="order-detail">
            <label>예약 날짜:</label>
            <span><%= reservationDate %></span>
        </div>
        <div class="order-detail">
            <label>예약 시간:</label>
            <span><%= reservationTime %></span>
        </div>
        <div class="order-detail">
            <label>예약 상태:</label>
            <span><%= reservationState %></span>
        </div>
        <div class="button-group">
            <button onclick="window.history.back();">수정하기</button>
            <button onclick="window.location.href='confirmOrder.jsp';">확인하기</button>
        </div>
    </div>
</body>
</html>
