<%@page import="com.WCLProject.model.DTO.VendorMemberDTO"%>
<%@page import="com.WCLProject.model.DTO.UserMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.WCLProject.model.DAO.DressDAO" %>
<%@ page import="com.WCLProject.model.DTO.Dress" %>
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
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Wedding Dress Detail</title>
<style>
<link rel="stylesheet" href="./css/dressDetail.css">
<link rel="stylesheet" href="./css/mainPage_globals.css">
<link rel="stylesheet" href="./css/mainPage_styleguide.css">
</style>
</head>
<body>

    <header>
        <jsp:include page="header2.jsp" />
    </header>
    <div class="container">
        <%
            String dressId = request.getParameter("id");
            DressDAO dressDAO = new DressDAO();
         	// 특정 드레스 ID로 드레스 정보 가져오기
            Dress dress = dressDAO.getDressById(dressId);
         	// 같은 브랜드의 다른 드레스를 목록으로 가져오기
            List<Dress> brandDresses = dressDAO.getDressesByBrand(dress.getDressBrand());
        %>
        <!-- 드레스 상세 정보 출력 -->
        <div class="dress-detail">
            <div class="detail-top">
                <div class="main-image">
                    <img src="<%= request.getContextPath() %>/upload/dress/<%= dress.getPhotoPath() %>" alt="<%= dress.getDressBrand() %>">
                    <span class="heart-icon" onclick="toggleLike(this)">&#x2661;</span>
                </div>
                <div class="dress-info">
                    <h2><%= dress.getDressBrand() %></h2>
                    <h3># <%= dress.getDressFabric() %>&nbsp;&nbsp;&nbsp;# <%= dress.getDressLine() %>&nbsp;&nbsp;&nbsp;# <%= dress.getDressStyle() %></h3>
                    <p class="line-break"><%= dress.getDressContent() %></p>
                    <p class="dress-price"><%= dress.getDressPrice() %>원</p>
                    <!-- 문의하기 버튼 -->
                    <button class="inquiry-button" onclick="location.href='inquiry.jsp?dressId=<%= dress.getId() %>'">문의하기</button>
                </div>
            </div>
            <!-- 같은 브랜드의 다른 드레스 이미지 출력 -->
            <div class="more-dresses">
                <h3>More dresses from <%= dress.getDressBrand() %></h3>
                <div class="thumbnail-images">
                    <% for(Dress brandDress : brandDresses) { %>
                        <div class="thumbnail-item">
                            <img src="<%= request.getContextPath() %>/upload/dress/<%= brandDress.getPhotoPath() %>" 
                                 alt="<%= brandDress.getDressBrand() %>"
                                 onclick="location.href='<%= request.getContextPath() %>/dressDetail.jsp?id=<%= brandDress.getId() %>'">
                        </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
    <!-- 메인 이미지 한번 더 출력하기 -->
    <div class="brand-section">
        <p>DRESS</p>
        <h2><%= dress.getDressBrand() %></h2>
        <div class="brand-main-image">
            <img src="<%= request.getContextPath() %>/upload/dress/<%= dress.getPhotoPath() %>" alt="<%= dress.getDressBrand() %>">
        </div>
    </div>
    <!-- 예약하기, 결제하기 버튼 -->
    <div class="button-section">
        <button onclick="location.href='reservation.jsp?dressId=<%= dress.getId() %>'">예약하기</button>
        <button onclick="location.href='payment.jsp?dressId=<%= dress.getId() %>'">결제하기</button>
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