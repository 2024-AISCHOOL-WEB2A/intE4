<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입_일반</title>
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
	<h2>일반 회원 가입</h2>
	<form action="JoinService_User" method="post">
		<div class="form-group">
			<label for="user_id">ID:</label> <input type="text" id="user_id"
				name="user_id" required>
			<button type="button" onclick="checkUserId()">중복 확인</button>
			<div id="user_id_result"></div>
		</div>
		<div class="form-group">
			<label for="user_pw">비밀번호:</label> <input type="password"
				id="user_pw" name="user_pw" required>
		</div>
		<div class="form-group">
			<label for="user_pw_check">비밀번호 확인:</label> <input type="password"
				id="user_pw_check" name="user_pw_check" required>
			<button type="button" onclick="checkUserPw()">비밀번호 확인</button>
			<div id="user_pw_result"></div>
		</div>
		<div class="form-group">
			<label for="user_name">이름:</label> <input type="text" id="user_name"
				name="user_name" required>
		</div>
		<div class="form-group">
			<label for="user_rrn">주민번호 (뒤 첫번째 자리까지):</label> <input type="text"
				id="user_rrn" name="user_rrn" maxlength="7" required>
		</div>
		<div class="form-group">
			<label for="user_tel">전화번호:</label> <input type="text" id="user_tel"
				name="user_tel" required>
		</div>
		<div class="form-group">
			<label for="user_nick">닉네임:</label> <input type="text" id="user_nick"
				name="user_nick" required>
		</div>
		<div class="form-group">
			<label for="user_email">이메일:</label> <input type="email"
				id="user_email" name="user_email" required>
		</div>
		<div class="form-group">
			<label for="user_address">주소:</label> <input type="text"
				id="user_postcode" name="user_postcode" placeholder="우편번호">
			<input type="button" onclick="user_execDaumPostcode()"
				value="우편번호 찾기"><br> <input type="text"
				id="user_address" name="user_address" placeholder="주소"><br>
			<input type="text" id="user_detailAddress" name="user_detailAddress"
				placeholder="상세주소"> <input type="text"
				id="user_extraAddress" name="user_extraAddress" placeholder="참고항목">
		</div>
		<div class="form-group">
			<label for="user_referrer">추천인:</label> <input type="text"
				id="user_referrer" name="user_referrer">
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
		function checkUserId() {
			var user_id = $('#user_id').val();

			$
					.ajax({
						url : 'CheckUserIdService',
						type : 'POST',
						data : {
							user_id : user_id
						},
						success : function(response) {
							console.log('Response:', response);

							response = response.trim();
							if (response === '생성 가능') {
								$('#user_id_result').text(response).css(
										'color', 'green');
							} else {
								$('#user_id_result').text(response).css(
										'color', 'red');
							}
						},
						error : function() {
							$('#user_id_result').text('오류가 발생했습니다. 다시 시도해주세요.')
									.css('color', 'red');
						}
					});
		}
	</script>
	<script>
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
	</script>
	<script>
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
