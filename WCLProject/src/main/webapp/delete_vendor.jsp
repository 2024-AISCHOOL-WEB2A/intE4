<%@ page import="com.WCLProject.model.DTO.VendorMemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    VendorMemberDTO member = (VendorMemberDTO) session.getAttribute("loginM");
    if (member == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업회원 탈퇴</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .delete-form {
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .delete-form h2 {
        margin-bottom: 20px;
    }
    .form-group {
        margin-bottom: 15px;
    }
    .form-group label {
        display: block;
        margin-bottom: 5px;
    }
    .form-group input {
        width: 100%;
        padding: 8px;
        box-sizing: border-box;
    }
    .form-group button {
        width: 100%;
        padding: 10px;
        background-color: #d9534f;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    .form-group button:hover {
        background-color: #c9302c;
    }
</style>
</head>
<body>
    <div class="delete-form">
        <h2>기업회원 탈퇴</h2>
        <form action="DeleteService_Vendor" method="post">
            <div class="form-group">
                <label for="vendor_id">기업 ID:</label>
                <input type="text" id="vendor_id" name="vendor_id" value="<%=member.getId()%>" readonly>
            </div>
            <div class="form-group">
                <label for="vendor_pw">비밀번호:</label>
                <input type="password" id="vendor_pw" name="vendor_pw" required>
            </div>
            <div class="form-group">
                <button type="submit">회원탈퇴</button>
            </div>
        </form>
    </div>
</body>
</html>
