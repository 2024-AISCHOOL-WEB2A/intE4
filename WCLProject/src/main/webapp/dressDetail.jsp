<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.WCLProject.model.DAO.DressDAO" %>
<%@ page import="com.WCLProject.model.DTO.Dress" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Wedding Dress Detail</title>
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
        .dress-detail {
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
        .dress-info {
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
        <h1>Wedding Choise</h1>
        <%
            String dressId = request.getParameter("id");
            DressDAO dressDAO = new DressDAO();
            // 특정 드레스 ID로 드레스 정보 가져오기
            Dress dress = dressDAO.getDressById(dressId);
            // 같은 브랜드의 다른 드레스를 목록으로 가져오기
            List<Dress> brandDresses = dressDAO.getDressesByBrand(dress.getDressBrand());
        %>
        <!-- 드레스 상세 정보 출력 -->
        <div class="dress-detail">
            <div class="main-image">
                <img src="<%= request.getContextPath() %>/upload/dress/<%= dress.getPhotoPath() %>" alt="<%= dress.getDressBrand() %>">
            </div>
            <div class="dress-info">
                <h2><%= dress.getDressBrand() %></h2>
                <p><strong>Fabric:</strong> <%= dress.getDressFabric() %></p>
                <p><strong>Line:</strong> <%= dress.getDressLine() %></p>
                <p><strong>Style:</strong> <%= dress.getDressStyle() %></p>
                <p><strong>Price:</strong> <%= dress.getDressPrice() %></p>
                <p><strong>Description:</strong> <%= dress.getDressContent() %></p>
                <p><strong>Date:</strong> <%= dress.getDressDate() %></p>
            </div>
        </div>
 		<!-- 같은 브랜드의 다른 드레스 이미지 출력 -->
        <h2>More dresses from <%= dress.getDressBrand() %></h2>
        <div class="thumbnail-images">
            <% for(Dress brandDress : brandDresses) { %>
                <img src="<%= request.getContextPath() %>/upload/dress/<%= brandDress.getPhotoPath() %>" 
                     alt="<%= brandDress.getDressBrand() %>"
                     onclick="location.href='<%= request.getContextPath() %>/dressDetail.jsp?id=<%= brandDress.getId() %>'">
            <% } %>
        </div>
    </div>
</body>
</html>