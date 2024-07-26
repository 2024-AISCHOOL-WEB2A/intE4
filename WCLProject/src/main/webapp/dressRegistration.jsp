<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="stylesheet" href="./css/dressRegistration_globals.css" />
<link rel="stylesheet" href="./css/dressRegistration_styleguide.css" />
<link rel="stylesheet" href="./css/dressRegistration_style.css" />
<link rel="stylesheet" href="./css/test.css" />
<style type="text/css">
</style>
</head>
<body>
	<header>
		<jsp:include page="header.jsp" />
	</header>

	<div class="container">
		<!-- 검색 및 버튼 영역 -->
		<div class="search-container">
			<input type="text" id="search" placeholder="상품명 검색..." />
		</div>

		<div class="table-container">
			<table>
				<thead>
					<tr>
						<th>NO</th>
						<th>상품 이미지</th>
						<th>상품명</th>
						<th>가격</th>
						<th>소재</th>
						<th>라인</th>
						<th>분위기</th>
						<th>등록일</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td><img src="./upload/dress/dress002.jpg" alt="상품 이미지"
							class="product-image"></td>
						<td>상품명 1</td>
						<td>₩100,000</td>
						<td>면</td>
						<td>라인 A</td>
						<td>화려함</td>
						<td>2024-07-26</td>
						<td><button class="btn-edit" onclick="editProduct(1)">수정</button></td>
						<td><button class="btn-delete" onclick="deleteProduct(1)">삭제</button></td>
					</tr>
					<tr>
						<td>2</td>
						<td><img src="./upload/dress/dress003.jpg" alt="상품 이미지"
							class="product-image" /></td>
						<td>상품명 2</td>
						<td>₩200,000</td>
						<td>폴리에스터</td>
						<td>라인 B</td>
						<td>세련됨</td>
						<td>2024-07-25</td>
						<td><button class="btn-edit" onclick="editProduct(2)">수정</button></td>
						<td><button class="btn-delete" onclick="deleteProduct(2)">삭제</button></td>
					</tr>
					<!-- 추가 상품 데이터 -->
				</tbody>
			</table>
		</div>
	</div>

	<footer>
		<jsp:include page="footer.jsp" />
	</footer>

	<script>
		function addProduct() {
			// 상품 등록 로직
			alert('상품 등록 버튼 클릭됨');
		}

		function deleteProduct(productId) {
			// 상품 삭제 로직
			if (confirm('정말로 삭제하시겠습니까?')) {
				alert('상품 ' + productId + ' 삭제됨');
				// 실제 삭제 로직 추가
			}
		}

		function editProduct(productId) {
			// 상품 수정 로직
			alert('상품 ' + productId + ' 수정 클릭됨');
			// 실제 수정 페이지로 이동 또는 수정 모달 열기
		}
	</script>
</body>
</html>
