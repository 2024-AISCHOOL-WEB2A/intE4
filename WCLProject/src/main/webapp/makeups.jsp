<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.WCLProject.model.DAO.MakeupDAO" %>
<%@ page import="com.WCLProject.model.DTO.Makeup" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Wedding Makeup Platform</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }
        .makeup-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            padding: 0 150px;
        }
        .makeup-item {
            width: 22%;
            margin: 15px;
            text-align: center;
        }
        .makeup-item img {
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
    <h1>MAKEUPS</h1>
    	<!-- 페이징 기능 -->
    	<div class="makeup-container">
        <%
            int currentPage = 1; // 현재 페이지
            int pageSize = 8; // 페이지당 데이터 개수 설정

            //
            String pageParam = request.getParameter("page");
            if (pageParam != null && pageParam.matches("\\d+")) { 
                currentPage = Integer.parseInt(pageParam);
            }

            // 데이터베이스에서 전체 메이크업 개수 가져오기
            MakeupDAO makeupDAO = new MakeupDAO();
            List<Makeup> makeups = makeupDAO.getMakeupsByVendor(currentPage, pageSize);
            int totalMakeups = makeupDAO.getTotalMakeupCount(); // 전체 메이크업의 개수
            int totalPages = (int) Math.ceil((double) totalMakeups / pageSize); // 전체 페이지 수
         	// 전체 메이크업 수를 pageSize로 나누고 올림 처리하기
        %>
        
        <!-- 화면 출력 기능 -->
        <%
		    for (int i = 0; i < makeups.size(); i++) {
		        Makeup makeup = makeups.get(i);
		%>
        <div class="makeup-item">
            <a href="<%= request.getContextPath() %>/makeupDetail.jsp?id=<%= makeup.getMakeupId() %>">
            	<img src="<%= request.getContextPath() %>/upload/makeup/<%= makeup.getPhotoPath() %>" alt="<%= makeup.getMakeupBrand() %>">
            </a>
            <h3><%= makeup.getMakeupBrand() %></h3>
            <p><%= makeup.getMakeupConcept() %></p>
            <p><%= makeup.getMakeupContent() %></p>
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

