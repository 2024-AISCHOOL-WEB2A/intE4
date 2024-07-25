<%@page import="com.WCLProject.model.DTO.Dress"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 관리</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2>상품 관리</h2>

        <% 
            // 로그인 확인 및 기업 회원 확인
            HttpSession session2 = request.getSession();
            String userId = (String) session2.getAttribute("vendor_id");
            String userType = (String) session2.getAttribute("veindor_category");

            if (userId == null || !"corporate".equals(userType)) {
                // 로그인하지 않았거나 기업 회원이 아닌 경우
                response.sendRedirect("LoginWcl.jsp");
                return;
            }
        %>

        <!-- 상품 등록 폼 -->
        <div class="card mt-3">
            <div class="card-header">
                상품 등록
            </div>
            <div class="card-body">
                <form action="DressServlet?action=add" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="dressTitle">상품명:</label>
                        <input type="text" id="dressTitle" name="dressTitle" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="dressContent">상품 설명:</label>
                        <textarea id="dressContent" name="dressContent" class="form-control" rows="3" required></textarea>
                    </div>
                    <div class="form-group">
                        <label for="dressPrice">가격:</label>
                        <input type="number" id="dressPrice" name="dressPrice" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="dressImage">상품 이미지:</label>
                        <input type="file" id="dressImage" name="dressImage" class="form-control-file" required>
                    </div>
                    <button type="submit" class="btn btn-primary">등록</button>
                </form>
            </div>
        </div>

        <!-- 상품 목록 및 관리 -->
        <div class="card mt-3">
            <div class="card-header">
                상품 목록
            </div>
            <div class="card-body">
                <%-- 여기서 상품 목록을 DB에서 가져와 출력합니다 --%>
                <% 
                    List<Dress> dresses = (List<Dress>) request.getAttribute("dresses");
                    if (dresses != null && !dresses.isEmpty()) {
                        for (Dress dress : dresses) {
                %>
                            <div class="product-item">
                                <h5><%= dress.getDressId() %></h5>
                                <p><%= dress.getDressContent() %></p>
                                <p>가격: <%= dress.getDressPrice() %>원</p>
                                <img src="<%= dress.getPhotoPath() %>" alt="<%= dress.getDressTitle() %>" class="img-fluid">
                                <a href="DressServlet?action=edit&dressId=<%= dress.getDressId() %>" class="btn btn-secondary">수정</a>
                                <a href="DressServlet?action=delete&dressId=<%= dress.getDressId() %>" class="btn btn-danger">삭제</a>
                            </div>
                            <hr>
                <% 
                        }
                    } else {
                %>
                    <p>등록된 상품이 없습니다.</p>
                <% } %>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
