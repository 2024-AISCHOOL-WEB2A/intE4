<%@ page import="java.util.ArrayList"%>
<%@ page import="com.WCLProject.model.DTO.Dress"%>
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
					<%
					// DressDTO 리스트를 가져옴
					ArrayList<Dress> dressList = (ArrayList<Dress>) request.getAttribute("dressList");

					// dressList가 null인지 확인하고, null이 아닌 경우 출력
					if (dressList != null) {
						int index = 1;
						for (Dress dress : dressList) {
					%>
					<tr>
						<td><%=index++%></td>
						<td><img src="<%=dress.getPhotoPath()%>"
							alt="<%=dress.getDressTitle()%>" width="100"></td>
						<td><%=dress.getDressTitle()%></td>
						<td><%=dress.getDressPrice()%></td>
						<td><%=dress.getDressFabric()%></td>
						<td><%=dress.getDressLine()%></td>
						<td><%=dress.getDressStyle()%></td>
						<td><%=dress.getDressDate()%></td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="10">No dresses available.</td>
					</tr>
					<%
					}
					%>
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
