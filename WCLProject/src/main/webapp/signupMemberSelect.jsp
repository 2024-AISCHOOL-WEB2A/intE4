<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/signupMemberSelect_globals.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/signupMemberSelect_styleguide.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/signupMemberSelect_style.css" />
</head>
<body>
	<header>
		<jsp:include page="header.jsp" />
	</header>
	<div class="member-select">
		<div class="div">
			<div class="container-5">
				<div class="heading">
					<div class="text-wrapper-21">일반회원&nbsp;&nbsp;/&nbsp;&nbsp;기업회원</div>
				</div>
				<div class="div-wrapper">
					<p class="text-wrapper-22">웨딩 초이스의 회원이 되시면 국내 최대의 리뷰와 웨딩 컬렉션
						할인정보, 웨딩홀 이벤트 등 다양한 정보를 확인하실 수 있습니다.</p>
				</div>
				<div class="background-border">
					<div class="background-border-wrapper">
						<div class="background-border-2">
							<img class="image"
								src="${pageContext.request.contextPath}/page_img/signupMemberSelect_img/image.png" />
							<div class="container-6">
								<a href="signupUser.jsp" class="text-wrapper-23">일반회원</a>
							</div>
						</div>
					</div>
					<div class="view-2">
						<div class="background-border-2">
							<img class="image"
								src="${pageContext.request.contextPath}/page_img/signupMemberSelect_img/image-1.png" />
							<div class="container-7">
								<a href="signupVendor.jsp" class="text-wrapper-23">기업회원</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<footer>
	<jsp:include page="footer.jsp" />
</footer>
</html>
