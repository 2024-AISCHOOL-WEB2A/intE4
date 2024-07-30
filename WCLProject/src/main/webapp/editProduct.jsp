<%@page import="java.sql.Timestamp"%>
<%@page import="com.WCLProject.model.DTO.Makeup"%>
<%@page import="com.WCLProject.model.DTO.Studio"%>
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
            String category = (String) request.getAttribute("category"); // 카테고리 값
            System.out.println(category);
            String id = null;
            String photoPath = null;
            String concept = null;
            int price = 0;
            String title = null;
            String content = null;
			Timestamp date = null;
            
            if ("스튜디오".equals(category)) {
                Studio studio = (Studio) request.getAttribute("studio");
                id = studio.getStudioId();
                photoPath = studio.getPhotoPath();
                concept = studio.getStudioConcept();
                price = studio.getStudioPrice();
                title = studio.getStudioTitle();
                content = studio.getStudioContent();
                date = studio.getStudioDate();
            } else if ("메이크업".equals(category)) {
                Makeup makeup = (Makeup) request.getAttribute("makeup");
                id = makeup.getMakeupId();
                photoPath = makeup.getPhotoPath();
                concept = makeup.getMakeupConcept();
                price = makeup.getMakeupPrice();
                title = makeup.getMakeupTitle();
                content = makeup.getMakeupContent();
                date = makeup.getMakeupDate();
            }

            if (id != null) {
            %>
				<!-- 상품 ID (숨겨진 필드) -->
				<input type="hidden" id="dress_id" name="dress_id"
					value="<%=id%>" />

				<div class="form-group">
					<label for="dress_title">상품 컨셉</label> <input type="text"
						id="dress_title" name="dress_title"
						value="<%=concept%>" required />
				</div>
				<div class="form-group">
					<label for="dress_brand">가격</label> <input type="text"
						id="dress_brand" name="dress_brand"
						value="<%=price%>" required />
				</div>
				<div class="form-group">
					<label for="dress_fabric">상품 한줄소개</label> <input type="text"
						id="dress_fabric" name="dress_fabric"
						value="<%=title%>" required />
				</div>
				<div class="form-group">
					<label for="dress_line">상품 상세설명</label> <input type="text"
						id="dress_line" name="dress_line"
						value="<%=content%>" required />
				</div>
				<button type="submit" class="action-button">수정</button>
			</form>

			<!-- 이미지 업로드 섹션 -->
			<form id="imageUploadForm" action="UploadProductImageService"
				method="post" enctype="multipart/form-data">
				<div class="image-upload">
					<label for="dress_photoPath">이미지 업로드</label> <input type="file"
						id="dress_photoPath" name="dress_photoPath" accept="image/*" /> <img
						src="<%=photoPath%>" alt="상품 이미지" width="100" />
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
