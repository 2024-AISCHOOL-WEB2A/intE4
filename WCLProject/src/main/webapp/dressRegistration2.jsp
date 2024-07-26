<%@page import="com.WCLProject.model.DTO.VendorMemberDTO"%>
<%@page import="com.WCLProject.model.DTO.Dress"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 관리</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
	<div class="container mt-5">
		<h2>상품 관리</h2>

		<%
		// 로그인 확인 및 기업 회원 확인
		session = request.getSession();
		VendorMemberDTO vendorInfo = (VendorMemberDTO) session.getAttribute("vendorInfo");

		if (vendorInfo == null) {
			// 로그인하지 않았거나 기업 회원이 아닌 경우
			response.sendRedirect("LoginWcl.jsp");
			return;
		}
		%>

		<!-- 상품 등록 폼 -->
		<div class="card mt-3">
			<div class="card-header">상품 등록</div>
			<div class="card-body">
				<form action="DressRegistrationService" method="post"
					enctype="application/x-www-form-urlencoded">
					<div class="form-group">
						<label for="dress_id">드레스 이름 :</label> <input type="text"
							id="dress_title" name="dress_title" class="form-control" required>
					</div>
					<div class="form-group">
						<label for="dress_brand">드레스 브랜드 :</label> <input type="text"
							id="dress_brand" name="dress_brand" class="form-control" required>
					</div>
					<div class="form-group">
						<label for="dress_fabric">드레스 원단 :</label> <input type="text"
							id="dress_fabric" name="dress_fabric" class="form-control"
							required>
					</div>
					<div class="form-group">
						<label for="dress_line">드레스 라인 :</label> <input type="text"
							id="dress_line" name="dress_line" class="form-control" required>
					</div>
					<div class="form-group">
						<label for="dress_style">드레스 분위기 :</label> <input type="text"
							id="dress_style" name="dress_style" class="form-control" required>
					</div>
					<div class="form-group">
						<label for="dress_price">가격 :</label> <input type="number"
							id="dress_price" name="dress_price" class="form-control" required>
					</div>
					<div class="form-group">
						<label for="dress_content">상품 설명 :</label>
						<textarea id="dress_content" name="dress_content"
							class="form-control" rows="3" required></textarea>
					</div>
					<button type="submit" class="btn btn-primary">등록</button>
				</form>
				<form action="DressRegistrationService" method="post"
					enctype="multipart/form-data">
					<div class="form-group">
						<label for="dress_image">상품 이미지 :</label> <input type="file"
							id="dress_image" name="dress_image" class="form-control-file"
							required>
					</div>
				</form>
			</div>
		</div>


		<!-- 상품 목록 및 관리 -->
		<div class="card mt-3">
			<div class="card-header">상품 목록</div>
			<div class="card-body">
				<%-- 여기서 상품 목록을 DB에서 가져와 출력합니다 --%>
				<%
				List<Dress> dresses = (List<Dress>) request.getAttribute("dresses");
				if (dresses != null && !dresses.isEmpty()) {
					for (Dress dress : dresses) {
				%>
				<div class="product-item">
					<h5><%=dress.getId()%></h5>
					<p><%=dress.getDressContent()%></p>
					<p>
						가격:
						<%=dress.getDressPrice()%>원
					</p>
					<img src="<%=dress.getPhotoPath()%>"
						alt="<%=dress.getDressTitle()%>" class="img-fluid"> <a
						href="DressServlet?action=edit&dressId=<%=dress.getId()%>"
						class="btn btn-secondary">수정</a> <a
						href="DressServlet?action=delete&dressId=<%=dress.getId()%>"
						class="btn btn-danger">삭제</a>
				</div>
				<hr>
				<%
				}
				} else {
				%>
				<p>등록된 상품이 없습니다.</p>
				<%
				}
				%>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
