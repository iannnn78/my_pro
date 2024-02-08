<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
	<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>PRODUCT</title>
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

  <!-- ======= Header ======= -->
<%@ include file="/WEB-INF/views/includes/Header.jsp"%>

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs d-flex align-items-center" style="">
      <div class="container position-relative d-flex flex-column align-items-center" data-aos="fade">

        <h2>Product</h2>
        <ol>
          <li><a href="${pageContext.request.contextPath }/">Home</a></li>
          <li>Product</li>
        </ol>

      </div>
    </div><!-- End Breadcrumbs -->

     <!-- ======= Blog Details Section ======= -->
    <section id="blog" class="blog">
      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="row g-5">

          <div class="col-lg-11">

            <article class="blog-details">

            


    <input type="hidden" name="rid" id="loginAddr" value="${sessionScope.loginInfo.maddr}">
   <input type="hidden" id="prcode" name="prcode" value="${product.prcode }">
                         
                           <form action="${pageContext.request.contextPath }/" 
                                  method="post" class="user">
                                  
                                     
<div class="form-floating mb-3">
<h2>
  <input type="text" readonly class="form-control-plaintext" name="prtitle"  id="prtitle" value="${product.prtitle }">
</h2>
              
</div>

              <div class="meta-top">
                <ul>
                  <li class="d-flex align-items-center"><i class="bi bi-person"></i> <a href="blog-details.html">${product.prid }</a></li>
     
                  <li class="d-flex align-items-center"><i class="bi bi-clock"></i> <a href="blog-details.html"><time datetime="2020-01-01">${product.prdate }</time></a></li>
           
                </ul>
              </div><!-- End meta top -->

              <div class="content">

                <img src="${pageContext.request.contextPath }/resources/uploadProduct/${product.prfilename }" width="200" height="200" class="img-fluid"  alt="">
          
                  
                  <h3>
                   <input type="text" readonly class="form-control-plaintext"  name="bcontents" id="InputContents" value="${product.prcontents }">
                  </h3>
               
                  
        
</div>
         <div class="input-group input-group-lg mb-3">
											<span class="input-group-text"
												style="justify-content: center;">가격(원)</span> <input
												type="text" class="prmoney form-control" name="prmoney"  id="prmoney"
											value='${product.prmoney }' readonly="readonly"
												style="background-color: white width: 50px; ">
										</div>
                
               
<c:choose> 
	<c:when test="${sessionScope.loginInfo == null }">
			<i class="bi bi-exclamation-circle-fill">
		결제를 원하신다면
			
			<a href="${pageContext.request.contextPath }/memberLoginForm">로그인</a> 해주세요.
								</i>
				</c:when>	
				<c:otherwise>
                	<div class="col" style="text-align: center; min-width:250px; max-width: 250px;">
									<button class="btn btn-danger font-bold mb-1" type="submit" style="width: 100px; height: 40px;" 
									        onclick="reservePro_kakaoPay('${product.prcode }',this)" id="${product.prcode }">결제</button>		
									       							        
								</div>
								<i class="bi bi-exclamation-circle-fill">
			주소는 회원 정보에 있는 주소지로 배달됩니다.
			
			<a href="${pageContext.request.contextPath }/memberInfo">주소지 변경</a>
								</i>
			
				</c:otherwise>	
				</c:choose>
                                  </form>

              </div><!-- End post content -->

        
<div>
  <div class="col-sm-6 mb-3 mb-sm-0 modifyCol">
                         
		                            
</div>
    <div class="col-sm-3 mb-3 mb-sm-0 modifyCol d-none">
		                           
		                            </div>	
		                            
                                    </div>
                                    
                                   
            </article><!-- End blog post -->

          
<!-- End blog comments -->

          </div>

          <div class="col-lg-4">

          

            </div><!-- End Blog Sidebar -->

          </div>
        </div>

      </div>
    </section><!-- End Blog Details Section -->

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

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<script type="text/javascript">
var reprcode = $("#prcode").val();

function reservePro_kakaoPay(checkedName, selBtn){
	console.log("reservePro() 호출");
	console.log(checkedName);

	
	var retitle = $("#prtitle").val();
	console.log("선택한 제품이름 : " + retitle);
	
	
	var remoney = $("#prmoney").val();//가격
	console.log("선택한 제품가격 : " + remoney);
	
	$.ajax({
		type : "get",
		url : "${pageContext.request.contextPath }/reservePro_payReady",
		data : {
			"checkedName" : checkedName,
			"retitle" : $("#prtitle").val(),
			"remoney" : $("#prmoney").val()
		},
		async : false,
		success:function(popUpUrl){ // 결제QR코드 페이지 URL
			console.log(popUpUrl);
			if(popUpUrl != 'Fail'){
				window.open(popUpUrl, "payPopUp","width=400, height=800, top=10, left=100");
				
			}
		}
	});
}


	


</script>
</body>

</html>