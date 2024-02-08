<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>타자정보</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${pageContext.request.contextPath }/resources/assets/img/favicon.png" rel="icon">
  <link href="${pageContext.request.contextPath }/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Roboto:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Work+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/resources/assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/resources/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath }/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath }/resources/assets/css/main.css" rel="stylesheet">
  
	<style type="text/css">
	.scrap {
	color: transparent; 
	text-shadow: 0 0 0 #f0f0f0;
	border: 1px solid gray;
	background-color: gray;
}

.scrap:hover {
	text-shadow: 0 0 0 #fdf002; 
	text-shadow: 0 0 0 #fdf002; 
	text-shadow: 0 0 0 #fdf002; 
}

.scrap_click {
	text-shadow: 0 0 0 #fdf002;
}

.list-group-item{
width: 350px;
 border: none;
}

.recode{
width: 1100px;
margin:0 auto;
text-align: center;
}

.scrapH{
margin-top: 30px;
margin-left: 74%;
}
	
	</style>

</head>

<body>

 <!-- Header -->
	<%@ include file="/WEB-INF/views/includes/Header.jsp"%>


  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs d-flex align-items-center" style="background-image: url('assets/img/breadcrumbs-bg.jpg');">
      <div class="container position-relative d-flex flex-column align-items-center" data-aos="fade">

        <h2>Record</h2>
        <ol>
          <li><a href="${pageContext.request.contextPath }/">Home</a></li>
          <li>Hitter </li>
        </ol>

      </div>
    </div><!-- End Breadcrumbs -->

    <!-- ======= Blog Section ======= -->
    <section id="blog" class="blog">
    <div class="card mb-4" style="max-width: 1100px; align-content: center; margin:0 auto; border-color: black; ">
  <div class="row g-0">
    <div class="col-md-2 p-3">
      <img src="${hpInfo.himg }" class="img-fluid rounded-start" alt="..." style="width: 120px;">
    </div>
    <div class="col-md-10">
      <div class="card-body">
        <h5 class="card-title">
        <strong>
        ${hpInfo.hname }
        </strong>
        (${hpInfo.hteam })
        </h5>
     <ul class="list-group list-group-horizontal" style="" >
  <li class="list-group-item">
  <strong>키/몸무게: </strong>
  ${hpInfo.hbody }</li>
  <li class="list-group-item" >
    <strong>생년월일: </strong>
  ${hpInfo.hbirth }</li>
</ul>
     <ul class="list-group list-group-horizontal">
  <li class="list-group-item"> <strong>등번호: </strong> NO. ${hpInfo.hno }</li>
  <li class="list-group-item ">   <strong>포지션: </strong>${hpInfo.hpos }</li>
</ul>
     <ul class="list-group list-group-horizontal">
  <li class="list-group-item"> <strong>연봉: </strong> ${hpInfo.hmoney }</li>
  <li class="list-group-item">   </li>
</ul>
      </div>
    </div>
  </div>
</div>
    

<div class="recode">
   <table class="table">
  <thead class="table-light">
    <tr>
      <th scope="col">경기수</th>
      <th scope="col">타율</th>
      <th scope="col">안타</th>
      <th scope="col">홈런</th>
		<th scope="col">타점</th>
    </tr>
  </thead>
  <tbody class="table-group-divider">
    <tr>
      <td>${hpInfo.hgame }</td>
       <td>${hpInfo.havg }</td>
         <td>${hpInfo.hhit }</td>
         <td>${hpInfo.hhr }</td>
       <td>${hpInfo.hrbi }</td>
    </tr>
  </tbody>
</table>
</div>

<div class="scrapH">
		<input type="button" class="btn btn-lg scrap" id="${hpInfo.hcode }" onclick="checkVal('${hpInfo.hcode }', this)" value="♡ 관심선수 등록">
</div>







			<input type="hidden" id="loginId" value="${sessionScope.loginInfo.mid }">
	


    </section><!-- End Blog Section -->

  </main><!-- End #main -->

   <!-- ======= Footer ======= -->
  <%@ include file="/WEB-INF/views/includes/Footer.jsp"%>
  <!-- ======= End Footer ======= -->



  <a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/vendor/aos/aos.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="${pageContext.request.contextPath }/resources/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="${pageContext.request.contextPath }/resources/assets/js/main.js"></script>

<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

<script type="text/javascript">

var loginId = $('#loginId').val();	
$(document).ready(function(){
	selectScrap();
});


function checkVal(checkedName, selBtn){
	console.log(checkedName);
	
	if (loginId == "") {
		alert("로그인이 필요한 서비스입니다.");
		location.href = "${pageContext.request.contextPath}/memberLoginForm";
		return null;
	} 
	if ($(selBtn).hasClass("scrap_click")) {
		$(selBtn).removeClass("scrap_click");
		$.ajax({
			type: "get",
			url: "${pageContext.request.contextPath }/removeScrap",
			data : {"checkedName" : checkedName},
			dataType : "json",
			success:function(result){
			}
		});
		
	}else{
	$(selBtn).addClass("scrap_click");
	$.ajax({
		type: "get",
		url: "${pageContext.request.contextPath }/scrapHname",
		data : {"checkedName" : checkedName},
		dataType : "json",
		success:function(result){
		}
	});
	}
	
	}
	
	function selectScrap(){
		$.ajax( { 
			type : "get",
			url : "${pageContext.request.contextPath }/selectScrap",
			async:false,
			dataType:"json",
			success : function(scrapList){
					 for(var scrapinfo of scrapList){
					 $("#"+scrapinfo.hschno).addClass("scrap_click");
					 }
				
			}
		} );			
	}
	
	
	
	
</script>

</body>

</html>
  
