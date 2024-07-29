<%@page import="com.WCLProject.model.DTO.VendorMemberDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.WCLProject.model.DTO.Dress"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
VendorMemberDTO vendor = (VendorMemberDTO) session.getAttribute("vendorInfo");
String isLogin;
if (vendor != null) {
	isLogin = "vendor";
} else {
	response.sendRedirect("mainPage.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="stylesheet" href="./css/dressRegistration_globals.css" />
<link rel="stylesheet" href="./css/dressRegistration_styleguide.css" />
<link rel="stylesheet" href="./css/dressRegistration_style.css" />
<link rel="stylesheet" href="./css/dressRegistration.css" />
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
				<button class="action-button" onclick="addProduct()">상품 등록</button>
				<button class="action-button" onclick="fetchDresses()">상품 조회</button>
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
				<tbody id="dress-table-body">
					<tr>
						<td colspan="10">상품 조회를 눌러주세요.</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<footer>
		<jsp:include page="footer.jsp" />
	</footer>

	<script>
		function addProduct() {
			 window.location.href = 'addProductDress.jsp';
		}
		
		function fetchDresses() {
		    // 상품 조회 버튼 클릭 시 AJAX 요청
		    const xhr = new XMLHttpRequest();
		    xhr.open('GET', 'ProductDressManagementService', true); // 해당 서블릿을 호출하는 GET 요청
		    xhr.onload = function () {
		        if (xhr.status === 200) {
		            // 응답받은 JSON 데이터를 파싱하여 테이블에 표시
		            const dresses = JSON.parse(xhr.responseText);
		            const tbody = document.getElementById('dress-table-body');
		            tbody.innerHTML = ''; // 기존 내용을 지움
	                let index = 1;
		            if (dresses.length === 0) {
		                // 상품이 없을 때
		                const row = `<tr>
		                    <td colspan="10">등록한 상품이 없습니다.</td>
		                </tr>`;
		                tbody.insertAdjacentHTML('beforeend', row);
		            } else {
		                dresses.forEach((dress, index) => {
		                    const row = `<tr>
		                        <td>\${index + 1}</td>
		                        <td><img src="\${dress.photoPath}" alt="\${dress.dressTitle}" width="100"></td>
		                        <td>\${dress.dressTitle}</td>
		                        <td>\${dress.dressPrice}</td>
		                        <td>\${dress.dressFabric}</td>
		                        <td>\${dress.dressLine}</td>
		                        <td>\${dress.dressStyle}</td>
		                        <td>\${dress.dressDate}</td>
		                        <td><a href="#" class="btn-edit">수정</a></td>
		                        <td><a href="#" class="btn-delete" onclick="deleteProduct('\${dress.id}')">삭제</a></td>
		                    </tr>`;
		                    tbody.insertAdjacentHTML('beforeend', row);
		                });
		            }
		        } else {
		            const tbody = document.getElementById('dress-table-body');
		            tbody.innerHTML = ''; // 기존 내용을 지움
		            const row = `<tr>
		                <td colspan="10">등록한 상품이 없습니다.</td>
		            </tr>`;
		            tbody.insertAdjacentHTML('beforeend', row);
		        }
		    };
		    xhr.send();
		}

	    function deleteProduct(productId) {
	        // 삭제 확인
	        if (confirm('정말로 삭제하시겠습니까?')) {
	            const xhr = new XMLHttpRequest();
	            xhr.open('POST', 'DeleteProductService', true); // 삭제 서블릿 호출
	            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	            xhr.onload = function () {
	                if (xhr.status === 200) {
	                    alert('상품이 삭제되었습니다.');
	                    fetchDresses(); // 상품 목록 새로고침
	                } else {
	                    alert('상품 삭제에 실패했습니다. 다시 시도해 주세요.');
	                }
	            };
	            xhr.send('product_id=' + encodeURIComponent(productId));
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
