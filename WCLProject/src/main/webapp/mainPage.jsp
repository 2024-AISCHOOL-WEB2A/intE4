<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mainPage_globals.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mainPage_styleguide.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mainPage_style.css" />
</head>
<body>
	<header>
		<jsp:include page="header.jsp" />
	</header>
	<div class="main">
		<div class="div">
			<div class="frame">
				<header class="header">
					<div class="container">
						<div class="link">
							<div class="w-e-d-d-i-n-g-c-h-o-wrapper">
								<p class="w-e-d-d-i-n-g-c-h-o">W e d d i n
									g&nbsp;&nbsp;&nbsp;&nbsp;C h o i c e</p>
							</div>
						</div>
					</div>
				</header>
			</div>
			<div class="rectangle-wrapper">
				<img class="rectangle"
					src="${pageContext.request.contextPath}/page_img/mainPage_img/rectangle-15.png" />
			</div>
			<div class="frame-wrapper">
				<div class="frame-4">
					<img class="icon"
						src="${pageContext.request.contextPath}/page_img/mainPage_img/icon.svg" />
					<div class="frame-5">
						<div class="frame-6">
							<a href="studios.jsp" class="image-background" style="background-image: url('<%= request.getContextPath() %>/page_img/mainPage_img/image-background.svg');"></a>
							<div class="text-wrapper-99">스튜디오</div>
						</div>
						<div class="frame-6">
	         				<a href="dresses.jsp" class="image-background-2" style="background-image: url('<%= request.getContextPath() %>/page_img/mainPage_img/image-background-1.svg');"></a>
							<div class="text-wrapper-99">드레스</div>
						</div>
						<div class="frame-6">
	         				<a href="weddinghalls.jsp" class="image-background-3" style="background-image: url('<%= request.getContextPath() %>/page_img/mainPage_img/image-background-2.svg');"></a>
							<div class="text-wrapper-99">웨딩홀</div>
						</div>
						<div class="frame-6">
	         				<a href="makeups.jsp" class="image-background-4" style="background-image: url('<%= request.getContextPath() %>/page_img/mainPage_img/image-background-3.svg');"></a>
							<div class="text-wrapper-99">메이크업</div>
						</div>
					</div>
					<img class="img"
						src="${pageContext.request.contextPath}/page_img/mainPage_img/icon-1.svg" />
				</div>
			</div>
			<div class="frame-7">
				<div class="view-wrapper">
					<div class="div-wrapper">
						<div class="frame-8">
							<div class="view-2">
								<div class="text-wrapper-6">드레스 라인</div>
								<div class="frame-9">
									<div class="group">
										<img class="rectangle-2"
											src="${pageContext.request.contextPath}/page_img/mainPage_img/rectangle-19.png" />
										<p class="p">
											<span class="span">플로렌스웨딩<br />
											<br /></span> <span class="text-wrapper-7">깨끗하고 포인트 있는 드레스</span>
										</p>
									</div>
									<div class="group-2">
										<img class="rectangle-2"
											src="${pageContext.request.contextPath}/page_img/mainPage_img/rectangle-20.png" />
										<p class="div-2">
											<span class="span">제시카로렌<br />
											<br /></span> <span class="text-wrapper-7">단아하고 클래식한 무드</span>
										</p>
									</div>
									<div class="group-3">
										<img class="rectangle-2"
											src="${pageContext.request.contextPath}/page_img/mainPage_img/rectangle-21.png" />
										<p class="div-3">
											<span class="span">모네뜨아르<br />
											<br /></span> <span class="text-wrapper-7">수입, 자체제작 드레스</span>
										</p>
									</div>
									<div class="group-4">
										<img class="rectangle-2"
											src="${pageContext.request.contextPath}/page_img/mainPage_img/rectangle-22.png" />
										<p class="div-3">
											<span class="span">클라라웨딩<br />
											<br /></span> <span class="text-wrapper-7">소녀스럽고 러블리한 이미지</span>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="view-3">
					<div class="view-4">
						<div class="frame-10">
							<div class="text-wrapper-8">스튜디오 라인</div>
							<div class="frame-9">
								<div class="group-5">
									<img class="rectangle-3"
										src="${pageContext.request.contextPath}/page_img/mainPage_img/rectangle-19-1.png" />
									<p class="div-4">
										<span class="span">헤리티지포토그라피<br />
										<br /></span> <span class="text-wrapper-7">한 편의 영화 주인공</span>
									</p>
								</div>
								<div class="group-5">
									<img class="rectangle-4"
										src="${pageContext.request.contextPath}/page_img/mainPage_img/rectangle-20-1.png" />
									<p class="div-4">
										<span class="span">가을 스튜디오<br />
										<br /></span> <span class="text-wrapper-7">인물중심의 자연스러움</span>
									</p>
								</div>
								<div class="group-5">
									<img class="rectangle-4"
										src="${pageContext.request.contextPath}/page_img/mainPage_img/rectangle-21-1.png" />
									<p class="div-4">
										<span class="span">이포토에세이<br />
										<br /></span> <span class="text-wrapper-7">심플하고 고급스러운 사진</span>
									</p>
								</div>
								<div class="group-6">
									<img class="rectangle-3"
										src="${pageContext.request.contextPath}/page_img/mainPage_img/rectangle-22-1.png" />
									<p class="div-4">
										<span class="span">세미앙<br />
										<br /></span> <span class="text-wrapper-7">야외, 인물사진 등 다양한 컨셉</span>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="view-wrapper">
					<div class="view-4">
						<div class="frame-10">
							<div class="text-wrapper-8">메이크업 라인</div>
							<div class="frame-9">
								<div class="group-5">
									<img class="rectangle-3"
										src="${pageContext.request.contextPath}/page_img/mainPage_img/rectangle-19-2.png" />
									<p class="div-4">
										<span class="span">제니하우스<br />
										<br /></span> <span class="text-wrapper-7">개성, 고급스러움, 색조</span>
									</p>
								</div>
								<div class="group-5">
									<img class="rectangle-3"
										src="${pageContext.request.contextPath}/page_img/mainPage_img/rectangle-20-2.png" />
									<p class="div-4">
										<span class="span">비올<br />
										<br /></span> <span class="text-wrapper-7">깔끔하고 고급스러운 느낌</span>
									</p>
								</div>
								<div class="group-5">
									<img class="rectangle-3"
										src="${pageContext.request.contextPath}/page_img/mainPage_img/rectangle-21-2.png" />
									<p class="div-4">
										<span class="span">꾸띠원<br />
										<br /></span> <span class="text-wrapper-7">청순, 트렌디, 깨끗</span>
									</p>
								</div>
								<div class="group-6">
									<img class="rectangle-3"
										src="${pageContext.request.contextPath}/page_img/mainPage_img/rectangle-22-2.png" />
									<p class="div-4">
										<span class="span">김청경헤어페이스<br />
										<br /></span> <span class="text-wrapper-7">자연스러운 음영메이크업</span>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="view-5">
					<div class="view-4">
						<div class="frame-10">
							<div class="text-wrapper-8">웨딩홀 라인</div>
							<div class="frame-9">
								<div class="group-5">
									<img class="rectangle-3"
										src="${pageContext.request.contextPath}/page_img/mainPage_img/rectangle-19-3.png" />
									<p class="div-4">
										<span class="span">더파티움<br />
										<br /></span> <span class="text-wrapper-7">교회 분위기의 넓은 공간</span>
									</p>
								</div>
								<div class="group-5">
									<img class="rectangle-4"
										src="${pageContext.request.contextPath}/page_img/mainPage_img/rectangle-20-3.png" />
									<p class="div-4">
										<span class="span">토브헤세드<br />
										<br /></span> <span class="text-wrapper-7">나만의 프라이빗한 맞춤웨딩</span>
									</p>
								</div>
								<div class="group-5">
									<img class="rectangle-4"
										src="${pageContext.request.contextPath}/page_img/mainPage_img/rectangle-21-3.png" />
									<p class="div-4">
										<span class="span">더채플앳<br />
										<br /></span> <span class="text-wrapper-7">교회 분위기의 넓은 공간</span>
									</p>
								</div>
								<div class="group-6">
									<img class="rectangle-3"
										src="${pageContext.request.contextPath}/page_img/mainPage_img/rectangle-22-3.png" />
									<p class="div-4">
										<span class="span">포레스트한울<br />
										<br /></span> <span class="text-wrapper-7">영원히 기억될 유일한 순간</span>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<footer class="footer">
				<div class="overlap-group">
					<div class="container-2">
						<div class="text-wrapper-9">Lisianthus</div>
						<div class="text-wrapper-10">(주)인트이사</div>
						<div class="text-wrapper-11">대표이사 김현수</div>
						<p class="text-wrapper-12">COPYRIGHT ©2024 SINBUYA ALL RIGHTS
							RESERVED.</p>
					</div>
					<p class="w-e-d-d-i-n-g-c-h-o-2">W e d d i n g&nbsp;&nbsp;C h o
						i c e</p>
				</div>
				<div class="container-3">
					<div class="text-wrapper-13">Information</div>
					<div class="text-wrapper-14">사업자등록번호 777 88 00999</div>
					<div class="text-wrapper-15">통신판매업신고 제2024-광주북구-00001호</div>
					<p class="div-5">
						<span class="text-wrapper-16">개인정보관리책임자 </span> <span
							class="text-wrapper-17">정수형</span>
					</p>
				</div>
				<div class="container-4">
					<div class="list">
						<div class="text-wrapper-18">이용약관</div>
						<div class="text-wrapper-19">개인정보처리방침</div>
						<div class="text-wrapper-20">회사소개</div>
						<div class="text-wrapper-21">오시는 길</div>
					</div>
					<div class="text-wrapper-22">Contact Us</div>
					<div class="element">오전 9:00 -&nbsp;&nbsp;18:00 (월요일-금요일)</div>
					<p class="t-f">
						<span class="text-wrapper-23">T</span> <span
							class="text-wrapper-24"> 062-123-4567   |   </span> <span
							class="text-wrapper-23">F</span> <span class="text-wrapper-24">
							062-123-4568</span>
					</p>
					<p class="text-wrapper-25">광주광역시 동구 동천동 인공지능사관학교 2층</p>
				</div>
			</footer>
		</div>
	</div>



	<script>
		// 로그인 페이지로 이동
		function moveToLogin() {
			window.location.href = '${pageContext.request.contextPath}/LoginWcl.jsp';
		}
		
		// 회원가입 페이지로 이동
		function moveToJoinMemberSelect() {
			window.location.href = '${pageContext.request.contextPath}/joinMemberSelect.jsp';
		}
	</script>
</body>
</html>
