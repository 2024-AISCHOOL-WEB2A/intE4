<%@page import="com.WCLProject.model.DTO.VendorMemberDTO"%>
<%@page import="com.WCLProject.model.DTO.UserMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.WCLProject.model.DAO.WeddingHallDAO" %>
<%@ page import="com.WCLProject.model.DTO.WeddingHall" %>
<%@ page import="java.util.List" %>
<% 
UserMemberDTO user = (UserMemberDTO) session.getAttribute("userInfo");
VendorMemberDTO vendor = (VendorMemberDTO) session.getAttribute("vendorInfo");
Boolean isLogin = (vendor != null || user != null);

if (!isLogin) {		
    response.sendRedirect("mainPage.jsp");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Wedding Hall Detail</title>
	<link rel="stylesheet" href="./css/mainPage_globals.css">
	<link rel="stylesheet" href="./css/mainPage_styleguide.css">
    <style>
        body {
            font-family: "Inter", Helvetica;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .wedding-hall-detail {
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
            min-height: 500px; /* 최소 높이 설정 */
            min-width: 450px; /* 최소 넓이 설정 */
        }
        .wedding-hall-info {
            width: 45%; /* 드레스 정보 너비를 45%로 조정 */
            margin-right: -10px;
        }
        .inquiry-button {
            color: black;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
            margin-top: 20px;
            font-weight: 550;
            background-color: #ffebeb;
            font-family: "Inter", Helvetica !important;
            letter-spacing: 1px; /* 글자 간격 설정 */
  			position: absolute; /* 부모 요소를 기준으로 고정 위치 */
    		bottom: 200px; /* 부모 요소의 하단에서 20px 위로 */
        }
        .more-weddinghalls {
            margin-top: 20px;
        }
        .thumbnail-images {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
        }
        .thumbnail-images img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            cursor: pointer;
            margin-top: 2px;
        }
        .brand-section {
            margin-top: 100px;
            text-align: center;
        }
        .brand-section p {
            font-size: 16px;
            font-weight: bold;
            margin: 0;
            font-family: "Inter", Helvetica !important;
        }
        .brand-section h2 {
            margin: 10px 0;
            font-size: 20px;
            font-weight: normal;
            font-family: "Inter", Helvetica !important;
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
            color: black;
            padding: 10px 20px;
            margin: 0 20px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
            font-weight: 550;
            background-color: #ffebeb;
            font-family: "Inter", Helvetica !important;
            letter-spacing: 1px; /* 글자 간격 설정 */
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
        .more-weddinghalls h3 {
        	font-family: "Radley", Helvetica !important;
        	color: black;
        	font-size: 15px;
        	margin-top: -5px;
        }
       	.wedding-hall-info h2 {
       		font-family: "Inter", Helvetica !important;
       		font-size: 25px;
       		font-weight: 550;
       		margin-top: 20px;
       		margin-bottom: 40px;
       	}
       	.wedding-hall-info h3{
			font-family: "Inter", Helvetica !important;
			color: #8A2BE2;
			font-weight: 550;
			margin-bottom: 10px;
			margin-left: 10px;
			font-size: 17px;
       	}
       	.line-break {
            white-space: pre-line; /* 줄바꿈을 해석하여 표시 */
            line-height: 1.6; /* 줄 간 간격을 1.6배로 설정 */
            margin-bottom: 25px;
            font-family: "Inter", Helvetica !important;
        }
        .weddinghall-price {
            font-size: 20px; /* 원하는 폰트 크기로 설정 */
            font-weight: 550; /* 필요에 따라 폰트 두께를 설정 */

        }
        .wedding-hall-info h4{
			font-family: "Inter", Helvetica !important;
			color: #8A2BE2;
			font-weight: 550;
			margin-bottom: 30px;
			margin-left: 10px;
			font-size: 17px;
		}
		.small-br {
	        line-height: 2.0; /* 원하는 줄 간격 설정 */
	    }
    </style>
</head>
<body>
	<header>
        <jsp:include page="header2.jsp" />
    </header>
    <div class="container">
        <%
            String weddingHallId = request.getParameter("id");
            WeddingHallDAO weddingHallDAO = new WeddingHallDAO();
         	// 특정 웨딩홀 ID로 웨딩홀 정보 가져오기
            WeddingHall weddingHall = weddingHallDAO.getWeddingHallById(weddingHallId);
         	// 같은 브랜드의 다른 웨딩홀을 목록으로 가져오기
            List<WeddingHall> brandWeddingHalls = weddingHallDAO.getWeddingHallsByBrand(weddingHall.getWeddingHallBrand());
        %>
        <!-- 웨딩홀 상세 정보 출력 -->
        <div class="wedding-hall-detail">
        	<div class="detail-top">
            	<div class="main-image">
                	<img src="<%= request.getContextPath() %>/upload/weddinghall/<%= weddingHall.getPhotoPath() %>" alt="<%= weddingHall.getWeddingHallBrand() %>">
                	<span class="heart-icon" onclick="toggleLike(this)">&#x2661;</span>
            	</div>
            	<div class="wedding-hall-info">
               		<h2><%= weddingHall.getWeddingHallBrand() %></h2>
               		<h3># <%= weddingHall.getWeddingHallType() %></h3>
               		<h4># <%= weddingHall.getWeddingHallTitle() %></h4>
                	<p class="small-br">식대 : <%= weddingHall.getWeddingHallMealCost() %>원</p>
                	<p class="small-br">보증인원 : <%= weddingHall.getWeddingHallAssurance() %></p>
                	<p class="line-break"><%= weddingHall.getWeddingHallContent() %></p>
                	<p class="weddinghall-price"><%= weddingHall.getWeddingHallPrice() %>원</p>
                	<!-- 문의하기 버튼 -->
                    <button class="inquiry-button" onclick="location.href='inquiry.jsp?dressId=<%= weddingHall.getWeddingHallId() %>'">문의하기</button>
            	</div>
        	</div>
        	<!-- 같은 브랜드의 다른 웨딩홀 이미지 출력 -->
        	<div class="more-weddinghalls">
        		<h3>More wedding halls from <%= weddingHall.getWeddingHallBrand() %></h3>
        		<div class="thumbnail-images">
            		<% for(WeddingHall brandWeddingHall : brandWeddingHalls) { %>
            		<div class="thumbnail-item">
                		<img src="<%= request.getContextPath() %>/upload/weddinghall/<%= brandWeddingHall.getPhotoPath() %>" 
                    		alt="<%= brandWeddingHall.getWeddingHallBrand() %>"
                     		onclick="location.href='<%= request.getContextPath() %>/weddinghallDetail.jsp?id=<%= brandWeddingHall.getWeddingHallId() %>'">
                   		</div>
           	 		<% } %>
        		</div>
    		</div>
   		</div>
	</div>
	<!-- 메인 이미지 한번 더 출력하기 -->
   	<div class="brand-section">
   		<p>STUDIO</p>
   		<h2><%= weddingHall.getWeddingHallBrand() %></h2>
   		<div class="brand-main-image">
            <img src="<%= request.getContextPath() %>/upload/weddinghall/<%= weddingHall.getPhotoPath() %>" alt="<%= weddingHall.getWeddingHallBrand() %>">
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
        
        // 페이지 로드 시 스크롤 위치 복원
        window.onload = function() {
            const scrollPosition = localStorage.getItem('scrollPosition');
            if (scrollPosition) {
                window.scrollTo(0, parseInt(scrollPosition, 10));
            }
        };

        // 페이지 언로드 시 스크롤 위치 저장
        window.onbeforeunload = function() {
            localStorage.setItem('scrollPosition', window.scrollY);
        };
    </script>	
</body>
</html>