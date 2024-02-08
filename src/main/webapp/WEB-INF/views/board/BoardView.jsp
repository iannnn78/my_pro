<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

</head>

<body>

  <!-- ======= Header ======= -->
<%@ include file="/WEB-INF/views/includes/Header.jsp"%>

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <div class="breadcrumbs d-flex align-items-center" style="">
      <div class="container position-relative d-flex flex-column align-items-center" data-aos="fade">

        <h2>Blog Details</h2>
        <ol>
          <li><a href="${pageContext.request.contextPath }/">Home</a></li>
          <li>Blog Details</li>
        </ol>

      </div>
    </div><!-- End Breadcrumbs -->

     <!-- ======= Blog Details Section ======= -->
    <section id="blog" class="blog">
      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="row g-5">

          <div class="col-lg-8">

            <article class="blog-details">

             

   <form action="${pageContext.request.contextPath }/boardModify" 
                                  method="post" class="user">
                                     <input type="hidden" name="bno" value="${board.bno }">
                                     
<div class="form-floating mb-3">
<h2>
  <input type="text" readonly class="form-control-plaintext" name="btitle"  id="InputTitle" value="${board.btitle }">
</h2>
              
</div>

              <div class="meta-top">
                <ul>
                  <li class="d-flex align-items-center"><i class="bi bi-person"></i> <a href="blog-details.html">${board.bid }</a></li>
                  <li class="d-flex align-items-center"><i class="bi bi-clock"></i> <a href="blog-details.html"><time datetime="2020-01-01">${board.bdate }</time></a></li>
                  <li class="d-flex align-items-center"><i class="bi bi-chat-dots"></i> <a href="blog-details.html">${board.bviews }</a></li>
                  
                </ul>
              </div><!-- End meta top -->

              <div class="content">
                

                <blockquote>
                  <p>
                   <input type="text" readonly class="form-control-plaintext"  name="bcontents" id="InputContents" value="${board.bcontents }">
               
                  </p>
                </blockquote>

         
                <img src="${pageContext.request.contextPath }/resources/uploadBoard/${board.bfilename }" class="img-fluid" alt="">

              </div><!-- End post content -->

              <div class="meta-bottom">
                <i class="bi bi-folder"></i>
                <ul class="cats">
                  <li><a href="#">${board.bcate }</a></li>
                </ul>

              </div><!-- End meta bottom -->
<div>
  <div class="col-sm-6 mb-3 mb-sm-0 modifyCol">
                                    <c:if test="${board.bid == sessionScope.loginInfo.mid }">
		                                <button type="button" onclick="del1(${board.bno})" 
		                                        class="btn btn-primary btn-user btn-block ">
		                                    삭제
		                                </button>	
		                                  
		                                   <button type="button" onclick="toggleModForm('open')" 
		                                        class="btn btn-primary btn-user btn-block ">
		                                    글수정
		                                </button>	 
		                            </c:if>  
		                            
</div>
    <div class="col-sm-3 mb-3 mb-sm-0 modifyCol d-none">
		                                <button type="submit" class="btn btn-success btn-user btn-block ">
		                                    수정
		                                </button>
		                            </div>
                                    <div class="col-sm-3 modifyCol d-none">
		                                <button type="button" onclick="toggleModForm('close')" 
		                                        class="btn btn-danger btn-user btn-block ">
		                                    취소
		                                </button>
		                            </div>	
		                            
                                    </div>
                 </form>                     
                                   
            </article><!-- End blog post -->

          

            <div class="comments">
			<div>
              <h4 class="comments-count">Comments</h4>

              <div id="comment" class="comment">
                <div class="d-flex" id="replyListArea">
                  
                  <div class="comment_area">
                <c:forEach items="${replyList }" var="reply">
                   <div style="display: inline-block; margin: 0 5px;  float: right;">

                   <c:if test="${reply.rid == sessionScope.loginInfo.mid }">
		                                <button type="button" onclick="del2(${reply.rno})" 
		                                        class="btn btn-outline-danger">
		                                  				<svg xmlns="http://www.w3.org/2000/svg" width="16"
																			height="16" fill="currentColor" class="bi bi-trash3"
																			viewBox="0 0 16 16">
  														<path
																				d="M6.5 1h3a.5.5 0 0 1 .5.5v1H6v-1a.5.5 0 0 1 .5-.5ZM11 2.5v-1A1.5 1.5 0 0 0 9.5 0h-3A1.5 1.5 0 0 0 5 1.5v1H2.506a.58.58 0 0 0-.01 0H1.5a.5.5 0 0 0 0 1h.538l.853 10.66A2 2 0 0 0 4.885 16h6.23a2 2 0 0 0 1.994-1.84l.853-10.66h.538a.5.5 0 0 0 0-1h-.995a.59.59 0 0 0-.01 0H11Zm1.958 1-.846 10.58a1 1 0 0 1-.997.92h-6.23a1 1 0 0 1-.997-.92L3.042 3.5h9.916Zm-7.487 1a.5.5 0 0 1 .528.47l.5 8.5a.5.5 0 0 1-.998.06L5 5.03a.5.5 0 0 1 .47-.53Zm5.058 0a.5.5 0 0 1 .47.53l-.5 8.5a.5.5 0 1 1-.998-.06l.5-8.5a.5.5 0 0 1 .528-.47ZM8 4.5a.5.5 0 0 1 .5.5v8.5a.5.5 0 0 1-1 0V5a.5.5 0 0 1 .5-.5Z" />
													</svg>
		                                </button>	
		                            </c:if>
		                          
             </div>
                    <h5>${reply.rid } </h5>
                    <time datetime="2020-01-01">${reply.rdate }</time>
                    <p>
                   ${reply.rcontents }
                    </p>
                  </c:forEach>
                  </div>
                </div>
			</div>
              </div><!-- End comment #1 -->

         
   <c:if test="${sessionScope.loginInfo.mid != null }">
              <div class="reply-form">

                <h4>Leave a Reply</h4>
               
                <form action="user" onsubmit="return writeReply(this)">
                  	<input type="hidden" name="rno"  value="${board.bno }">
              <input type="hidden" name="rid" id="loginId" value="${sessionScope.loginInfo.mid}">
                  <div class="row">
                    <div class="col form-group">
                      <textarea name="rcontents" class="form-control" placeholder="Your Comment*"></textarea>
                    </div>
                  </div>
                  <button type="submit" class="btn btn-primary">Post Comment</button>

                </form>

              </div>
</c:if>
            </div><!-- End blog comments -->

          </div>

          <div class="col-lg-4">

           <!-- sidebar tags-->
             <%@ include file="/WEB-INF/views/includes/fanPage/FanSideBar.jsp"%>
           <!-- End sidebar tags-->

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
<script type="text/javascript">
var viewBno = '${board.bno }';
var viewRno = '${reply.rno }';

function del2(viewRno) {
	console.log("삭제할 글번호: " + viewRno);
	var Redel = confirm('정말 삭제하시겠습니까?');
	if (Redel) {
		console.log("예 선택");
	
	$.ajax({

	});
	}else {
		console.log("아니요 선택");
		return false;
	}
}

function del1(viewBno) {
	console.log("삭제할 글번호: " + viewBno);
	var Redel = confirm('정말 삭제하시겠습니까?');
	if (Redel) {
		console.log("예 선택");
	
	$.ajax({
		type : "get",
		url : "${pageContext.request.contextPath }/deleteWrite",
		data : {
			"viewBno" : viewBno
		},
		async : false,
		success : function(checkResult) {
			console.log(checkResult);
			if (checkResult == '1') {
				alert("글 삭제 성공");
				boardList(viewBno);
			} else {
				alert("글 삭제 실패");
			}
		}
	});
	}else {
		console.log("아니요 선택");
		return false;
	}
}

function modifyBoard(viewBno) {
	
}
function writeReply(formObj) {
	console.log("replyWrite(formObj) 호출")
	var rno = formObj.rno;
	console.log("댓글작성 글번호 : " + rno.value);
	var rid = formObj.rid;
	console.log("댓글작성자 : " + rid.value);
	var rcontents = formObj.rcontents;
	console.log("댓글내용 : " + rcontents.value);

	$.ajax({
		type : "get",
		url : "${pageContext.request.contextPath }/replyWrite",
		data : {
			"rno" : rno.value,
			"rid" : rid.value,
			"rcontents" : rcontents.value
		},
		async : false,
		success : function(checkResult) {
			console.log(checkResult);
			if (checkResult == '1') {
				alert("댓글 등록 성공");
				replyList(rno.value);
			} else {
				alert("댓글 등록 실패");
			}
		}
	});

	rcontents.value = "";

	return false;
}

var titleVal = "";
var contentVal = "";

function toggleModForm(btnType){
	
	$(".modifyCol").toggleClass("d-none");
	
	if(btnType == 'open'){
		titleVal = $("#InputTitle").val();
		contentVal = $("#InputContents").val();
		$("#InputTitle").removeAttr("readonly");
		$("#InputContents").removeAttr("readonly");
	} else {
		$("#InputTitle").val(titleVal);
		$("#InputContents").val(contentVal);
		$("#InputTitle").attr("readonly","readonly");
		$("#InputContents").attr("readonly","readonly");
	}
	
}

function replyList(rno) {
	console.log('댓글 목록 조회 replyList(rno) 호출')
	$
			.ajax({
				type : "get",
				url : "${pageContext.request.contextPath }/replyList",
				data : {
					"rno" : rno
				},
				dataType : "json",
				async : false,
				success : function(rList) {
					console.log(rList);
					console.log(viewBno);
					var output = "";
					for (var i = 0; i < rList.length; i++) {
						console.log(rList[i].rid + " : "
								+ rList[i].rcontents);
						
						output += '<div class="comment_area">';
						output += '<h5>' + rList[i].rid + '</h5>';
						output += '<time datetime="2020-01-01">'
						 + rList[i].redate + '</time>';
						output += '<p>';
				output += rList[i].rcontents
						output += '</p>';
						output += '</div>';
					
						//
					}
					$("#replyListArea").html(output);
				}
			});
}


</script>
</body>

</html>