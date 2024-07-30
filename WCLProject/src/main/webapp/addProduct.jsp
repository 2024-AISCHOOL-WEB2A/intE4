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
        <form id="productForm" action="AddProductService" method="post">
            <div class="form-group">
                <label for="dress_title">상품명</label>
                <input type="text" id="dress_title" name="dress_title" required />
            </div>
            <div class="form-group">
                <label for="dress_brand">브랜드</label>
                <input type="text" id="dress_brand" name="dress_brand" required />
            </div>
            <div class="form-group">
                <label for="dress_fabric">원단</label>
                <input type="text" id="dress_fabric" name="dress_fabric" required />
            </div>
            <div class="form-group">
                <label for="dress_line">라인</label>
                <input type="text" id="dress_line" name="dress_line" required />
            </div>
            <div class="form-group">
                <label for="dress_style">스타일</label>
                <input type="text" id="dress_style" name="dress_style" required />
            </div>
            <div class="form-group">
                <label for="price">가격</label>
                <input type="number" id="dress_price" name="dress_price" required />
            </div>
            <div class="form-group">
                <label for="dress_content">내용</label>
                <textarea id="dress_content" name="dress_content" rows="4" required></textarea>
            </div>
            <!-- 이미지 업로드 섹션 -->
            <div class="image-upload">
                <label for="dress_photoPath">이미지 업로드</label>
                <input type="file" id="dress_photoPath" name="dress_photoPath" accept="image/*" />
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