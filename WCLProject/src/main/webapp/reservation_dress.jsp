<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.WCLProject.model.DTO.Dress"%>
<%@ page import="com.WCLProject.model.DAO.DressDAO"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.WCLProject.model.DTO.UserMemberDTO"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>드레스 예약 페이지</title>
    <link rel="stylesheet" href="./css/mainPage_globals.css">
    <link rel="stylesheet" href="./css/mainPage_styleguide.css">
    <style>
        /* 전체적인 스타일 설정 */
        body {
            font-family: "Inter", Helvetica, sans-serif;
            background-color: #f4f4f4;
            padding: 0;
            margin: 0;
        }

        /* 컨테이너 설정, 페이지 가운데 정렬 및 패딩 */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            text-align: center;
        }

        /* 예약 폼의 스타일 설정, 박스와 그림자 효과 */
        .reservation-form {
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            margin-top: 40px;
            margin-bottom: 60px;
        }

        /* 드레스 이미지의 스타일 설정 */
        .reservation-form img {
            max-width: 60%;
            height: auto;
            border-radius: 10px;
            margin-bottom: 30px;
        }

        /* 폼 제목의 스타일 설정 */
        .reservation-form h2 {
            font-size: 2.5em;
            margin-bottom: 20px;
            color: #333;
        }

        /* 폼 그룹 스타일 설정, 레이블과 인풋 필드를 나란히 배치 */
        .form-group {
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* 레이블 스타일 설정, 우측 정렬 및 간격 조정 */
        .form-group label {
            width: 20%;
            text-align: right;
            margin-right: 10px;
            font-size: 1.2em;
            color: #555;
        }

        /* 인풋 필드 스타일 설정 */
        .form-group input {
            width: 40%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1.1em;
        }

		/* 날짜와 시간 인풋 필드의 글씨체 적용 */
        input[type="date"],
        input[type="time"] {
            font-family: "Inter", Helvetica, sans-serif; /* 글씨체 적용 */
            font-size: 1.1em; /* 글씨 크기 */
            padding: 10px; /* 인풋 필드 안쪽 여백 */
        }


        /* 버튼 그룹 스타일 설정, 버튼들 사이 간격 설정 */
        .button-group {
            display: flex;
            justify-content: center; /* 버튼을 가운데로 정렬 */
            gap: 40px; /* 버튼 간의 간격 설정 */
            margin-top: 30px;
        }

        /* 버튼 스타일 설정 */
        .button-group button {
            width: 20%; /* 버튼 너비를 조정하여 중앙에 모이게 설정 */
            padding: 12px;
            font-size: 1.2em;
            color: #000;
            background-color: #ffebeb;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <!-- 헤더를 포함하는 부분 -->
    <jsp:include page="header.jsp" />

    <!-- 메인 컨텐츠 컨테이너 -->
    <div class="container">
        <div class="reservation-form">
            <h2>드레스 예약</h2>
            <%
            // 세션에서 사용자 정보를 가져옴
            HttpSession userSession = request.getSession();
            UserMemberDTO user = (UserMemberDTO) userSession.getAttribute("userInfo");

            // 로그인된 사용자가 없으면 로그인 페이지로 리다이렉트
            if (user == null) {
                response.sendRedirect("loginPage.jsp");
                return;
            }

            // 사용자 ID 및 드레스 ID를 가져옴
            String userId = user.getId();
            String dressId = request.getParameter("dressId");

            // 드레스 정보를 가져오기 위해 DAO를 사용
            DressDAO dressDAO = new DressDAO();
            Dress dress = dressDAO.getDressById(dressId);

            // 드레스 정보를 찾을 수 없으면 오류 메시지 출력
            if (dress == null) {
                out.println("<p>잘못된 요청입니다. 드레스 정보를 찾을 수 없습니다.</p>");
                return;
            }
            %>
            <!-- 드레스 이미지 출력 -->
            <img src="<%= request.getContextPath() %>/upload/dress/<%= dress.getPhotoPath() %>" alt="Dress Image" />

            <!-- 예약 폼 시작 -->
            <form id="reservationForm" method="get" action="ReservationService">
                <!-- 회원 ID 필드 -->
                <div class="form-group">
                    <label for="user_id">회원 ID:</label>
                    <input type="text" id="user_id" name="user_id" value="<%=userId%>" readonly>
                </div>

                <!-- 아이템 ID 필드 -->
                <div class="form-group">
                    <label for="item_id">아이템 ID:</label>
                    <input type="text" id="item_id" name="item_id" value="<%=dressId%>" readonly>
                </div>

                <!-- 숨겨진 필드로 사진 경로 포함 -->
                <div class="form-group">
                    <input type="hidden" id="photo_path" name="photo_path" value="<%= dress.getPhotoPath() %>" readonly>
                </div>

                <!-- 카테고리 필드 -->
                <div class="form-group">
                    <label for="vendor_category">카테고리:</label>
                    <input type="text" id="vendor_category" name="vendor_category" value="드레스" readonly>
                </div>

                <!-- 브랜드 필드 -->
                <div class="form-group">
                    <label for="item_brand">브랜드:</label>
                    <input type="text" id="item_brand" name="item_brand" value="<%=dress.getDressBrand()%>" readonly>
                </div>

                <!-- 패브릭 필드 -->
                <div class="form-group">
                    <label for="fabric">Fabric:</label>
                    <input type="text" id="fabric" name="fabric" value="<%=dress.getDressFabric()%>" readonly>
                </div>

                <!-- 라인 필드 -->
                <div class="form-group">
                    <label for="line">Line:</label>
                    <input type="text" id="line" name="line" value="<%=dress.getDressLine()%>" readonly>
                </div>

                <!-- 스타일 필드 -->
                <div class="form-group">
                    <label for="style">Style:</label>
                    <input type="text" id="style" name="style" value="<%=dress.getDressStyle()%>" readonly>
                </div>

                <!-- 가격 필드 -->
                <div class="form-group">
                    <label for="item_price">가격:</label>
                    <input type="text" id="item_price" name="item_price" value="<%=dress.getDressPrice()%>" readonly>
                </div>

                <!-- 예약 날짜 선택 필드 -->
                <div class="form-group">
                    <label for="reservation_date">예약 날짜:</label>
                    <input type="date" id="reservation_date" name="reservation_date" required>
                </div>

                <!-- 예약 시간 선택 필드 -->
                <div class="form-group">
                    <label for="reservation_time">예약 시간:</label>
                    <input type="time" id="reservation_time" name="reservation_time" required>
                </div>

                <!-- 예약 상태 필드 (예약 대기중으로 고정) -->
                <div class="form-group">
                    <label for="reservation_state">예약 상태:</label>
                    <input type="text" id="reservation_state" name="reservation_state" value="예약대기중" readonly>
                </div>

                <!-- 예약 확인 및 취소 버튼 -->
                <div class="button-group">
                    <button type="button" class="cancel" onclick="cancelReservation()">예약취소</button>
                    <button type="submit">예약 확인</button>
                </div>
            </form>
        </div>
    </div>

    <!-- 푸터를 포함하는 부분 -->
    <jsp:include page="footer.jsp" />

    <script>
        // 예약 취소 버튼 클릭 시 이전 페이지로
