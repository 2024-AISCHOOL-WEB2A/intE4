<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.WCLProject.model.DAO.StudioDAO" %>
<%@ page import="com.WCLProject.model.DTO.Studio" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.WCLProject.model.DTO.UserMemberDTO"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>스튜디오 예약 페이지</title>
    <link rel="stylesheet" href="./css/mainPage_globals.css">
    <link rel="stylesheet" href="./css/mainPage_styleguide.css">
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
</head>
<body>
    <div class="container">
        <div class="reservation-form">
            <h2>스튜디오 예약</h2>
            <%
            HttpSession userSession = request.getSession();
            UserMemberDTO user = (UserMemberDTO) userSession.getAttribute("userInfo");
            if (user == null) {
                response.sendRedirect("loginPage.jsp");
                return;
            }

            String category = request.getParameter("category");
            String itemId = request.getParameter("itemId");

            if (category == null || itemId == null || !"스튜디오".equals(category)) {
                out.println("<p>잘못된 요청입니다. 스튜디오 정보가 누락되었거나 잘못된 카테고리입니다.</p>");
                return;
            }

            String photoPath = "";
            String title = "";
            String brand = "";  // 브랜드 정보 저장 변수
            int price = 0;
            String imagePath = "studio";  // 스튜디오 경로 설정

            StudioDAO studioDAO = new StudioDAO();
            Studio studio = studioDAO.getStudioById(itemId);
            if (studio == null) {
                out.println("<p>잘못된 요청입니다. 스튜디오 정보를 찾을 수 없습니다.</p>");
                return;
            }
            photoPath = studio.getPhotoPath();
            title = studio.getStudioTitle();
            brand = studio.getStudioBrand();  // 브랜드 정보 가져오기
            price = studio.getStudioPrice();

            %>
            <img src="<%= request.getContextPath() %>/upload/<%= imagePath %>/<%= photoPath %>" alt="Item Image" class="item-image"/>
            <!-- 예약 폼 시작 -->
            <form id="reservationForm" method="get" action="ReservationService">
                <div class="form-group">
                    <label for="user_id">회원 ID:</label>
                    <input type="text" id="user_id" name="user_id" value="<%=user.getId()%>" readonly>
                </div>
                <div class="form-group">
                    <label for="item_id">아이템 ID:</label>
                    <input type="text" id="item_id" name="item_id" value="<%=itemId%>" readonly>
                </div>
                <div class="form-group">
                    <input type="hidden" id="photo_path" name="photo_path" value="<%= photoPath %>" readonly>
                </div>
                <div class="form-group">
                    <label for="vendor_category">카테고리:</label>
                    <input type="text" id="vendor_category" name="vendor_category" value="<%=category%>" readonly>
                </div>
                <div class="form-group">
                    <label for="item_brand">브랜드:</label>
                    <input type="text" id="item_brand" name="item_brand" value="<%= brand %>" readonly>
                </div>
                <div class="form-group">
                    <label for="item_price">가격:</label>
                    <input type="text" id="item_price" name="item_price" value="<%= price %>" readonly>
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
                <div class="button-group">
                    <button type="button" class="cancel" onclick="cancelReservation()">예약취소</button>
                    <button type="submit">예약 확인</button>
                </div>
            </form>
        </div>
    </div>
    <script>
        function cancelReservation() {
            window.history.back();
        }
    </script>
</body>
</html>
