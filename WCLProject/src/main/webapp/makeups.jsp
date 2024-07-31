<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.WCLProject.model.DAO.MakeupDAO" %>
<%@ page import="com.WCLProject.model.DTO.Makeup" %>
<!DOCTYPE html>
<link rel="stylesheet" href="./css/mainPage_globals.css">
<link rel="stylesheet" href="./css/mainPage_styleguide.css">
<html>
<head>
    <meta charset="UTF-8">
    <title>Wedding Makeup Platform</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: white;
        }
        .makeup-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 0 100px;
            margin-top: 20px;
        }
        .makeup-item {
            width: 22%;
            margin: 18px;
            text-align: left;
            margin-bottom: 70px;
            margin-top: 10px;
        }
        .makeup-item img {
            width: 300px; /* 고정 너비 */
		    height: 300px; /* 고정 높이 */
		    object-fit: cover; /* 이미지를 요소 크기에 맞게 조정하면서 비율 유지, 넘치는 부분은 자름 */
		    object-position: top; /* 이미지를 에 위치시킴 */
		    border-radius: 2px;
        }
        .pagination {
            text-align: center;
            margin-top: 0px;
            margin-bottom: 100px;
        }
        .pagination a {
            margin: 0 5px;
            text-decoration: none;
            color: black;
        }
        .pagination strong {
            margin: 0 5px;
            color: #000;
            font-weight: bold;
        }
        .h1 {
            margin-top: 250px;
            margin-bottom: 50px;
            margin-left: 125px;
            font-size: 2em;
            font-weight: bold;
        }
        .makeup-item-detail {
        	margin-top: -17px;
        }
        .makeup-item-detail h3 {
        	margin-top: 20px !important;
        	font-size: 20px;
        	font-weight: bold;
        	margin-bottom: 3px;
		    font-family: "Inter", Helvetica;
		}
		.makeup-item-detail p {
		    margin-top: 0; /* p 요소의 위쪽 마진을 없앱니다 */
		    font-family: "Inter", Helvetica;
		    font-weight: 550;
		    color: #a0a0a0;
		}
    </style>
</head>
<body>
    <header>
        <jsp:include page="header2.jsp" />
    </header>
    <div class="h1">메이크업 라인</div>
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
            <div class="makeup-item-detail">
	            <h3><%= makeup.getMakeupBrand() %></h3>
	            <p><%= makeup.getMakeupTitle() %></p>
            </div>
        </div>
        <% } %>
    </div>
    <!-- 페이징 기능(페이지 이동) -->
	<div class="pagination">
	    <%
	        String baseQueryString = request.getQueryString() != null ? request.getQueryString().replaceAll("page=[^&]*&?", "") : "";
	        if (currentPage > 1) {
	    %>
	        <a href="?page=<%= (currentPage - 1) %><%= baseQueryString.length() > 0 ? "&" + baseQueryString : "" %>">&laquo; 이전</a>
	    <%
	        }
	        for (int i = 1; i <= totalPages; i++) {
	            if (i == currentPage) {
	    %>
	        <strong><%= i %></strong>
	    <%
	            } else {
	    %>
	        <a href="?page=<%= i %><%= baseQueryString.length() > 0 ? "&" + baseQueryString : "" %>"><%= i %></a>
	    <%
	            }
	        }
	        if (currentPage < totalPages) {
	    %>
	        <a href="?page=<%= (currentPage + 1) %><%= baseQueryString.length() > 0 ? "&" + baseQueryString : "" %>">다음 &raquo;</a>
	    <%
	        }
	    %>
	</div>
	<script>
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
	<footer>
        <jsp:include page="footer.jsp" />
    </footer>  
</body>
</html>

