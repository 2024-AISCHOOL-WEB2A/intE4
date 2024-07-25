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
            <img src="path/to/item_image.jpg" alt="Item Image" class="item-image"/>
            <form action="ReservationService" method="post">
                <div class="form-group">
                    <label for="user_id">회원 ID:</label>
                    <input type="text" id="user_id" name="user_id" required>
                </div>
                <div class="form-group">
                    <label for="item_id">아이템 ID:</label>
                    <input type="text" id="item_id" name="item_id" required>
                </div>
                <div class="form-group">
                    <label for="vendor_category">카테고리:</label>
                    <select id="vendor_category" name="vendor_category" required>
                        <option value="Dress">드레스</option>
                        <option value="Makeup">메이크업</option>
                        <option value="Studio">스튜디오</option>
                        <option value="WeddingHall">웨딩홀</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="reservation_date">예약 날짜:</label>
                    <input type="date" id="reservation_date" name="reservation_date" required>
                </div>
                <div class="form-group">
                    <label for="reservation_time">예약 시간:</label>
                    <input type="time" id="reservation_time" name="reservation_time" required>
                </div>
                <div class="form-group">
                    <label for="reservation_state">예약 상태:</label>
                    <input type="text" id="reservation_state" name="reservation_state" value="예약대기중" readonly>
                </div>
                <div class="form-group">
                    <label for="item_price">가격:</label>
                    <input type="number" step="0.01" id="item_price" name="item_price" required>
                </div>
                <div class="form-group">
                    <button type="submit">예약</button>
                </div>
            </form>
        </div>
        <button onclick="window.location.href='orderSummary.jsp';">주문서로 이동</button>
    </div>
</body>
</html>
