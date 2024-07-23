<%@page import="com.WCLProject.model.DTO.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과</title>
</head>
<body>
<%

    UserVO vo = (UserVO)session.getAttribute("info");

    // 로그인 검증 로직 (예시)
    if(vo != null) {
        out.println("<h1>로그인 성공</h1>");
    } else {
        out.println("<h1>로그인 실패</h1>");
    }
%>
</body>
</html>
