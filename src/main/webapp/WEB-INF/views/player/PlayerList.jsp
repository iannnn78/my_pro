<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>PLAYERLIST</title>
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


</head>

<body>

 <!-- Header -->
	<%@ include file="/WEB-INF/views/includes/Header.jsp"%>


  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs d-flex align-items-center">
      <div class="container position-relative d-flex flex-column align-items-center" data-aos="fade">

        <h2>FanPage</h2>
        <ol>
          <li><a href="${pageContext.request.contextPath }/">Home</a></li>
          <li>Blog</li>
        </ol>

      </div>
    </div><!-- End Breadcrumbs -->

    <!-- ======= Blog Section ======= -->
    <section id="blog" class="blog">
    
    <div class="col-6" style="width: 1000px; text-align: center; margin:0 auto; " >
  <div class="col-td-6">
    <h4 style="text-align: center;">팀순위</h4>
    </div>
 <div class="box col-td-6" style="text-align: center;">
    <table class="table" style="text-align: center;">
  <thead style="text-align: center;">
    <tr style="text-align: center;">
      <th scope="col">순위</th>
      <th scope="col">팀명</th>
      <th scope="col">승</th>
      <th scope="col">무</th>
      <th scope="col">패</th>
   	  <th scope="col">승률</th>
    </tr>
  </thead>
  <tbody class="table-group-divider">
         <c:forEach items="${teamList }" var="team">
    <tr>
      <td> ${team.trank } </td>
      <td>${team.tteam }</td>
      <td>${team.twin }</td>
            <td>${team.ttie }</td>
      <td>${team.tlose }</td>
       <td>${team.todds }</td>
    </tr>
  </c:forEach>  
  </tbody>
</table>
 </div>
 </div>
 <div class="col-6" style="width: 1200px; text-align: center; margin:0 auto; " >
  <div class="col-td-6">
 <h4>선수 순위</h4>
 </div>
 
 <ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item" role="presentation">
    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">타자</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">투수</button>
  </li>

</ul>
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">

    <table class="table">
  <thead>
    <tr>
      <th scope="col">순위</th>
      <th scope="col">선수명</th>
      <th scope="col">타율</th>
      <th scope="col">경기수</th>
      <th scope="col">안타</th>
      <th scope="col">홈런</th>
      <th scope="col">타점</th>
    </tr>
  </thead>
  <tbody class="table-group-divider">
         <c:forEach items="${hpList }" var="hitter">
    <tr>
      <td scope="row"> ${hitter.hrank } </td>
      <td>
      <a href ="${pageContext.request.contextPath }/hitterInfo?hcode=${hitter.hcode}">  ${hitter.hname }   </a>
 </td>
      <td>${hitter.havg }</td>
	<td>${hitter.hgame }</td>
	<td>${hitter.hhit }</td>
		<td>${hitter.hhr }</td>
<td>${hitter.hrbi }</td>	
  
    </tr>
  </c:forEach>  
  </tbody>
</table>

  </div>
 
  </div>
  <div class="tab-pane fade" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
     <table class="table">
  <thead>
    <tr>
      <th scope="col">순위</th>
      <th scope="col">선수명</th>
      <th scope="col">ERA</th>
      <th scope="col">경기수</th>
      <th scope="col">승</th>
      <th scope="col">패</th>
      <th scope="col">이닝</th>
    </tr>
  </thead>
  <tbody class="table-group-divider">
         <c:forEach items="${ppList }" var="pitcher">
    <tr>
      <td> ${pitcher.prank }  </td>
      <td>
        <a href ="${pageContext.request.contextPath }/pitcherInfo?pcode=${pitcher.pcode}"> 
${pitcher.pname }  
</a>
      </td>
      <td>${pitcher.pera }</td>
 	  <td>${pitcher.pgame }</td>
 	  <td>${pitcher.pwin }</td>
      <td>${pitcher.plose }</td> 	
      <td>${pitcher.pip }</td> 	 
    </tr>
  </c:forEach>  
  </tbody>
</table>
  </div>
</div>
 
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



</body>

</html>
  