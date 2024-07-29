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
            flex-direction: column; /* 레이아웃을 column으로 변경 */
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .detail-top {
            display: flex;
            width: 100%;
            justify-content: space-between;
        }
        .main-image {
            width: 45%;
            position: relative;
        }
        .main-image img {
            width: 100%;
            height: auto;
        }
        .studio-info {
            width: 45%; /* 드레스 정보 너비를 45%로 조정 */
        }
        .inquiry-button {
            background-color: #ffdddd;
            color: black;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
            margin-top: 20px;
            font-weight: 550;
        }
        .more-studios {
            margin-top: 20px;
        }
        .thumbnail-images {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }
        .thumbnail-images img {
            width: 90px;
            height: 90px;
            object-fit: cover;
            cursor: pointer;
            margin-top: -15px;
        }
        .brand-section {
            margin-top: 100px;
            text-align: center;
        }
        .brand-section p {
            font-size: 16px;
            font-weight: bold;
            margin: 0;
        }
        .brand-section h2 {
            margin: 10px 0;
            font-size: 20px;
            font-weight: normal;
        }
        .brand-main-image {
            margin-top: 20px;
        }
        .brand-main-image img {
            width: 45%;
            height: auto;
        }
        .button-section {
            text-align: center;
            margin: 120px 0; /* 버튼을 더 아래로 내리기 위해 margin을 크게 설정 */
        }
        .button-section button {
            background-color: #ffdddd;
            color: black;
            padding: 10px 20px;
            margin: 0 10px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
            font-weight: 550;
        }
        .heart-icon {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 24px;
            color: grey;
            cursor: pointer;
        }
        .heart-icon.liked {
            color: red;
        }
    </style>
</head>
<body>
	<header>
        <jsp:include page="header2.jsp" />
    </header>
    <div class="container">
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
        	<div class="detail-top">
            	<div class="main-image">
                	<img src="<%= request.getContextPath() %>/upload/studio/<%= studio.getPhotoPath() %>" alt="<%= studio.getStudioBrand() %>">
                	<span class="heart-icon" onclick="toggleLike(this)">&#x2661;</span>
            	</div>
            	<div class="studio-info">
                	<h2><%= studio.getStudioBrand() %></h2>
                	<p><strong>Concept : </strong> <%= studio.getStudioConcept() %></p>
                	<p><strong>￦ </strong> <%= studio.getStudioPrice() %></p>
                	<p><strong></strong> <%= studio.getStudioContent() %></p>
                	<!-- 문의하기 버튼 -->
                    <button class="inquiry-button" onclick="location.href='inquiry.jsp?dressId=<%= studio.getStudioId() %>'">문의하기</button>
            	</div>
        	</div>
        	<!-- 같은 브랜드의 다른 스튜디오 이미지 출력 -->
        	<div class="more-stuios">
        		<h3>More studios from <%= studio.getStudioBrand() %></h3>
        		<div class="thumbnail-images">
            		<% for(Studio brandStudio : brandStudios) { %>
            			<div class="thumbnail-item">
                			<img src="<%= request.getContextPath() %>/upload/studio/<%= brandStudio.getPhotoPath() %>" 
                     		alt="<%= brandStudio.getStudioBrand() %>"
                     		onclick="location.href='<%= request.getContextPath() %>/studioDetail.jsp?id=<%= brandStudio.getStudioId() %>'">
                     	</div>	
            		<% } %>
       		 	</div>
    		</div>
   		</div>
   	</div>
   	<!-- 메인 이미지 한번 더 출력하기 -->
   	<div class="brand-section">
   		<p>STUDIO</p>
   		<h2><%= studio.getStudioBrand() %></h2>
   		<div class="brand-main-image">
            <img src="<%= request.getContextPath() %>/upload/studio/<%= studio.getPhotoPath() %>" alt="<%= studio.getStudioBrand() %>">
        </div>
    </div>        
   	<!-- 예약하기, 결제하기 버튼 -->
    <div class="button-section">
        <button onclick="">예약하기</button>
        <button onclick="">결제하기</button>
    </div>
    <footer>
        <jsp:include page="footer.jsp" />
    </footer>
    <script>
        function toggleLike(element) {
            element.classList.toggle('liked');
        }
    </script>	
</body>
</html>