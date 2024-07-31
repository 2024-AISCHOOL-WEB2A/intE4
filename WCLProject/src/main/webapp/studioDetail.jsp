<%@page import="com.WCLProject.model.DTO.VendorMemberDTO"%>
<%@page import="com.WCLProject.model.DTO.UserMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.WCLProject.model.DAO.StudioDAO" %>
<%@ page import="com.WCLProject.model.DTO.Studio" %>
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
    <title>Studio Detail</title>
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
            min-height: 500px; /* 최소 높이 설정 */
            min-width: 450px; /* 최소 넓이 설정 */
        }
        .studio-info {
            width: 43%; /* 드레스 정보 너비를 45%로 조정 */
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
        .more-studios {
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
        .more-studios h3 {
        	font-family: "Radley", Helvetica !important;
        	color: black;
        	font-size: 15px;
        	margin-top: -5px;
        }
       	.studio-info h2 {
       		font-family: "Inter", Helvetica !important;
       		font-size: 25px;
       		font-weight: 550;
       		margin-top: 20px;
       		margin-bottom: 40px;
       	}
       	.studio-info h3{
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
        .studio-price {
            font-size: 20px; /* 원하는 폰트 크기로 설정 */
            font-weight: 550; /* 필요에 따라 폰트 두께를 설정 */

        }
        .studio-info h4{
			font-family: "Inter", Helvetica !important;
			color: #8A2BE2;
			font-weight: 550;
			margin-bottom: 30px;
			margin-left: 10px;
			font-size: 17px;
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
                	<h3># <%= studio.getStudioConcept() %></h3>
                	<h4># <%= studio.getStudioTitle() %></h4>
                	<p class="line-break"><%= studio.getStudioContent() %></p>
                	<p class="studio-price"><%= studio.getStudioPrice() %>원</p>
                	<!-- 문의하기 버튼 -->
                    <button class="inquiry-button" onclick="location.href='inquiry.jsp?dressId=<%= studio.getStudioId() %>'">문의하기</button>
            	</div>
        	</div>
        	<!-- 같은 브랜드의 다른 스튜디오 이미지 출력 -->
        	<div class="more-studios">
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