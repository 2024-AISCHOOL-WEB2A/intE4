<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
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
			<form id="productForm" action="AddProductService" method="post">
				<%-- 				<input type="hidden" id="dress_id" name="dress_id" value="<%=//id%>" /> --%>

				<div class="form-group">
					<label for="product_concept">상품 컨셉</label> <input type="text"
						id="product_concept" name="product_concept" required />
				</div>
				<div class="form-group">
					<label for="product_price">가격</label> <input type="number"
						id="product_price" name="product_price" required />
				</div>
				<div class="form-group">
					<label for="product_title">상품 한줄소개</label> <input type="text"
						id="product_title" name="product_title" required />
				</div>
				<div class="form-group">
					<label for="product_content">상품 상세설명</label> <input type="text"
						id="product_content" name="product_content" required />
				</div>
				<button type="submit" class="action-button">등록</button>
			</form>
		</div>

		<!-- 이미지 업로드 폼 -->
		<div class="form-container">
			<h2>이미지 업로드</h2>
			<form id="imageUploadForm" action="UploadImageService" method="post"
				enctype="multipart/form-data">
				<div class="image-upload">
					<label for="product_photoPath">이미지 업로드</label> <input type="file"
						id="product_photoPath" name="product_photoPath" accept="image/*" />
				</div>
				<button type="submit" class="action-button">이미지 등록</button>
			</form>
		</div>
	</div>
	<footer>
		<jsp:include page="footer.jsp" />
	</footer>
</body>
</html>
