<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.WCLProject.model.DAO.ReservationDAO"%>
<%@ page import="com.WCLProject.model.DTO.ReservationDTO"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>주문</title>
    <style>
        body {
            font-family: "Inter", Helvetica, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
            margin: 0;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }

        h2 {
            text-align: center;
            font-size: 2.5em;
            margin-bottom: 40px;
            color: #333;
        }

        .reservation-item {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 20px;
        }

        .reservation-item img {
            max-width: 150px;
            height: auto;
            border-radius: 10px;
            margin-right: 30px;
        }

        .item-details {
            flex: 1;
        }

        .item-details p {
            margin: 0;
            margin-bottom: 10px;
            font-size: 1.1em;
            color: #555;
        }

        .item-price {
            font-weight: bold;
            color: #333;
        }

        .button-group {
            text-align: center;
            margin-top: 30px;
        }

        .button-group button {
            padding: 15px 30px;
            font-size: 1.2em;
            color: #000;
            background-color: #ffebeb;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 0 20px;
            transition: background-color 0.3s ease;
        }

        .button-group button.cancel {
            background-color: #ffebeb;
        }

        .button-group button.cancel:hover {
            background-color: #ffcccc;
        }

        .button-group button:hover {
            background-color: #ffcccc;
        }

        .category-title {
            margin-top: 30px;
            font-size: 1.8em;
            font-weight: bold;
            color: #8A2BE2;
            border-bottom: 2px solid #ccc;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        .checkbox {
            margin-right: 15px;
            transform: scale(1.5); /* 체크박스 크기 더 크게 조정 */
        }

        .total-price {
            margin-top: 30px;
            text-align: center;
            font-size: 1.8em;
            font-weight: bold;
            color: #333;
        }

        .price-comparison {
            text-align: center;
            margin-top: 20px;
            font-size: 1.2em;
            color: #555;
        }

        .highlight {
            color: #8A2BE2; /* 보라색 */
            font-weight: bold;
            font-size: 1.5em;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@latest/dist/tf.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@latest/dist/teachablemachine-image.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
        // 선택된 항목들의 가격을 합산하여 표시하는 함수
        function calculateTotalPrice() {
            var checkboxes = document.querySelectorAll('input[type="checkbox"].reservation-checkbox:checked');
            var totalPrice = 0;

            checkboxes.forEach(function(checkbox) {
                var priceElement = checkbox.closest('.reservation-item').querySelector('.item-price');
                var price = parseInt(priceElement.textContent.replace('원', '').replace(',', ''));
                totalPrice += price;
            });

            document.getElementById('totalPrice').textContent = totalPrice.toLocaleString() + '원';
        }

        // 전체 선택 및 해제 기능
        function toggleSelectAll(source) {
            var checkboxes = document.querySelectorAll('input[type="checkbox"].reservation-checkbox');
            checkboxes.forEach(function(checkbox) {
                checkbox.checked = source.checked;
            });
            calculateTotalPrice(); // 전체 선택 시 총합을 다시 계산
            showPriceComparison(); // 가격 비교도 업데이트
        }

        // 카테고리별로 전체 선택/해제 기능
        function toggleCategorySelectAll(source, category) {
            var checkboxes = document.querySelectorAll('input[type="checkbox"].reservation-checkbox[data-category="' + category + '"]');
            checkboxes.forEach(function(checkbox) {
                checkbox.checked = source.checked;
            });
            calculateTotalPrice(); // 카테고리 선택 시 총합을 다시 계산
            showPriceComparison(); // 가격 비교도 업데이트
        }

        function showPriceComparison() {
            var categories = {};

            // 선택된 체크박스를 모두 가져옴
            var checkboxes = document.querySelectorAll('input[type="checkbox"].reservation-checkbox:checked');

            checkboxes.forEach(function(checkbox) {
                // 체크박스의 카테고리 가져오기
                var category = checkbox.getAttribute('data-category');
                // 해당 체크박스가 속한 아이템의 가격 가져오기
                var priceElement = checkbox.closest('.reservation-item').querySelector('.item-price');
                var price = parseInt(priceElement.textContent.replace('원', '').replace(',', ''));
                var itemId = checkbox.closest('.reservation-item').querySelector('.item-details p:nth-child(2)').textContent.split(': ')[1];
                var itemBrand = checkbox.closest('.reservation-item').querySelector('.item-details p:nth-child(1)').textContent.split(': ')[1];

                // 카테고리별로 가격을 배열로 저장
                if (!categories[category]) {
                    categories[category] = [];
                }

                categories[category].push({ itemId: itemId, price: price, itemBrand: itemBrand });
            });

            // 각 카테고리별로 가격 차이를 계산하고 출력
            for (var category in categories) {
                if (categories[category].length > 1) {
                    var prices = categories[category].map(item => item.price);
                    var minPrice = Math.min.apply(null, prices);
                    var maxPrice = Math.max.apply(null, prices);
                    var difference = maxPrice - minPrice;

                    var minItem = categories[category].find(item => item.price === minPrice);
                    var maxItem = categories[category].find(item => item.price === maxPrice);

                    // 가격 비교 결과를 해당 카테고리 섹션 끝에 추가
                    var comparisonOutput = document.createElement('div');
                    comparisonOutput.className = 'price-comparison';
                    comparisonOutput.innerHTML = 
                        '<strong>' + minItem.itemId + ' (' + minItem.itemBrand + ')</strong>이 ' +
                        '<strong>' + maxItem.itemId + ' (' + maxItem.itemBrand + ')</strong>보다 ' +
                        '<span class="highlight">' + difference.toLocaleString() + '원</span> 더 저렴합니다.';

                    // 현재 카테고리 섹션을 찾고, 그 안에 comparisonOutput을 추가
                    var categorySection = document.getElementById('priceComparison-' + category);
                    if (categorySection) {
                        categorySection.innerHTML = '';
                        categorySection.appendChild(comparisonOutput);
                    }
                }
            }
        }




        

        // 체크박스 클릭 시 총합 및 가격 비교 결과를 다시 계산
        document.addEventListener('DOMContentLoaded', function() {
            var selectAllCheckbox = document.getElementById('selectAll');
            var checkboxes = document.querySelectorAll('input[type="checkbox"].reservation-checkbox');

            // 전체 선택 체크박스 이벤트 핸들러
            selectAllCheckbox.addEventListener('change', function() {
                toggleSelectAll(this);
            });

            // 개별 체크박스 이벤트 핸들러
            checkboxes.forEach(function(checkbox) {
                checkbox.addEventListener('change', function() {
                    calculateTotalPrice();
                    showPriceComparison();
                });
            });

            // 페이지 로드 시 초기 총합 및 가격 비교 계산
            calculateTotalPrice();
            showPriceComparison();
        });

        $(document).ready(function() {
            $("#check_module").click(function() {
                var IMP = window.IMP; // 생략가능
                IMP.init('imp05218310'); // IAMP 인증키 설정
                var totalPrice = parseInt(document.getElementById('totalPrice').textContent.replace(/[^0-9]/g, ''));
                IMP.request_pay({
                    pg: 'html5_inicis',
                    pay_method: 'card',
                    merchant_uid: 'merchant_' + new Date().getTime(),
                    name: 'WeddingChoice',
                    amount: totalPrice,
                    buyer_email: 'iamport@siot.do',
                    buyer_name: '구매자이름',
                    buyer_tel: '010-1234-5678',
                    buyer_addr: '서울특별시 강남구 삼성동',
                    buyer_postcode: '123-456',
                    m_redirect_url: 'https://www.yourdomain.com/payments/complete'
                }, function(rsp) {
                    console.log(rsp);
                    if (rsp.success) {
                        var msg = '결제가 완료되었습니다.';
                        /* msg += '고유ID : ' + rsp.imp_uid; */
                        /* msg += '상점 거래ID : ' + rsp.merchant_uid; */
                        msg += '결제 금액 : ' + rsp.paid_amount;
                        /* msg += '카드 승인번호 : ' + rsp.apply_num; */
                        window.location.href = '<%=request.getContextPath()%>/paymentSuccess.jsp';
                    } else {
                        var msg = '결제에 실패하였습니다.';
                        msg += '에러내용 : ' + rsp.error_msg;
                        alert(msg);
                    }
                });
            });
        });
    </script>
</head>
<body>
    <!-- 헤더 포함 -->
    <jsp:include page="header.jsp" />

    <div class="container">
        <h2>주문</h2>
        <!-- 전체 선택 체크박스 -->
        <div class="select-all">
            <label>
                <input type="checkbox" id="selectAll"> 전체 선택/ 전체 선택해제
            </label>
        </div>
        <!-- 예약 항목과 삭제 요청을 처리하는 폼 -->
        <form id="orderForm" method="get" action="OrderRemove">
            <%
            // 세션에서 사용자 ID를 가져옴
            String userId = (String) session.getAttribute("userId");
            if (userId == null) {
                response.sendRedirect("loginPage.jsp");
                return;
            }

            // 데이터베이스에서 해당 사용자의 예약 정보를 가져옴
            ReservationDAO reservationDAO = new ReservationDAO();
            List<ReservationDTO> reservations = reservationDAO.getReservationsByUserId(userId);

            if (reservations == null || reservations.isEmpty()) {
                // 예약된 항목이 없을 때 메시지 표시
                out.println("<p>예약된 항목이 없습니다.</p>");
            } else {
                // 카테고리별로 예약을 그룹화하기 위해 Map 사용
                Map<String, List<ReservationDTO>> categorizedReservations = new HashMap<>();
                for (ReservationDTO reservation : reservations) {
                    String category = reservation.getVendorCategory();
                    if (!categorizedReservations.containsKey(category)) {
                        categorizedReservations.put(category, new ArrayList<>());
                    }
                    categorizedReservations.get(category).add(reservation);
                }

                // 카테고리별로 예약 정보 출력
                for (Map.Entry<String, List<ReservationDTO>> entry : categorizedReservations.entrySet()) {
                    String category = entry.getKey();
                    List<ReservationDTO> categoryReservations = entry.getValue();
            %>
            <div class="category-section">
                <div class="category-title">
                    <%=category%>
                    <!-- 카테고리별 전체 선택/해제 체크박스 -->
                    <label style="float: right;">
                        <input type="checkbox" class="category-checkbox" onchange="toggleCategorySelectAll(this, '<%=category%>')"> <%=category%> 전체 선택/해제
                    </label>
                </div>
                <%
                for (ReservationDTO reservation : categoryReservations) {
                    // 카테고리에 따라 이미지 경로를 동적으로 설정
                    String imagePath = "";
                    if ("드레스".equals(category)) {
                        imagePath = "dress";
                    } else if ("스튜디오".equals(category)) {
                        imagePath = "studio";
                    } else if ("웨딩홀".equals(category)) {
                        imagePath = "weddinghall";
                    } else if ("메이크업".equals(category)) {
                        imagePath = "makeup";
                    }
                    String photoPath = reservation.getPhotoPath();
                    String reservationDateTime = reservation.getReservationDate();
                    String reservationDate = reservationDateTime.substring(0, reservationDateTime.lastIndexOf(':')); // 분까지만 추출
                %>
                <div class="reservation-item">
                    <!-- 예약 ID를 값으로 가지는 체크박스를 표시하여 삭제할 예약 선택 -->
                    <input type="checkbox" class="checkbox reservation-checkbox" name="reservationIds" value="<%=reservation.getReservationId()%>" data-category="<%=category%>"> 
                    <img src="<%=request.getContextPath()%>/upload/<%=imagePath%>/<%=photoPath%>" alt="Item Image">
                    <div class="item-details">
                       <p><strong>브랜드:</strong> <%=reservation.getItemBrand()%></p>
                        <p><strong>아이템 ID:</strong> <%=reservation.getItemId()%></p>
                        <p><strong>카테고리:</strong> <%=reservation.getVendorCategory()%></p>
                        <p><strong>예약 날짜:</strong> <%=reservationDate%></p> <!-- 분까지만 표시 -->
                        <p><strong>가격:</strong> <span class="item-price"><%=reservation.getItemPrice()%>원</span></p>
                    </div>
                </div>
                <%
                }
                %>
                <!-- 가격 비교 결과를 표시할 요소 -->
                <div id="priceComparison-<%=category%>" class="price-comparison"></div>
            </div>
            <%
            }
            }
            %>
            
            <!-- 총합을 표시하는 부분 -->
            <div class="total-price">
                총 합계: <span id="totalPrice">0원</span>
            </div>
            <!-- 버튼 그룹: 삭제 및 결제 -->
            <div class="button-group">
                <button type="submit" class="cancel">예약 삭제</button>
                <button id="check_module" type="button">결제하기</button>
            </div>
        </form>
    </div>

    <!-- 푸터 포함 -->
    <jsp:include page="footer.jsp" />
</body>
</html>
