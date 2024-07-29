<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="globals.css" />
    <link rel="stylesheet" href="styleguide.css" />
    <link rel="stylesheet" href="style.css" />
    <title>예약 페이지</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .reservation-form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            margin-bottom: 20px;
        }
        .reservation-form h2 {
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .button-group {
            display: flex;
            justify-content: space-between;
        }
        .button-group button {
            width: 48%;
            padding: 10px;
            background-color: #5cb85c;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .button-group button.cancel {
            background-color: #d9534f;
        }
        .button-group button.cancel:hover {
            background-color: #c9302c;
        }
        .button-group button:hover {
            background-color: #4cae4c;
        }
        .item-image {
            max-width: 100%;
            height: auto;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        /* 커스텀 알림창 스타일 */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0,0,0);
            background-color: rgba(0,0,0,0.4);
        }
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 300px;
            border-radius: 5px;
        }
        .modal-content h2 {
            margin-top: 0;
        }
        .modal-content button {
            padding: 10px 20px;
            margin-top: 10px;
        }
        .modal-content .confirm {
            background-color: #5cb85c;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .modal-content .confirm:hover {
            background-color: #4cae4c;
        }
        .modal-content .cancel {
            background-color: #d9534f;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .modal-content .cancel:hover {
            background-color: #c9302c;
        }
    </style>
</head>
<body>
    <div class="reservation">
        <div class="div">
            <div class="frame">
                <div class="nav">
                    <p class="lisianthus">L i s i a n t h u s</p>
                    <div class="frame-2">
                        <div class="view">
                            <div class="text-wrapper">웨딩홀</div>
                            <div class="text-wrapper">드레스</div>
                            <div class="text-wrapper-2">스튜디오</div>
                            <div class="text-wrapper-3">메이크업</div>
                        </div>
                        <div class="frame-3">
                            <div class="text-wrapper-4">회원정보 수정</div>
                            <div class="text-wrapper-5">예약관리</div>
                            <div class="text-wrapper-5">로그아웃</div>
                        </div>
                    </div>
                </div>
                <header class="header">
                    <div class="container">
                        <div class="link">
                            <div class="w-e-d-d-i-n-g-c-h-o-wrapper">
                                <p class="w-e-d-d-i-n-g-c-h-o">W e d d i n g&nbsp;&nbsp;&nbsp;&nbsp;C h o i c e</p>
                            </div>
                        </div>
                    </div>
                </header>
            </div>
            <div class="frame-wrapper">
                <div class="frame-4">
                    <img class="icon" src="img/icon.svg" />
                    <div class="frame-5">
                        <div class="frame-6">
                            <div class="image-background"></div>
                            <div class="text-wrapper-6">스튜디오</div>
                        </div>
                        <div class="frame-6">
                            <div class="image-background-2"></div>
                            <div class="text-wrapper-6">드레스</div>
                        </div>
                        <div class="frame-6">
                            <div class="image-background-3"></div>
                            <div class="text-wrapper-6">웨딩홀</div>
                        </div>
                        <div class="frame-6">
                            <div class="image-background-4"></div>
                            <div class="text-wrapper-6">메이크업</div>
                        </div>
                    </div>
                    <img class="img" src="img/icon-1.svg" />
                </div>
            </div>
            <footer class="footer">
                <div class="overlap-group">
                    <div class="container-2">
                        <div class="text-wrapper-7">Lisianthus</div>
                        <div class="text-wrapper-8">(주)인트이사</div>
                        <div class="text-wrapper-9">대표이사 김현수</div>
                        <p class="p">COPYRIGHT ©2024 SINBUYA ALL RIGHTS RESERVED.</p>
                    </div>
                    <p class="w-e-d-d-i-n-g-c-h-o-2">W e d d i n g&nbsp;&nbsp;C h o i c e</p>
                </div>
                <div class="container-3">
                    <div class="text-wrapper-10">Information</div>
                    <div class="text-wrapper-11">사업자등록번호 777 88 00999</div>
                    <div class="text-wrapper-12">통신판매업신고 제2024-광주북구-00001호</div>
                    <p class="div-2">
                        <span class="span">개인정보관리책임자 </span> <span class="text-wrapper-13">정수형</span>
                    </p>
                </div>
                <div class="container-4">
                    <div class="list">
                        <div class="text-wrapper-14">이용약관</div>
                        <div class="text-wrapper-15">개인정보처리방침</div>
                        <div class="text-wrapper-16">회사소개</div>
                        <div class="text-wrapper-17">오시는 길</div>
                    </div>
                    <div class="text-wrapper-18">Contact Us</div>
                    <div class="element">오전 9:00 -&nbsp;&nbsp;18:00 (월요일-금요일)</div>
                    <p class="t-f">
                        <span class="text-wrapper-19">T</span>
                        <span class="text-wrapper-20"> 062-123-4567   |   </span>
                        <span class="text-wrapper-19">F</span>
                        <span class="text-wrapper-20"> 062-123-4568</span>
                    </p>
                    <p class="text-wrapper-21">광주광역시 동구 동천동 인공지능사관학교 2층</p>
                </div>
            </footer>
            <div class="background">
                <div class="container-5">
                    <button class="button"><div class="text-wrapper-22">예약</div></button>
                    <button class="button"><div class="text-wrapper-22">결제</div></button>
                    <button class="button"><div class="text-wrapper-22">취소</div></button>
                </div>
            </div>
        </div>
        <div class="container-6">
            <div class="section"><div class="container-7"></div></div>
            <div class="frame-7">
                <div class="container-8">
                    <div class="heading">
                        <img class="SVG-margin" src="img/svg-margin.svg" />
                        <div class="text-wrapper-23">8. 2(금) 오후 4:00</div>
                    </div>
                    <div class="container-9">
                        <div class="container-10">
                            <div class="container-11">
                                <img class="button-2" src="img/button.svg" />
                                <div class="text-wrapper-24">2024.8</div>
                                <img class="button-2" src="img/button-1.svg" />
                            </div>
                            <div class="table">
                                <div class="header-row">
                                    <div class="cell">일</div>
                                    <div class="cell">월</div>
                                    <div class="cell">화</div>
                                    <div class="cell">수</div>
                                    <div class="cell">목</div>
                                    <div class="cell">금</div>
                                    <div class="cell">토</div>
                                </div>
                                <div class="body">
                                    <div class="row">
                                        <div class="data">
                                            <button class="container-wrapper">
                                                <div class="div-wrapper"><div class="text-wrapper-25">28</div></div>
                                            </button>
                                        </div>
                                        <div class="button-wrapper">
                                            <button class="button-3">
                                                <div class="div-wrapper"><div class="text-wrapper-26">29</div></div>
                                            </button>
                                        </div>
                                        <div class="data-2">
                                            <button class="button-3">
                                                <div class="container-12"><div class="text-wrapper-26">30</div></div>
                                            </button>
                                        </div>
                                        <div class="button-wrapper">
                                            <button class="button-3">
                                                <div class="div-wrapper"><div class="text-wrapper-26">31</div></div>
                                            </button>
                                        </div>
                                        <div class="data-3">
                                            <button class="button-4">
                                                <div class="div-wrapper"><div class="text-wrapper-27">1</div></div>
                                            </button>
                                        </div>
                                        <div class="data-4">
                                            <button class="button-3">
                                                <div class="div-wrapper"><div class="text-wrapper-28">2</div></div>
                                            </button>
                                        </div>
                                        <div class="button-wrapper">
                                            <button class="button-5">
                                                <div class="div-wrapper"><div class="text-wrapper-28">3</div></div>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="row-2">
                                        <div class="data">
                                            <button class="button-3">
                                                <div class="div-wrapper"><div class="text-wrapper-29">4</div></div>
                                            </button>
                                        </div>
                                        <div class="data">
                                            <button class="button-3">
                                                <div class="div-wrapper"><div class="text-wrapper-28">5</div></div>
                                            </button>
                                        </div>
                                        <div class="data">
                                            <button class="button-6">
                                                <div class="container-13"><div class="text-wrapper-28">6</div></div>
                                            </button>
                                        </div>
                                        <div class="data">
                                            <button class="button-7">
                                                <div class="div-wrapper"><div class="text-wrapper-28">7</div></div>
                                            </button>
                                        </div>
                                        <div class="data-5">
                                            <button class="container-wrapper">
                                                <div class="div-wrapper"><div class="text-wrapper-28">8</div></div>
                                            </button>
                                        </div>
                                        <div class="data">
                                            <button class="container-wrapper">
                                                <div class="div-wrapper"><div class="text-wrapper-28">9</div></div>
                                            </button>
                                        </div>
                                        <div class="data">
                                            <button class="button-8">
                                                <div class="div-wrapper"><div class="text-wrapper-28">10</div></div>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="data">
                                            <button class="container-wrapper">
                                                <div class="div-wrapper"><div class="text-wrapper-30">11</div></div>
                                            </button>
                                        </div>
                                        <div class="data">
                                            <button class="button-7">
                                                <div class="div-wrapper"><div class="text-wrapper-28">12</div></div>
                                            </button>
                                        </div>
                                        <div class="data">
                                            <button class="button-7">
                                                <div class="div-wrapper"><div class="text-wrapper-28">13</div></div>
                                            </button>
                                        </div>
                                        <div class="data">
                                            <button class="button-7">
                                                <div class="div-wrapper"><div class="text-wrapper-28">14</div></div>
                                            </button>
                                        </div>
                                        <div class="data-6">
                                            <button class="container-wrapper">
                                                <div class="container-14"><div class="text-wrapper-28">15</div></div>
                                            </button>
                                        </div>
                                        <div class="data-7">
                                            <button class="container-wrapper">
                                                <div class="div-wrapper"><div class="text-wrapper-28">16</div></div>
                                            </button>
                                        </div>
                                        <div class="data-8">
                                            <button class="button-8">
                                                <div class="container-15"><div class="text-wrapper-31">17</div></div>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="row-2">
                                        <div class="data">
                                            <button class="container-wrapper">
                                                <div class="div-wrapper"><div class="text-wrapper-29">18</div></div>
                                            </button>
                                        </div>
                                        <div class="data">
                                            <button class="margin-wrapper">
                                                <div class="margin">
                                                    <div class="div-wrapper"><div class="text-wrapper-32">19</div></div>
                                                </div>
                                            </button>
                                        </div>
                                        <div class="data">
                                            <button class="button-7">
                                                <div class="div-wrapper"><div class="text-wrapper-33">20</div></div>
                                            </button>
                                        </div>
                                        <div class="data">
                                            <button class="margin-wrapper">
                                                <div class="margin">
                                                    <div class="div-wrapper"><div class="text-wrapper-34">21</div></div>
                                                </div>
                                            </button>
                                        </div>
                                        <div class="data">
                                            <button class="container-wrapper">
                                                <div class="div-wrapper"><div class="text-wrapper-32">22</div></div>
                                            </button>
                                        </div>
                                        <div class="data">
                                            <button class="container-wrapper">
                                                <div class="div-wrapper"><div class="text-wrapper-31">23</div></div>
                                            </button>
                                        </div>
                                        <div class="data-9">
                                            <button class="button-8">
                                                <div class="container-16"><div class="text-wrapper-35">24</div></div>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="data">
                                            <button class="container-wrapper">
                                                <div class="div-wrapper"><div class="text-wrapper-36">25</div></div>
                                            </button>
                                        </div>
                                        <div class="data-10">
                                            <button class="button-7">
                                                <div class="div-wrapper"><div class="text-wrapper-31">26</div></div>
                                            </button>
                                        </div>
                                        <div class="data-11">
                                            <button class="button-7">
                                                <div class="div-wrapper"><div class="text-wrapper-37">27</div></div>
                                            </button>
                                        </div>
                                        <div class="data-12">
                                            <button class="button-9">
                                                <div class="container-17"><div class="text-wrapper-28">28</div></div>
                                            </button>
                                        </div>
                                        <div class="data-12">
                                            <button class="button-4">
                                                <div class="container-18"><div class="text-wrapper-28">29</div></div>
                                            </button>
                                        </div>
                                        <div class="data-13">
                                            <button class="button-3">
                                                <div class="div-wrapper"><div class="text-wrapper-28">30</div></div>
                                            </button>
                                        </div>
                                        <div class="data-14">
                                            <button class="button-5">
                                                <div class="container-19"><div class="text-wrapper-28">31</div></div>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="horizontal-border">
                        <div class="container-20">
                            <div class="div-wrapper-2"><div class="text-wrapper-38">오전</div></div>
                            <div class="list-2">
                                <div class="item">
                                    <button class="button-10"><div class="text-wrapper-39">10:00</div></button>
                                </div>
                                <div class="item">
                                    <button class="button-10"><div class="text-wrapper-40">10:30</div></button>
                                </div>
                                <div class="item">
                                    <button class="button-10"><div class="text-wrapper-41">11:00</div></button>
                                </div>
                                <div class="item">
                                    <button class="button-10"><div class="text-wrapper-42">11:30</div></button>
                                </div>
                            </div>
                            <div class="container-21"><div class="text-wrapper-38">오후</div></div>
                            <div class="list-3">
                                <div class="item-2">
                                    <button class="button-10"><div class="text-wrapper-43">12:00</div></button>
                                </div>
                                <div class="item-3">
                                    <button class="button-10"><div class="text-wrapper-39">12:30</div></button>
                                </div>
                                <div class="item-4">
                                    <button class="button-11"><div class="text-wrapper-44">1:00</div></button>
                                </div>
                                <div class="item-5">
                                    <button class="button-11"><div class="text-wrapper-44">1:30</div></button>
                                </div>
                                <div class="item-6">
                                    <button class="button-11"><div class="text-wrapper-45">2:00</div></button>
                                </div>
                                <div class="item-7">
                                    <button class="button-11"><div class="text-wrapper-46">2:30</div></button>
                                </div>
                                <div class="item-8">
                                    <button class="button-11"><div class="text-wrapper-47">3:00</div></button>
                                </div>
                                <div class="item-9">
                                    <button class="button-11"><div class="text-wrapper-48">3:30</div></button>
                                </div>
                                <div class="item-10">
                                    <button class="button-11"><div class="text-wrapper-48">4:00</div></button>
                                </div>
                                <div class="item-11">
                                    <button class="button-11"><div class="text-wrapper-49">4:30</div></button>
                                </div>
                                <div class="item-12">
                                    <button class="button-12"><div class="text-wrapper-50">5:00</div></button>
                                </div>
                                <div class="item-13">
                                    <button class="button-11"><div class="text-wrapper-51">5:30</div></button>
                                </div>
                                <div class="item-14">
                                    <button class="button-11"><div class="text-wrapper-51">6:00</div></button>
                                </div>
                                <div class="item-15">
                                    <button class="button-11"><div class="text-wrapper-47">6:30</div></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="section-2">
                    <div class="container-22">
                        <div class="list-wrapper">
                            <div class="list-4">
                                <div class="container-23">
                                    <div class="container-24">
                                        <div class="container-25">
                                            <div class="item-wrapper">
                                                <div class="dress-picture-wrapper">
                                                    <img class="dress-picture" src="img/dress-picture.png" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="container-26">
                            <div class="div-wrapper-2"><div class="text-wrapper-52">WBL 드레스#</div></div>
                            <div class="list-5">
                                <div class="item-16">
                                    <img class="SVG-margin-2" src="img/svg-margin-1.svg" />
                                    <div class="container-27">
                                        <p class="text-wrapper-53">
                                            세련되고 환상적이고 도시적인 느낌을 가진 드레스입니다.<br />이걸 입는 당신은 이쁜이
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 커스텀 알림창 -->
        <div id="confirmModal" class="modal">
            <div class="modal-content">
                <h2>예약을 확정하시겠습니까?</h2>
                <button class="confirm" onclick="confirmReservation()">확인</button>
                <button class="cancel" onclick="closeConfirmModal()">취소</button>
            </div>
        </div>
    </div>

    <script>
        function cancelReservation() {
            window.history.back();
        }

        function showConfirmModal() {
            const reservationDate = document.getElementById('reservation_date').value;
            const reservationTime = document.getElementById('reservation_time').value;

            if (!reservationDate || !reservationTime) {
                alert("예약 날짜와 시간을 모두 선택해주세요.");
                return;
            }

            const modal = document.getElementById('confirmModal');
            modal.style.display = "block";
        }

        function closeConfirmModal() {
            const modal = document.getElementById('confirmModal');
            modal.style.display = "none";
        }

        function confirmReservation() {
            closeConfirmModal();
            document.getElementById('reservationForm').action = 'orderSummary.jsp';
            document.getElementById('reservationForm').submit();
        }

        window.onclick = function(event) {
            const modal = document.getElementById('confirmModal');
            if (event.target == modal) {
                closeConfirmModal();
            }
        }
    </script>
</body>
</html>
