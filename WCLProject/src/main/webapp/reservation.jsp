<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.WCLProject.model.DAO.DressDAO" %>
<%@ page import="com.WCLProject.model.DTO.Dress" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>예약 페이지</title>
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
        .button-group {
            display: flex;
            justify-content: space-between;
        }
        .button-group button {
            width: 48%;
            padding: 10px;
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
        .item-image {
            max-width: 100%;
            height: auto;
            border-radius: 5px;
            margin-bottom: 20px;
        }
    </style>
    <!-- Bootstrap CSS and JS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
            <form id="reservationForm" method="get">
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
                <!-- 버튼 그룹 -->
                <div class="button-group">
                    <button type="button" class="cancel" onclick="cancelReservation()">예약 취소</button>
                    <button type="button" onclick="showConfirmModal()">예약 확인</button>
                </div>
            </form>
        </div>
    </div>

    <!-- 커스텀 알림창 -->
    <div id="confirmModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">예약 확인</h4>
                </div>
                <div class="modal-body">
                    <p>예약을 확정하시겠습니까?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" onclick="confirmReservation()">확인</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 알림 Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">WCL</h4>
                </div>
                <div class="modal-body">
                    <p>예약 날짜와 시간을 선택해주세요.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        //취소버튼 누르면 이전페이지로 이동
        function cancelReservation() {
            window.history.back();
        }

        function showConfirmModal() {
            const reservationDate = document.getElementById('reservation_date').value;
            const reservationTime = document.getElementById('reservation_time').value;

            if (!reservationDate || !reservationTime) {
                $("#myModal").modal();
                return;
            }

            $("#confirmModal").modal();
        }

        function closeConfirmModal() {
            $("#confirmModal").modal('hide');
        }

        function confirmReservation() {
            closeConfirmModal();
            const userId = document.getElementById('user_id').value;
            const itemId = document.getElementById('item_id').value;
            const category = document.getElementById('vendor_category').value;
            const itemBrand = document.getElementById('item_brand').value;
            const fabric = document.getElementById('fabric').value;
            const line = document.getElementById('line').value;
            const style = document.getElementById('style').value;
            const itemPrice = document.getElementById('item_price').value;
            const reservationDate = document.getElementById('reservation_date').value;
            const reservationTime = document.getElementById('reservation_time').value;

            const orderUrl = `orderSummary.jsp?user_id=${userId}&item_id=${itemId}&vendor_category=${category}&item_brand=${itemBrand}&fabric=${fabric}&line=${line}&style=${style}&item_price=${itemPrice}&reservation_date=${reservationDate}&reservation_time=${reservationTime}`;
            
            window.location.href = orderUrl;
        }

        window.onclick = function(event) {
            const modal = document.getElementById('confirmModal');
            if (event.target == modal) {
                closeConfirmModal();
            }
        }
    </script>
</body>
</html>
