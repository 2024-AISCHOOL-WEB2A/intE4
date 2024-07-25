<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.WCLProject.model.DAO.StudioDAO" %>
<%@ page import="com.WCLProject.model.DTO.Studio" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Wedding Studio Platform</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }
        .studio-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            padding: 0 150px;
        }
        .studio-item {
            width: 22%;
            margin: 15px;
            text-align: center;
        }
        .studio-item img {
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
    <h1>STUDIOS</h1>
    	<!-- 페이징 기능 -->
    	<div class="studio-container">
        <%
            int currentPage = 1; // 현재 페이지
            int pageSize = 8; // 페이지당 데이터 개수 설정
			
            //
            String pageParam = request.getParameter("page");
            if (pageParam != null && pageParam.matches("\\d+")) { 
                currentPage = Integer.parseInt(pageParam);
            }

         	// 데이터베이스에서 전체 스튜디오 개수 가져오기
            StudioDAO studioDAO = new StudioDAO();
            List<Studio> studios = studioDAO.getStudiosByVendor(currentPage, pageSize);
            int totalStudios = studioDAO.getTotalStudioCount(); // 전체 스튜디오의 개수
            int totalPages = (int) Math.ceil((double) totalStudios / pageSize); // 전체 페이지 수
         	// 전체 스튜디오 수를 pageSize로 나누고 올림 처리하기
        %>
        
        <!-- 화면 출력 기능 -->
        <%
            for (int i = 0; i < studios.size(); i++) {
                Studio studio = studios.get(i);
        %>
        <div class="studio-item">
            <a href="<%= request.getContextPath() %>/studioDetail.jsp?id=<%= studio.getStudioId() %>">
            	<img src="<%= request.getContextPath() %>/upload/studio/<%= studio.getPhotoPath() %>" alt="<%= studio.getStudioBrand() %>">
            </a>
            <h3><%= studio.getStudioBrand() %></h3>
            <p><%= studio.getStudioConcept() %></p>
            <p><%= studio.getStudioContent() %></p>
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
