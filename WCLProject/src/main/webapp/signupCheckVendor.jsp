<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/signupVendor_globals.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/signupVendor_styleguide.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/signupVendor_style.css" />
</head>
<body>
	<div class="business-membership">
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
							<div class="text-wrapper-4">로그인</div>
							<div class="text-wrapper-4">회원가입</div>
						</div>
					</div>
				</div>
				<header class="header">
					<div class="container">
						<div class="link">
							<div class="w-e-d-d-i-n-g-c-h-o-wrapper">
								<p class="w-e-d-d-i-n-g-c-h-o">W e d d i n
									g&nbsp;&nbsp;&nbsp;&nbsp;C h o i c e</p>
							</div>
						</div>
					</div>
				</header>
			</div>
			<footer class="footer">
				<div class="overlap-group">
					<div class="container-2">
						<div class="text-wrapper-6">Lisianthus</div>
						<div class="text-wrapper-7">(주)인트이사</div>
						<div class="text-wrapper-8">대표이사 김현수</div>
						<p class="p">COPYRIGHT ©2024 SINBUYA ALL RIGHTS RESERVED.</p>
					</div>
					<p class="w-e-d-d-i-n-g-c-h-o-2">W e d d i n g&nbsp;&nbsp;C h o
						i c e</p>
				</div>
				<div class="container-3">
					<div class="text-wrapper-9">Information</div>
					<div class="text-wrapper-10">사업자등록번호 777 88 00999</div>
					<div class="text-wrapper-11">통신판매업신고 제2024-광주북구-00001호</div>
					<p class="div-2">
						<span class="span">개인정보관리책임자 </span> <span class="text-wrapper-12">정수형</span>
					</p>
				</div>
				<div class="container-4">
					<div class="list">
						<div class="text-wrapper-13">이용약관</div>
						<div class="text-wrapper-14">개인정보처리방침</div>
						<div class="text-wrapper-15">회사소개</div>
						<div class="text-wrapper-16">오시는 길</div>
					</div>
					<div class="text-wrapper-17">Contact Us</div>
					<div class="element">오전 9:00 -&nbsp;&nbsp;18:00 (월요일-금요일)</div>
					<p class="t-f">
						<span class="text-wrapper-18">T</span> <span
							class="text-wrapper-19"> 062-123-4567   |   </span> <span
							class="text-wrapper-18">F</span> <span class="text-wrapper-19">
							062-123-4568</span>
					</p>
					<p class="text-wrapper-20">광주광역시 동구 동천동 인공지능사관학교 2층</p>
				</div>
			</footer>
			<div class="view-2">
				<div class="background">
					<div class="container-5">
						<div class="heading">
							<div class="text-wrapper-21">기업회원 가입</div>
						</div>
						<div class="div-3">
							<p class="text-wrapper-22">웨딩 초이스의 회원이 되시면 국내 최대의 리뷰와 웨딩 컬렉션
								할인정보, 웨딩홀 이벤트 등 다양한 판매 서비스를 확인하실 수 있습니다.</p>
						</div>
					</div>
				</div>
				<div class="form-wrapper">
					<div class="form">
						<div class="fieldset">
							<div class="container-6">
								<form id="signup_vendor_firstForm" method="post">
									<div class="view-3">
										<div class="label-margin">
											<div class="label">
												<div class="text-wrapper-25">기업명</div>
											</div>
										</div>
										<div class="container-wrapper">
											<div class="container-7">
												<div class="input">
													<input type="text" id="vendor_name" name="vendor_name"
														style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
														required>
												</div>
												<div class="label-wrapper">
													<div class="label-2">
														<div class="container-8"></div>
													</div>
												</div>
											</div>
										</div>
										<div class="container-9"></div>
									</div>
									<br>
									<div class="view-4">
										<div class="label-margin">
											<div class="label">
												<div class="text-wrapper-25">기업 주소</div>
											</div>
										</div>
										<div class="input-wrapper">
											<div class="input-2">
												<input type="text" id="vendor_postcode"
													name="vendor_postcode"
													style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
													placeholder="우편번호">
												<!-- 주쇼 API -->
												<input type="button" onclick="vendor_execDaumPostcode()"
													style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
													value="우편번호 찾기"><br>
												<!-- 주쇼 API -->
												<input type="text" id="vendor_address" name="vendor_address"
													style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
													placeholder="주소"><br>
												<!-- 주쇼 API -->
												<input type="text" id="vendor_detailAddress"
													style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
													name="vendor_detailAddress" placeholder="상세주소">
												<!-- 주쇼 API -->
												<input type="text" id="vendor_extraAddress"
													style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
													name="vendor_extraAddress" placeholder="참고항목">
												<!-- 주쇼 API -->
											</div>
										</div>
									</div>
									<br> <br> <br> <br> <br> <br> <br>
									<br> <br> <br> <br>
									<div class="view-5">
										<div class="label-margin-2">
											<div class="label-3">
												<div class="text-wrapper-25">아아디</div>
											</div>
										</div>
										<div class="input-3">
											<input type="text" id="vendor_id" name="vendor_id"
												style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
												required>
											<div id="vendor_id_result"></div>
										</div>
										<br>
										<div class="vertical-border">
											<button class="button" onclick="checkVendorId()">
												<div class="text-wrapper-26">중복확인</div>
											</button>
										</div>
										<div class="container-10">
											<div class="container-11">
												<p class="text-wrapper-27">※ 아이디는 4~12자 사이로 입력해주세요.</p>
											</div>
										</div>
									</div>
									<br>
									<div class="view-5">
										<div class="label-margin-2">
											<div class="label-3">
												<div class="text-wrapper-25">비밀번호</div>
											</div>
										</div>
										<div class="input-3">
											<input type="password" id="vendor_pw" name="vendor_pw"
												style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
												required>
										</div>
										<div class="container-10">
											<div class="container-11">
												<p class="text-wrapper-27">※ 비밀번호는 8~12자 사이로 입력해주세요.</p>
											</div>
										</div>
									</div>
									<br>
									<div class="view-5">
										<div class="label-margin-2">
											<div class="label-3">
												<div class="text-wrapper-25">비밀번호 확인</div>
											</div>
										</div>
										<div class="input-3">
											<input type="password" id="vendor_pw_check"
												name="vendor_pw_check"
												style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
												required>
											<div id="vendor_pw_result"></div>
										</div>
										<div class="vertical-border">
											<button class="button" onclick="checkVendorPw()">
												<div class="text-wrapper-26">중복확인</div>
											</button>
										</div>
									</div>
									<br>
									<div class="view-5">
										<div class="label-margin-2">
											<div class="label-3">
												<div class="text-wrapper-25">사업자 번호</div>
											</div>
										</div>
										<div class="input-3">
											<input type="text" id="vendor_license" name="vendor_license"
												style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
												required>
											<div id="vendor_license_result"></div>
										</div>
										<div class="vertical-border">
											<button class="button" onclick="checkLicense()">
												<div class="text-wrapper-26">중복확인</div>
											</button>
										</div>
									</div>
									<br>
									<div class="view-5">
										<div class="label-margin-2">
											<div class="label-3">
												<div class="text-wrapper-25">이메일 주소</div>
											</div>
										</div>
										<div class="input-3">
											<input type="email" id="vendor_email" name="vendor_email"
												style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
												required>
										</div>
									</div>
									<br>
									<div class="view-6">
										<div class="label-margin-3">
											<div class="label">
												<div class="text-wrapper-25">연락처</div>
											</div>
										</div>
										<div class="container-12">
											<div class="input-4">
												<input type="tel" id="vendor_tel" name="vendor_tel"
													style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
													required>
											</div>
										</div>
									</div>
									<br>
									<div class="view-6">
										<div class="label-margin">
											<div class="label">
												<div class="text-wrapper-25">업종</div>
											</div>
										</div>
										<div class="container-wrapper">
											<div class="options-wrapper">
												<select id="vendor_category" name="vendor_category"
													style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
													required>
													<option value="웨딩홀">웨딩홀</option>
													<option value="스튜디오">스튜디오</option>
													<option value="드레스">드레스</option>
													<option value="메이크업">메이크업</option>
												</select>
											</div>
										</div>
									</div>
									<br>
									<div class="view-4">
										<div class="label-margin">
											<div class="label">
												<div class="text-wrapper-25">기업 홈페이지 주소</div>
											</div>
										</div>
										<div class="input-wrapper">
											<div class="input-5">
												<input type="text" id="vendor_site_url"
													name="vendor_site_url"
													style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
													required>
											</div>
										</div>
									</div>
								</form>
								<br>
								<form id="upload_files_form" action="FileUploadService"
									method="post" enctype="multipart/form-data">
									<div class="view-5">
										<div class="label-margin-2">
											<div class="label-3">
												<div class="text-wrapper-25">사업자등록증 첨부</div>
											</div>
										</div>
										<input type="file" id="vendor_license_image_file"
											name="vendor_license_image_file"> <input
											type="hidden" id="vendor_license_image"
											name="vendor_license_image">
										<div class="container-10">
											<div class="container-11">
												<div class="text-wrapper-27">※ 해당 업체만 등록해주세요.</div>
											</div>
										</div>
									</div>
									<br>
									<div class="view-5">
										<div class="label-margin-2">
											<div class="label-3">
												<div class="text-wrapper-25">기업 로고 첨부</div>
											</div>
										</div>
										<input type="file" id="vendor_logo_image_file"
											name="vendor_logo_image_file"> <input type="hidden"
											id="vendor_logo_image" name="vendor_logo_image"> <br>
										<div class="container-10">
											<div class="container-11">
												<p class="text-wrapper-27">※ 원본 스캔 후 첨부해주세요.</p>
											</div>
										</div>
									</div>
								</form>
								<br>
								<form id="signup_vendor_secondForm" method="post">
									<div class="view-7">
										<div class="label-margin">
											<div class="label">
												<div class="text-wrapper-25">기업 소개</div>
											</div>
										</div>
										<div class="input-wrapper">
											<div class="input-2">
												<input type="text" id="vendor_intro" name="vendor_intro"
													style="width: 380px; height: 40px; padding: 10px; border: 1px solid #ccc; box-sizing: border-box;"
													required>
											</div>
										</div>
										<div class="container-14">
											<div class="container-11">
												<div class="text-wrapper-27">※ 4,000자 이내로 작성해주세요.</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="fieldset-2">
							<div class="container-15">
								<div class="container-16">
									<div class="margin">
										<div class="container-17">
											<div class="text-wrapper-27">서비스이용약관 (필수)</div>
											<div class="background-border">
												<div class="overlap">
													<div class="horizontal-border">
														<div class="list-2">
															<div class="overlap-group-2">
																<div class="item">
																	<div class="div-4">
																		<div class="text-wrapper-29">제1조(목적)</div>
																	</div>
																</div>
																<div class="link-wrapper">
																	<div class="div-4">
																		<p class="text-wrapper-29">제3조 (약관 등의 명시와 설명 및 개정)</p>
																	</div>
																</div>
																<div class="item-2">
																	<div class="div-4">
																		<div class="text-wrapper-29">제5조(서비스의 중단)</div>
																	</div>
																</div>
																<div class="item-3">
																	<div class="div-4">
																		<p class="text-wrapper-29">제7조(회원 탈퇴 및 자격 상실 등)</p>
																	</div>
																</div>
																<div class="item-4">
																	<div class="div-4">
																		<div class="text-wrapper-29">제9조(구매신청)</div>
																	</div>
																</div>
																<div class="item-5">
																	<div class="div-4">
																		<div class="text-wrapper-29">제11조(지급 방법)</div>
																	</div>
																</div>
																<div class="item-6">
																	<div class="div-4">
																		<div class="text-wrapper-29">제13조(재화 등의 공급)</div>
																	</div>
																</div>
																<div class="item-7">
																	<div class="div-4">
																		<div class="text-wrapper-29">제15조(청약 철회 등)</div>
																	</div>
																</div>
																<div class="item-8">
																	<div class="div-4">
																		<a href="https://www.sinbuya.com/join#t17"
																			target="_blank" rel="noopener noreferrer"><div
																				class="text-wrapper-29">제17조(개인정보보호)</div></a>
																	</div>
																</div>
																<div class="item-9">
																	<div class="div-4">
																		<a href="https://www.sinbuya.com/join#t19"
																			target="_blank" rel="noopener noreferrer"><p
																				class="text-wrapper-29">제19조(회원의 아이디(ID) 및 비밀번호에
																				대한 의무)</p></a>
																	</div>
																</div>
																<div class="item-10">
																	<div class="div-4">
																		<a href="https://www.sinbuya.com/join#t21"
																			target="_blank" rel="noopener noreferrer"><p
																				class="text-wrapper-29">제21조(연결 &#34;사이트&#34;과
																				피연결 &#34;사이트&#34;간의 관계)</p></a>
																	</div>
																</div>
																<div class="item-11">
																	<div class="div-4">
																		<a href="https://www.sinbuya.com/join#t23"
																			target="_blank" rel="noopener noreferrer"><div
																				class="text-wrapper-29">제23조(분쟁 해결)</div></a>
																	</div>
																</div>
																<div class="item-12">
																	<div class="div-4">
																		<a href="https://www.sinbuya.com/join#t25"
																			target="_blank" rel="noopener noreferrer"><div
																				class="text-wrapper-29">부칙</div></a>
																	</div>
																</div>
															</div>
															<div class="overlap-2">
																<div class="item">
																	<div class="div-4">
																		<div class="text-wrapper-29">제2조(정의)</div>
																	</div>
																</div>
																<div class="link-wrapper">
																	<div class="div-4">
																		<div class="text-wrapper-29">제4조(서비스의 제공 및 변경)</div>
																	</div>
																</div>
																<div class="item-2">
																	<div class="div-4">
																		<div class="text-wrapper-29">제6조(회원가입)</div>
																	</div>
																</div>
																<div class="item-3">
																	<div class="div-4">
																		<div class="text-wrapper-29">제8조(회원에 대한 통지)</div>
																	</div>
																</div>
																<div class="item-4">
																	<div class="div-4">
																		<div class="text-wrapper-29">제10조 (계약의 성립)</div>
																	</div>
																</div>
																<div class="item-5">
																	<div class="div-4">
																		<div class="text-wrapper-29">제12조(수신확인통지․구매신청 변경
																			및 취소)</div>
																	</div>
																</div>
																<div class="item-6">
																	<div class="div-4">
																		<div class="text-wrapper-29">제14조(환급)</div>
																	</div>
																</div>
																<div class="item-7">
																	<div class="div-4">
																		<div class="text-wrapper-29">제16조(청약 철회 등의 효과)</div>
																	</div>
																</div>
																<div class="item-8">
																	<div class="div-4">
																		<a href="https://www.sinbuya.com/join#t18"
																			target="_blank" rel="noopener noreferrer">
																			<div class="text-wrapper-29">제18조(&#34;사이트&#34;의
																				의무)</div>
																		</a>
																	</div>
																</div>
																<div class="item-9">
																	<div class="div-4">
																		<a href="https://www.sinbuya.com/join#t20"
																			target="_blank" rel="noopener noreferrer"><div
																				class="text-wrapper-29">제20조(이용자의 의무)</div></a>
																	</div>
																</div>
																<div class="item-10">
																	<div class="div-4">
																		<a href="https://www.sinbuya.com/join#t22"
																			target="_blank" rel="noopener noreferrer"><p
																				class="text-wrapper-29">제22조(저작권의 귀속 및 이용 제한)</p></a>
																	</div>
																</div>
																<div class="item-11">
																	<div class="div-4">
																		<a href="https://www.sinbuya.com/join#t24"
																			target="_blank" rel="noopener noreferrer"><div
																				class="text-wrapper-29">제24조(재판권 및 준거법)</div></a>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="article">
														<div class="div-3">
															<div class="link-2">
																<div class="text-wrapper-30">제1조(목적)</div>
															</div>
														</div>
														<div class="div-3">
															<p class="text-wrapper-31">
																이 약관은 인트이사(이하 &#34;당사&#34;라 한다)에서 운영하는 웨딩초이스
																웹사이트(https://www.weddingchoice.com)(이하 &#34;사이트&#34;라
																한다)에서 제공하는 인터넷 관련 서비스(이하 &#34;서비스&#34;라 한다)를 이용함에 있어 당사와
																이용자의 권리, 의무 및<br />책임 사항을 규정함을 목적으로 합니다.
															</p>
														</div>
													</div>
												</div>
												<div class="overlap-3">
													<div class="article-2">
														<div class="div-3">
															<div class="link-2">
																<div class="text-wrapper-30">제2조(정의)</div>
															</div>
														</div>
														<div class="div-3">
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">①</div>
																</div>
																<p class="text-wrapper-33">
																	&#34;사이트&#34;이란 당사의 재화 또는 용역(이하 &#34;재화 등&#34;이라 함)을
																	이용자에게 제공하기 위하여 컴퓨터 등 정보통신 설비를 이용하여 재화 등을 거래할 수 있도록 설정한
																	가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로<br />도 사용합니다.
																</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">②</div>
																</div>
																<p class="text-wrapper-34">&#34;이용자&#34;란
																	&#34;사이트&#34;에 접속하여 이 약관에 따라 &#34;사이트&#34;이 제공하는 서비스를
																	받는 회원 및 비회원을 말합니다.</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">③</div>
																</div>
																<p class="text-wrapper-34">&#39;회원&#39;이라 함은
																	&#34;사이트&#34;에 개인정보를 제공하여 회원 등록을 한 자로서, &#34;사이트&#34;의
																	정보를 지속적으로 제공받으며, &#34;사이트&#34;이 제공하는 서비스를 계속적으로 이용할 수
																	있는 자를 말합니다.</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">④</div>
																</div>
																<p class="text-wrapper-34">&#39;비회원&#39;이라 함은 회원에
																	가입하지 않고 &#34;사이트&#34;이 제공하는 서비스를 이용하는 자를 말합니다.</p>
															</div>
														</div>
													</div>
													<div class="article-3">
														<div class="div-3">
															<div class="link-2">
																<p class="text-wrapper-30">제3조 (약관 등의 명시와 설명 및 개정)</p>
															</div>
														</div>
														<div class="div-3">
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">①</div>
																</div>
																<p class="text-wrapper-33">
																	&#34;사이트&#34;은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의
																	불만을 처리할 수 있는 곳의 주소를 포함), 전화번호, 전자우편주소, 사업자등록번호,
																	통신판매업신고번호, 개인정보관리책임자 등을 이용자가 쉽게 알 수 있<br />도록
																	&#34;사이트&#34;의 초기 서비스 화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가
																	연결 화면을 통하여 볼 수 있도록 할 수 있습니다.
																</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">②</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;은 이용자가 약관에
																	동의하기에 앞서 약관에 정하여져 있는 내용 중 청약 철회, 배송 책임, 환불 조건 등과 같은 중요한
																	내용을 이용자가 이해할 수 있도록 별도의 연결 화면 또는 팝업 화면 등을 제공하여 이용자의 확인을
																	구합니다.</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">③</div>
																</div>
																<p class="text-wrapper-33">
																	&#34;사이트&#34;은 전자상거래등에서의소비자보호에관한법률, 약관의규제에관한법률,
																	전자거래기본법, 전자서명법, 정보통신망이용촉진등에관한 법률, 방문판매등에관한 법률, 소비자보호법 등
																	관련 법을 위배하지 않는 범위에서 이 약관을 개<br />정할 수 있습니다.
																</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">④</div>
																</div>
																<p class="text-wrapper-33">
																	&#34;사이트&#34;이 약관을 개정할 경우에는 적용 일자 및 개정 사유를 명시하여 현행 약관과
																	함께 &#34;사이트&#34;의 초기 화면에 그 적용 일자 7일 전부터 적용일자 전일까지
																	공지합니다. 다만, 이용자에게 불리하게 약관 내용을 변경하는 경우에는 최소한<br />30일
																	이상의 사전 유예기간을 두고 공지합니다. 이 경우 &#34;사이트&#34;은 개정 전 내용과 개정
																	후 내용을 명확히 비교하여 이용자가 알기 쉽도록 표시합니다. 개정약관에 이의가 있는 회원은 회원
																	탈퇴를 할 수 있습니다. 단, 이의가 있음에도 불구<br />하고 본 조 제1항, 제2항에 따른
																	당사의 고지가 있은 후 30일 이내에 회원 탈퇴를 하지 않은 회원은 개정약관에 동의한 것으로
																	간주합니다.
																</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">⑤</div>
																</div>
																<p class="text-wrapper-33">
																	&#34;사이트&#34;이 약관을 개정할 경우에는 그 개정 약관은 그 적용 일자 이후에 체결되는
																	계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관 조항이 그대로 적용됩니다.<br />다만
																	이 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정 약관의
																	공지 기간 내에 &#34;사이트&#34;에 송신하여 &#34;사이트&#34;의 동의를 받은 경우에는
																	개정 약관 조항이 적용됩니다.
																</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">⑥</div>
																</div>
																<p class="text-wrapper-34">이 약관에서 정하지 아니한 사항과 이 약관의
																	해석에 관하여는 전자상거래등에서의소비자보호에관한법률, 약관의규제등에관한법률, 공정거래위원회가 정하는
																	전자상거래등에서의소비자 보호지침 및 관계 법령 또는 상관례에 따릅니다.</p>
															</div>
														</div>
													</div>
													<div class="article-4">
														<div class="div-3">
															<div class="link-2">
																<div class="text-wrapper-30">제4조(서비스의 제공 및 변경)</div>
															</div>
														</div>
														<div class="div-3">
															<div class="item-14">
																<div class="container-18">
																	<div class="text-wrapper-32">①</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;은 다음과 같은 업무를
																	수행합니다.</p>
																<div class="div-3">
																	<div class="item-13">
																		<div class="container-19">
																			<div class="text-wrapper-35">1.</div>
																		</div>
																		<p class="text-wrapper-34">재화 또는 용역에 대한 정보 제공 및 구매
																			계약의 체결</p>
																	</div>
																	<div class="item-13">
																		<div class="container-19">
																			<div class="text-wrapper-35">2.</div>
																		</div>
																		<p class="text-wrapper-34">구매 계약이 체결된 제화 또는 용역의 배송</p>
																	</div>
																	<div class="item-13">
																		<div class="container-19">
																			<div class="text-wrapper-35">3.</div>
																		</div>
																		<div class="text-wrapper-34">기타 &#34;사이트&#34;이
																			정하는 업무</div>
																	</div>
																</div>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">②</div>
																</div>
																<p class="text-wrapper-33">
																	&#34;사이트&#34;은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차
																	체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화
																	또는 용역의 내용 및 제공 일자를 명시하여 현재의 재화<br />또는 용역의 내용을 게시한 곳에
																	즉시 공지합니다.
																</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">③</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;이 제공하기로 이용자와
																	계약을 체결한 서비스의 내용을 재화 등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는
																	그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">④</div>
																</div>
																<p class="text-wrapper-34">전항의 경우 &#34;사이트&#34;은 이로
																	인하여 이용자가 입은 손해를 배상합니다. 다만, &#34;사이트&#34;이 고의 또는 과실이 없음을
																	입증하는 경우에는 그러하지 아니합니다.</p>
															</div>
														</div>
													</div>
													<div class="article-5">
														<div class="div-3">
															<div class="link-2">
																<div class="text-wrapper-30">제5조(서비스의 중단)</div>
															</div>
														</div>
														<div class="div-3">
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">①</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;은 컴퓨터 등
																	정보통신설비의 보수점검, 교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을
																	일시적으로 중단할 수 있습니다.</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">②</div>
																</div>
																<p class="text-wrapper-34">제1항에 의한 서비스 중단의 경우에는
																	&#34;사이트&#34;은 제8조에 정한 방법으로 이용자에게 통지합니다.</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">③</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;은 1항의 사유로
																	서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다.
																	단, &#34;사이트&#34;이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</p>
															</div>
														</div>
													</div>
													<div class="article-6">
														<div class="div-3">
															<div class="link-2">
																<div class="text-wrapper-30">제6조(회원가입)</div>
															</div>
														</div>
														<div class="div-3">
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">①</div>
																</div>
																<p class="text-wrapper-34">이용자는 &#34;사이트&#34;이 정한 가입
																	양식에 따라 회원 정보를 기입한 후 이 약관과 개인정보의 수집, 제공 및 활용에 동의한다는 의사
																	표시를 함으로써 가입을 신청합니다.</p>
															</div>
															<div class="item-14">
																<div class="container-18">
																	<div class="text-wrapper-32">②</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;은 제1항과 같이
																	회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당하지 않는 한 회원으로 등록합니다.</p>
																<div class="div-3">
																	<div class="item-13">
																		<div class="container-19">
																			<div class="text-wrapper-35">1.</div>
																		</div>
																		<p class="text-wrapper-34">가입 신청자가 이 약관 제7조제3항에
																			의하여 이전에 회원 가입을 상실한 적이 있는 경우 (다만 제7조제3항에 의한 회원 자격 상실 후
																			3년이 경과한 자로서 &#34;사이트&#34;의 회원 재가입 승낙을 얻은 경우는 예외로
																			합니다.)</p>
																	</div>
																	<div class="item-13">
																		<div class="container-19">
																			<div class="text-wrapper-35">2.</div>
																		</div>
																		<p class="text-wrapper-34">등록 내용에 허위, 기재누락, 오기가 있는
																			경우</p>
																	</div>
																	<div class="item-13">
																		<div class="container-19">
																			<div class="text-wrapper-35">3.</div>
																		</div>
																		<p class="text-wrapper-34">기타 회원으로 등록하는 것이
																			&#34;사이트&#34;의 기술상 현저히 지장이 있다고 판단되는 경우</p>
																	</div>
																</div>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">③</div>
																</div>
																<p class="text-wrapper-34">회원 가입 계약의 성립 시기는
																	&#34;사이트&#34;의 승낙이 회원에게 도달한 시점으로 합니다.</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">④</div>
																</div>
																<p class="text-wrapper-34">회원은 등록 사항에 변경이 있는 경우, 즉시
																	전자우편 또는 기타 방법으로 &#34;사이트&#34;에 대하여 그 변경 사항을 알려야 합니다.</p>
															</div>
														</div>
													</div>
													<div class="article-7">
														<div class="div-3">
															<div class="link-2">
																<p class="text-wrapper-30">제7조(회원 탈퇴 및 자격 상실 등)</p>
															</div>
														</div>
														<div class="div-3">
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">①</div>
																</div>
																<p class="text-wrapper-34">회원은 &#34;사이트&#34;에 언제든지
																	탈퇴를 요청할 수 있으며 &#34;사이트&#34;은 즉시 회원 탈퇴를 처리합니다.</p>
															</div>
															<div class="item-14">
																<div class="container-18">
																	<div class="text-wrapper-32">②</div>
																</div>
																<p class="text-wrapper-34">회원이 다음 각호의 사유에 해당하는 경우,
																	&#34;사이트&#34;은 회원 자격을 제한 및 정지시킬 수 있습니다.</p>
																<div class="div-3">
																	<div class="item-13">
																		<div class="container-19">
																			<div class="text-wrapper-35">1.</div>
																		</div>
																		<p class="text-wrapper-34">가입 신청시에 허위 내용을 등록한 경우</p>
																	</div>
																	<div class="item-13">
																		<div class="container-19">
																			<div class="text-wrapper-35">2.</div>
																		</div>
																		<p class="text-wrapper-34">&#34;사이트&#34;을 이용하여 구입한
																			재화 등의 대금, 기타 &#34;사이트&#34; 이용에 관련하여 회원이 부담하는 채무를 기일에
																			지급하지 않는 경우</p>
																	</div>
																	<div class="item-13">
																		<div class="container-19">
																			<div class="text-wrapper-35">3.</div>
																		</div>
																		<p class="text-wrapper-34">다른 사람의 &#34;사이트&#34;
																			이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우</p>
																	</div>
																	<div class="item-13">
																		<div class="container-19">
																			<div class="text-wrapper-35">4.</div>
																		</div>
																		<p class="text-wrapper-34">&#34;사이트&#34;을 이용하여 법령
																			또는 이 약관이 금지하거나 공서 양속에 반하는 행위를 하는 경우</p>
																	</div>
																	<div class="item-13">
																		<div class="container-19">
																			<div class="text-wrapper-35">5.</div>
																		</div>
																		<div class="text-wrapper-34">회원이 사망한 경우</div>
																	</div>
																</div>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">③</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;이 회원 자격을 제한/
																	정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우
																	&#34;사이트&#34;은 회원 자격을 상실시킬 수 있습니다.</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">④</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;이 회원 자격을
																	상실시키는 경우에는 회원 등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원 등록 말소 전에
																	최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.</p>
															</div>
														</div>
													</div>
													<div class="article-8">
														<div class="div-3">
															<div class="link-2">
																<div class="text-wrapper-30">제8조(회원에 대한 통지)</div>
															</div>
														</div>
														<div class="div-3">
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">①</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;이 회원에 대한 통지를
																	하는 경우, 회원이 &#34;사이트&#34;과 미리 약정하여 지정한 전자우편 주소로 할 수
																	있습니다.</p>
															</div>
															<div class="item-15">
																<div class="container-18">
																	<div class="text-wrapper-32">②</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;은 불특정 다수 회원에
																	대한 통지의 경우 1주일 이상 &#34;사이트&#34;게시판에 게시함으로써 개별 통지에 갈음할 수
																	있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별 통지를
																	합니다.</p>
															</div>
														</div>
													</div>
													<div class="article-9">
														<div class="div-3">
															<div class="link-2">
																<div class="text-wrapper-30">제9조(구매신청)</div>
															</div>
														</div>
														<div class="div-3">
															<p class="text-wrapper-31">&#34;사이트&#34; 이용자는
																&#34;사이트&#34;상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며,
																&#34;사이트&#34;은 이용자가 구매를 신청함에 있어서 다음의 각 내용을 알기 쉽게 제공합니다.
																단, 회원인 경우 제2호 내지 제4호의 적용을 제외할 수 있습니다.</p>
														</div>
														<div class="list-3">
															<div class="item-13">
																<div class="container-19">
																	<div class="text-wrapper-36">1.</div>
																</div>
																<p class="text-wrapper-34">재화 등의 검색 및 선택</p>
															</div>
															<div class="item-13">
																<div class="container-19">
																	<div class="text-wrapper-36">2.</div>
																</div>
																<p class="text-wrapper-34">성명, 주소, 전화번호, 전자우편주소(또는
																	휴대전화번호) 등의 입력</p>
															</div>
															<div class="item-13">
																<div class="container-19">
																	<div class="text-wrapper-36">3.</div>
																</div>
																<p class="text-wrapper-34">약관 내용, 청약 철회권이 제한되는 서비스,
																	배송료, 설치비 등의 비용 부담과 관련한 내용에 대한 확인</p>
															</div>
															<div class="item-13">
																<div class="container-19">
																	<div class="text-wrapper-36">4.</div>
																</div>
																<p class="text-wrapper-34">이 약관에 동의하고 위 3. 호의 사항을
																	확인하거나 거부하는 표시(예: 마우스 클릭)</p>
															</div>
															<div class="item-13">
																<div class="container-19">
																	<div class="text-wrapper-36">5.</div>
																</div>
																<p class="text-wrapper-34">재화 등의 구매 신청 및 이에 관한 확인 또는
																	&#34;사이트&#34;의 확인에 대한 동의</p>
															</div>
															<div class="item-13">
																<div class="container-19">
																	<div class="text-wrapper-36">6.</div>
																</div>
																<div class="text-wrapper-34">결제 방법의 선택</div>
															</div>
															<div class="item-13">
																<div class="container-19">
																	<div class="text-wrapper-36">7.</div>
																</div>
																<p class="text-wrapper-34">기타 &#34;사이트&#34;이 별도로 정하는
																	절차</p>
															</div>
														</div>
													</div>
													<div class="article-10">
														<div class="div-3">
															<div class="link-2">
																<div class="text-wrapper-30">제10조 (계약의 성립)</div>
															</div>
														</div>
														<div class="div-3">
															<div class="item-14">
																<div class="container-18">
																	<div class="text-wrapper-32">①</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;은 제9조와 같은 구매
																	신청에 대하여 다음 각호에 해당하면 승낙하지 않을 수 있습니다.</p>
																<div class="div-3">
																	<div class="item-13">
																		<div class="container-19">
																			<div class="text-wrapper-35">1.</div>
																		</div>
																		<p class="text-wrapper-34">신청 내용에 허위, 기재 누락, 오기가
																			있는 경우</p>
																	</div>
																	<div class="item-13">
																		<div class="container-19">
																			<div class="text-wrapper-35">2.</div>
																		</div>
																		<p class="text-wrapper-34">미성년자가 담배, 주류 등 청소년보호법에서
																			금지하는 재화 및 용역을 구매하는 경우</p>
																	</div>
																	<div class="item-13">
																		<div class="container-19">
																			<div class="text-wrapper-35">3.</div>
																		</div>
																		<p class="text-wrapper-34">기타 구매 신청에 승낙하는 것이
																			&#34;사이트&#34; 기술상 현저히 지장이 있다고 판단하는 경우</p>
																	</div>
																</div>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">②</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;의 승낙이
																	제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">③</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;의 승낙의 의사
																	표시에는 이용자의 구매 신청에 대한 확인 및 판매 가능 여부, 구매 신청의 정정 취소 등에 관한
																	정보 등을 포함하여야 합니다.</p>
															</div>
														</div>
													</div>
													<div class="article-11">
														<div class="div-3">
															<div class="link-2">
																<div class="text-wrapper-30">제11조(지급 방법)</div>
															</div>
														</div>
														<div class="div-3">
															<p class="text-wrapper-31">
																&#34;사이트&#34;에서 이용자가 구매하거나 이용하는 재화 또는 용역에 대한 대금 지급 방법은
																다음 각호의 방법 중 가용한 방법으로 할 수 있습니다. 단, &#34;사이트&#34;은 이용자의 지급
																방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할<br />수 없습니다.
															</p>
														</div>
														<div class="list-4">
															<div class="item-13">
																<div class="container-19">
																	<div class="text-wrapper-36">1.</div>
																</div>
																<div class="text-wrapper-34">계좌이체</div>
															</div>
															<div class="item-13">
																<div class="container-19">
																	<div class="text-wrapper-36">2.</div>
																</div>
																<div class="text-wrapper-34">신용카드 결제</div>
															</div>
															<div class="item-13">
																<div class="container-19">
																	<div class="text-wrapper-36">3.</div>
																</div>
																<div class="text-wrapper-34">전자 화폐에 의한 결제</div>
															</div>
															<div class="item-13">
																<div class="container-19">
																	<div class="text-wrapper-36">4.</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;이 지급한 포인트에
																	의한 결제</p>
															</div>
															<div class="item-13">
																<div class="container-19">
																	<div class="text-wrapper-36">5.</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;과 계약을 맺었거나
																	&#34;사이트&#34;이 인정한 상품권에 의한 결제</p>
															</div>
															<div class="item-13">
																<div class="container-19">
																	<div class="text-wrapper-36">6.</div>
																</div>
																<p class="text-wrapper-34">기타 전자적 지급 방법에 의한 대금 지급 등</p>
															</div>
														</div>
													</div>
													<div class="article-12">
														<div class="div-3">
															<div class="link-2">
																<div class="text-wrapper-30">제12조(수신확인통지․구매신청 변경 및
																	취소)</div>
															</div>
														</div>
														<div class="list-5">
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">①</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;은 이용자의 구매
																	신청이 있는 경우 이용자에게 수신 확인 통지를 합니다.</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">②</div>
																</div>
																<p class="text-wrapper-33">
																	수신 확인 통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인 통지를 받은 후 즉시
																	구매 신청 변경 및 취소를 요청할 수 있고 &#34;사이트&#34;은 배송 전에 이용자의 요청이
																	있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합<br />니다. 다만 이미 대금을 지불한
																	경우에는 제15조 청약 철회 등에 관한 규정에 따릅니다.
																</p>
															</div>
														</div>
													</div>
													<div class="article-13">
														<div class="div-3">
															<div class="link-2">
																<div class="text-wrapper-30">제13조(재화 등의 공급)</div>
															</div>
														</div>
														<div class="div-3">
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">①</div>
																</div>
																<p class="text-wrapper-33">
																	&#34;사이트&#34;은 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가
																	청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를
																	취합니다. 다만 &#34;사이트&#34;이 이미 재화 등의 대금의 전<br />부 또는 일부를
																	받은 경우에는 대금의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다. 다만,
																	소비자와 &#34;사이트&#34;간 재화 등의 공급 시기에 관하여 별도의 약정이 있는 경우에는
																	그러하지 아니합니다. 이때 &#34;사이트&#34;은 이용자<br />가 재화 등의 공급 절차 및
																	진행 사항을 확인할 수 있도록 적절한 조치를 합니다.
																</p>
															</div>
															<div class="item-16">
																<div class="container-18">
																	<div class="text-wrapper-32">②</div>
																</div>
																<p class="text-wrapper-33">
																	&#34;사이트&#34;은 이용자가 구매한 재화에 대해 배송 수단, 수단별 배송 비용 부담자,
																	수단별 배송기간 등을 명시합니다. 만약 &#34;사이트&#34;이 약정 배송기간을 초과한 경우에는
																	그로 인한 이용자의 손해를 배상하여야 합니다. 다만 &#34;사이트&#34;이 고의, 과<br />실이
																	없음을 입증한 경우에는 그러하지 아니합니다.
																</p>
															</div>
														</div>
													</div>
													<div class="article-14">
														<div class="div-3">
															<div class="link-2">
																<div class="text-wrapper-30">제14조(환급)</div>
															</div>
														</div>
														<div class="div-3">
															<p class="text-wrapper-31">
																&#34;사이트&#34;은 이용자가 구매 신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수
																없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을
																받은 날부터 3영업일 이내에 환급하거나 환급에 필요한<br />조치를 취합니다.
															</p>
														</div>
													</div>
												</div>
												<div class="overlap-4">
													<div class="article-2">
														<div class="div-3">
															<div class="link-2">
																<div class="text-wrapper-30">제15조(청약 철회 등)</div>
															</div>
														</div>
														<div class="div-3">
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">①</div>
																</div>
																<p class="text-wrapper-33">
																	&#34;사이트&#34;과 재화 등의 구매에 관한 계약을 체결한 이용자는 계약 내용에 관한 서면을
																	교부 받은 날부터 7일 이내에 청약의 철회를 할 수 있습니다. 다만 그 서면을 교부 받은 때보다
																	재화등의 공급이 늦게 이루어진 경우에는 재화 등의 공급을<br />받거나 공급이 개시된 날부터
																	7일 이내에 청약의 철회를 할 수 있습니다.
																</p>
															</div>
															<div class="item-14">
																<div class="container-18">
																	<div class="text-wrapper-32">②</div>
																</div>
																<p class="text-wrapper-34">이용자는 재화 등을 배송 받은 경우 다음
																	각호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.</p>
																<div class="div-3">
																	<div class="item-13">
																		<div class="container-19">
																			<div class="text-wrapper-35">1.</div>
																		</div>
																		<p class="text-wrapper-34">이용자에게 책임 있는 사유로 재화 등이
																			멸실 또는 훼손된 경우 (다만 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약
																			철회를 할 수 있습니다.)</p>
																	</div>
																	<div class="item-13">
																		<div class="container-19">
																			<div class="text-wrapper-35">2.</div>
																		</div>
																		<p class="text-wrapper-34">이용자의 사용 또는 일부 소비에 의하여
																			재화 등의 가치가 현저히 감소한 경우</p>
																	</div>
																	<div class="item-13">
																		<div class="container-19">
																			<div class="text-wrapper-35">3.</div>
																		</div>
																		<p class="text-wrapper-34">시간의 경과에 의하여 재판매가 곤란할
																			정도로 재화 등의 가치가 현저히 감소한 경우</p>
																	</div>
																	<div class="item-13">
																		<div class="container-19">
																			<div class="text-wrapper-35">4.</div>
																		</div>
																		<p class="text-wrapper-34">같은 성능을 지닌 재화 등으로 복제가
																			가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우</p>
																	</div>
																	<div class="item-13">
																		<div class="container-19">
																			<div class="text-wrapper-35">5.</div>
																		</div>
																		<p class="text-wrapper-34">각 화면에 고지된 주문취소·재작업에 대한
																			안내 사항에 해당되는 경우</p>
																	</div>
																</div>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">③</div>
																</div>
																<p class="text-wrapper-34">제2항 제2호 내지 제4호의 경우에는
																	&#34;사이트&#34;이 사전에 청약 철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에
																	명기하거나 시용 상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약 철회 등이 제한되지
																	않습니다.</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">④</div>
																</div>
																<p class="text-wrapper-33">
																	이용자는 제1항 및 제2항의 규정에도 불구하고 재화 등의 내용이 표시, 광고 내용과 다르거나 계약
																	내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알
																	수 있었던 날부터 30일 이내에 청약철회 등<br />을 할 수 있습니다.
																</p>
															</div>
														</div>
													</div>
													<div class="article-15">
														<div class="div-3">
															<div class="link-2">
																<div class="text-wrapper-30">제16조(청약 철회 등의 효과)</div>
															</div>
														</div>
														<div class="div-3">
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">①</div>
																</div>
																<p class="text-wrapper-33">
																	&#34;사이트&#34;은 이용자로부터 재화 등을 반환 받은 경우 3영업일 이내에 이미 지급받은
																	재화 등의 대금을 환급합니다. 이 경우 &#34;사이트&#34;이 이용자에게 재화 등의 환급을
																	지연한 때에는 그 지연 기간에 대하여 공정거래위원회가 정하여 고시하는<br />지연 이자율을
																	곱하여 산정한 지연 이자(이하 &#34;지연 배상금&#34;이라 한다)를 지급합니다.
																</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">②</div>
																</div>
																<p class="text-wrapper-33">
																	&#34;사이트&#34;은 위 대금을 환급함에 있어서 이용자가 신용카드 그밖에 대통령령이 정하는
																	결제 수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제 수단을 제공한 사업자로 하여금
																	재화등의 대금의 청구를 정지 또는 취소하도록 요청<br />합니다. 다만,
																	&#34;사이트&#34;이 결제업자로부터 해당 재화 등의 대금을 이미 지급 받은 때에는 지체 없이
																	이를 결제업자에게 환급하고, 그 사실을 소비자에게 통지하여야 합니다.
																</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">③</div>
																</div>
																<p class="text-wrapper-33">
																	청약 철회 등의 경우 공급 받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다.
																	&#34;사이트&#34;은 이용자에게 청약 철회 등을 이유로 위약금 또는 손해배상을 청구하지
																	않습니다. 다만 재화 등의 내용이 표시, 광고 내용과 다르거나 계약 내<br />용과 다르게
																	이행되어 청약 철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 &#34;사이트&#34;이
																	부담합니다.
																</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">④</div>
																</div>
																<p class="text-wrapper-33">
																	이미 재화 등이 일부 사용 또는 일부 소비된 경우에는 그 재화 등의 사용 또는 일부 소비에 의하여
																	소비자가 얻은 이익 또는 그 재화 등의 공급에 소요된 비용에 상당하는 금액으로서 대통령령이 정하는
																	범위의 금액의 지급을 이용자에게 청구<br />할 수 있습니다.
																</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">⑤</div>
																</div>
																<p class="text-wrapper-34">이용자가 재화 등을 제공받을 때 발송비를
																	부담한 경우에 &#34;사이트&#34;은 청약 철회 시 그 비용을 누가 부담하는지를 알기 쉽도록
																	명확하게 표시합니다.</p>
															</div>
														</div>
													</div>
													<div class="article-16">
														<div class="div-3">
															<div class="link-2">
																<div class="text-wrapper-30">제17조(개인정보보호)</div>
															</div>
														</div>
														<div class="div-3">
															<div class="item-14">
																<div class="container-18">
																	<div class="text-wrapper-32">①</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;은 이용자의 정보수집
																	시 구매 계약 이행에 필요한 최소한의 정보를 수집하고 동의를 받습니다. 다음 사항을 필수사항으로
																	하며 그 외 사항은 선택 사항으로 합니다.</p>
																<div class="div-3">
																	<div class="item-13">
																		<div class="container-19">
																			<div class="text-wrapper-35">1.</div>
																		</div>
																		<div class="text-wrapper-34">이름</div>
																	</div>
																	<div class="item-13">
																		<div class="container-19">
																			<div class="text-wrapper-35">2.</div>
																		</div>
																		<div class="text-wrapper-34">주소</div>
																	</div>
																	<div class="item-13">
																		<div class="container-19">
																			<div class="text-wrapper-35">3.</div>
																		</div>
																		<div class="text-wrapper-34">희망ID(회원의 경우)</div>
																	</div>
																	<div class="item-13">
																		<div class="container-19">
																			<div class="text-wrapper-35">4.</div>
																		</div>
																		<div class="text-wrapper-34">비밀번호(회원의 경우)</div>
																	</div>
																	<div class="item-13">
																		<div class="container-19">
																			<div class="text-wrapper-35">5.</div>
																		</div>
																		<div class="text-wrapper-34">이동전화번호 및 수신 여부</div>
																	</div>
																	<div class="item-13">
																		<div class="container-19">
																			<div class="text-wrapper-35">6.</div>
																		</div>
																		<p class="text-wrapper-34">전자우편 주소 및 수신 여부</p>
																	</div>
																</div>
															</div>
															<div class="item-14">
																<div class="container-18">
																	<div class="text-wrapper-32">②</div>
																</div>
																<p class="text-wrapper-34">제공된 개인정보는 당해 이용자의 동의 없이
																	목적 외의 이용이나 제 3자에게 제공할 수 없으며 이에 대한 모든 책임은 &#34;사이트&#34;이
																	집니다. 다만 다음의 경우에는 예외로 합니다.</p>
																<div class="div-3">
																	<div class="item-13">
																		<div class="container-19">
																			<div class="text-wrapper-35">1.</div>
																		</div>
																		<p class="text-wrapper-34">배송 업무상 배송업체에게 배송에 필요한
																			최소한의 이용자의 정보(성명, 주소, 전화번호)를 알려 주는 경우</p>
																	</div>
																	<div class="item-13">
																		<div class="container-19">
																			<div class="text-wrapper-35">2.</div>
																		</div>
																		<p class="text-wrapper-34">통계 작성, 학술 연구 또는 시장 조사를
																			위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공되는 경우</p>
																	</div>
																	<div class="item-13">
																		<div class="container-19">
																			<div class="text-wrapper-35">3.</div>
																		</div>
																		<p class="text-wrapper-34">재화 등의 거래에 따른 대금정산을 위하여
																			필요한 경우</p>
																	</div>
																	<div class="item-13">
																		<div class="container-19">
																			<div class="text-wrapper-35">4.</div>
																		</div>
																		<p class="text-wrapper-34">도용방지를 위하여 본인확인에 필요한 경우</p>
																	</div>
																	<div class="item-13">
																		<div class="container-19">
																			<div class="text-wrapper-35">5.</div>
																		</div>
																		<p class="text-wrapper-34">법률의 규정 또는 법률에 의하여 필요한
																			불가피한 사유가 있는 경우</p>
																	</div>
																</div>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">③</div>
																</div>
																<p class="text-wrapper-33">
																	&#34;사이트&#34; 이용자의 개인정보 수집/이용 동의를 받아야 하는 경우에는 개인정보 수집
																	항목, 수집/이용 목적, 보유기간 등 개인정보보호법 및 정보통신망이용촉진및정보보호등에관한법률 등
																	관련 법률에서 규정한 사항을 미리 명시하거나 고<br />지하여 동의를 받으며, 이용자는 언제든지
																	이 동의를 철회할 수 있습니다.
																</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">④</div>
																</div>
																<p class="text-wrapper-33">
																	이용자는 언제든지 &#34;사이트&#34;이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을
																	요구할 수 있으며, &#34;사이트&#34;은 이에 지체 없이 필요한 조치를 취할 의무를 집니다.
																	이용자가 오류의 정정을 요구한 경우에는 &#34;사이트&#34;는 그 오류를 정<br />정할
																	때까지 당해 개인정보를 이용하지 않습니다.
																</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">⑤</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;은 개인정보보호를
																	위하여 관리자를 한정하여 그 수를 최소화하며, 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의
																	분실, 도난, 유출, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">⑥</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34; 또는 그로부터
																	개인정보를 제공 받은 제3자는 개인 정보의 수집 목적 또는 제공 받는 목적을 달성한 때에 당해
																	개인정보를 지체 없이 파기합니다.</p>
															</div>
														</div>
													</div>
													<div class="article-17">
														<div class="div-3">
															<div class="link-2">
																<div class="text-wrapper-30">제18조(&#34;사이트&#34;의
																	의무)</div>
															</div>
														</div>
														<div class="div-3">
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">①</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;은 법령과 이 약관이
																	금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로
																	재화, 용역을 제공하는데 최선을 다하여야 합니다.</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">②</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;은 이용자가 안전하게
																	인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함) 보호를 위한 보안 시스템을
																	갖추어야 합니다.</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">③</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;이 상품이나 용역에
																	대하여 &#34;표시,광고의공정화에관한법률&#34; 제3조 소정의 부당한 표시, 광고 행위를
																	함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">④</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;은 이용자가 원하지
																	않는 영리 목적의 광고성 전자우편을 발송하지 않습니다.</p>
															</div>
														</div>
													</div>
													<div class="article-18">
														<div class="div-3">
															<div class="link-2">
																<p class="text-wrapper-30">제19조(회원의 아이디(ID) 및 비밀번호에
																	대한 의무)</p>
															</div>
														</div>
														<div class="div-3">
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">①</div>
																</div>
																<p class="text-wrapper-34">제17조의 경우를 제외한 아이디(ID)와
																	비밀번호에 관한 관리 책임은 회원에게 있습니다.</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">②</div>
																</div>
																<p class="text-wrapper-34">회원은 자신의 아이디(ID) 및 비밀번호를
																	제3자에게 이용하게 해서는 안됩니다.</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">③</div>
																</div>
																<p class="text-wrapper-34">회원이 자신의 아이디(ID) 및 비밀번호를
																	도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 &#34;사이트&#34;에게 통보하고
																	&#34;사이트&#34;의 안내가 있는 경우에는 그에 따라야 합니다.</p>
															</div>
														</div>
													</div>
													<div class="article-19">
														<div class="div-3">
															<div class="link-2">
																<div class="text-wrapper-30">제20조(이용자의 의무)</div>
															</div>
														</div>
														<div class="div-3">
															<p class="text-wrapper-31">이용자는 다음 행위를 하여서는 안됩니다.</p>
														</div>
														<div class="list-4">
															<div class="item-13">
																<div class="container-19">
																	<div class="text-wrapper-36">1.</div>
																</div>
																<p class="text-wrapper-34">신청 또는 변경시 허위 내용의 등록</p>
															</div>
															<div class="item-13">
																<div class="container-19">
																	<div class="text-wrapper-36">2.</div>
																</div>
																<div class="text-wrapper-34">타인의 정보 도용</div>
															</div>
															<div class="item-13">
																<div class="container-19">
																	<div class="text-wrapper-36">3.</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;에 게시된 정보의
																	변경, 삭제 등 훼손</p>
															</div>
															<div class="item-13">
																<div class="container-19">
																	<div class="text-wrapper-36">4.</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;이 정한 정보 이외의
																	정보 (컴퓨터 프로그램 등) 등의 송신 또는 게시</p>
															</div>
															<div class="item-13">
																<div class="container-19">
																	<div class="text-wrapper-36">5.</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;이 기타 제3자의
																	저작권 등 지적 재산권에 대한 침해</p>
															</div>
															<div class="item-13">
																<div class="container-19">
																	<div class="text-wrapper-36">6.</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34; 기타 제3자의 명예를
																	손상시키거나 업무를 방해하는 행위</p>
															</div>
															<div class="item-13">
																<div class="container-19">
																	<div class="text-wrapper-36">7.</div>
																</div>
																<p class="text-wrapper-34">외설 또는 폭력적인 메시지, 화상, 음성,
																	기타 공서양속에 반하는 정보를 &#34;사이트&#34;에 공개 또는 게시하는 행위</p>
															</div>
														</div>
													</div>
													<div class="article-20">
														<div class="div-3">
															<div class="link-2">
																<p class="text-wrapper-30">제21조(연결 &#34;사이트&#34;과
																	피연결 &#34;사이트&#34;간의 관계)</p>
															</div>
														</div>
														<div class="div-3">
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">①</div>
																</div>
																<p class="text-wrapper-34">상위 &#34;사이트&#34;과 하위
																	&#34;사이트&#34;이 하이퍼 링크(예: 하이퍼 링크의 대상에는 문자, 그림 및 동화상 등이
																	포함됨)방식 등으로 연결된 경우, 전자를 연결 &#34;사이트&#34;(웹 사이트)이라고 하고
																	후자를 피연결 &#34;사이트&#34;(웹사이트)이라고 합니다.</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">②</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;은 자신의 사이트에
																	&#34;사이트&#34; 연결 사이트가 취급하는 상품 또는 용역에 대하여 보증책임을 지지 않는다는
																	내용을 명시한 경우, 그 거래에 대한 보증책임을 지지 않습니다.</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">③</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;과
																	&#34;사이트&#34; 연결 사이트는 독자적으로 점포를 운영하는 것으로 &#34;사이트&#34;은
																	&#34;사이트&#34; 연결사이트와 이용자간에 행해진 거래에 대하여 어떠한 책임도 지지 않습니다.
																</p>
															</div>
														</div>
													</div>
													<div class="article-21">
														<div class="div-3">
															<div class="link-2">
																<p class="text-wrapper-30">제22조(저작권의 귀속 및 이용 제한)</p>
															</div>
														</div>
														<div class="div-3">
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">①</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;이 작성한 저작물에
																	대한 저작권 기타 지적 재산권은 &#34;사이트&#34;에 귀속합니다.</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">②</div>
																</div>
																<p class="text-wrapper-34">이용자는 &#34;사이트&#34;을
																	이용함으로써 얻은 정보 중 &#34;사이트&#34;에게 지적 재산권이 귀속된 정보를
																	&#34;사이트&#34;의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여
																	영리 목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">③</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;은 약정에 따라
																	이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">④</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;은 이용자가 과도한
																	트래픽을 발생시키거나 저작물을 이용한 영업방해 행위가 감지될시 게시물에 대한 접근을 잠정적으로
																	제한할 수 있습니다.</p>
															</div>
														</div>
													</div>
													<div class="article-22">
														<div class="div-3">
															<div class="link-2">
																<div class="text-wrapper-30">제23조(분쟁 해결)</div>
															</div>
														</div>
														<div class="div-3">
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">①</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;은 이용자가 제기하는
																	정당한 의견이나 불만을 반영하고 그 피해를 보상 처리하기 위하여 피해 보상 처리 기구를 설치,
																	운영합니다.</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">②</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;은 이용자로부터
																	제출되는 불만 사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한
																	경우에는 이용자에게 그 사유와 처리 일정을 지체 없이 통보해드립니다.</p>
															</div>
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">③</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;과 이용자간에 발생한
																	전자상거래 분쟁과 관련하여 이용자의 피해 구제 신청이 있는 경우에는 공정거래위원회 또는
																	분쟁조정기관의 조정에 따를 수 있습니다.</p>
															</div>
															<div class="item-14">
																<div class="container-18">
																	<div class="text-wrapper-32">④</div>
																</div>
																<p class="text-wrapper-33">
																	소비자에게 책임 있는 사유로 인하여 재화 등의 판매에 관한 계약이 해제된 경우
																	전자상거래등에서의소비자호보에관한법률에 의거 &#34;사이트&#34;이 이용자에게 청구하는
																	손해배상액은 다음 각호에서 정한 금액에 대금 미납에 따른 지연 배상금<br />을 더한 금액을
																	초과할 수 없습니다.
																</p>
																<div class="list-6">
																	<div class="item-14">
																		<div class="container-19">
																			<div class="text-wrapper-35">1.</div>
																		</div>
																		<p class="text-wrapper-34">공급 받은 재화 등이 반환된 경우에는 다음
																			각목의 1에 해당하는 금액 중 큰 금액</p>
																		<div class="list-5">
																			<div class="item-13">
																				<div class="container-20">
																					<div class="text-wrapper-37">가.</div>
																				</div>
																				<p class="text-wrapper-34">반환된 재화 등의 통상 사용료액 또는
																					그 사용에 의하여 통상 얻어지는 이익에 상당하는 금액</p>
																			</div>
																			<div class="item-13">
																				<div class="container-20">
																					<div class="text-wrapper-37">나.</div>
																				</div>
																				<p class="text-wrapper-34">반환된 재화 등의 판매 가격에서 그
																					재화 등이 반환된 당시의 가액을 공제한 금액</p>
																			</div>
																		</div>
																	</div>
																	<div class="item-13">
																		<div class="container-19">
																			<div class="text-wrapper-35">2.</div>
																		</div>
																		<p class="text-wrapper-34">공급 받은 재화 등이 반환되지 아니한
																			경우에는 그 재화 등의 판매 가액에 상당하는 금액</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<div class="article-23">
														<div class="div-3">
															<div class="link-2">
																<div class="text-wrapper-30">제24조(재판권 및 준거법)</div>
															</div>
														</div>
														<div class="div-3">
															<div class="item-13">
																<div class="container-18">
																	<div class="text-wrapper-32">①</div>
																</div>
																<p class="text-wrapper-33">
																	&#34;사이트&#34;과 이용자간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의
																	주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방 법원의 전속 관할로 합니다. 다만 제소
																	당시 이용자의 주소 또는 거소가 분명하지 않거나 외<br />국 거주자의 경우에는 민사 소송법상의
																	관할 법원에 제기합니다.
																</p>
															</div>
															<div class="item-17">
																<div class="container-18">
																	<div class="text-wrapper-32">②</div>
																</div>
																<p class="text-wrapper-34">&#34;사이트&#34;과 이용자간에 제기된
																	전자상거래 소송에는 한국법을 적용합니다.</p>
															</div>
														</div>
													</div>
													<div class="article-24">
														<div class="div-3">
															<div class="link-2">
																<div class="text-wrapper-30">부칙 제1조 (약관의 효력)</div>
															</div>
														</div>
														<div class="div-3">
															<p class="text-wrapper-31">이 약관은 2017년 5월 16일부터
																시행됩니다.</p>
														</div>
													</div>
												</div>
											</div>
											<div class="label-4">
												<div class="border"></div>
												<p class="text-wrapper-27">위 내용을 이해했으며, 약관에 동의합니다.</p>
											</div>
										</div>
									</div>
									<div class="margin">
										<div class="container-17">
											<div class="text-wrapper-27">개인정보보호정책 (필수)</div>
											<div class="background-border">
												<div class="overlap-5">
													<div class="article-25">
														<div class="heading-2">
															<div class="text-wrapper-38">제 1장. 총칙</div>
														</div>
														<div class="list-5">
															<div class="item-13">
																<div class="container-21">
																	<div class="text-wrapper-39">①</div>
																</div>
																<p class="text-wrapper-34">㈜인트이사(이하 `회사`라 함)은 고객님의
																	개인정보보호를 매우 중요하게 여기고 있으며, &#34;개인정보보호법&#34; 등 개인정보보호에 관한
																	제반 법령을 준수하고 있습니다.</p>
															</div>
															<div class="item-13">
																<div class="container-21">
																	<div class="text-wrapper-39">②</div>
																</div>
																<p class="text-wrapper-40">
																	회사는 본 개인정보처리방침을 회사 인터넷 홈페이지 첫 화면 또는 첫 화면과의 연결화면을 통하여
																	공개함으로써 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 당사가 고객님의 개인정보를 안전하게
																	취급하기 위하여 어떠한 조치를<br />취하고 있는지를 고객님이 용이하게 확인할 수 있도록
																	조치하고 있습니다.
																</p>
															</div>
														</div>
													</div>
													<div class="article-26">
														<div class="heading-2">
															<br>
															<p class="text-wrapper-38">제 2장. 개인정보 수집 및 이용목적</p>
														</div>
														<div class="div-3">
															<div class="item-13">
																<div class="container-21">
																	<div class="text-wrapper-39">①</div>
																</div>
																<p class="text-wrapper-34">서비스의 원활한 제공 및 운영</p>
															</div>
															<div class="item-13">
																<div class="container-22"></div>
																<p class="text-wrapper-34">서비스 제공에 관한 계약 이행 및 서비스
																	제공에 따른 요금정산, 콘텐츠 제공, 고객님의 행사 ・ 일정에 따른 맞춤 안내, 구매 및 요금
																	결제, 금융거래 본인 인증 및 금융 서비스, 요금 추심</p>
															</div>
															<div class="item-13">
																<div class="container-21">
																	<div class="text-wrapper-39">②</div>
																</div>
																<div class="text-wrapper-34">고객관리</div>
															</div>
															<div class="item-13">
																<div class="container-22"></div>
																<p class="text-wrapper-34">문의사항 및 요청사항에 대한 응대, 개인
																	식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입의사 확인, 분쟁 조정을 위한 기록
																	보존, 불만 처리, 공지사항 전달, 서비스에 대한 만족도 조사, 사후 DM</p>
															</div>
															<div class="item-13">
																<div class="container-21">
																	<div class="text-wrapper-39">③</div>
																</div>
																<div class="text-wrapper-34">마케팅 및 광고에의 활용</div>
															</div>
															<div class="item-18">
																<div class="container-22"></div>
																<p class="text-wrapper-33">
																	1. 본사는 회원의 개인정보를 마케팅을 위하여 제3자에게 제공하지 않습니다.<br />다만,
																	본사는 회원의 개인정보를 본사의 웨딩플래너 및 이벤트/마케팅 담당자가 제공받아 결혼준비 서비스 상담
																	및 이용 권유, 광고게재 및 각종 서비스 안내,<br />알림톡 서비스 제공, 이벤트 / 마케팅
																	정보 안내와 홍보, 설문 조사를 위한 정보 확보를 위하여 이용하고 있습니다.
																</p>
																<p class="text-wrapper-41">
																	2. 제공받는 개인정보의 내용<br />- 개인식별정보 (이름, 성별, 결혼예정일, 지역,
																	이메일, 연락처)
																</p>
																<p class="text-wrapper-41">
																	3. 제공받는 자의 개인정보 보유 및 이용기간<br />- 개인정보 삭제 및 탈회를 요청할 때까지
																	보유.이용합니다.<br />- 회원 가입의 경우 개인정보에 관한 회사 내부 방침 및 관련 법률
																	등에 따라 개인정보를 보유합니다.
																</p>
																<p class="text-wrapper-41">
																	4. 상품권유 중지청구(Do-Not Call) : 위 마케팅정보 제공 및 이용에 동의한 이후에도
																	전화[대표번호], 서면 등을 통해 마케팅활동에 대한 중지를 요청할 수 있습니다.<br />5.
																	신규 서비스(제품 포함) 및 이벤트 정보 안내, 뉴스레터 발송 및 최신기업정보 안내
																</p>
															</div>
														</div>
													</div>
													<div class="article-27">
														<div class="heading-2">
															<p class="text-wrapper-38">제 3장. 수집하는 개인정보의 항목 및 수집
																방법</p>
														</div>
														<div class="list-7">
															<div class="overlap-group-3">
																<div class="item-19">
																	<div class="container-21">
																		<div class="text-wrapper-39">①</div>
																	</div>
																	<div class="text-wrapper-34">수집항목</div>
																</div>
																<div class="item-table">
																	<div class="header-row">
																		<div class="cell">
																			<div class="text-wrapper-42">채널별 구분</div>
																		</div>
																		<div class="cell-2">
																			<div class="text-wrapper-42">필수 수집 항목</div>
																		</div>
																		<div class="cell-3">
																			<div class="text-wrapper-42">선택 수집 항목</div>
																		</div>
																	</div>
																	<div class="body">
																		<div class="row">
																			<div class="data">
																				<div class="text-wrapper-43">계약 고객</div>
																			</div>
																			<div class="data-2">
																				<p class="text-wrapper-43">이름, 휴대폰번호, 이메일 주소,
																					행사일자, 행사 장소, 이용상품 정보, 결제 기록</p>
																			</div>
																			<div class="IP-wrapper">
																				<p class="IP">
																					자택 전화번호, 자택 주소, 결혼 여부, 기념일, 여권 정보, 서비스 이용기록, 접속 로그,
																					쿠키,<br />접속 IP 정보
																				</p>
																			</div>
																		</div>
																		<div class="div-4">
																			<div class="data-3">
																				<div class="text-wrapper-43">행사・상품 문의 고객</div>
																			</div>
																			<div class="data-4">
																				<p class="text-wrapper-43">이름, 휴대폰번호, 이메일 주소,
																					서비스 이용기록, 접속 로그, 쿠키, 접속 IP 정보</p>
																			</div>
																			<div class="data-5">
																				<p class="text-wrapper-43">행사예정일, 결혼 여부, 기념일, 자택
																					전화번호, 자택 주소</p>
																			</div>
																		</div>
																		<div class="row">
																			<div class="data-6">
																				<div class="text-wrapper-43">홈페이지/모바일앱 가입 고객</div>
																			</div>
																			<div class="data-7">
																				<p class="IP">
																					이름, 성별, 아이디, 비밀번호, 이메일 주소, 휴대폰번호, 서비스 이용기록, 접속 로그,
																					쿠키,<br />접속 IP 정보
																				</p>
																			</div>
																			<div class="data-8">
																				<div class="text-wrapper-43">네이버 아이디</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
															<div class="overlap-6">
																<div class="item-19">
																	<div class="container-21">
																		<div class="text-wrapper-39">②</div>
																	</div>
																	<div class="text-wrapper-34">수집방법</div>
																</div>
																<div class="item-20">
																	<div class="container-22"></div>
																	<p class="text-wrapper-34">홈페이지(www.sinbuya.com)
																		회원가입 , 서비스 이용 및 각종 문의・신청, 서면 ・ 온라인 계약서 작성, 서면 양식,
																		전화/팩스를 통한 회원가입, 경품 행사 응모, 제휴사로부터의 제공</p>
																</div>
															</div>
														</div>
													</div>
													<div class="article-28">
														<div class="heading-2">
															<p class="text-wrapper-38">제 4장. 개인정보의 보유 및 이용기간</p>
														</div>
														<div class="div-3">
															<div class="item-13">
																<div class="container-21">
																	<div class="text-wrapper-39">①</div>
																</div>
																<p class="text-wrapper-33">
																	회사는 고객님의 개인정보를 수집한 때로부터 개인정보의 수집 및 이용에 관한 동의 목적을 달성할
																	때까지 기간 동안에 한하여 고객님의 개인정보를 보유 및 이용하며, 개인정보 수집 및 이용목적이
																	달성된 경우에는 해당 정보를 지체 없이<br />파기합니다.
																</p>
															</div>
															<div class="item-13">
																<div class="container-21">
																	<div class="text-wrapper-39">②</div>
																</div>
																<p class="text-wrapper-44">
																	단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한
																	기간 동안 회원정보를 보관합니다. 이 경우 회사는 해당 개인정보를 별도의 데이터베이스(DB)로
																	옮기거나 보관장소를 달리하여 보존합<br />니다.
																</p>
															</div>
															<div class="item-21">
																<div class="div-3">
																	<p class="text-wrapper-31">
																		[계약 또는 청약철회 등에 관한 기록]<br />- 보존이유: 전자상거래 등에서의 소비자보호에
																		관한 법률<br />- 보존기간: 5년
																	</p>
																</div>
																<div class="div-3">
																	<p class="text-wrapper-31">
																		[소비자의 불만 또는 분쟁처리에 관한 기록]<br />- 보존이유: 전자상거래 등에서의
																		소비자보호에 관한 법률<br />- 보존기간: 3년
																	</p>
																</div>
																<div class="div-3">
																	<p class="text-wrapper-31">
																		[부정이용 등에 관한 기록]<br />- 보존이유: 전자상거래 등에서의 소비자보호에 관한 법률<br />-
																		보존기간: 5년
																	</p>
																</div>
																<div class="div-3">
																	<p class="text-wrapper-31">
																		[신용정보의 수집/처리 및 이용 등에 관한 기록]<br />- 보존이유: 신용정보의 이용 및
																		보호에 관한 법률<br />- 보존기간: 3년
																	</p>
																</div>
																<div class="div-3">
																	<p class="text-wrapper-31">
																		[표시/광고에 관한 기록]<br />- 보존이유: 전자상거래 등에서의 소비자보호에 관한 법률<br />-
																		보존기간: 6개월
																	</p>
																</div>
																<div class="div-3">
																	<p class="text-wrapper-31">
																		[이용자의 인터넷 등 로그기록/ 이용자의 접속지 추적자료 그 외의 통신사실 확인 자료]<br />-
																		보존이유: 통신비밀보호법<br />- 보존기간: 3개월/6개월
																	</p>
																</div>
															</div>
														</div>
													</div>
													<div class="article-29">
														<div class="heading-2">
															<p class="text-wrapper-38">제 5장. 개인정보의 파기 절차 및 방법</p>
														</div>
														<div class="div-3">
															<p class="text-wrapper-31">회사는 다른 법률에 따라 개인정보를 보존하여야
																하는 경우가 아닌 한, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기하는 것을
																원칙으로 합니다. 파기 절차 및 방법은 다음과 같습니다.</p>
														</div>
														<div class="list-4">
															<div class="item-13">
																<div class="text-wrapper-31">[파기절차]</div>
															</div>
															<div class="item-13">
																<div class="container-23">
																	<div class="text-wrapper-45">-</div>
																</div>
																<p class="text-wrapper-46">고객님이 회사에 제공한 개인 정보는 수집 ・
																	이용 목적이 달성된 후에는 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타
																	관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기됩니다.
																</p>
															</div>
															<div class="item-13">
																<div class="container-23">
																	<div class="text-wrapper-45">-</div>
																</div>
																<p class="text-wrapper-34">별도 DB로 옮겨진 개인정보는 법률에 의한
																	경우가 아니고서는 보유되는 목적 이외의 다른 목적으로 이용되지 않습니다.</p>
															</div>
														</div>
														<div class="list-8">
															<div class="item-13">
																<div class="text-wrapper-31">[파기방법]</div>
															</div>
															<div class="item-13">
																<div class="container-23">
																	<div class="text-wrapper-45">-</div>
																</div>
																<p class="text-wrapper-34">전자적 파일형태로 저장된 개인정보는 기록을
																	재생할 수 없는 기술적 방법을 사용하여 삭제합니다.</p>
															</div>
															<div class="item-13">
																<div class="container-23">
																	<div class="text-wrapper-45">-</div>
																</div>
																<p class="text-wrapper-34">종이에 출력된 개인정보는 분쇄기로 분쇄하거나
																	소각을 통하여 파기합니다.</p>
															</div>
														</div>
													</div>
													<div class="article-30">
														<div class="heading-2">
															<p class="text-wrapper-38">제 6장. 정보주체(고객 및 법정대리인)의
																권리와 그 행사 방법</p>
														</div>
														<div class="div-3">
															<div class="item-13">
																<div class="container-21">
																	<div class="text-wrapper-39">①</div>
																</div>
																<p class="text-wrapper-34">정보주체(고객님 및 만 14세 미만의 아동의
																	경우 그 법정대리인)는 회사에 대하여 얼마든지 개인정보 수집・이용 ・제공 등의 동의를
																	철회(가입해지)할 수 있습니다.</p>
															</div>
															<div class="item-13">
																<div class="container-21">
																	<div class="text-wrapper-39">②</div>
																</div>
																<p class="text-wrapper-34">또한 회사에 대하여, 고객님은 자신의
																	개인정보를, 법정대리인은 만 14세 미만의 아동의 개인정보를 각 열람 ・ 제공 및 오류를 정정하도록
																	요구할 수 있습니다.</p>
															</div>
															<div class="item-14">
																<div class="container-21">
																	<div class="text-wrapper-39">③</div>
																</div>
																<p class="text-wrapper-33">
																	고객님은 위와 같은 권리를 온라인에서는 회사 홈페이지에 접속하여 본인 확인 절차를 거친 후
																	개인정보관리 메뉴에서 행사가능하며, 오프라인에서는 서면, 전화 또는 이메일을 통해 고객센터 또는
																	회사 개인정보관리책임자에게 연락하는<br />방법으로 행사할 수 있습니다.<br />단, 아래
																	사항에 해당하는 경우에는 개인정보의 전부 또는 일부에 대하여 열람/정정・삭제를 거절할 수 있습니다.
																</p>
																<div class="list-5">
																	<div class="item-13">
																		<div class="container-23">
																			<div class="text-wrapper-45">-</div>
																		</div>
																		<p class="text-wrapper-34">법률에 따라 열람이 금지되거나 제한되는
																			경우</p>
																	</div>
																	<div class="item-13">
																		<div class="container-23">
																			<div class="text-wrapper-45">-</div>
																		</div>
																		<p class="text-wrapper-34">다른 사람의 생명∙신체를 해할 우려가
																			있거나 다른 사람의 재산과 그 밖의 이익을 부당하게 침해할 우려가 있는 경우</p>
																	</div>
																</div>
															</div>
															<div class="item-13">
																<div class="container-21">
																	<div class="text-wrapper-39">④</div>
																</div>
																<p class="text-wrapper-44">
																	고객님이 개인정보 오류정정을 요구하신 경우, 회사는 오류정정을 완료하기 전까지 당해 개인정보를 이용
																	・ 제공하지 않으며, 이미 제3자에게 당해 개인정보를 제공한 경우에는 제3자에게 지체없이 통지하여
																	오류 정정이 이루어지도록 하<br />고 있습니다.
																</p>
															</div>
															<div class="item-13">
																<div class="container-21">
																	<div class="text-wrapper-39">⑤</div>
																</div>
																<p class="text-wrapper-33">
																	고객님 또는 법정 대리인이 동의철회(가입해지)한 경우, 회사는 지체없이 파기하는 것을 원칙으로 하나
																	관계법령에서 의무적으로 보유하도록 한 경우에는 개인정보 처리방침 &#39;개인정보의 보유 및
																	이용기간&#39;에 따라 처리하고, 반드시 필요한<br />경우에만 열람 또는 이용이 가능하도록
																	조치하고 있습니다.
																</p>
															</div>
														</div>
													</div>
													<div class="article-31">
														<div class="heading-2">
															<p class="text-wrapper-38">제 7장. 개인정보의 안전성 확보 조치에 관한
																사항</p>
														</div>
														<div class="div-3">
															<p class="text-wrapper-31">
																[개인정보의 기술적/관리적 보호 대책]<br />회사는 고객의 개인정보를 처리함에 있어 개인정보의
																분실, 도난, 누출, 변조 또는 훼손되지 않도록 안전성 확보를 위하여 아래와 같은 기술적/관리적
																대책을 적용하고 있습니다.
															</p>
														</div>
														<div class="list-9">
															<div class="item-13">
																<div class="container-21">
																	<div class="text-wrapper-39">①</div>
																</div>
																<div class="text-wrapper-34">기술적 조치</div>
															</div>
															<div class="item-13">
																<div class="container-23">
																	<div class="text-wrapper-45">-</div>
																</div>
																<p class="text-wrapper-34">고객정보의 암호화: 소중한 고객의 개인정보는
																	DB내에 암호화되어 저장되어 외부 침입에 의해 유출되더라도 고객의 개인정보를 활용할 수 없도록 하고
																	있습니다.</p>
															</div>
															<div class="item-13">
																<div class="container-23">
																	<div class="text-wrapper-45">-</div>
																</div>
																<p class="text-wrapper-34">통신 구간 암호화: 고객이 홈페이지를 통한
																	모든 구간에 대해 SSL을 통해 고객의 정보가 안전하게 전송되도록 조치하고 있습니다.</p>
															</div>
															<div class="item-13">
																<div class="container-23">
																	<div class="text-wrapper-45">-</div>
																</div>
																<p class="text-wrapper-33">
																	보안솔루션의 설치: 서비스 제공 및 고객의 정보를 안전하게 관리하기 위하여 개인정보처리시스템에 대해
																	백신프로그램의 설치 및 주기적인 업데이트를 수행하고 주기적으로 점검을 수행하고 있습니다. 해킹 등의
																	외부침입을 대비하여 침<br />입차단/탐지시스템을 설치하여 외부침입에 대해 계속적으로 모니터링을
																	수행하고 있습니다.
																</p>
															</div>
															<div class="item-13">
																<div class="container-21">
																	<div class="text-wrapper-39">②</div>
																</div>
																<div class="text-wrapper-34">관리적 조치</div>
															</div>
															<div class="item-13">
																<div class="container-23">
																	<div class="text-wrapper-45">-</div>
																</div>
																<p class="text-wrapper-34">개인정보관리체계 수립: 개인정보를 안전하게
																	관리하기 위하여 회사 내부적으로 개인정보 관리체계를 수립하여 운영하고 있습니다.</p>
															</div>
															<div class="item-13">
																<div class="container-23">
																	<div class="text-wrapper-45">-</div>
																</div>
																<p class="text-wrapper-34">개인정보보호 위원회 운영: 회사의
																	개인정보보호를 위한 위원회를 구성하여 연2회 이상 위원회 회의를 개최하고 개인정보관리체계의 운영 및
																	개인정보보호 이슈 등의 사항에 대하여 개선하고 바로잡기 위한 노력을 기울이고 있습니다.</p>
															</div>
															<div class="item-13">
																<div class="container-23">
																	<div class="text-wrapper-45">-</div>
																</div>
																<p class="text-wrapper-47">
																	개인정보 취급자 관리: 고객의 개인정보를 처리하는 개인정보처리자를 대상으로 개인정보보호 서약서를
																	징수하고 있습니다. 또한 개인정보처리자의 권한 관리를 통하여 불필요한 고객의 개인정보에 대한 접근과
																	노출을 최소화하고 있습니<br />다.
																</p>
															</div>
														</div>
													</div>
													<div class="article-32">
														<div class="heading-2">
															<p class="text-wrapper-38">제 8장. 개인정보의 자동 수집 장치의
																설치・운영 및 그 거부에 관한 사항</p>
														</div>
														<div class="div-3">
															<p class="text-wrapper-31">
																회사는 고객님의 정보를 수시로 저장하고 찾아내는 &#39;쿠키(cookie)&#39; 등을
																운용합니다. 쿠키란 회사의 웹사이트를 운영하는데 이용되는 서버가 고객님의 브라우저에 보내는 아주 작은
																텍스트 파일로서 고객님의 컴퓨터 하드디스크에 저장됩니다. 회<br />사는 다음과 같은 목적을 위해
																쿠키를 사용합니다.
															</p>
														</div>
														<div class="list-4">
															<div class="item-13">
																<div class="container-21">
																	<div class="text-wrapper-39">①</div>
																</div>
																<div class="text-wrapper-34">쿠키 등 사용 목적</div>
															</div>
															<div class="item-13">
																<div class="container-23">
																	<div class="text-wrapper-45">-</div>
																</div>
																<p class="text-wrapper-44">
																	홈페이지 접속빈도 및 방문시간 분석, 이용자의 관심분야 파악 및 분석, 각종 이벤트 참여 및
																	방문횟수 파악 등을 통한 타겟 마케팅 및 개인 맞춤 서비스 제공을 위해 쿠키 등을 사용합니다.
																	고객님은 쿠키 설치에 대한 선택권을 가지고 있습니<br />다. 따라서, 고객님은 웹브라우저에서
																	옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든
																	쿠키의 저장을 거부할 수도 있습니다.
																</p>
															</div>
															<div class="item-13">
																<div class="container-21">
																	<div class="text-wrapper-39">②</div>
																</div>
																<div class="text-wrapper-34">쿠키 설정 거부 방법</div>
															</div>
															<div class="item-13">
																<div class="container-23">
																	<div class="text-wrapper-45">-</div>
																</div>
																<p class="text-wrapper-34">쿠키 설정을 거부하는 방법으로는 이용자가
																	사용하는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을
																	거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.</p>
															</div>
															<div class="item-13">
																<div class="container-23">
																	<div class="text-wrapper-45">-</div>
																</div>
																<p class="text-wrapper-34">설정방법 예(인터넷 익스플로어의 경우) : 웹
																	브라우저 상단의도구 &gt; 인터넷옵션 &gt; 개인정보 &gt; 고급 &gt; 설정방법 선택</p>
															</div>
															<div class="item-13">
																<div class="container-23">
																	<div class="text-wrapper-45">-</div>
																</div>
																<p class="text-wrapper-34">다만, 쿠키의 저장을 거부할 경우에는 일부
																	서비스 이용에 어려움이 있을 수 있습니다.</p>
															</div>
														</div>
													</div>
													<div class="article-33">
														<div class="heading-2">
															<p class="text-wrapper-38">제 9장. 개인정보책임자 및 개인정보관련 불만
																처리에 관한 사항</p>
														</div>
														<div class="div-3">
															<div class="item-22">
																<div class="container-21">
																	<div class="text-wrapper-39">①</div>
																</div>
																<p class="text-wrapper-34">회사는 고객님의 개인정보를 보호하고,
																	개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 담당 부서 및 개인정보관리책임자를 지정하고
																	있습니다.</p>
																<div class="div-3">
																	<p class="text-wrapper-31">
																		・ 이름 : 김현수<br />・ 직위 : 대표<br />・ 전화 : 070-1212-3434<br />・
																		메일 : info@weddingchoice.com
																	</p>
																</div>
															</div>
															<div class="item-13">
																<div class="container-21">
																	<div class="text-wrapper-39">②</div>
																</div>
																<p class="text-wrapper-34">고객님께서 위 개인정보 담당부서 또는
																	개인정보관리책임자에게 회사의 개인정보보호 취급 사항에 관한 의견 또는 불만을 제기하실 경우, 회사는
																	신속하고 성실하게 조치하여 문제가 해결될 수 있도록 노력하겠습니다.</p>
															</div>
															<div class="item-13">
																<div class="container-21">
																	<div class="text-wrapper-39">③</div>
																</div>
																<p class="text-wrapper-34">기타 개인정보침해에 대한 신고나 상담이
																	필요하신 경우에는 아래 기관에 문의하시기 바랍니다.</p>
															</div>
															<div class="item-13">
																<div class="container-23">
																	<div class="text-wrapper-45">-</div>
																</div>
																<p class="text-wrapper-34">개인정보 침해신고센터(한국인터넷진흥원 운영)
																	: privacy.kisa.or.kr / (국번없이)118</p>
															</div>
															<div class="item-13">
																<div class="container-23">
																	<div class="text-wrapper-45">-</div>
																</div>
																<p class="text-wrapper-34">대검찰청 인터넷범죄수사센터 :
																	www.spo.go.kr / 02-3480-3573</p>
															</div>
															<div class="item-13">
																<div class="container-23">
																	<div class="text-wrapper-45">-</div>
																</div>
																<p class="text-wrapper-34">경찰청 사이버테러대응센터 :
																	www.netan.go.kr / 1566-0112</p>
															</div>
														</div>
													</div>
													<div class="article-34">
														<div class="heading-2">
															<p class="text-wrapper-38">제 10장. 개인정보 처리방침의 변경에 관한
																사항</p>
														</div>
														<div class="div-3">
															<p class="text-wrapper-31">회사는 본 개인정보처리방침을 변경하는 경우에는
																그 이유 및 변경내용을 인터넷 홈페이지 첫 화면의 공지사항란 또는 별도의 창을 통하는 등의 방법으로
																최소 7일 이전에 공지할 것입니다.</p>
														</div>
														<div class="list-10">
															<div class="item-13">
																<div class="container-23">
																	<div class="text-wrapper-45">-</div>
																</div>
																<div class="text-wrapper-34">개인정보처리방침 버전번호 :
																	20170527</div>
															</div>
															<div class="item-13">
																<div class="container-23">
																	<div class="text-wrapper-45">-</div>
																</div>
																<p class="text-wrapper-34">개인정보처리방침 시행일자 : 2017년 05월
																	27일</p>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="label-4">
												<div class="border"></div>
												<p class="text-wrapper-27">위 내용을 이해했으며, 약관에 동의합니다.</p>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="legend-2">
								<div class="text-wrapper-48"></div>
								<div class="horizontal-divider"></div>
							</div>
						</div>
						<form id="signup_vendor_threeForm" method="post"
							onsubmit="return validateForm()">

							<div class="button-wrapper">
								<button id="submit_all_forms" type="submit" class="button-2">
									<div class="text-wrapper-49">가입신청</div>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 주소 API -->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<!-- jQuery 라이브러리 추가 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		// 아이디 중복 확인
		function checkVendorId() {
			var vendor_id = $('#vendor_id').val();

			$.ajax({
				url : 'CheckVendorIdService',
				type : 'POST',
				data : {
					vendor_id : vendor_id
				},
				success : function(response) {
					console.log('Response:', response);

					response = response.trim();
					if (response === '생성 가능') {
						$('#vendor_id_result').text(response).css('color',
								'green');
					} else {
						$('#vendor_id_result').text(response).css('color',
								'red');
					}
				},
				error : function() {
					$('#vendor_id_result').text('오류가 발생했습니다. 다시 시도해주세요.').css(
							'color', 'red');
				}
			});
		}

		// 비밀번호 확인
		function checkVendorPw() {
			var p1 = document.getElementById("vendor_pw").value;
			var p2 = document.getElementById("vendor_pw_check").value;

			if (p1.length < 8) {
				$('#vendor_pw_result').text("비밀번호는 최소 8자리 이상이어야 합니다").css(
						'color', 'red');
				return;
			}

			if (p1 == p2) {
				$('#vendor_pw_result').text("비밀번호 일치").css('color', 'green');
			} else {
				$('#vendor_pw_result').text("비밀번호 불일치").css('color', 'red');
			}
		}

		// 사업자번호 중복확인
		function checkLicense() {
			var vendor_license = $('#vendor_license').val();

			if (vendor_license.length !== 10) {
				$('#vendor_license_result').text("사업자번호는 10자리여야 합니다").css(
						'color', 'red');
				return;
			}

			$.ajax({
				url : 'CheckLicenseService',
				type : 'POST',
				data : {
					vendor_license : vendor_license
				},
				success : function(response) {
					console.log('Response:', response);

					response = response.trim();
					if (response === '생성 가능') {
						$('#vendor_license_result').text(response).css('color',
								'green');
					} else {
						$('#vendor_license_result').text(response).css('color',
								'red');
					}
				},
				error : function() {
					$('#vendor_license_result').text('오류가 발생했습니다. 다시 시도해주세요.')
							.css('color', 'red');
				}
			});
		}

		// 파일 업로드
		// 문서가 완전히 로드된 후 스크립트 실행
		$(document)
				.ready(
						function() {
							// 파일 업로드 비동기 처리
							window.uploadFiles = function(callback) {
								/*var formData = new FormData(document
								 .getElementById('upload_files_form')); */
								var formElement = document
										.getElementById('upload_files_form');
								var formData = new FormData(formElement);

								// 추가 필드 포함
								formData.append('vendor_id', $('#vendor_id')
										.val());

								$.ajax({
									url : 'FileUploadService',
									type : 'POST',
									data : formData,
									contentType : false,
									processData : false,
									success : function(response) {
										// 서버에서 파일 업로드 경로를 받았다면 콜백 함수 호출
										callback(response);
									},
									error : function() {
										alert('파일 업로드 실패');
									}
								});
							}

							// 회원가입 전 업로드 확인
							window.validateForm = function() {
								var vendorLicenseFile = document
										.getElementById('vendor_license_image_file').files.length;
								if (vendorLicenseFile === 0) {
									alert('사업자등록증 이미지를 업로드해야 합니다.');
									return false;
								}
								return true;
							}

							// 폼 제출 처리
							$('#signupVendor')
									.submit(
											function(event) {
												event.preventDefault(); // 기본 폼 제출 방지

												if (!validateForm()) {
													return; // 유효성 검사 실패 시 제출 중지
												}

												uploadFiles(function(filePaths) {
													// 파일 업로드 경로를 폼에 추가
													$('#vendor_license_image')
															.val(
																	filePaths.licenseImagePath);
													$('#vendor_logo_image')
															.val(
																	filePaths.logoImagePath);

													// 회원가입 폼 제출
													this.submit(); // 폼을 실제로 제출
												}.bind(this));
											});
						});

		//여러개의 form 하나로 병합
		document.getElementById('submit_all_forms').addEventListener('click', function(e) {
    e.preventDefault(); // 기본 폼 제출 동작을 막습니다.

    var formData = new FormData();

    // 첫 번째 폼의 데이터 추가
    var firstForm = document.getElementById('signup_vendor_firstForm');
    var firstFormData = new FormData(firstForm);
    firstFormData.forEach((value, key) => {
        formData.append(key, value);
    });

    // 두 번째 폼의 데이터 추가
    var secondForm = document.getElementById('signup_vendor_secondForm');
    var secondFormData = new FormData(secondForm);
    secondFormData.forEach((value, key) => {
        formData.append(key, value);
    });

    // 세 번째 폼의 데이터 추가 (이 폼은 숨겨진 폼이므로 보통은 데이터가 없음)
    var thirdForm = document.getElementById('signup_vendor_threeForm');
    var thirdFormData = new FormData(thirdForm);
    thirdFormData.forEach((value, key) => {
        formData.append(key, value);
    });

 	// 절대 경로로 URL 설정
    var url = `JoinService_Vendor`;

    // 모든 데이터를 하나의 요청으로 전송
    fetch(url, {
        method: 'POST',
        body: formData
    }).then(function(response) {
        if (response.ok) {
            return response.json(); // 서버에서 JSON 응답을 반환하는 경우
        } else {
            throw new Error('데이터 전송 실패');
        }
    }).then(function(data) {
        alert("모든 데이터가 성공적으로 전송되었습니다.");
        console.log(data); // 서버의 응답 데이터 확인
    }).catch(function(error) {
        console.error('Error:', error);
    });
});
		
		
		
		
		
		// 도로명주소찾기 스크립트
		function vendor_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("vendor_extraAddress").value = extraAddr;

							} else {
								document.getElementById("vendor_extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('vendor_postcode').value = data.zonecode;
							document.getElementById("vendor_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("vendor_detailAddress")
									.focus();
						}
					}).open();
		}
	</script>


</body>
</html>
