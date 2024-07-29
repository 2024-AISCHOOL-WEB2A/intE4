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
        .makeup-info {
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
        .more-makeups {
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
            String makeupId = request.getParameter("id");
            MakeupDAO makeupDAO = new MakeupDAO();
         	// 특정 메이크업 ID로 메이크업 정보 가져오기
            Makeup makeup = makeupDAO.getMakeupById(makeupId);
         	// 같은 브랜드의 다른 메이크업 목록으로 가져오기
            List<Makeup> brandMakeups = makeupDAO.getMakeupsByBrand(makeup.getMakeupBrand());
        %>
        <!-- 메이크업 상세 정보 출력 -->
        <div class="makeup-detail">
        	<div class="detail-top">
            	<div class="main-image">
                	<img src="<%= request.getContextPath() %>/upload/makeup/<%= makeup.getPhotoPath() %>" alt="<%= makeup.getMakeupBrand() %>">
            	    <span class="heart-icon" onclick="toggleLike(this)">&#x2661;</span>                	
            	</div>
            	<div class="makeup-info">
	                <h2><%= makeup.getMakeupBrand() %></h2>
	                <p><strong>Concept : </strong> <%= makeup.getMakeupConcept() %></p>
	                <p><strong>￦</strong> <%= makeup.getMakeupPrice() %></p>
	                <p><strong></strong> <%= makeup.getMakeupContent() %></p>
	                <!-- 문의하기 버튼 -->
                    <button class="inquiry-button" onclick="location.href='inquiry.jsp?dressId=<%= makeup.getMakeupId() %>'">문의하기</button>
            	</div>
        	</div>
        	<!-- 같은 브랜드의 다른 메이크업 이미지 출력 -->
        	<div class="more-makeups">
        		<h3>More makeups from <%= makeup.getMakeupBrand() %></h3>
        		<div class="thumbnail-images">
            		<% for(Makeup brandMakeup : brandMakeups) { %>
                		<div class="thumbnail-item">
                			<img src="<%= request.getContextPath() %>/upload/makeup/<%= brandMakeup.getPhotoPath() %>" 
                     		alt="<%= brandMakeup.getMakeupBrand() %>"
                     		onclick="location.href='<%= request.getContextPath() %>/makeupDetail.jsp?id=<%= brandMakeup.getMakeupId() %>'">
						</div>                   
            		<% } %>
        		</div>
    		</div>
   		</div>
   	</div>
   	<!-- 메인 이미지 한번 더 출력하기 -->
   	<div class="brand-section">
   		<p>MAKEUP</p>
   		<h2><%= makeup.getMakeupBrand() %></h2>
   		<div class="brand-main-image">
            <img src="<%= request.getContextPath() %>/upload/makeup/<%= makeup.getPhotoPath() %>" alt="<%= makeup.getMakeupBrand() %>">
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