<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.WCLProject.model.DTO.ReservationDTO"%>
<%@ page import="com.WCLProject.model.DTO.Dress"%>
<%@ page import="com.WCLProject.model.DTO.Makeup"%>
<%@ page import="com.WCLProject.model.DTO.Studio"%>
<%@ page import="com.WCLProject.model.DTO.WeddingHall"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문서</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        padding: 20px;
    }
    .container {
        width: 80%;
        margin: auto;
    }
    .order-summary {
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        margin-bottom: 20px;
    }
    .order-summary h2 {
        margin-bottom: 20px;
    }
    .order-item {
        display: flex;
        margin-bottom: 15px;
    }
    .order-item img {
        max-width: 150px;
        margin-right: 20px;
    }
    .order-item div {
        flex: 1;
    }
    .order-item h3 {
        margin: 0;
    }
    .order-item p {
        margin: 5px 0;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>주문서</h1>
        <%
            @SuppressWarnings("unchecked")
            List<ReservationDTO> reservations = (List<ReservationDTO>) session.getAttribute("reservations");
            
            // 디버깅용 로그 메시지
            System.out.println("세션에서 가져온 예약 목록: " + reservations);

            if (reservations != null && !reservations.isEmpty()) {
                for (ReservationDTO reservation : reservations) {
                    String vendorCategory = reservation.getVendorCategory();
        %>
        <div class="order-summary">
            <h2>예약 정보</h2>
            <% if ("드레스".equals(vendorCategory)) {
                        Dress dress = reservation.getDress();
                        if (dress != null) { %>
            <div class="order-item">
                <img src="<%= dress.getPhotoPath() %>" alt="Dress Image">
                <div>
                    <h3><%= dress.getDressTitle() %></h3>
                    <p>라인: <%= dress.getDressLine() %></p>
                    <p>브랜드: <%= dress.getDressBrand() %></p>
                    <p>가격: <%= dress.getDressPrice() %>원</p>
                    <p>예약 날짜: <%= reservation.getReservationDate() %></p>
                </div>
            </div>
            <% } else { %>
            <p>드레스 정보가 없습니다.</p>
            <% }
               } else if ("메이크업".equals(vendorCategory)) {
                        Makeup makeup = reservation.getMakeup();
                        if (makeup != null) { %>
            <div class="order-item">
                <img src="<%= makeup.getPhotoPath() %>" alt="Makeup Image">
                <div>
                    <h3><%= makeup.getMakeupTitle() %></h3>
                    <p>컨셉: <%= makeup.getMakeupConcept() %></p>
                    <p>브랜드: <%= makeup.getMakeupBrand() %></p>
                    <p>가격: <%= makeup.getMakeupPrice() %>원</p>
                    <p>예약 날짜: <%= reservation.getReservationDate() %></p>
                </div>
            </div>
            <% } else { %>
            <p>메이크업 정보가 없습니다.</p>
            <% }
               } else if ("스튜디오".equals(vendorCategory)) {
                        Studio studio = reservation.getStudio();
                        if (studio != null) { %>
            <div class="order-item">
                <img src="<%= studio.getPhotoPath() %>" alt="Studio Image">
                <div>
                    <h3><%= studio.getStudioTitle() %></h3>
                    <p>컨셉: <%= studio.getStudioConcept() %></p>
                    <p>브랜드: <%= studio.getStudioBrand() %></p>
                    <p>가격: <%= studio.getStudioPrice() %>원</p>
                    <p>예약 날짜: <%= reservation.getReservationDate() %></p>
                </div>
            </div>
            <% } else { %>
            <p>스튜디오 정보가 없습니다.</p>
            <% }
               } else if ("웨딩홀".equals(vendorCategory)) {
                        WeddingHall weddingHall = reservation.getWeddingHall();
                        if (weddingHall != null) { %>
            <div class="order-item">
                <img src="<%= weddingHall.getPhotoPath() %>" alt="Wedding Hall Image">
                <div>
                    <h3><%= weddingHall.getWeddingHallTitle() %></h3>
                    <p>브랜드: <%= weddingHall.getWeddingHallBrand() %></p>
                    <p>가격: <%= weddingHall.getWeddingHallPrice() %>원</p>
                    <p>예약 날짜: <%= reservation.getReservationDate() %></p>
                </div>
            </div>
            <% } else { %>
            <p>웨딩홀 정보가 없습니다.</p>
            <% } } %>
        </div>
        <% } } else { %>
        <p>예약된 항목이 없습니다.</p>
        <% } %>
    </div>
</body>
</html>
