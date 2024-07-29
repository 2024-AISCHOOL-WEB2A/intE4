<%@page import="com.WCLProject.model.DTO.MemberDTO"%>
<%@page import="com.WCLProject.model.DTO.VendorMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
VendorMemberDTO vendor = (VendorMemberDTO) session.getAttribute("vendorInfo");
MemberDTO user = (MemberDTO) session.getAttribute("userInfo");
String isLogin;
String vendorCategory = null;

if (vendor != null) {
    isLogin = "vendor";
    vendorCategory = vendor.getCategory();
} else if (user != null) {
    isLogin = "user";
} else {
    isLogin = "not Login";
}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Responsive Header</title>
<link rel="stylesheet" href="./css/header.css">
</head>
<body>
    <div class="nav">
        <a href="mainPage.jsp" class="lisianthus">L i s i a n t h u s</a>
        <div class="frame-2">
            <div class="view">
                <a href="weddinghalls.jsp" class="text-wrapper">웨딩홀</a>
                <a href="dresses.jsp" class="text-wrapper">드레스</a>
                <a href="studios.jsp" class="text-wrapper-2">스튜디오</a>
                <a href="makeups.jsp" class="text-wrapper-3">메이크업</a>
            </div>
            <%
            if ("vendor".equals(isLogin)) {
                if ("드레스".equals(vendorCategory)) {
            %>
                <div class="frame-3">
                    <div class="text-wrapper-4">회원정보 수정</div>
                    <div class="text-wrapper-5">예약관리</div>
                    <a href="productDressManagement.jsp" class="text-wrapper-5">상품관리(드레스)</a>
                    <form id="logoutForm" action="Logout" method="post" style="display: none;">
                        <input type="hidden" name="_method" value="POST">
                    </form>
                    <div class="text-wrapper-5" onclick="document.getElementById('logoutForm').submit();">로그아웃</div>
                </div>
            <%
                } else if ("웨딩홀".equals(vendorCategory)) {
            %>
                <div class="frame-3">
                    <div class="text-wrapper-4">회원정보 수정</div>
                    <div class="text-wrapper-5">예약관리</div>
                    <a href="#" class="text-wrapper-5">상품 관리(웨딩홀)</a>
                    <form id="logoutForm" action="Logout" method="post" style="display: none;">
                        <input type="hidden" name="_method" value="POST">
                    </form>
                    <div class="text-wrapper-5" onclick="document.getElementById('logoutForm').submit();">로그아웃</div>
                </div>
            <%
                } else { // 기타 카테고리
            %>
                <div class="frame-3">
                    <div class="text-wrapper-4">회원정보 수정</div>
                    <div class="text-wrapper-5">예약관리</div>
                    <a href="#" class="text-wrapper-5">상품 관리(스메)</a>
                    <form id="logoutForm" action="Logout" method="post" style="display: none;">
                        <input type="hidden" name="_method" value="POST">
                    </form>
                    <div class="text-wrapper-5" onclick="document.getElementById('logoutForm').submit();">로그아웃</div>
                </div>
            <%
                }
            } else if ("user".equals(isLogin)) {
            %>
                <div class="frame-3">
                    <div class="text-wrapper-4">회원정보 수정</div>
                    <div class="text-wrapper-5">예약관리</div>
                    <form id="logoutForm" action="Logout" method="post" style="display: none;">
                        <input type="hidden" name="_method" value="POST">
                    </form>
                    <div class="text-wrapper-5" onclick="document.getElementById('logoutForm').submit();">로그아웃</div>
                </div>
            <%
            } else { // 로그인하지 않은 사용자
            %>
                <div class="frame-3">
                    <a href="LoginWcl.jsp" class="text-wrapper-4">로그인</a>
                    <a href="signupMemberSelect.jsp" class="text-wrapper-5">회원가입</a>
                </div>
            <%
            }
            %>
        </div>
    </div>
</body>
</html>
