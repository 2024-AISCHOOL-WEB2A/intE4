<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.WCLProject.model.DAO.WeddingHallDAO" %>
<%@ page import="com.WCLProject.model.DTO.WeddingHall" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Wedding Halls Platform</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }
        .weddinghall-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            padding: 0 150px;
        }
        .weddinghall-item {
            width: 22%;
            margin: 15px;
            text-align: center;
        }
        .weddinghall-item img {
            width: 100%;
            height: auto;
        }
        .pagination {
            text-align: center;
            margin-top: 20px;
        }
        .pagination a {
            margin: 0 5px;
            text-decoration: none;
            color: #333;
        }
        .pagination strong {
            margin: 0 5px;
            color: #333;
        }
    </style>
</head>
<body>
    <h1>WEDDING HALLS</h1>
    	<!-- 페이징 기능 -->
    	<div class="weddinghall-container">
        <%
            int currentPage = 1; // 현재 페이지
            int pageSize = 8; // 페이지당 데이터 개수 설정
            
			//
            String pageParam = request.getParameter("page");
            if (pageParam != null && pageParam.matches("\\d+")) { 
                currentPage = Integer.parseInt(pageParam);
            }
			
         	// 데이터베이스에서 전체 웨딩홀 개수 가져오기
            WeddingHallDAO weddingHallDAO = new WeddingHallDAO();
            List<WeddingHall> weddingHalls = weddingHallDAO.getWeddingHallsByVendor(currentPage, pageSize);
            int totalWeddingHalls = weddingHallDAO.getTotalWeddingHallCount();
            int totalPages = (int) Math.ceil((double) totalWeddingHalls / pageSize);
         	// 전체 스튜디오 수를 pageSize로 나누고 올림 처리하기
        %>
        
        <!-- 화면 출력 기능 -->
        <%
            for (int i = 0; i < weddingHalls.size(); i++) {
                WeddingHall weddingHall = weddingHalls.get(i);
        %>
        <div class="weddinghall-item">
            <a href="<%= request.getContextPath() %>/weddinghallDetail.jsp?id=<%= weddingHall.getWeddingHallId() %>">
            	<img src="<%= request.getContextPath() %>/upload/weddinghall/<%= weddingHall.getPhotoPath() %>" alt="<%= weddingHall.getWeddingHallBrand() %>">
            </a>
            <h3><%= weddingHall.getWeddingHallBrand() %></h3>
            <p><%= weddingHall.getWeddingHallType() %></p>
            <p><%= weddingHall.getWeddingHallContent() %></p>
        </div>
        <% } %>
    </div>
    <!-- 페이징 기능(페이지 이동) -->
    <div class="pagination">
        <%
            for (int i = 1; i <= totalPages; i++) {
                if (i == currentPage) {
        %>
        <strong><%= i %></strong>
        <%
                } else {
        %>
        <a href="?page=<%= i %>"><%= i %></a>
        <%
                }
            }
        %>
    </div>
</body>
</html>