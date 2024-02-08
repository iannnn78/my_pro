<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <!-- ======= Hero Section ======= -->
  <section id="hero" class="hero">
                    <c:choose>
	<c:when test="${sessionScope.loginInfo == null }">
    <div class="info d-flex align-items-center">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-6 text-center">
            <h2 data-aos="fade-down">Welcome to <span>EveryBall</span></h2>
            <p data-aos="fade-up">프로야구에 대한 다양하고 정확한 정보, 실시간으로 많은 팬들과 소통할 수 있는 국내 최대의 스포츠 사이트 EveryBall에 오신것을 환영합니다. </p>
            <a data-aos="fade-up" data-aos-delay="200" href="${pageContext.request.contextPath }/memberLoginForm" class="btn-get-started">시작하기</a>
          </div>
        </div>
      </div>
    </div>
    </c:when>
    <c:otherwise>
       <div class="info d-flex align-items-center">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-6 text-center">
            <h2 data-aos="fade-down">${sessionScope.loginInfo.mid}님 반가워요!</h2>
            
    
          </div>
        </div>
      </div>
    </div>
    </c:otherwise>
    </c:choose>

    <div id="hero-carousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="5000">

      <div class="carousel-item active" style="background-image: url(https://th.bing.com/th/id/OIP.QIr76YZWRi4i5CgBN2suVwHaEo?pid=ImgDet&rs=1"></div>
      <div class="carousel-item" style="background-image: url(https://th.bing.com/th/id/OIP.VMm8h-Vmbsk5HGXmHMyVcQHaEK?pid=ImgDet&rs=1"></div>



      <a class="carousel-control-prev" href="#hero-carousel" role="button" data-bs-slide="prev">
        <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>
      </a>

      <a class="carousel-control-next" href="#hero-carousel" role="button" data-bs-slide="next">
        <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>
      </a>

    </div>

  </section><!-- End Hero Section -->