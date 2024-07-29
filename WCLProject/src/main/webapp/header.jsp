<%@page import="com.WCLProject.model.DTO.MemberDTO"%>
<%@page import="com.WCLProject.model.DTO.VendorMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
VendorMemberDTO vendor = (VendorMemberDTO) session.getAttribute("vendorInfo");
MemberDTO user = (MemberDTO) session.getAttribute("userInfo");
String isLogin;
if (vendor != null) {
	isLogin = "vendor";
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
				<div class="text-wrapper">웨딩홀</div>
				<div class="text-wrapper">드레스</div>
				<div class="text-wrapper-2">스튜디오</div>
				<div class="text-wrapper-3">메이크업</div>
			</div>
			<%
			if (isLogin.equals("vendor")) {
			%>
			<div class="frame-3">
				<div class="text-wrapper-4">회원정보 수정</div>
				<div class="text-wrapper-5">예약관리</div>
				<a href="dressRegistration.jsp" class="text-wrapper-5">상품관리</a>
				<div class="text-wrapper-5">로그아웃</div>
			</div>
			<%
			} else if (isLogin.equals("user")) {
			%>
			<div class="frame-3">
				<div class="text-wrapper-4">회원정보 수정</div>
				<div class="text-wrapper-5">예약관리</div>
				<div class="text-wrapper-5">로그아웃</div>
			</div>
			<%
			} else {
			%>
			<div class="frame-3">
				<a href="LoginWcl.jsp" class="text-wrapper-4">로그인</a> <a
					href="signupMemberSelect.jsp" class="text-wrapper-5">회원가입</a>
			</div>
			<%
			}
			%>
		</div>
	</div>
</body>
</html>
