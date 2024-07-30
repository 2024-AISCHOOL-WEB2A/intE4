<%@page import="com.WCLProject.model.DTO.VendorMemberDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.WCLProject.model.DTO.Dress"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
VendorMemberDTO vendor = (VendorMemberDTO) session.getAttribute("vendorInfo");
String isLogin;
String vendorCategory = null;
if (vendor != null) {
	isLogin = "vendor";
	vendorCategory = vendor.getCategory();
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
				<button class="action-button" onclick="fetchProduct()">상품 조회</button>
		</div>

		<div class="table-container">
			<table>
				<thead>
					<tr>
						<th>NO</th>
						<th>상품 이미지</th>
						<th>상품 컨셉</th>
						<th>가격</th>
						<th>상품 한줄소개</th>
						<th>상품 상세설명</th>
						<th>등록일</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody id="product-table-body">
					<tr>
						<td colspan="9">상품 조회를 눌러주세요.</td>
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
		
		function fetchProduct() {
			var vendorCategory = "<%= vendorCategory %>";
		    let url;
		    if (vendorCategory == "스튜디오") {
		        url = 'ProductManagementService?category=스튜디오';
		    } else if (vendorCategory === "메이크업") {
		        url = 'ProductManagementService?category=메이크업';
		    } else {
		        console.error("알 수 없는 카테고리:", vendorCategory);
		        return;
		    }

		    // 상품 조회 버튼 클릭 시 AJAX 요청
		    const xhr = new XMLHttpRequest();
		    xhr.open('GET', url, true);
		    xhr.onload = function () {
		        if (xhr.status === 200) {
		            // 응답받은 JSON 데이터를 파싱하여 테이블에 표시
		            const products = JSON.parse(xhr.responseText);
		            const tbody = document.getElementById('product-table-body');
		            tbody.innerHTML = ''; // 기존 내용을 지움
		            let index = 1;
		            if (products.length === 0) {
		                const row = `<tr>
		                    <td colspan="9">등록한 상품이 없습니다.</td>
		                </tr>`;
		                tbody.insertAdjacentHTML('beforeend', row);
		            } else {
		                products.forEach((product, index) => {
		                    let title, price, description, date, photoPath;

		                    if (vendorCategory === "스튜디오") {
		                        photoPath = product.studioPhotoPath;
		                        concept = product.studioConcept;
		                        price = product.studioPrice;
		                        title = product.studioTitle;
		                        content = product.studioContent;
		                        date = product.studioDate;
		                        id = product.studioId;
		                    } else if (vendorCategory === "메이크업") {
		                        photoPath = product.makeupPhotoPath;
		                        concept = product.makeupConcept;
		                        price = product.makeupPrice;
		                        title = product.makeupTitle;
		                        content = product.makeupContent;
		                        date = product.makeupDate;
		                        id = product.makeupId;
		                    }

		                    const row = `<tr>
		                        <td>\${index + 1}</td>
		                        <td><img src="\${photoPath}" alt="\${title}" width="100"></td>
		                        <td>\${concept}</td>
		                        <td>\${price}</td>
		                        <td>\${title}</td>
		                        <td>\${content}</td>
		                        <td>\${date}</td>
		                        <td><a href="#" class="btn-edit" onclick="editProduct('\${product.id}')">수정</a></td>
		                        <td><a href="#" class="btn-delete" onclick="deleteProduct('\${product.id}')">삭제</a></td>
		                    </tr>`;
		                    tbody.insertAdjacentHTML('beforeend', row);
		                });
		            }
		        } else {
		            const tbody = document.getElementById('product-table-body');
		            tbody.innerHTML = '';
		            const row = `<tr>
		                <td colspan="9">상품 정보를 불러올 수 없습니다.</td>
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
	    	window.location.href = 'EditProductDressService?productId=' + encodeURIComponent(productId);
	    }

	</script>
</body>
</html>
