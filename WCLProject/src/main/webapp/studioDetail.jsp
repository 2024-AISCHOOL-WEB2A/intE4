<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.WCLProject.model.DAO.StudioDAO" %>
<%@ page import="com.WCLProject.model.DTO.Studio" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Studio Detail</title>
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
        .studio-detail {
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
        .studio-info {
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
        <h1>Studio Choice</h1>
        <%
            String studioId = request.getParameter("id");
            StudioDAO studioDAO = new StudioDAO();
         	// 특정 스튜디오 ID로 스튜디오 정보 가져오기
            Studio studio = studioDAO.getStudioById(studioId);
         	// 같은 브랜드의 다른 스튜디오를 목록으로 가져오기
            List<Studio> brandStudios = studioDAO.getStudiosByBrand(studio.getStudioBrand());
        %>
        <!-- 스튜디오 상세 정보 출력 -->
        <div class="studio-detail">
            <div class="main-image">
                <img src="<%= request.getContextPath() %>/upload/studio/<%= studio.getPhotoPath() %>" alt="<%= studio.getStudioBrand() %>">
            </div>
            <div class="studio-info">
                <h2><%= studio.getStudioBrand() %></h2>

                <p><strong>Price:</strong> <%= studio.getStudioPrice() %></p>
                <p><strong>Description:</strong> <%= studio.getStudioContent() %></p>
                <p><strong>Date:</strong> <%= studio.getStudioDate() %></p>
            </div>
        </div>
        <!-- 같은 브랜드의 다른 스튜디오 이미지 출력 -->
        <h2>More studios from <%= studio.getStudioBrand() %></h2>
        <div class="thumbnail-images">
            <% for(Studio brandStudio : brandStudios) { %>
                <img src="<%= request.getContextPath() %>/upload/studio/<%= brandStudio.getPhotoPath() %>" 
                     alt="<%= brandStudio.getStudioBrand() %>"
                     onclick="location.href='<%= request.getContextPath() %>/studioDetail.jsp?id=<%= brandStudio.getStudioId() %>'">
            <% } %>
        </div>
    </div>
</body>
</html>