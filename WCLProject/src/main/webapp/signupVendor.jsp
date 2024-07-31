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
					<br><br>
						<form id="signup_vendor" action="JoinService_Vendor" method="post"
							onsubmit="return validateForm()">
							<div class="view-3">
								<div class="label-margin">
									<div class="label">
										<div class="text-wrapper-25">기업명</div>
									</div>
								</div>
								<div class="container-wrapper">
									<div class="container-7">
										<div class="input">
											<input type="text" id="vendor_name" name="vendor_name"
												style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
												required>
										</div>
										<div class="label-wrapper">
											<div class="label-2">
												<div class="container-8"></div>
											</div>
										</div>
									</div>
								</div>
								<div class="container-9"></div>
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
											placeholder="우편번호">
										<!-- 주쇼 API -->
										<input type="button" onclick="vendor_execDaumPostcode()"
											style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
											value="우편번호 찾기"><br>
										<!-- 주쇼 API -->
										<input type="text" id="vendor_address" name="vendor_address"
											style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
											placeholder="주소"><br>
										<!-- 주쇼 API -->
										<input type="text" id="vendor_detailAddress"
											style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
											name="vendor_detailAddress" placeholder="상세주소">
										<!-- 주쇼 API -->
										<input type="text" id="vendor_extraAddress"
											style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
											name="vendor_extraAddress" placeholder="참고항목">
										<!-- 주쇼 API -->
									</div>
								</div>
							</div>
							<br> <br> <br> <br> <br> <br> <br>
							<br> <br> <br> <br>
							<div class="view-5">
								<div class="label-margin-2">
									<div class="label-3">
										<div class="text-wrapper-25">아아디</div>
									</div>
								</div>
								<div class="input-3">
									<input type="text" id="vendor_id" name="vendor_id"
										style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
										required>
									<div id="vendor_id_result"></div>
								</div>
								<br>
								<div class="vertical-border">
									<button class="button" onclick="checkVendorId()">
										<div class="text-wrapper-26">중복확인</div>
									</button>
								</div>
								<div class="container-10">
									<div class="container-11">
										<p class="text-wrapper-27">※ 아이디는 4~12자 사이로 입력해주세요.</p>
									</div>
								</div>
							</div>
							<br>
							<div class="view-5">
								<div class="label-margin-2">
									<div class="label-3">
										<div class="text-wrapper-25">비밀번호</div>
									</div>
								</div>
								<div class="input-3">
									<input type="password" id="vendor_pw" name="vendor_pw"
										style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
										required>
								</div>
								<div class="container-10">
									<div class="container-11">
										<p class="text-wrapper-27">※ 비밀번호는 8~12자 사이로 입력해주세요.</p>
									</div>
								</div>
							</div>
							<br>
							<div class="view-5">
								<div class="label-margin-2">
									<div class="label-3">
										<div class="text-wrapper-25">비밀번호 확인</div>
									</div>
								</div>
								<div class="input-3">
									<input type="password" id="vendor_pw_check"
										name="vendor_pw_check"
										style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
										required>
									<div id="vendor_pw_result"></div>
								</div>
								<div class="vertical-border">
									<button class="button" onclick="checkVendorPw()">
										<div class="text-wrapper-26">중복확인</div>
									</button>
								</div>
							</div>
							<br>
							<div class="view-5">
								<div class="label-margin-2">
									<div class="label-3">
										<div class="text-wrapper-25">사업자 번호</div>
									</div>
								</div>
								<div class="input-3">
									<input type="text" id="vendor_license" name="vendor_license"
										style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
										required>
									<div id="vendor_license_result"></div>
								</div>
								<div class="vertical-border">
									<button class="button" onclick="checkLicense()">
										<div class="text-wrapper-26">중복확인</div>
									</button>
								</div>
							</div>
							<br>
							<div class="view-5">
								<div class="label-margin-2">
									<div class="label-3">
										<div class="text-wrapper-25">이메일 주소</div>
									</div>
								</div>
								<div class="input-3">
									<input type="email" id="vendor_email" name="vendor_email"
										style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
										required>
								</div>
							</div>
							<br>
							<div class="view-6">
								<div class="label-margin-3">
									<div class="label">
										<div class="text-wrapper-25">연락처</div>
									</div>
								</div>
								<div class="container-12">
									<div class="input-4">
										<input type="tel" id="vendor_tel" name="vendor_tel"
											style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
											required>
									</div>
								</div>
							</div>
							<br>
							<div class="view-6">
								<div class="label-margin">
									<div class="label">
										<div class="text-wrapper-25">업종</div>
									</div>
								</div>
								<div class="container-wrapper">
									<div class="options-wrapper">
										<select id="vendor_category" name="vendor_category"
											style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
											required>
											<option value="웨딩홀">웨딩홀</option>
											<option value="스튜디오">스튜디오</option>
											<option value="드레스">드레스</option>
											<option value="메이크업">메이크업</option>
										</select>
									</div>
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
											required>
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
											required>
									</div>
								</div>
								<div class="container-14">
									<div class="container-11">
										<div class="text-wrapper-27">※ 4,000자 이내로 작성해주세요.</div>
									</div>
								</div>
							</div>
							<div
								style="text-align: center; margin-top: 200px; height: 500px;">
								<button type="submit"
									style="background-color: red; color: white; padding: 10px 20px; border: none; border-radius: 5px; font-size: 16px;">
									가입신청</button>
							</div>
						</form>
						<form id="upload_files_form" action="FileUploadService"
							method="post" enctype="multipart/form-data"
							style="margin-top: -680px">
							<div class="view-5">
								<div class="label-margin-2">
									<div class="label-3">
										<div class="text-wrapper-25">사업자등록증 첨부</div>
									</div>
								</div>
								<input type="file" id="vendor_license_image_file"
									name="vendor_license_image_file"> <input type="hidden"
									id="vendor_license_image" name="vendor_license_image">
								<div class="container-10">
									<div class="container-11">
										<div class="text-wrapper-27">※ 원본 스캔 후 첨부해주세요.</div>
									</div>
								</div>
							</div>
							<br>
							<div class="view-5">
								<div class="label-margin-2">
									<div class="label-3">
										<div class="text-wrapper-25">기업 로고 첨부</div>
									</div>
								</div>
								<input type="file" id="vendor_logo_image_file"
									name="vendor_logo_image_file"> <input type="hidden"
									id="vendor_logo_image" name="vendor_logo_image"> <br>
								<div class="container-10">
									<div class="container-11">
										<p class="text-wrapper-27">※ 해당 업체만 등록해주세요.</p>
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
		// 아이디 중복 확인
		function checkVendorId() {
			var vendor_id = $('#vendor_id').val();

			$.ajax({
				url : 'CheckVendorIdService',
				type : 'POST',
				data : {
					vendor_id : vendor_id
				},
				success : function(response) {
					console.log('Response:', response);

					response = response.trim();
					if (response === '생성 가능') {
						$('#vendor_id_result').text(response).css('color',
								'green');
					} else {
						$('#vendor_id_result').text(response).css('color',
								'red');
					}
				},
				error : function() {
					$('#vendor_id_result').text('오류가 발생했습니다. 다시 시도해주세요.').css(
							'color', 'red');
				}
			});
		}

		// 비밀번호 확인
		function checkVendorPw() {
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

		// 사업자번호 중복확인
		function checkLicense() {
			var vendor_license = $('#vendor_license').val();

			if (vendor_license.length !== 10) {
				$('#vendor_license_result').text("사업자번호는 10자리여야 합니다").css(
						'color', 'red');
				return;
			}

			$.ajax({
				url : 'CheckLicenseService',
				type : 'POST',
				data : {
					vendor_license : vendor_license
				},
				success : function(response) {
					console.log('Response:', response);

					response = response.trim();
					if (response === '생성 가능') {
						$('#vendor_license_result').text(response).css('color',
								'green');
					} else {
						$('#vendor_license_result').text(response).css('color',
								'red');
					}
				},
				error : function() {
					$('#vendor_license_result').text('오류가 발생했습니다. 다시 시도해주세요.')
							.css('color', 'red');
				}
			});
		}

		// 파일 업로드
		// 문서가 완전히 로드된 후 스크립트 실행
		$(document)
				.ready(
						function() {
							// 파일 업로드 비동기 처리
							window.uploadFiles = function(callback) {
								/*var formData = new FormData(document
								 .getElementById('upload_files_form')); */
								var formElement = document
										.getElementById('upload_files_form');
								var formData = new FormData(formElement);

								// 추가 필드 포함
								formData.append('vendor_id', $('#vendor_id')
										.val());

								$.ajax({
									url : 'FileUploadService',
									type : 'POST',
									data : formData,
									contentType : false,
									processData : false,
									success : function(response) {
										// 서버에서 파일 업로드 경로를 받았다면 콜백 함수 호출
										callback(response);
									},
									error : function() {
										alert('파일 업로드 실패');
									}
								});
							}

							// 회원가입 전 업로드 확인
							window.validateForm = function() {
								var vendorLicenseFile = document
										.getElementById('vendor_license_image_file').files.length;
								if (vendorLicenseFile === 0) {
									alert('사업자등록증 이미지를 업로드해야 합니다.');
									return false;
								}
								return true;
							}

							// 폼 제출 처리
							$('#signupVendor')
									.submit(
											function(event) {
												event.preventDefault(); // 기본 폼 제출 방지

												if (!validateForm()) {
													return; // 유효성 검사 실패 시 제출 중지
												}

												uploadFiles(function(filePaths) {
													// 파일 업로드 경로를 폼에 추가
													$('#vendor_license_image')
															.val(
																	filePaths.licenseImagePath);
													$('#vendor_logo_image')
															.val(
																	filePaths.logoImagePath);

													// 회원가입 폼 제출
													this.submit(); // 폼을 실제로 제출
												}.bind(this));
											});
						});

		//여러개의 form 하나로 병합
		document.getElementById('submit_all_forms').addEventListener('click', function(e) {
    e.preventDefault(); // 기본 폼 제출 동작을 막습니다.

    var formData = new FormData();

    // 첫 번째 폼의 데이터 추가
    var firstForm = document.getElementById('signup_vendor_firstForm');
    var firstFormData = new FormData(firstForm);
    firstFormData.forEach((value, key) => {
        formData.append(key, value);
    });

    // 두 번째 폼의 데이터 추가
    var secondForm = document.getElementById('signup_vendor_secondForm');
    var secondFormData = new FormData(secondForm);
    secondFormData.forEach((value, key) => {
        formData.append(key, value);
    });

    // 세 번째 폼의 데이터 추가 (이 폼은 숨겨진 폼이므로 보통은 데이터가 없음)
    var thirdForm = document.getElementById('signup_vendor_threeForm');
    var thirdFormData = new FormData(thirdForm);
    thirdFormData.forEach((value, key) => {
        formData.append(key, value);
    });

 	// 절대 경로로 URL 설정
    var url = `JoinService_Vendor`;

    // 모든 데이터를 하나의 요청으로 전송
    fetch(url, {
        method: 'POST',
        body: formData
    }).then(function(response) {
        if (response.ok) {
            return response.json(); // 서버에서 JSON 응답을 반환하는 경우
        } else {
            throw new Error('데이터 전송 실패');
        }
    }).then(function(data) {
        alert("모든 데이터가 성공적으로 전송되었습니다.");
        console.log(data); // 서버의 응답 데이터 확인
    }).catch(function(error) {
        console.error('Error:', error);
    });
});
		
		
		
		
		
		// 도로명주소찾기 스크립트
		function vendor_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("vendor_extraAddress").value = extraAddr;

							} else {
								document.getElementById("vendor_extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('vendor_postcode').value = data.zonecode;
							document.getElementById("vendor_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("vendor_detailAddress")
									.focus();
						}
					}).open();
		}
	</script>


</body>
</html>
