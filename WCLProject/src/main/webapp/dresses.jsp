<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.WCLProject.model.DAO.DressDAO" %>
<%@ page import="com.WCLProject.model.DTO.Dress" %>
<!DOCTYPE html>
<link rel="stylesheet" href="./css/dresses.css">
<link rel="stylesheet" href="./css/mainPage_globals.css">
<link rel="stylesheet" href="./css/mainPage_styleguide.css">
<html>
<head>
<meta charset="UTF-8">
<title>Dress</title>
<style>
</style>
</head>
<body>
    <header>
        <jsp:include page="header2.jsp" />
    </header>
    <!-- 필터링 지역, 소재, 금액대, 라인, 분위기 순 -->
    <div class="filter-container">
    <h1>드레스 라인</h1>
        <span class="filter-title">지역 </span>
        <form action="" method="get" style="display:inline-block;">
            <select class="region-select" name="region" onchange="this.form.submit()">
                <option value="">전체</option>
                <option value="서울" <%= "서울".equals(request.getParameter("region")) ? "selected" : "" %>>서울</option>
                <option value="경기" <%= "경기".equals(request.getParameter("region")) ? "selected" : "" %>>경기</option>
                <option value="인천" <%= "인천".equals(request.getParameter("region")) ? "selected" : "" %>>인천</option>
                <option value="광주" <%= "광주".equals(request.getParameter("region")) ? "selected" : "" %>>광주</option>
                <option value="대전" <%= "대전".equals(request.getParameter("region")) ? "selected" : "" %>>대전</option>
                <option value="대구" <%= "대구".equals(request.getParameter("region")) ? "selected" : "" %>>대구</option>
                <option value="울산" <%= "울산".equals(request.getParameter("region")) ? "selected" : "" %>>울산</option>
                <option value="부산" <%= "부산".equals(request.getParameter("region")) ? "selected" : "" %>>부산</option>
            </select>
        </form>
    </div>
    <div class="filter-container">
        <span class="filter-title">소재</span>
        <a class="filter-button" href="?fabric=실크<%= request.getQueryString() != null ? "&" + request.getQueryString().replaceAll("&?fabric=[^&]*", "") : "" %>">실크</a>
        <a class="filter-button" href="?fabric=레이스<%= request.getQueryString() != null ? "&" + request.getQueryString().replaceAll("&?fabric=[^&]*", "") : "" %>">레이스</a>
        <a class="filter-button" href="?fabric=비즈<%= request.getQueryString() != null ? "&" + request.getQueryString().replaceAll("&?fabric=[^&]*", "") : "" %>">비즈</a>
    </div>
    <div class="filter-container">
        <span class="filter-title">금액대</span>
        <a class="filter-button" href="?priceRange=베이직<%= request.getQueryString() != null ? "&" + request.getQueryString().replaceAll("&?priceRange=[^&]*", "") : "" %>">베이직</a>
        <a class="filter-button" href="?priceRange=스탠다드<%= request.getQueryString() != null ? "&" + request.getQueryString().replaceAll("&?priceRange=[^&]*", "") : "" %>">스탠다드</a>
        <a class="filter-button" href="?priceRange=프리미엄<%= request.getQueryString() != null ? "&" + request.getQueryString().replaceAll("&?priceRange=[^&]*", "") : "" %>">프리미엄</a>
    </div>
    <div class="filter-container">
        <span class="filter-title">라인</span>
        <a class="filter-button" href="?line=탑A<%= request.getQueryString() != null ? "&" + request.getQueryString().replaceAll("&?line=[^&]*", "") : "" %>">탑 A라인</a>
        <a class="filter-button" href="?line=하트A<%= request.getQueryString() != null ? "&" + request.getQueryString().replaceAll("&?line=[^&]*", "") : "" %>">하트 A라인</a>
        <a class="filter-button" href="?line=하이넥A<%= request.getQueryString() != null ? "&" + request.getQueryString().replaceAll("&?line=[^&]*", "") : "" %>">하이넥 A라인</a>
        <a class="filter-button" href="?line=탑머메이드<%= request.getQueryString() != null ? "&" + request.getQueryString().replaceAll("&?line=[^&]*", "") : "" %>">탑 머메이드</a>
        <a class="filter-button" href="?line=하트머메이드<%= request.getQueryString() != null ? "&" + request.getQueryString().replaceAll("&?line=[^&]*", "") : "" %>">하트 머메이드</a>
        <a class="filter-button" href="?line=하이넥머메이드<%= request.getQueryString() != null ? "&" + request.getQueryString().replaceAll("&?line=[^&]*", "") : "" %>">하이넥 머메이드</a>
    </div>
    <div class="filter-container">
        <span class="filter-title">분위기</span>
        <a class="filter-button" href="?style=러블리<%= request.getQueryString() != null ? "&" + request.getQueryString().replaceAll("&?style=[^&]*", "") : "" %>">러블리</a>
        <a class="filter-button" href="?style=단아한<%= request.getQueryString() != null ? "&" + request.getQueryString().replaceAll("&?style=[^&]*", "") : "" %>">단아한</a>
        <a class="filter-button" href="?style=화려한<%= request.getQueryString() != null ? "&" + request.getQueryString().replaceAll("&?style=[^&]*", "") : "" %>">화려한</a>
        <a class="filter-button" href="?style=유니크<%= request.getQueryString() != null ? "&" + request.getQueryString().replaceAll("&?style=[^&]*", "") : "" %>">유니크</a>
    </div>
    <!-- 선택된 필터 표시 및 취소 기능 -->
    <div class="selected-filters">
        <%
     		// 선택된 필터를 순서대로 확인하고, 각 필터에 대해 제거 링크를 제공
            if (request.getParameter("fabric") != null) {
        %>
            <span class="selected-filter">
                <%= request.getParameter("fabric") %> <a href="?<%= request.getQueryString().replaceAll("&?fabric=[^&]*", "") %>">×</a>
            </span>
        <%
            }
            if (request.getParameter("priceRange") != null) {
        %>
            <span class="selected-filter">
                <%= request.getParameter("priceRange") %> <a href="?<%= request.getQueryString().replaceAll("&?priceRange=[^&]*", "") %>">×</a>
            </span>
        <%
            }
            if (request.getParameter("line") != null) {
        %>
            <span class="selected-filter">
                <%= request.getParameter("line") %> <a href="?<%= request.getQueryString().replaceAll("&?line=[^&]*", "") %>">×</a>
            </span>
        <%
            }
            if (request.getParameter("style") != null) {
        %>
            <span class="selected-filter">
                <%= request.getParameter("style") %> <a href="?<%= request.getQueryString().replaceAll("&?style=[^&]*", "") %>">×</a>
            </span>
        <%
            }
        %>
    </div>

    <div class="dress-container">
        <%
            DressDAO dressDAO = new DressDAO();
            List<Dress> dresses;
            List<String> fabrics = new ArrayList<>();
            List<String> lines = new ArrayList<>();
            List<String> styles = new ArrayList<>();
            String priceRangeParam = request.getParameter("priceRange");
            String regionParam = request.getParameter("region");
            int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
            int pageSize = 8; // 한 페이지에 표시할 항목 수
			
            // 선택된 필터 리스트에 추가
            if (request.getParameter("fabric") != null) {
                fabrics.add(request.getParameter("fabric"));
            }
            if (request.getParameter("line") != null) {
                lines.add(request.getParameter("line"));
            }
            if (request.getParameter("style") != null) {
                styles.add(request.getParameter("style"));
            }
            // 필터가 적용된 드레스 목록 가져오기
            if (!fabrics.isEmpty() || !lines.isEmpty() || !styles.isEmpty() || priceRangeParam != null || regionParam != null) {
                dresses = dressDAO.getDressesByFiltersWithPaging(fabrics, lines, styles, priceRangeParam, regionParam, currentPage, pageSize);
            } else {
                dresses = dressDAO.getDresses(currentPage, pageSize);
            }
			
            // 드레스 목록 출력
            for (Dress dress : dresses) {
        %>
                <div class="dress-item">
                    <a href="<%= request.getContextPath() %>/dressDetailLike.jsp?id=<%= dress.getId() %>">
                        <img src="<%= request.getContextPath() %>/upload/dress/<%= dress.getPhotoPath() %>" alt="<%= dress.getDressTitle() %>">
                    </a> 
	                <div class="dress-item-detail">
	                 	<h3><%= dress.getDressBrand() %></h3>
	                	<p><%= dress.getDressTitle() %></p>   
	               	</div>
               	</div>
        <%
            }
            
			// 필터된 드레스의 총 개수를 가져와서 페이지 수 계산하기
            int totalDresses = dressDAO.getFilteredDressCount(fabrics, lines, styles, priceRangeParam, regionParam);
            int totalPages = (int) Math.ceil((double) totalDresses / pageSize);
        %>
    </div>

    <!-- 페이징 -->
    <div class="pagination">
        <%
            String baseQueryString = request.getQueryString() != null ? request.getQueryString().replaceAll("page=[^&]*&?", "") : "";
        	if (currentPage > 1) {
        %>
                <a href="?page=<%= (currentPage - 1) %><%= baseQueryString.length() > 0 ? "&" + baseQueryString : "" %>">&laquo; 이전</a>
        <%
            }
            // 총 페이지 수 만큼 번호 출력
            for (int i = 1; i <= totalPages; i++) {
                if (i == currentPage) {
        %>
        			<!-- i = 현재 페이지 번호 -->
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