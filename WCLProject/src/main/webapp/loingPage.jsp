<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/loginPage_globals.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/loginPage_styleguide.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/loginPage_style.css" />	
</head>
<body>
	<div class="login">
		<div class="div">
			<header>
				<jsp:include page="header2.jsp" />
			</header>
			<div class="background-shadow">
				<div class="form">
					<div class="horizontal-border">
						<p class="div-3"></p>
						<div class="text-wrapper-22">웨딩초이스 로그인</div>
					</div>
					<div class="fieldset">
						<div class="container-5">
							<div class="background-border">
								<div class="input">
									<div class="div-wrapper">
										<div class="text-wrapper-23">아이디</div>
									</div>
								</div>
								<div class="input">
									<div class="div-wrapper">
										<div class="text-wrapper-23">비밀번호</div>
									</div>
								</div>
							</div>
							<button class="button">
								<div class="text-wrapper-24">로그인</div>
							</button>
						</div>
						<div class="label">
							<div class="border"></div>
							<div class="text-wrapper-25">로그인 유지</div>
						</div>
					</div>
					<div class="list-wrapper">
						<div class="list-2">
							<div class="item-link">
								<div class="text-wrapper-26">회원가입을 하시려면 여기를 클릭하세요.</div>
								<img class="background"
									src="${pageContext.request.contextPath}/page_img/loginPage_img/background.svg" />
							</div>
							<div class="item-link-2">
								<div class="text-wrapper-27">아이디 혹은 비밀번호를 잊으셨나요?</div>
								<img class="background-2"
									src="${pageContext.request.contextPath}/page_img/loginPage_img/background-1.svg" />
							</div>
						</div>
					</div>
				</div>
				<div class="#">
					<a href="javascript:kakaoLogin();"> <img
						src="${pageContext.request.contextPath}/page_img/loginPage_img/kakao_login_large_wide.png"
						width="400" height="70" alt="카카오톡 간편로그인 버튼">
					</a>
				</div>

				<div class="background-3"></div>
			</div>
		</div>
	</div>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		// Initialize the Kakao SDK
		window.Kakao.init("ca86f087f3c4b3dacde14170e15c6291");

		function kakaoLogin() {
			window.Kakao.Auth.login({
				scope : 'profile_nickname, account_email',
				success : function(authObj) {
					console.log(authObj);
					window.Kakao.API.request({
						url : '/v2/user/me',
						success : function(res) {
							const kakao_account = res.kakao_account;
							console.log(kakao_account);
						}
					});
				},
				fail : function(error) {
					console.error(error);
				}
			});
		}
	</script>
</body>
</html>
