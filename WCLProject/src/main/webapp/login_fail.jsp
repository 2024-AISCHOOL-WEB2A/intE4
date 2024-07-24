<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 실패</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .message {
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        text-align: center;
    }
    .message h2 {
        color: red;
        margin-bottom: 20px;
    }
    .message a {
        color: green;
        text-decoration: none;
    }
    .message a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <div class="message">
        <h2>로그인 실패</h2>
        <p>아이디 또는 비밀번호가 잘못되었습니다.</p>
        <a href="LoginWcl.jsp">로그인 페이지로 돌아가기</a>
    </div>
</body>
</html>
