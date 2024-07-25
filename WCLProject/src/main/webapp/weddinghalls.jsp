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
    <div class="weddinghall-container">
        <%
            int currentPage = 1;
            int pageSize = 8;

            String pageParam = request.getParameter("page");
            if (pageParam != null && pageParam.matches("\\d+")) { // 숫자 형식인지 확인
                currentPage = Integer.parseInt(pageParam);
            }

            WeddingHallDAO weddingHallDAO = new WeddingHallDAO();
            List<WeddingHall> weddingHalls = weddingHallDAO.getWeddingHallsByVendor(currentPage, pageSize);
            int totalWeddingHalls = weddingHallDAO.getTotalWeddingHallCount();
            int totalPages = (int) Math.ceil((double) totalWeddingHalls / pageSize);
        %>
        
        <%
            for (int i = 0; i < weddingHalls.size(); i++) {
                WeddingHall weddingHall = weddingHalls.get(i);
        %>
        <div class="weddinghall-item">
            <a href="<%= request.getContextPath() %>/weddingHallDetail.jsp?id=<%= weddingHall.getWeddingHallId() %>">
            	<img src="<%= request.getContextPath() %>/upload/weddinghall/<%= weddingHall.getPhotoPath() %>" alt="<%= weddingHall.getWeddingHallBrand() %>">
            </a>
            <h3><%= weddingHall.getWeddingHallBrand() %></h3>
            <p><%= weddingHall.getWeddingHallType() %></p>
            <p><%= weddingHall.getWeddingHallContent() %></p>
        </div>
        <% } %>
    </div>
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
