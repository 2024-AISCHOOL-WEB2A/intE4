<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.WCLProject.model.DAO.MakeupDAO" %>
<%@ page import="com.WCLProject.model.DTO.Makeup" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Makeup Detail</title>
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
        .makeup-detail {
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
        .makeup-info {
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
        <h1>Makeup Choice</h1>
        <%
            String makeupId = request.getParameter("id");
            MakeupDAO makeupDAO = new MakeupDAO();
            Makeup makeup = makeupDAO.getMakeupById(makeupId);
            List<Makeup> brandMakeups = makeupDAO.getMakeupsByBrand(makeup.getMakeupBrand());
        %>
        <div class="makeup-detail">
            <div class="main-image">
                <img src="<%= request.getContextPath() %>/upload/makeup/<%= makeup.getPhotoPath() %>" alt="<%= makeup.getMakeupBrand() %>">
            </div>
            <div class="makeup-info">
                <h2><%= makeup.getMakeupBrand() %></h2>
                <p><strong>Concept:</strong> <%= makeup.getMakeupConcept() %></p>
                <p><strong>Price:</strong> <%= makeup.getMakeupPrice() %></p>
                <p><strong>Description:</strong> <%= makeup.getMakeupContent() %></p>
                <p><strong>Date:</strong> <%= makeup.getMakeupDate() %></p>
            </div>
        </div>
        <h2>More makeups from <%= makeup.getMakeupBrand() %></h2>
        <div class="thumbnail-images">
            <% for(Makeup brandMakeup : brandMakeups) { %>
                <img src="<%= request.getContextPath() %>/makeupimages/<%= brandMakeup.getPhotoPath() %>" 
                     alt="<%= brandMakeup.getMakeupBrand() %>"
                     onclick="location.href='<%= request.getContextPath() %>/makeupDetail.jsp?id=<%= brandMakeup.getMakeupId() %>'">
            <% } %>
        </div>
    </div>
</body>
</html>