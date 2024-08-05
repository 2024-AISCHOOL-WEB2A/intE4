<%@page import="com.WCLProject.model.DTO.VendorMemberDTO"%>
<%@page import="com.WCLProject.model.DTO.UserMemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.WCLProject.model.DAO.DressDAO"%>
<%@ page import="com.WCLProject.model.DTO.Dress"%>
<%@ page import="java.util.List"%>
<% 
UserMemberDTO user = (UserMemberDTO) session.getAttribute("userInfo");
VendorMemberDTO vendor = (VendorMemberDTO) session.getAttribute("vendorInfo");
Boolean isLogin = (vendor != null || user != null);
%>
<% if (!isLogin) { %>
    <script type="text/javascript">
        alert("로그인이 필요합니다.");
        window.location.href = "mainPage.jsp";
    </script>
<%
    return;
}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href="./css/dressDetailLike.css">
<link rel="stylesheet" href="./css/mainPage_globals.css">
<link rel="stylesheet" href="./css/mainPage_styleguide.css">
<meta charset="UTF-8">
<title>Wedding Dress Detail</title>
<style>
.highlighted {
	border: 2px solid red;
}
</style>
</head>
<body>
	 <header>
        <jsp:include page="header2.jsp" />
    </header>
    <div class="container">
        <%
        String dressId = request.getParameter("id");
        DressDAO dressDAO = new DressDAO();
        Dress dress = dressDAO.getDressById(dressId);
        List<Dress> brandDresses = dressDAO.getDressesByBrand(dress.getDressBrand());
        Collections.shuffle(brandDresses);
        List<Dress> filteredBrandDresses = new ArrayList<>(brandDresses);
        filteredBrandDresses.remove(dress);
        %>
        <!-- 드레스 상세 정보 출력 -->
        <div class="dress-detail">
            <div class="detail-top">
                <div class="main-image">
                    <img id="like"
                        src="<%=request.getContextPath()%>/upload/dress/<%=dress.getPhotoPath()%>"
                        alt="<%=dress.getDressBrand()%>">
                    <span class="heart-icon" onclick="toggleLike(this)">&#x2661</span>
                </div>
                <div class="dress-info">
                    <h2><%=dress.getDressBrand()%></h2>
                    <h3>
                        #
                        <%=dress.getDressFabric()%>&nbsp;&nbsp;&nbsp;#
                        <%=dress.getDressLine()%>&nbsp;&nbsp;&nbsp;#
                        <%=dress.getDressStyle()%></h3>
                    <h4># <%= dress.getDressTitle() %></h4>
                    <p class="line-break"><%=dress.getDressContent()%></p>
                    <p class="dress-price"><%=dress.getDressPrice()%>원
                    </p>
                    <button class="inquiry-button"
                        onclick="location.href='inquiry.jsp?dressId=<%=dress.getId()%>'">문의하기</button>
                </div>
            </div>
            <div class="more-dresses">
                <h3>More dresses from <%=dress.getDressBrand()%></h3>
                <div class="thumbnail-images">
                    <%
                    for (Dress brandDress : brandDresses) {
                    %>
                    <div class="thumbnail-item">
                        <img
                            src="<%=request.getContextPath()%>/upload/dress/<%=brandDress.getPhotoPath()%>"
                            alt="<%=brandDress.getDressBrand()%>"
                            onclick="location.href='<%=request.getContextPath()%>/dressDetailLike.jsp?id=<%=brandDress.getId()%>'">
                    </div>
                    <%
                    }
                    %>
                </div>
            </div>
        </div>
    </div>

    <div id="image-container">
        <%
        ArrayList<Dress> recommendDressList = (ArrayList<Dress>) request.getAttribute("recommendDressList");
        if (recommendDressList != null && !recommendDressList.isEmpty()) {
            for (Dress likedDress : recommendDressList) {
        %>
        <div class="choice">
            <img
                src="<%=request.getContextPath()%>/upload/dress/<%=likedDress.getPhotoPath()%>"
                alt="<%=likedDress.getDressBrand()%>"
                onclick="location.href='<%=request.getContextPath()%>/dressDetailLike.jsp?id=<%=likedDress.getId()%>'">
            <div class="description"><%=likedDress.getDressBrand()%>
                (<%=likedDress.getDressPrice()%>원)
            </div>
            <div class="description2">
                #<%=likedDress.getDressFabric()%>&nbsp;&nbsp;&nbsp;#<%=likedDress.getDressLine()%>&nbsp;&nbsp;&nbsp;#<%=likedDress.getDressStyle()%>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <p>No recommendations available.</p>
        <%
        }
        %>
    </div>

    <div class="brand-section">
        <p>DRESS</p>
        <div id="mr_playResult"></div>
        <h2><%=dress.getDressBrand()%></h2>
        <div class="brand-main-image">
            <img id="mr_play"
                src="<%=request.getContextPath()%>/upload/dress/<%=dress.getPhotoPath()%>"
                alt="<%=dress.getDressBrand()%>">
        </div>
    </div>
    <div class="button-section">
        <button
            onclick="location.href='reservation_dress.jsp?dressId=<%=dress.getId()%>'">예약하기</button>
        <button
            onclick="location.href='payment.jsp?dressId=<%=dress.getId()%>'">결제하기</button>
    </div>

    <footer>
        <jsp:include page="footer.jsp" />
    </footer>

	<script
		src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs@latest/dist/tf.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@teachablemachine/image@latest/dist/teachablemachine-image.min.js"></script>

	<script type="text/javascript">
const URL = "./my_model/";

let model, labelContainer, maxPredictions;

async function init() {
    try {
        const modelURL = URL + "model.json";
        const metadataURL = URL + "metadata.json";
        model = await tmImage.load(modelURL, metadataURL);
        maxPredictions = model.getTotalClasses();
        labelContainer = document.getElementById("mr_playResult");
        for (let i = 0; i < maxPredictions; i++) {
            labelContainer.appendChild(document.createElement("div"));
        }
    } catch (error) {
        console.error("Error loading the model:", error);
    }
}

async function predict() {
    try {
        const image = document.getElementById('mr_play');
        if (!image.complete || image.naturalHeight === 0) {
            console.error("Image is not loaded properly");
            return;
        }
        const prediction = await model.predict(image);
        let highestPrediction = prediction[0];
        for (let i = 1; i < maxPredictions; i++) {
            if (prediction[i].probability > highestPrediction.probability) {
                highestPrediction = prediction[i];
            }
        }
        const classPrediction = highestPrediction.className + ": " + highestPrediction.probability.toFixed(2);
        labelContainer.childNodes[0].innerHTML = classPrediction;
        labelContainer.style.display = 'block'; // Ensure the result is visible
        
        sendResultsToServer(highestPrediction.className);
    } catch (error) {
        console.error("Error during prediction:", error);
    }
}

async function sendResultsToServer(resultString) {
    const brand = "<%= dress.getDressBrand() %>";
    try {
        const response = await fetch('/WCLProject/RecommendationService', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: new URLSearchParams({
                'result': resultString,
                'brand': brand
            }),
        });

        if (response.ok) {
            const data = await response.json();
            console.log("Received data:", data); // 디버깅용 로그
            updateRecommendations(data);
        } else {
            console.error('Failed to send result to the server:', response.statusText);
        }
    } catch (error) {
        console.error('Error sending result to the server:', error);
    }
}

async function handleLikeClick(element) {
    element.classList.toggle('active');
    var isLiked = element.classList.contains('active');
    localStorage.setItem('isLiked', isLiked);

    var imageContainer = document.getElementById('image-container');
    if (isLiked) {
        imageContainer.style.display = 'block';
        // 모델 초기화 및 예측
        if (!model) {
            await init();
        }
        const image = document.getElementById('mr_play');
        if (image.complete && image.naturalHeight !== 0) {
            await predict();
        } else {
            image.onload = predict;
        }
    } else {
        imageContainer.style.display = 'none';
        if (labelContainer) {
            labelContainer.style.display = 'none';
        }
    }
}

//새로운 함수 추가: 추천 드레스 업데이트
function updateRecommendations(dresses) {
	var contextPath = '<%=request.getContextPath()%>';
	 const container = document.getElementById('image-container');
	    container.innerHTML = ''; // 기존 내용 초기화

	    dresses.forEach(dress => {
	        const dressElement = document.createElement('div');
	        dressElement.className = 'choice';
	        dressElement.innerHTML = `
	            <img src="\${contextPath}/upload/dress/\${dress.photoPath}" 
	                 alt="\${dress.dressBrand}" 
	                 onclick="location.href='\${contextPath}/dressDetailLike.jsp?id=\${dress.id}'">
	            <div class="description">\${dress.dressBrand} (\${dress.dressPrice}원)</div>
	            <div class="description2">#\${dress.dressFabric} #\${dress.dressLine} #\${dress.dressStyle}</div>
	        `;
	        container.appendChild(dressElement);
	    });
	}

// 페이지 로드 시
window.onload = async function() {
    const scrollPosition = localStorage.getItem('scrollPosition');
    if (scrollPosition) {
        window.scrollTo(0, parseInt(scrollPosition, 10));
    }

    // 페이지 로드 시 좋아요 상태를 확인하고 설정
    var liked = localStorage.getItem('isLiked') === 'true';
    if (liked) {
        document.querySelector('.heart-icon').classList.add('active');
        document.getElementById('image-container').style.display = 'block';
        // Initialize model if not already loaded
        if (!model) {
            await init();
        }
        // Ensure the image is loaded before predicting
        const image = document.getElementById('mr_play');
        if (image.complete && image.naturalHeight !== 0) {
            predict();
        } else {
            image.onload = predict; // Call predict once the image is fully loaded
        }
    } else {
        const imageContainer = document.getElementById('image-container');
        if (imageContainer) {
            imageContainer.style.display = 'none'; // Ensure the image container is hidden
        }
        if (labelContainer) {
            labelContainer.style.display = 'none'; // Ensure the prediction result is hidden
        }
    }
};
		
		// 페이지 언로드 시 스크롤 위치 저장
		window.onbeforeunload = function() {
			localStorage.setItem('scrollPosition', window.scrollY);
		};
		
	    // 하트를 클릭할 때 로컬 저장소에 상태 저장
	    document.querySelector('.heart-icon').addEventListener('click', function() {
	        handleLikeClick(this);
	    });
		
	</script>
</body>
</html>