<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.WCLProject.model.DAO.DressDAO" %>
<%@ page import="com.WCLProject.model.DTO.Dress" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<link rel="stylesheet" href="./css/dressDetailLike.css">
<link rel="stylesheet" href="./css/mainPage_globals.css">
<link rel="stylesheet" href="./css/mainPage_styleguide.css">
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Wedding Dress Detail</title>
<style>
	.highlighted {
            border: 2px solid red;
    }
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
            // 랜덤으로 드레스 정렬해서 출력
         	Collections.shuffle(brandDresses);
         // brandDresses에서 현재 dress 객체를 제거
            List<Dress> filteredBrandDresses = new ArrayList<>(brandDresses);
            filteredBrandDresses.remove(dress);
        %>
        <!-- 드레스 상세 정보 출력 -->
        <div class="dress-detail">
            <div class="detail-top">
                <div class="main-image">
                    <img id = "like" src="<%= request.getContextPath() %>/upload/dress/<%= dress.getPhotoPath() %>" alt="<%= dress.getDressBrand() %>">
                    <!-- 좋아요 클릭 -->
                    <span class="heart-icon" onclick="toggleLike(this)">&#x2661</span>
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
                                 onclick="location.href='<%= request.getContextPath() %>/dressDetailLike.jsp?id=<%= brandDress.getId() %>'">
                        </div>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
    
     <!-- 좋아요 이미지 출력하기 -->
	<div id="image-container">
        <% for(int i = 0; i < 3 && i < filteredBrandDresses.size(); i++) {
            Dress likedDress = filteredBrandDresses.get(i); // 좋아요된 드레스 리스트에서 가져오기
        %>
            <div class="choice">
                <img src="<%= request.getContextPath() %>/upload/dress/<%= likedDress.getPhotoPath() %>" 
                     alt="<%= likedDress.getDressBrand() %>" 
                     onclick="location.href='<%= request.getContextPath() %>/dressDetailLike.jsp?id=<%= likedDress.getId() %>'">
                <div class="description"><%= likedDress.getDressBrand() %> (<%= likedDress.getDressPrice() %>원)</div>
                <div class="description2">#<%= likedDress.getDressFabric() %>&nbsp;&nbsp;&nbsp;#<%= likedDress.getDressLine() %>&nbsp;&nbsp;&nbsp;#<%= likedDress.getDressStyle() %> </div>
            </div>
        <% } %>
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
        
     // 페이지 로드 시 좋아요 상태를 확인하고 설정
        document.addEventListener("DOMContentLoaded", function() {
            var liked = localStorage.getItem('isLiked') === 'true';
            if (liked) {
                document.querySelector('.heart-icon').classList.add('active');
                document.getElementById('image-container').style.display = 'block';
            }
        });

        // 하트를 클릭할 때 로컬 저장소에 상태 저장
        function toggleLike(element) {
            element.classList.toggle('active');
            var isLiked = element.classList.contains('active');
            localStorage.setItem('isLiked', isLiked);

            var imageContainer = document.getElementById('image-container');
            if (isLiked) {
                imageContainer.style.display = 'block';
            } else {
                imageContainer.style.display = 'none';
            }
        }
        
        
        
        
        
     /* 페이지 이동하면 하트 꺼지는 현상
     // 좋아요 누르면 색 바뀌고 추천 창 뜸
        function toggleLike(element) {
		    element.classList.toggle('active');
		    var imageContainer = document.getElementById('image-container');
		    
		    if (element.classList.contains('active')) {
		        imageContainer.style.display = 'block';
		    } else {
		        imageContainer.style.display = 'none';
		    }
		} */
        
    </script>
</body>
</html>