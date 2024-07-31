<%@page import="com.WCLProject.model.DTO.WeddingHall"%>
<%@page import="com.WCLProject.model.DTO.Dress"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
<link rel="stylesheet" href="./css/addProductDress.css" />
</head>
<body>
	<header>
		<jsp:include page="header.jsp" />
	</header>

	<div class="container">
		<!-- 상품 수정 폼 -->
		<div class="form-container">
			<h2>상품 수정</h2>
			<form id="productForm" action="UpdateProductWeddingHallService"
				method="post">
				<%
				WeddingHall weddinghall = (WeddingHall) request.getAttribute("weddinghall");
				if (weddinghall != null) {
				%>

				<!-- 상품 ID (숨겨진 필드) -->
				<input type="hidden" id="weddingHall_id" name="weddingHall_id"
					value="<%=weddinghall.getWeddingHallId()%>" />

				<div class="form-group">
					<label for="weddingHall_type">웨딩홀 타입</label> <input type="text"
						id="weddingHall_type" name="weddingHall_type"
						value="<%=weddinghall.getWeddingHallType()%>" required />
				</div>
				<div class="form-group">
					<label for="weddingHall_price">웨딩홀 가격</label> <input type="number"
						id="weddingHall_price" name="weddingHall_price"
						value="<%=weddinghall.getWeddingHallPrice()%>" required />
				</div>
				<div class="form-group">
					<label for="weddingHall_mealCost">식대</label> <input type="number"
						id="weddingHall_mealCost" name="weddingHall_mealCost"
						value="<%=weddinghall.getWeddingHallMealCost()%>" required />
				</div>
				<div class="form-group">
					<label for="weddingHall_assurance">보증인원</label> <input type="number"
						id="weddingHall_assurance" name="weddingHall_assurance"
						value="<%=weddinghall.getWeddingHallAssurance()%>" required />
				</div>
				<div class="form-group">
					<label for="weddingHall_title">웨딩홀 한줄소개</label> <input type="text"
						id="weddingHall_title" name="weddingHall_title"
						value="<%=weddinghall.getWeddingHallTitle()%>" required />
				</div>
				<div class="form-group">
					<label for="weddingHall_content">웨딩홀 상세 설명</label> <input type="text"
						id="weddingHall_content" name="weddingHall_content"
						value="<%=weddinghall.getWeddingHallContent()%>" required />
				</div>
				<button type="submit" class="action-button">수정</button>
			</form>

			<!-- 이미지 업로드 섹션 -->
			<form id="imageUploadForm" action="UploadProductImageService"
				method="post" enctype="multipart/form-data">
				<div class="image-upload">
					<label for="weddingHall_photoPath">웨딩홀 이미지</label> <input type="file"
						id="weddingHall_photoPath" name="weddingHall_photoPath" accept="image/*" /> <img
						src="<%=weddinghall.getPhotoPath()%>" alt="상품 이미지" width="100" />
				</div>
			</form>
			<%
			} else {
			out.println("상품 정보를 찾을 수 없습니다.");
			}
			%>
		</div>
	</div>

	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>
</html>
