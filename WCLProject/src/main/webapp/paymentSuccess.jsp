<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Wedding Choice - 결제 완료</title>
<style>
    main {
        text-align: center;
        padding: 20px;
    }
    h1 {
        color: red;
        font-size: 2.5em;
        margin-bottom: 30px;
    }
    .payment-complete {
        display: flex;
        flex-direction: column;
        align-items: center;
    }
.payment-complete img {
    width: 700px;
    height: auto;
    margin-top: 100px;
    margin-bottom: 20px; /* 이미지와 링크 사이 간격 조절 */
}
.main-link {
    margin-bottom: 100px;
    font-size: 1.2em;
    color: #333;
    text-decoration: none;
    padding: 10px 20px;
    border: 1px solid skyblue;
    border-radius: 5px;
    transition: all 0.3s ease;
}
.main-link:hover {
    background-color: #333;
    color: white;
}
</style>
</head>
<body>
<header>
<jsp:include page="header.jsp" />
</header>

<main>
<h1>Wedding Choice</h1>

<div class="payment-complete">
<img alt="결제완료" src="./upload/payment/결제완료.png">
<a href="mainPage.jsp" class="main-link">메인페이지로 이동</a>
</div>
</main>

<footer>
<jsp:include page="footer.jsp" />
</footer>
</body>
</html>