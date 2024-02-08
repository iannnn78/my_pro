<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>FANPAGE</title>
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
	

</style>
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
      <div class="container" data-aos="fade-up" data-aos-delay="100">
    <div class="d-grid gap-2 d-md-flex justify-content-md-end mb-3">
   <a href="${pageContext.request.contextPath }/boardWritePage">
   <button type="button" class="btn btn-outline-warning">
   글작성
  </button>
   </a>
    </div>

        <div class="row gy-4 posts-list">
                    <c:forEach items="${boardList }" var="board">

          <div class="col-xl-4 col-md-6">
            <div class="post-item position-relative h-100">

              <div class="post-img position-relative overflow-hidden">
                <img alt="" class="img-fluid"
                         style=""   src="${pageContext.request.contextPath }/resources/uploadBoard/${board.bfilename }">
                <span class="post-date">${board.bdate }</span>
              </div>

              <div class="post-content d-flex flex-column">
                <h3 class="post-title">
<a href="${pageContext.request.contextPath }/boardView?viewBno=${board.bno }"> 
                ${board.btitle }
</a>
                </h3>
                <div class="meta d-flex align-items-center">
                  <div class="d-flex align-items-center">
                    <i class="bi bi-person"></i> <span class="ps-2">${board.bid }</span>
                  </div>
                  <span class="px-3 text-black-50">/</span>
                  <div class="d-flex align-items-center">
                    <i class="bi bi-folder2"></i> <span class="ps-2">${board.bcate }</span>
                  </div>
                </div>

                <p>
                 ${board.bcontents }
                </p>

                <hr>

                <a href="${pageContext.request.contextPath }/boardView?viewBno=${board.bno }" class="readmore stretched-link"><span>Read More</span><i class="bi bi-arrow-right"></i></a>

              </div>

            </div>
          </div><!-- End post list item -->
              </c:forEach>

          

     

        </div><!-- End blog posts list -->

        <div class="blog-pagination">
          <ul class="justify-content-center">
            <li><a href="#">1</a></li>
            <li class="active"><a href="#">2</a></li>
            <li><a href="#">3</a></li>
          </ul>
        </div><!-- End blog pagination -->

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