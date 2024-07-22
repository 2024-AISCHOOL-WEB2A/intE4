<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입_기업</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.signup-form {
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.signup-form h2 {
	margin-bottom: 20px;
}

.form-group {
	margin-bottom: 15px;
}

.form-group label {
	display: block;
	margin-bottom: 5px;
}

.form-group input {
	width: 100%;
	padding: 8px;
	box-sizing: border-box;
}

.form-group button {
	width: 100%;
	padding: 10px;
	background-color: #5cb85c;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.form-group button:hover {
	background-color: #4cae4c;
}
</style>
</head>
<body>
	<h2>기업회원 가입</h2>
	<form action="JoinService_Vendor" method="post" enctype="multipart/form-data">
		<div class="form-group">
			<label for="vendor_id">기업 ID:</label> <input type="text"
				id="vendor_id" name="vendor_id" required>
			<button onclick="checkId()">중복 확인</button>
			<div id="vendor_id_result"></div>
		</div>
		<div class="form-group">
			<label for="vendor_pw">비밀번호:</label> <input type="password"
				id="vendor_pw" name="vendor_pw" required>
		</div>
		<div class="form-group">
			<label for="vendor_pw_check">비밀번호 확인:</label> <input type="password"
				id="vendor_pw_check" name="vendor_pw_check" required>
			<button type="button" onclick="checkPw()">비밀번호 확인</button>
			<div id="vendor_pw_result"></div>
		</div>
		<div class="form-group">
			<label for="vendor_name">기업명:</label> <input type="text"
				id="vendor_name" name="vendor_name" required>
		</div>
		<div class="form-group">
			<label for="vendor_tel">전화번호:</label> <input type="text"
				id="vendor_tel" name="vendor_tel" required>
		</div>
		<div class="form-group">
			<label for="vendor_email">이메일:</label> <input type="email"
				id="vendor_email" name="vendor_email" required>
		</div>
		<div class="form-group">
			<label for="vendor_address">주소:</label> <input type="text"
				id="vendor_postcode" name="vendor_postcode" placeholder="우편번호">
			<!-- 주쇼 API -->
			<input type="button" onclick="vendor_execDaumPostcode()"
				value="우편번호 찾기"><br>
			<!-- 주쇼 API -->
			<input type="text" id="vendor_address" name="vendor_address"
				placeholder="주소"><br>
			<!-- 주쇼 API -->
			<input type="text" id="vendor_detailAddress"
				name="vendor_detailAddress" placeholder="상세주소">
			<!-- 주쇼 API -->
			<input type="text" id="vendor_extraAddress"
				name="vendor_extraAddress" placeholder="참고항목">
			<!-- 주쇼 API -->
		</div>
		<div class="form-group">
			<label for="vendor_license">사업자번호:</label> <input type="text"
				id="vendor_license" name="vendor_license">
			<button type="button" onclick="checkLicense()">사업자번호 확인</button>
			<div id="vendor_license_result"></div>
		</div>
		<div class="form-group">
			<label for="vendor_category">업종:</label> <select id="vendor_category"
				name="vendor_category">
				<option value="웨딩홀">웨딩홀</option>
				<option value="스튜디오">스튜디오</option>
				<option value="드레스">드레스</option>
				<option value="메이크업">메이크업</option>
			</select>
		</div>
		<div class="form-group">
			<label for="vendor_license_image">사업자등록증이미지:</label> <!-- <input
				type="text" id="vendor_license_image" name="vendor_license_image"> -->
				<input type="file" name="vendor_license_file">
		</div>
		<div class="form-group">
			<label for="vendor_logo_image">기업로고이미지:</label> <!-- <input type="text"
				id="vendor_logo_image" name="vendor_logo_image"> -->
				<input type="file" name="vendor_logo_file">
		</div>
		<div class="form-group">
			<label for="vendor_intro">소개:</label> <input type="text"
				id="vendor_intro" name="vendor_intro">
		</div>
		<div class="form-group">
			<label for="vendor_site_url">기업홈페이지:</label> <input type="text"
				id="vendor_site_url" name="vendor_site_url">
		</div>
		<div class="form-group">
			<button type="submit">회원가입</button>
		</div>
	</form>

	<!-- 주소 API -->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<!-- jQuery 라이브러리 추가 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		function checkId() {
			var vendor_id = $('#vendor_id').val();

			$.ajax({
				url : 'CheckIdService',
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
	</script>
	<script>
		function checkPw() {
			var p1 = document.getElementById("vendor_pw").value;
			var p2 = document.getElementById("vendor_pw_check").value;
            
			if (p1.length < 8) {
                $('#vendor_pw_result').text("비밀번호는 최소 8자리 이상이어야 합니다").css('color', 'red');
                return;
            }
			
			if (p1 == p2) {
				$('#vendor_pw_result').text("비밀번호 일치").css('color', 'green');
			} else {
				$('#vendor_pw_result').text("비밀번호 불일치").css('color', 'red');
			}
		}
	</script>
	<script>
		function checkLicense() {
			var vendor_license = $('#vendor_license').val();

            if (vendor_license.length !== 10) {
                $('#vendor_license_result').text("사업자번호는 10자리여야 합니다").css('color', 'red');
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
					$('#vendor_license_result').text('오류가 발생했습니다. 다시 시도해주세요.').css(
							'color', 'red');
				}
			});
		}
	</script>
	<script>
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