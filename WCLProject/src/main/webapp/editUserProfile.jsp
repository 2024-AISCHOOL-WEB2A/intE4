<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.WCLProject.model.DTO.UserMemberDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/signupVendor_globals.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/signupVendor_styleguide.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/signupVendor_style.css" />
</head>
<title>회원정보 수정</title>
</head>
<body>
	<header>
		<jsp:include page="header2.jsp" />
	</header>
	<div class="business-membership">
		<div class="form-wrapper">
			<div class="form">
				<div class="fieldset">
					<div class="container-6">
						<br> <br>
						<form id="update_user" action="UpdateUserProfileService" method="post" onsubmit="">
							<%
							UserMemberDTO user = (UserMemberDTO) session.getAttribute("userInfo");
							String userName = user.getName();
							String userAddress = user.getAddress();
							String userEmail = user.getEmail();
							String userTel = user.getTel();
							String userNick = user.getNick();
							%>
							<!-- 이름 -->
							<div class="view-3">
								<div class="label-margin">
									<div class="label">
										<div class="text-wrapper-25">이름</div>
									</div>
								</div>
								<div class="container-wrapper">
									<div class="container-7">
										<div class="input">
											<input type="text" id="user_name" name="user_name"
												style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
												value="<%=userName%>" readonly>
										</div>
									</div>
								</div>
							</div>
							<br>
							<!-- 주소 -->
							<div class="view-4">
								<div class="label-margin">
									<div class="label">
										<div class="text-wrapper-25">주소</div>
									</div>
								</div>
								<div class="input-wrapper">
									<div class="input-2">
										<input type="text" id="user_postcode" name="user_postcode"
											style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
											placeholder="우편번호" value=""> <input type="button"
											onclick="user_execDaumPostcode()"
											style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
											value="우편번호 찾기"><br> <input type="text"
											id="user_address" name="user_address"
											style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
											placeholder="주소" value="<%=userAddress%>"><br> <input
											type="text" id="user_detailAddress"
											style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
											name="user_detailAddress" placeholder="상세주소" value="">
										<input type="text" id="user_extraAddress"
											style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
											name="user_extraAddress" placeholder="참고항목" value="">
									</div>
								</div>
							</div>
							<br> <br> <br> <br> <br> <br> <br>
							<br>
							<!-- 이메일 -->
							<div class="view-5">
								<div class="label-margin-2">
									<div class="label-3">
										<div class="text-wrapper-25">이메일 주소</div>
									</div>
								</div>
								<div class="input-3">
									<input type="email" id="user_email" name="user_email"
										style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
										value="<%=userEmail%>" required>
								</div>
							</div>
							<br>
							<!-- 연락처 -->
							<div class="view-6">
								<div class="label-margin-3">
									<div class="label">
										<div class="text-wrapper-25">연락처</div>
									</div>
								</div>
								<div class="container-12">
									<div class="input-4">
										<input type="tel" id="user_tel" name="user_tel"
											style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
											value="<%=userTel%>" required>
									</div>
								</div>
							</div>
							<br>
							<!-- 닉네임 -->
							<div class="view-4">
								<div class="label-margin">
									<div class="label">
										<div class="text-wrapper-25">닉네임</div>
									</div>
								</div>
								<div class="input-wrapper">
									<div class="input-5">
										<input type="text" id="user_nick" name="user_nick"
											style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
											value="<%=userNick%>" required>
									</div>
								</div>
							</div>
							<br>
							<!-- 비밀번호 -->
							<div class="view-5">
								<div class="label-margin-2">
									<div class="label-3">
										<div class="text-wrapper-25">비밀번호</div>
									</div>
								</div>
								<div class="input-3">
									<input type="password" id="user_pw" name="user_pw"
										style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
										placeholder="새 비밀번호를 입력하세요" required>
								</div>
							</div>
							<br>
							<!-- 비밀번호 확인 -->
							<div class="view-5">
								<div class="label-margin-2">
									<div class="label-3">
										<div class="text-wrapper-25">비밀번호 확인</div>
									</div>
								</div>
								<div class="input-3">
									<input type="password" id="user_pw_check" name="user_pw_check"
										style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
										required>
									<div id="user_pw_result"></div>
								</div>
								<div class="vertical-border">
									<button type="button" class="button" onclick="checkUserPw()">
										<div class="text-wrapper-26">중복확인</div>
									</button>
								</div>
							</div>
							<br>
							<div style="text-align: center; margin-top: 50px;">
								<button type="submit"
									style="background-color: red; color: white; padding: 10px 20px; border: none; border-radius: 5px; font-size: 16px;">
									정보 수정</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>

	<!-- 주소 API -->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<!-- jQuery 라이브러리 추가 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	
	// 비밀번호 중복 검사
	function checkUserPw() {
		var p1 = document.getElementById("user_pw").value;
		var p2 = document.getElementById("user_pw_check").value;

		if (p1.length < 8) {
			$('#user_pw_result').text("비밀번호는 최소 8자리 이상이어야 합니다").css(
					'color', 'red');
			return;
		}

		if (p1 == p2) {
			$('#user_pw_result').text("비밀번호 일치").css('color', 'green');
		} else {
			$('#user_pw_result').text("비밀번호 불일치").css('color', 'red');
		}
	}
	
		function user_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							var addr = '';
							var extraAddr = '';

							if (data.userSelectedType === 'R') {
								addr = data.roadAddress;
							} else {
								addr = data.jibunAddress;
							}

							if (data.userSelectedType === 'R') {
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								document.getElementById("user_extraAddress").value = extraAddr;

							} else {
								document.getElementById("user_extraAddress").value = '';
							}

							document.getElementById('user_postcode').value = data.zonecode;
							document.getElementById("user_address").value = addr;
							document.getElementById("user_detailAddress")
									.focus();
						}
					}).open();
		}
	</script>

</body>
</html>