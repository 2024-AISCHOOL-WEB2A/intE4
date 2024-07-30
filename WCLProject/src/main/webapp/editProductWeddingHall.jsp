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
			<form id="productForm" action="UpdateProductDressService"
				method="post">
				<%
				Dress dress = (Dress) request.getAttribute("dress");
				if (dress != null) {
				%>

				<!-- 상품 ID (숨겨진 필드) -->
				<input type="hidden" id="dress_id" name="dress_id"
					value="<%=dress.getId()%>" />

				<div class="form-group">
					<label for="dress_title">상품명</label> <input type="text"
						id="dress_title" name="dress_title"
						value="<%=dress.getDressTitle()%>" required />
				</div>
				<div class="form-group">
					<label for="dress_brand">브랜드</label> <input type="text"
						id="dress_brand" name="dress_brand"
						value="<%=dress.getDressBrand()%>" required />
				</div>
				<div class="form-group">
					<label for="dress_fabric">원단</label> <input type="text"
						id="dress_fabric" name="dress_fabric"
						value="<%=dress.getDressFabric()%>" required />
				</div>
				<div class="form-group">
					<label for="dress_line">라인</label> <input type="text"
						id="dress_line" name="dress_line"
						value="<%=dress.getDressLine()%>" required />
				</div>
				<div class="form-group">
					<label for="dress_style">스타일</label> <input type="text"
						id="dress_style" name="dress_style"
						value="<%=dress.getDressStyle()%>" required />
				</div>
				<div class="form-group">
					<label for="dress_price">가격</label> <input type="number"
						id="dress_price" name="dress_price"
						value="<%=dress.getDressPrice()%>" required />
				</div>
				<div class="form-group">
					<label for="dress_content">내용</label>
					<textarea id="dress_content" name="dress_content" rows="4" required><%=dress.getDressContent()%></textarea>
				</div>
				<button type="submit" class="action-button">수정</button>
			</form>

			<!-- 이미지 업로드 섹션 -->
			<form id="imageUploadForm" action="UploadProductImageService"
				method="post" enctype="multipart/form-data">
				<div class="image-upload">
					<label for="dress_photoPath">이미지 업로드</label> <input type="file"
						id="dress_photoPath" name="dress_photoPath" accept="image/*" /> <img
						src="<%=dress.getPhotoPath()%>" alt="상품 이미지" width="100" />
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
