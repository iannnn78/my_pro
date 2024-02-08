<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>MYPAGE</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link
	href="${pageContext.request.contextPath }/resources/assets/img/favicon.png"
	rel="icon">
<link
	href="${pageContext.request.contextPath }/resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Roboto:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Work+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link
	href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/assets/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/assets/vendor/aos/aos.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/resources/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link
	href="${pageContext.request.contextPath }/resources/assets/css/main.css"
	rel="stylesheet">

<style type="text/css">
.Sli {
	list-style: none;
	border-bottom: 1px solid #ebebeb;
	width: 100%;
}

.mainCon {
	width: 100%;
	padding: 1rem;
	align-items: center;
	display: flex;
}
</style>
</head>

<body>

	<!-- Header -->
	<%@ include file="/WEB-INF/views/includes/Header.jsp"%>


	<main id="main">


		<!-- Section -->
		<section id="section" style="background-color: gray;">
			<div class="section-div" style="justify-content: center;">
				<div class="row my-4" style="width: 100%;">

					<div class="col-2 mx-4" style="width: 15%;">
						<!-- SideBar -->

					</div>

					<div class="col-lg-10 col-xl-8" style="width: 70%;">
						<div class="card shadow rounded-3"
							style="border: 1px solid #e0e0e0;">
							<div class="card-body p-4 p-sm-5 mb-3">

								<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist"
									style="width: 500px; margin-left: auto; margin-right: auto;">
									<li class="nav-item" role="presentation">
										<button class="nav-link active" id="pills-home-tab"
											data-bs-toggle="pill" data-bs-target="#pills-home"
											type="button" role="tab" aria-controls="pills-home"
											aria-selected="true">회원정보</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link" id="pills-profile-tab"
											data-bs-toggle="pill" data-bs-target="#pills-profile"
											type="button" role="tab" aria-controls="pills-profile"
											aria-selected="false">관심선수</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link" id="pills-contact-tab"
											data-bs-toggle="pill" data-bs-target="#pills-contact"
											type="button" role="tab" aria-controls="pills-contact"
											aria-selected="false">내글</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link" id="pills-disabled-tab"
											data-bs-toggle="pill" data-bs-target="#pills-disabled"
											type="button" role="tab" aria-controls="pills-disabled"
											aria-selected="false">구매내역</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link" id="pills-product-tab"
											data-bs-toggle="pill" data-bs-target="#pills-product"
											type="button" role="tab" aria-controls="#pills-product"
											aria-selected="false">판매내역</button>
									</li>
								</ul>
								
								
								
								<div class="tab-content" id="pills-tabContent">
									<div class="tab-pane fade show active" id="pills-home"
										role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
										<div class="input-group input-group-lg mb-3">
											<span class="input-group-text"
												style="width: 17%; justify-content: center;">아이디</span> <input
												type="text" class="id form-control"
												value="${sessionScope.loginInfo.mid }" readonly="readonly"
												style="background-color: white;">
										</div>
										<div class="input-group input-group-lg mb-3">
											<span class="input-group-text"
												style="width: 17%; justify-content: center;">비밀번호</span> <input
												type="password" class="pw form-control"
												value="${sessionScope.loginInfo.mpw }" readonly="readonly"
												style="background-color: white;"> <input
												type="hidden" class="pwBtn btn btn-success"
												onclick="changePw()" value="변경">
										</div>
										<div class="input-group input-group-lg mb-3">
											<span class="input-group-text"
												style="width: 17%; justify-content: center;">이름</span> <input
												type="text" class="name form-control"
												value="${sessionScope.loginInfo.mname }" readonly="readonly"
												style="background-color: white;">
										</div>

										<div class="input-group input-group-lg mb-3">
											<span class="input-group-text"
												style="width: 17%; justify-content: center;">이메일</span> <input
												type="text" class="email form-control"
												value="${sessionScope.loginInfo.memail }"
												readonly="readonly" style="background-color: white;">
										</div>
											<div class="input-group input-group-lg mb-3">
											<span class="input-group-text"
												style="width: 17%; justify-content: center;">주소</span> <input
												type="text" class="addr form-control"
												value="${sessionScope.loginInfo.maddr }"
												readonly="readonly" style="background-color: white;">
										</div>
										<div class="input-group input-group-lg mb-3">
											<span class="input-group-text"
												style="width: 17%; justify-content: center;">나이</span> <input
												type="text" class="email form-control"
												value="${sessionScope.loginInfo.mage }" readonly="readonly"
												style="background-color: white;">
										</div>

										<div class="d-grid gap-2 d-md-flex justify-content-md-end">
											<input type="button"
												class="changeBtn btn btn-outline-primary btn-lg mx-1"
												onclick="changeInfo()" value="수정"> <input
												type="hidden"
												class="saveBtn btn btn-outline-primary btn-lg mx-1"
												onclick="saveInfo()" value="저장"> <input
												type="button"
												class="deleteBtn btn btn-outline-danger btn-lg"
												onclick="deleteInfo()" value="탈퇴"> <input
												type="hidden"
												class="cancleBtn btn btn-outline-secondary btn-lg"
												onclick="changeCancle()" value="취소">
										</div>
									</div>
									<div class="tab-pane fade" id="pills-profile" role="tabpanel"
										aria-labelledby="pills-profile-tab" tabindex="0">
										<div style="text-align: center;">
															<c:choose>
												<c:when test="${empty myhitter }">
													<div class="noScrap">
														<strong> 관심 선수가 없습니다. </strong>
													</div>
												</c:when>
												<c:otherwise>
													<c:forEach items="${myhitter }" var="myhitter">
														<li class="Sli">
															<div class="mainCon">
																<div class="sName col-3">
																	      <img src="${myhitter.himg }" class="img-fluid rounded-start" alt="...">
																	<p>${myhitter.hname }</p>
																	<br>
																</div>
																<div class="sContent col-3 mx-5">
																	<h6>
																		<a
																			href="${pageContext.request.contextPath }/hitterInfo?hcode=${myhitter.hcode }">
																			<strong> >선수 정보 자세히 보기 </strong>
																		</a>
																	</h6>
																	<br>
																</div>

																<div class="sDel col-1">
														
																</div>
																<hr>
															</div>

													</c:forEach>
																		<c:forEach items="${mypitcher }" var="mypitcher">
														<li class="Sli">
															<div class="mainCon">
																<div class="sName col-3">
																	      <img src="${mypitcher.pimg }" class="img-fluid rounded-start" alt="...">
																	<p>${mypitcher.pname }</p>
																	<br>
																</div>
																<div class="sContent col-3 mx-5">
																	<h6>
																		<a
																			href="${pageContext.request.contextPath }/pitcherInfo?hcode=${mypitcher.pcode }">
																			<strong> >선수 정보 자세히 보기 </strong>
																		</a>
																	</h6>
																	<br>
																</div>

																<div class="sDel col-1">
														
																</div>
																<hr>
															</div>

													</c:forEach>
												</c:otherwise>
											</c:choose>
										</div>
  
									</div>
									<div class="tab-pane fade" id="pills-contact" role="tabpanel"
										aria-labelledby="pills-contact-tab" tabindex="0">
										<div style="text-align: center;">
											<c:choose>
												<c:when test="${empty myboard }">
													<div class="noScrap">
														<strong> 쓴 글이 없습니다. </strong>
													</div>1
												</c:when>
												<c:otherwise>
													<c:forEach items="${myboard }" var="myboard">
														<li class="Sli">
															<div class="mainCon">
																<div class="sName col-3">
																	<p>${myboard.bdate }</p>
																	<br>
																</div>
																<div class="sContent col-6 mx-5">
																	<h6>
																		<a
																			href="${pageContext.request.contextPath }/boardView?viewBno=${myboard.bno }">
																			<strong> ${myboard.btitle } </strong>
																		</a>
																	</h6>
																	<br>
																</div>

																<div class="sDel col-1">
																	<button type="button"
																		class="btn btn-outline-danger del"
																		onclick="delBtn('${myboard.bno }', this)">
																		<svg xmlns="http://www.w3.org/2000/svg" width="16"
																			height="16" fill="currentColor" class="bi bi-trash3"
																			viewBox="0 0 16 16">
  														<path
																				d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z" />
													</svg>
																	</button>
																</div>
																<hr>
															</div>
														</li>


													</c:forEach>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
									<div class="tab-pane fade" id="pills-disabled" role="tabpanel"
										aria-labelledby="pills-disabled-tab" tabindex="0">

										
										<div style="text-align: center;">
											<c:choose>
												<c:when test="${empty myreserve }">
													<div class="noScrap">
														<strong> 쓴 글이 없습니다. </strong>
													</div>
												</c:when>
												<c:otherwise>
													<c:forEach items="${myreserve }" var="myreserve">
														<li class="Sli">
															<div class="mainCon">
																<div class="sName col-2">
																	<p>${myreserve.redate }</p>
																	<br>
																</div>
																<div class="sContent col-4 mx-5">
																	<h6>
																
																			<strong> ${myreserve.retitle } </strong>
											
																	</h6>
																	<br>
																</div>
															<div class="sContent col-2 mx-5">
																	<h6>
																
																			<strong> ${myreserve.remoney } 원 </strong>
											
																	</h6>
																	<br>
																</div>
					
																<div class="sContent col-1">
																	거래완료
																</div>
																<hr>
															</div>
														</li>


													</c:forEach>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
									
										<div class="tab-pane fade" id="pills-product" role="tabpanel"
										aria-labelledby="pills-product-tab" tabindex="0">

										
										<div style="text-align: center;">
										
													<c:forEach items="${myproy }" var="myproy">
														<li class="Sli">
															<div class="mainCon">
																<div class="sName col-2">
																	<p>${myproy.prdate }</p>
																	<br>
																</div>
																<div class="sContent col-4 mx-5">
																	<h6>
																
																			<strong> ${myproy.prtitle } </strong>
											
																	</h6>
																	<br>
																</div>
															<div class="sContent col-2 mx-5">
																	<h6>
																
																			<strong> ${myproy.prmoney } 원 </strong>
											
																	</h6>
																	<br>
																</div>
					
																<div class="sContent col-1">
																	거래완료
																</div>
																<hr>
															</div>
														</li>


													</c:forEach>
													
														<c:forEach items="${mypron }" var="mypron">
														<li class="Sli">
															<div class="mainCon">
																<div class="sName col-2">
																	<p>${mypron.prdate }</p>
																	<br>
																</div>
																<div class="sContent col-4 mx-5">
																	<h6>
																
																			<strong> ${mypron.prtitle } </strong>
											
																	</h6>
																	<br>
																</div>
															<div class="sContent col-2 mx-5">
																	<h6>
																
																			<strong> ${mypron.prmoney } 원 </strong>
											
																	</h6>
																	<br>
																</div>
					
																<div class="sContent col-1">
																	거래중
																</div>
																<hr>
															</div>
														</li>


													</c:forEach>
													
											
										</div>
									</div>
									
									</div>
								</div>


							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

	</main>
	<!-- End #main -->


	<!-- ======= Footer ======= -->
	<%@ include file="/WEB-INF/views/includes/Footer.jsp"%>
	<!-- ======= End Footer ======= -->



	<a href="#"
		class="scroll-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<div id="preloader"></div>

	<!-- Vendor JS Files -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/vendor/aos/aos.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/assets/vendor/php-email-form/validate.js"></script>

	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<!-- Template Main JS File -->
	<script
		src="${pageContext.request.contextPath }/resources/assets/js/main.js"></script>
		
		<script type="text/javascript">
	
		function delBtn(bno, selbtn){
			console.log("삭제할 글번호: " + bno);
			var Redel = confirm('정말 삭제하시겠습니까?');
			if (Redel) {
				console.log("예 선택");
			$.ajax({
				type: "get",
				url: "${pageContext.request.contextPath }/deleteWrite",
				data : {"viewBno" : bno},
				dataType : "json",
				success:function(result){
				}
			});
			location.href="${pageContext.request.contextPath}/memberInfo";
			}else {
				console.log("아니요 선택");
				return false;
			}
		}
		
		</script>
		
	<script type="text/javascript">
		function changeInfo() {
			console.log("changeInfo() 호출");
			$('.name').prop("readonly", false);
			$('.addr').prop("readonly", false);

			$('.pw').css("background", "#e9ecef");
			$('.id').css("background", "#e9ecef");
			$('.email').css("background", "#e9ecef");

		
			$('.changeBtn').prop("type", "hidden");
			$('.saveBtn').prop("type", "button");
			$('.deleteBtn').prop("type", "hidden");
			$('.cancleBtn').prop("type", "button");
		}

		function saveInfo() {
			console.log("saveInfo() 호출");

			var id = $('.id').val();
			var pw = $('.pw').val();
			var name = $('.name').val();
			var addr = $('.addr').val();
			var email = $('.email').val();

			console.log("로그인 아이디: " + id);
			console.log("로그인 비밀번호: " + pw);
			console.log("로그인 이름: " + name);
			console.log("로그인 주소: " + addr);
			console.log("로그인 이메일: " + email);
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath }/updateInfo",
				data : {
					"id" : id,
					"pw" : pw,
					"name" : name,
					"addr" : addr
				},
				success : function(result) {
					console.log(result);
					if (result == "OK") {
						alert("회원정보가 수정되었습니다. 다시 로그인 해주세요");
						location.href = "${pageContext.request.contextPath}/";
					} else {
						alert("오류가 발생했습니다.");
						location.reload();
					}
				}
			});
			$('.name').prop("readonly", true);
			$('.addr').prop("readonly", true);

			$('.pw').css("background", "white");
			$('.id').css("background", "white");
			$('.birth').css("background", "white");
			$('.email').css("background", "white");


	
			$('.changeBtn').prop("type", "button");
			$('.saveBtn').prop("type", "hidden");
			$('.deleteBtn').prop("type", "button");
			$('.cancleBtn').prop("type", "hidden");
		}
		
		function deleteInfo() {
			console.log("deleteInfo() 호출");
			window.open("${pageContext.request.contextPath }/deleteUser",
					"회원 탈퇴", "width=400,height=400,top=10,left=100");
		}

		function changeCancle() {
			console.log("changeCancle() 호출");
			location.reload();
		}

		function deleteCheck(result) {
			if (result) {
				alert("탈퇴되었습니다.");
				location.href = "${pageContext.request.contextPath}/memberLogout"
			} else {
				location.reload();
			}
		}
		
	</script>
</body>

</html>