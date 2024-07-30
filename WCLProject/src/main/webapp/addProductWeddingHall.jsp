<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/addProductDress.css" />
</head>
<body>
	<header>
		<jsp:include page="header.jsp" />
	</header>
	<div class="container">
		<!-- 상품 등록 폼 -->
		<div class="form-container">
			<h2>상품 등록</h2>
			<form id="productForm" action="AddProductWeddingHallService"
				method="post">
				<div class="form-group">
					<label for="weddingHall_type">웨딩홀 타입</label> <input type="text"
						id="weddingHall_type" name="weddingHall_type" required />
				</div>
				<div class="form-group">
					<label for="weddingHall_price">웨딩홀 가격</label> <input type="number"
						id="weddingHall_price" name="weddingHall_price" required />
				</div>
				<div class="form-group">
					<label for="weddingHall_mealCost">식대</label> <input type="number"
						id="weddingHall_mealCost" name="weddingHall_mealCost" required />
				</div>
				<div class="form-group">
					<label for="weddingHall_assurance">보증인원</label> <input type="text"
						id="weddingHall_assurance" name="weddingHall_assurance" required />
				</div>
				<div class="form-group">
					<label for="weddingHall_title">웨딩홀 한줄소개</label> <input type="text"
						id="weddingHall_title" name="weddingHall_title" required />
				</div>
				<div class="form-group">
					<label for="weddingHall_content">웨딩홀 상세 설명</label> <input
						type="text" id="weddingHall_content" name="weddingHall_content"
						required />
				</div>
				<!-- 이미지 업로드 섹션 -->
				<div class="image-upload">
					<label for="weddingHall_photoPath">웨딩홀 이미지</label> <input
						type="file" id="weddingHall_photoPath"
						name="weddingHall_photoPath" accept="image/*" />
				</div>
				<button type="submit" class="action-button">등록</button>
			</form>
		</div>
	</div>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>
</html>