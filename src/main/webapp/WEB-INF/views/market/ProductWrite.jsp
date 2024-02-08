<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>판매글 작성</title>
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
    <div class="breadcrumbs d-flex align-items-center" style="background-image: url('assets/img/breadcrumbs-bg.jpg');">
      <div class="container position-relative d-flex flex-column align-items-center" data-aos="fade">

        <h2>FanPage</h2>
        <ol>
          <li><a href="${pageContext.request.contextPath }/">Home</a></li>
          <li>Blog</li>
        </ol>

      </div>
    </div><!-- End Breadcrumbs -->
		
		
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                
                    <!-- Content Row -->
                    <div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9" style="width: 60%">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
                <div class="row">
                    <div class="col ml-auto mr-auto" style="background-color: white;" >
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">상품판매</h1>
                            </div>
                            <hr>
                            <form action="${pageContext.request.contextPath }/productWrite" 
                                  enctype="multipart/form-data"
                                  method="post" class="user">
                            
                                  
                                <div class="form-group mb-3">
                                    <input name="prtitle" type="text" id="inputTitle" placeholder="제목" class="form-control form-control-user">
                                </div>
                                <div class="form-group mb-2">
                                  
                                    <textarea name="prcontents" id="inputContents" class="form-control" rows="10"></textarea>
                                </div>
                                
                            <div class="form-group mb-3">
                                    <input name="prmoney" type="text" id="inputTitle" placeholder="가격" class="form-control form-control-user">
                                </div>
                                
                                <div class="form-group mb-4">
                                	
                                    <input type="file" name="prfile" id="inputFile"  class="form-control form-control-user" 
                                     style="padding-top:11px; height:48px;"  >
                                </div>
                             <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                  <button class="btn btn-warning me-md-1" type="button">취소</button>
                                <button type="submit" class="btn btn-warning btn-user btn-block">
								글작성
                                </button>
</div>

                                <hr>
                            </form>
                        </div>
                    </div>
                </div>
                
                </div>
                </div>
                </div>
                </div>


                    
                </div>
                <!-- /.container-fluid -->
                
                


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