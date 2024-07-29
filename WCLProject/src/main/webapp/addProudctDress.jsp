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
        <form id="productForm" action="AddProductDressService.jsp">
            <div class="form-group">
                <label for="productName">상품명</label>
                <input type="text" id="productName" name="productName" required />
            </div>
            <div class="form-group">
                <label for="brand">브랜드</label>
                <input type="text" id="brand" name="brand" required />
            </div>
            <div class="form-group">
                <label for="fabric">원단</label>
                <input type="text" id="fabric" name="fabric" required />
            </div>
            <div class="form-group">
                <label for="line">라인</label>
                <input type="text" id="line" name="line" required />
            </div>
            <div class="form-group">
                <label for="style">스타일</label>
                <input type="text" id="style" name="style" required />
            </div>
            <div class="form-group">
                <label for="price">가격</label>
                <input type="number" id="price" name="price" required />
            </div>
            <div class="form-group">
                <label for="description">내용</label>
                <textarea id="description" name="description" rows="4" required></textarea>
            </div>
            <!-- 이미지 업로드 섹션 -->
            <div class="image-upload">
                <label for="imageUpload">이미지 업로드</label>
                <input type="file" id="imageUpload" name="imageUpload" accept="image/*" />
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