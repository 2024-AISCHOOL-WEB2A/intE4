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
						<th>웨딩홀 이미지</th>
						<th>웨딩홀 이름</th>
						<th>웨딩홀 타입</th>
						<th>웨딩홀 가격</th>
						<th>식대</th>
						<th>보증인원</th>
						<th>웨딩홀 한줄설명</th>
						<th>웨딩홀 상세설명</th>
						<th>등록일</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody id="weddingHall-table-body">
					<tr>
						<td colspan="12">상품 조회를 눌러주세요.</td>
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
			 window.location.href = 'addProductWeddingHall.jsp';
		}
		
		function fetchDresses() {
		    // 상품 조회 버튼 클릭 시 AJAX 요청
		    const xhr = new XMLHttpRequest();
		    xhr.open('GET', 'ProductWeddingHallManagementService', true); // 해당 서블릿을 호출하는 GET 요청
		    xhr.onload = function () {
		        if (xhr.status === 200) {
		            // 응답받은 JSON 데이터를 파싱하여 테이블에 표시
		            const weddingHallList = JSON.parse(xhr.responseText);
		            const tbody = document.getElementById('weddingHall-table-body');
		            tbody.innerHTML = ''; // 기존 내용을 지움
	                let index = 1;
		            if (weddingHallList.length === 0) {
		                // 상품이 없을 때
		                const row = `<tr>
		                    <td colspan="12">등록한 상품이 없습니다.</td>
		                </tr>`;
		                tbody.insertAdjacentHTML('beforeend', row);
		            } else {
		            	weddingHallList.forEach((weddingHallList, index) => {
		                    const row = `<tr>
		                        <td>\${index + 1}</td>
		                        <td><img src="\${weddingHallList.photoPath}" alt="\${weddingHallList.weddingHallTitle}" width="100"></td>
		                        <td>\${weddingHallList.weddingHallBrand}</td>
		                        <td>\${weddingHallList.weddingHallType}</td>
		                        <td>\${weddingHallList.weddingHallPrice}</td>
		                        <td>\${weddingHallList.weddingHallMealCost}</td>
		                        <td>\${weddingHallList.weddingHallAssurance}</td>
		                        <td>\${weddingHallList.weddingHallTitle}</td>
		                        <td>\${weddingHallList.weddingHallContent}</td>
		                        <td>\${weddingHallList.weddingHallDate}</td>
		                        <td><a href="#" class="btn-edit" onclick="editProduct('\${weddingHallList.weddingHallId}')">수정</a></td>
		                        <td><a href="#" class="btn-delete" onclick="deleteProduct('\${weddingHallList.weddingHallId}')">삭제</a></td>
		                    </tr>`;
		                    tbody.insertAdjacentHTML('beforeend', row);
		                });
		            }
		        } else {
		            const tbody = document.getElementById('weddingHall-table-body');
		            tbody.innerHTML = ''; // 기존 내용을 지움
		            const row = `<tr>
		                <td colspan="12">등록한 상품이 없습니다.</td>
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
	    	window.location.href = 'EditProductWeddingHallService?productId=' + encodeURIComponent(productId);
	    }

	</script>
</body>
</html>
