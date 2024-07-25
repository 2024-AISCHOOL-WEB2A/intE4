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
    	<!-- 페이징 기능 -->
    	<div class="dress-container">
        <%
            int currentPage = 1; // 현재 페이지
            int pageSize = 8; // 페이지당 데이터 개수 설정

            String pageParam = request.getParameter("page");
            if (pageParam != null && pageParam.matches("\\d+")) {
                currentPage = Integer.parseInt(pageParam);
            }
            // 데이터베이스에서 전체 드레스 수 가져오기
            DressDAO dressDAO = new DressDAO();
            List<Dress> dresses = dressDAO.getDresses(currentPage, pageSize);
            int totalDresses = dressDAO.getDressCount(); // 전체 드레수의 개수
            int totalPages = (int) Math.ceil((double) totalDresses / pageSize); // 전체 페이지 수
            // 전체 드레스 수를 pageSize로 나누고 올림 처리하기
        %>
        
 		<!-- 화면 출력 기능 -->
		<%
		    for (int i = 0; i < dresses.size(); i++) {
		        Dress dress = dresses.get(i);
		%>
		<div class="dress-item">
		    <a href="<%= request.getContextPath() %>/dressDetail.jsp?id=<%= dress.getId() %>">
            	<img src="<%= request.getContextPath() %>/upload/dress/<%= dress.getPhotoPath() %>" alt="<%= dress.getDressBrand() %>">
            </a>
		    <h3><%= dress.getDressBrand() %></h3>
		    <p><%= dress.getDressContent() %></p>
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
