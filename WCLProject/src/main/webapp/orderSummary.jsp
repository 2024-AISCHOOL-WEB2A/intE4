<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.WCLProject.model.DTO.ReservationDTO" %>
<%@ page import="com.WCLProject.model.DTO.Dress" %>
<%@ page import="com.WCLProject.model.DTO.Makeup" %>
<%@ page import="com.WCLProject.model.DTO.Studio" %>
<%@ page import="com.WCLProject.model.DTO.WeddingHall" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Summary</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .summary-table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 18px;
            text-align: left;
        }
        .summary-table th, .summary-table td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }
        .summary-table th {
            background-color: #f2f2f2;
        }
        .summary-table img {
            max-width: 100px;
            height: auto;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Order Summary</h2>
        <table class="summary-table">
            <tr>
                <th>Image</th>
                <th>Details</th>
                <th>Price</th>
                <th>Date</th>
                <th>State</th>
            </tr>
            <%
                // 중복 변수 선언 문제 해결
                HttpSession currentSession = request.getSession();
                List<ReservationDTO> reservations = (List<ReservationDTO>) currentSession.getAttribute("reservations");
                if (reservations != null) {
                    for (ReservationDTO reservation : reservations) {
                        String itemImage = "";
                        String itemDetails = "";
                        switch (reservation.getVendorCategory()) {
                            case "드레스":
                                Dress dress = reservation.getDress();
                                itemImage = dress.getPhotoPath();
                                itemDetails = dress.getDressBrand() + "<br>" + dress.getDressStyle();
                                break;
                            case "메이크업":
                                Makeup makeup = reservation.getMakeup();
                                itemImage = makeup.getPhotoPath();
                                itemDetails = makeup.getMakeupBrand() + "<br>" + makeup.getMakeupStyle();
                                break;
                            case "스튜디오":
                                Studio studio = reservation.getStudio();
                                itemImage = studio.getPhotoPath();
                                itemDetails = studio.getStudioName() + "<br>" + studio.getStudioLocation();
                                break;
                            case "웨딩홀":
                                WeddingHall weddingHall = reservation.getWeddingHall();
                                itemImage = weddingHall.getPhotoPath();
                                itemDetails = weddingHall.getWeddingHallBrand() + "<br>" + weddingHall.getWeddingHallType();
                                break;
                        }
            %>
            <tr>
                <td><img src="<%= itemImage %>" alt="Item Image"></td>
                <td><%= itemDetails %></td>
                <td><%= reservation.getItemPrice() %></td>
                <td><%= reservation.getReservationDate() %></td>
                <td><%= reservation.getReservationState() %></td>
            </tr>
            <%
                    }
                }
            %>
        </table>
    </div>
</body>
</html>
