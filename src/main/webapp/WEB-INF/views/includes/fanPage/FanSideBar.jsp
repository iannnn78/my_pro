<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<div class="sidebar">

            

              <div class="sidebar-item recent-posts">
                <h3 class="sidebar-title">인기 포스트</h3>

                <div class="mt-3">
	<c:forEach items="${boardHit }" var="boardHit">
                  <div class="post-item mt-3">
                    
                    <div>
                      <h4><a href="blog-details.html"> ${boardHit.btitle } </a></h4>
                      <time datetime="2020-01-01">${boardHit.bdate } </time>
                    </div>
                  </div><!-- End recent post item-->
</c:forEach>
<br>
                   <a href="${pageContext.request.contextPath }/boardList">
                   - 전체 게시글 보기
                   </a> 

                </div>
		
              </div><!-- End sidebar recent posts-->

             </div>