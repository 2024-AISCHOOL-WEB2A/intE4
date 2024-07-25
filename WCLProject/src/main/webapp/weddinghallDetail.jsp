<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.WCLProject.model.DAO.WeddingHallDAO" %>
<%@ page import="com.WCLProject.model.DTO.WeddingHall" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Wedding Hall Detail</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .wedding-hall-detail {
            display: flex;
            justify-content: space-between;
        }
        .main-image {
            width: 60%;
        }
        .main-image img {
            width: 100%;
            height: auto;
        }
        .wedding-hall-info {
            width: 35%;
        }
        .thumbnail-images {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-top: 20px;
        }
        .thumbnail-images img {
            width: 100px;
            height: 150px;
            object-fit: cover;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Wedding Hall Choice</h1>
        <%
            String weddingHallId = request.getParameter("id");
            WeddingHallDAO weddingHallDAO = new WeddingHallDAO();
         	// 특정 웨딩홀 ID로 웨딩홀 정보 가져오기
            WeddingHall weddingHall = weddingHallDAO.getWeddingHallById(weddingHallId);
         	// 같은 브랜드의 다른 웨딩홀을 목록으로 가져오기
            List<WeddingHall> brandWeddingHalls = weddingHallDAO.getWeddingHallsByBrand(weddingHall.getWeddingHallBrand());
        %>
        <!-- 웨딩홀 상세 정보 출력 -->
        <div class="wedding-hall-detail">
            <div class="main-image">
                <img src="<%= request.getContextPath() %>/upload/weddinghall/<%= weddingHall.getPhotoPath() %>" alt="<%= weddingHall.getWeddingHallBrand() %>">
            </div>
            <div class="wedding-hall-info">
                <h2><%= weddingHall.getWeddingHallBrand() %></h2>
                <p><strong>Meal Cost:</strong> <%= weddingHall.getWeddingHallMealCost() %></p>
                <p><strong>Assurance:</strong> <%= weddingHall.getWeddingHallAssurance() %></p>
                <p><strong>Type:</strong> <%= weddingHall.getWeddingHallType() %></p>
                <p><strong>Price:</strong> <%= weddingHall.getWeddingHallPrice() %></p>
                <p><strong>Description:</strong> <%= weddingHall.getWeddingHallContent() %></p>
                <p><strong>Date:</strong> <%= weddingHall.getWeddingHallDate() %></p>
            </div>
        </div>
        <!-- 같은 브랜드의 다른 웨딩홀 이미지 출력 -->
        <h2>More wedding halls from <%= weddingHall.getWeddingHallBrand() %></h2>
        <div class="thumbnail-images">
            <% for(WeddingHall brandWeddingHall : brandWeddingHalls) { %>
                <img src="<%= request.getContextPath() %>/upload/weddinghall/<%= brandWeddingHall.getPhotoPath() %>" 
                     alt="<%= brandWeddingHall.getWeddingHallBrand() %>"
                     onclick="location.href='<%= request.getContextPath() %>/weddingHallDetail.jsp?id=<%= brandWeddingHall.getWeddingHallId() %>'">
            <% } %>
        </div>
    </div>
</body>
</html>