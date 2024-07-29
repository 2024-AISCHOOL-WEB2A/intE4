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
<link rel="stylesheet" href="./css/header3.css">
</head>
<body>
	<div class="nav">
		<a href="mainPage.jsp" class="lisianthus">L i s i a n t h u s</a>
		<div class="frame-2">
			<div class="view">
				<a href="weddinghalls.jsp" class="text-wrapper">웨딩홀</a> <a
					href="dresses.jsp" class="text-wrapper">드레스</a> <a
					href="studios.jsp" class="text-wrapper-2">스튜디오</a> <a
					href="makeups.jsp" class="text-wrapper-3">메이크업</a>
			</div>
			<%
			if (isLogin.equals("vendor")) {
			%>
			<div class="frame-3">
				<div class="text-wrapper-4">회원정보 수정</div>
				<div class="text-wrapper-5">예약관리</div>
				<a href="dressRegistration.jsp" class="text-wrapper-5">상품관리</a>
				<form id="logoutForm" action="Logout" method="post"
					style="display: none;">
					<input type="hidden" name="_method" value="POST">
				</form>
				<div class="text-wrapper-5"
					onclick="document.getElementById('logoutForm').submit();">로그아웃</div>
			</div>
			<%
			} else if (isLogin.equals("user")) {
			%>
			<div class="frame-3">
				<div class="text-wrapper-4">회원정보 수정</div>
				<div class="text-wrapper-5">예약관리</div>
				<form id="logoutForm" action="Logout" method="post"
					style="display: none;">
					<input type="hidden" name="_method" value="POST">
				</form>
				<div class="text-wrapper-5"
					onclick="document.getElementById('logoutForm').submit();">로그아웃</div>
			</div>
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
	<header class="header">
           <div class="container">
             <div class="link">
               <div class="w-e-d-d-i-n-g-c-h-o-wrapper">
                 <p class="w-e-d-d-i-n-g-c-h-o">W e d d i n g&nbsp;&nbsp;&nbsp;&nbsp;C h o i c e</p>
               </div>
             </div>
           </div>
   	</header>
   	<div class="rectangle-wrapper"><img class="rectangle" src="<%= request.getContextPath() %>/page_img/mainPage_img/rectangle-15.png" /></div>
	<div class="frame-wrapper">
		<div class="frame-4">
			<img class="icon" src="<%= request.getContextPath() %>/page_img/mainPage_img/icon.svg" />
			<div class="frame-5">
				<div class="frame-6">
					<a href="#" class="image-background" style="background-image: url('<%= request.getContextPath() %>/page_img/mainPage_img/image-background.svg');"></a>
					<div class="text-wrapper-6">스튜디오</div>
				</div>
	       		<div class="frame-6">
	         		<a href="#" class="image-background-2" style="background-image: url('<%= request.getContextPath() %>/page_img/mainPage_img/image-background-1.svg');"></a>
	         		<div class="text-wrapper-6">드레스</div>
	       		</div>
	       		<div class="frame-6">
	         		<a href="#" class="image-background-3" style="background-image: url('<%= request.getContextPath() %>/page_img/mainPage_img/image-background-2.svg');"></a>
	         		<div class="text-wrapper-6">웨딩홀</div>
	       		</div>
	       		<div class="frame-6">
	         		<a href="#" class="image-background-4" style="background-image: url('<%= request.getContextPath() %>/page_img/mainPage_img/image-background-3.svg');"></a>
	         		<div class="text-wrapper-6">메이크업</div>
	       		</div>
	     	</div>
	     	<img class="img" src="<%= request.getContextPath() %>/page_img/mainPage_img/icon-1.svg" />
	   </div>
</body>
</html>
