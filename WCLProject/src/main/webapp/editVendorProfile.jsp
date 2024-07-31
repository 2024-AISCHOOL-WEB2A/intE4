<%@page import="com.WCLProject.model.DTO.VendorMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/signupVendor_globals.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/signupVendor_styleguide.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/signupVendor_style.css" />
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
						<form id="update_vendor_profile"
							action="UpdateVendorProfileService" method="post" onsubmit="">
							<%
							VendorMemberDTO vendor = (VendorMemberDTO) session.getAttribute("vendorInfo");
							String name = vendor.getName();
							String address = vendor.getAddress();
							String email = vendor.getEmail();
							String tel = vendor.getTel();
							String url = vendor.getSite_url();
							String intro = vendor.getIntro();
							%>
							<div class="view-3">
								<div class="label-margin">
									<div class="label">
										<div class="text-wrapper-25">이름</div>
									</div>
								</div>
								<div class="container-wrapper">
									<div class="container-7">
										<div class="input">
											<input type="text" id="vendor_name" name="vendor_name"
												style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
												value="<%=name%>" readonly>
										</div>
									</div>
								</div>
							</div>
							<br>

							<div class="view-4">
								<div class="label-margin">
									<div class="label">
										<div class="text-wrapper-25">기업 주소</div>
									</div>
								</div>
								<div class="input-wrapper">
									<div class="input-2">
										<input type="text" id="vendor_postcode" name="vendor_postcode"
											style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
											placeholder="우편번호" required> <input type="button"
											onclick="vendor_execDaumPostcode()"
											style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
											value="우편번호 찾기"><br> <input type="text"
											id="vendor_address" name="vendor_address"
											style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
											placeholder="주소" required><br> <input
											type="text" id="vendor_detailAddress"
											name="vendor_detailAddress"
											style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
											placeholder="상세주소" value="<%=address%>"> <input
											type="text" id="vendor_extraAddress"
											name="vendor_extraAddress"
											style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
											placeholder="참고항목">
									</div>
								</div>
							</div>
							<br> <br> <br> <br> <br> <br> <br>
							<br> <br> <br> <br>
							<div class="view-5">
								<div class="label-margin-2">
									<div class="label-3">
										<div class="text-wrapper-25">이메일 주소</div>
									</div>
								</div>
								<div class="input-3">
									<input type="email" id="vendor_email" name="vendor_email"
										style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
										value="<%=email%>" required>
								</div>
							</div>
							<br>
							<div class="view-6">
								<div class="label-margin">
									<div class="label">
										<div class="text-wrapper-25">연락처</div>
									</div>
								</div>
								<div class="container-12">
									<div class="input-4">
										<input type="tel" id="vendor_tel" name="vendor_tel"
											style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
											value="<%=tel%>" required>
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
									<input type="password" id="vendor_pw" name="vendor_pw"
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
									<input type="password" id="vendor_pw_check" name="vendor_pw_check"
										style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
										required>
									<div id="vendor_pw_result"></div>
								</div>
								<div class="vertical-border">
									<button type="button" class="button" onclick="checkUserPw()">
										<div class="text-wrapper-26">중복확인</div>
									</button>
								</div>
							</div>
							<br>
							<div class="view-4">
								<div class="label-margin">
									<div class="label">
										<div class="text-wrapper-25">기업 홈페이지 주소</div>
									</div>
								</div>
								<div class="input-wrapper">
									<div class="input-5">
										<input type="text" id="vendor_site_url" name="vendor_site_url"
											style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
											value="<%=url%>" required>
									</div>
								</div>
							</div>
							<br>
							<div class="view-7">
								<div class="label-margin">
									<div class="label">
										<div class="text-wrapper-25">기업 소개</div>
									</div>
								</div>
								<div class="input-wrapper">
									<div class="input-2">
										<input type="text" id="vendor_intro" name="vendor_intro"
											style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
											value="<%=intro%>" required>
									</div>
								</div>
								<div class="container-14">
									<div class="container-11">
										<div class="text-wrapper-27">※ 4,000자 이내로 작성해주세요.</div>
									</div>
								</div>
							</div>
							<br>
							<div class="view-7">
								<div
									style="display: flex; justify-content: center; margin-top: 50px;">
									<button type="submit"
										style="background-color: red; color: white; padding: 10px 20px; border: none; border-radius: 5px; font-size: 16px;">
										정보 수정</button>
								</div>
							</div>
						</form>
						<br> <br> <br>
						<!-- 로고 업로드 폼 -->
						<form id="upload_logo_form" action="UpdateLogoService"
							method="post" enctype="multipart/form-data">
							<div class="view-5">
								<div class="label-margin-2">
									<div class="label-3">
										<div class="text-wrapper-25">기업 로고 첨부</div>
									</div>
								</div>
								<input type="file" id="vendor_logo_image_file"
									name="vendor_logo_image_file"> <input type="hidden"
									id="vendor_logo_image" name="vendor_logo_image">
								<div class="container-10">
									<div class="container-11">
										<p class="text-wrapper-27">※ 해당 업체의 로고만 등록해주세요.</p>
									</div>
								</div>
							</div>
						</form>
						<br>
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
		var p1 = document.getElementById("vendor_pw").value;
		var p2 = document.getElementById("vendor_pw_check").value;

		if (p1.length < 8) {
			$('#vendor_pw_result').text("비밀번호는 최소 8자리 이상이어야 합니다").css(
					'color', 'red');
			return;
		}

		if (p1 == p2) {
			$('#vendor_pw_result').text("비밀번호 일치").css('color', 'green');
		} else {
			$('#vendor_pw_result').text("비밀번호 불일치").css('color', 'red');
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