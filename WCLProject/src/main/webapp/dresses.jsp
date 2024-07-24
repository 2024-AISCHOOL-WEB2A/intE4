<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.WCLProject.model.DAO.DressDAO" %>
<%@ page import="com.WCLProject.model.DTO.Dress" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Wedding Dress Platform</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }
        .dress-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            padding: 0 150px; /* 양쪽 여백 추가 */
        }
        .dress-item {
            width: 22%;
            margin: 15px;
            text-align: center;
        }
        .dress-item img {
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
    <h1>DRESS</h1>
    <div class="dress-container">
        <%
            int currentPage = 1;
            int pageSize = 8;

            String pageParam = request.getParameter("page");
            if (pageParam != null && pageParam.matches("\\d+")) { // 숫자 형식인지 확인
                currentPage = Integer.parseInt(pageParam);
            }

            DressDAO dressDAO = new DressDAO();
            List<Dress> dresses = dressDAO.getDresses(currentPage, pageSize);
            int totalDresses = dressDAO.getDressCount();
            int totalPages = (int) Math.ceil((double) totalDresses / pageSize);
        %>
        
		<%
		    for (int i = 0; i < dresses.size(); i++) {
		        Dress dress = dresses.get(i);
		%>
		<div class="dress-item">
		    <img src="<%= request.getContextPath() %>/upload/dress/<%= dress.getPhotoPath() %>" alt="<%= dress.getDressBrand() %>">
		    <h3><%= dress.getDressBrand() %></h3>
		    <p><%= dress.getDressContent() %></p>
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
