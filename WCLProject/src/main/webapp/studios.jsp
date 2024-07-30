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
            background-color: white;
        }
        .studio-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 0 100px;
            margin-top: 20px;
        }
        .studio-item {
            width: 22%;
            margin: 18px;
            text-align: left;
            margin-bottom: 70px;
            margin-top: 10px;
        }
        .studio-item img {
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
        
        h1 {
            margin-top: 50px;
            margin-bottom: 30px;
            margin-left: 125px;
            font-size: 2em;
        }
        
        .studio-item-detail {
        	margin-top: -17px;
        }
        .studio-item-detail h3 {
        	margin-top: 20px !important;
        	font-size: 20px;
        	font-weight: bold;
        	margin-bottom: 3px;
		    font-family: "Inter", Helvetica;
		} 
		.studio-item-detail p {
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
    <h1>스튜디오 라인</h1>
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
            <div class="studio-item-detail">
	            <h3><%= studio.getStudioBrand() %></h3>
	            <p><%= studio.getStudioTitle() %></p>
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
