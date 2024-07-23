<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <header>
        <nav>
            <a href="Login">로그인</a>
        </nav>
    </header>

    <!-- Menu -->
    <nav id="menu">
        <ul class="links">
            <li><h5>로그인</h5></li>
            <form action="Login" method="post">
                <li><input type="text" name="user_id" placeholder="Email을 입력하세요" required></li>
                <li><input type="password" name="user_pw" placeholder="PW를 입력하세요" required></li>
                <li><input type="submit" value="LogIn" class="button fit"></li>
            </form>
        </ul>
    </nav>

    <!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/main.js"></script>
</body>
</html>
