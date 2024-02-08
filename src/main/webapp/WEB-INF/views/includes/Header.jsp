<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <!-- ======= Header ======= -->
  <header id="header" class="header d-flex align-items-center">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">

      <a href="${pageContext.request.contextPath }/" class="logo d-flex align-items-center">
        <h1>EveryBall<span>.</span></h1>
      </a>

      <i class="mobile-nav-toggle mobile-nav-show bi bi-list"></i>
      <i class="mobile-nav-toggle mobile-nav-hide d-none bi bi-x"></i>
      <nav id="navbar" class="navbar">
        <ul>
          <li><a href="${pageContext.request.contextPath }/" >Home</a></li>
          <li><a href="${pageContext.request.contextPath }/service">소개</a></li>
          <li><a href="${pageContext.request.contextPath }/playerList">기록실</a></li>
          <li><a href="${pageContext.request.contextPath }/marketList">중고장터</a></li>
          <li><a href="${pageContext.request.contextPath }/boardList">팬페이지</a></li>
   
                                 <c:choose>
	<c:when test="${sessionScope.loginInfo == null }">
          <li><a href="${pageContext.request.contextPath }/memberLoginForm">비회원</a></li>
             
</c:when>
<c:otherwise>

         <li class="dropdown"><a href="#"><span>${sessionScope.loginInfo.mid}님</span> <i class="bi bi-chevron-down dropdown-indicator"></i></a>
            <ul>
              <li><a href="${pageContext.request.contextPath }/memberInfo">내정보</a></li>
         
              <li><a href="${pageContext.request.contextPath }/memberLogout">로그아웃</a></li>
            </ul>
          </li>      
</c:otherwise>
                        </c:choose>
        </ul>
      </nav><!-- .navbar -->
    

    </div>
  </header><!-- End Header -->