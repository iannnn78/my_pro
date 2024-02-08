<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Login</title>
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

<body class="bg-gradient-primary">

	<!-- Header -->
	<header id="header">
	<div class="header-div mt-4" style="text-align: center;">
		<div class="logo">
			<a class="navbar-brand" href="${pageContext.request.contextPath }/">
			
        <h1>EveryBall<span>.</span></h1>
    
			</a>
		</div>
	</div>
	</header>
        <!-- <img src="assets/img/logo.png" alt=""> -->
	
    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9" style="width: 50%">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                       
                            <div class="col-lg">
                                <div class="p-4">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">로그인</h1>
                                    </div>
                                    <form class="user"  action="${pageContext.request.contextPath }/memberLogin" 
                            method="post" onsubmit="return checkInputVal(this)">
                                        <div class="form-group my-1">
                                            <input type="text" class="form-control form-control-user"
                                                id="inputId" placeholder="Id" name="inputMid">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                id="inputPw" placeholder="Password" name="inputMpw">
                                        </div>
                                        <div class="d-grid gap-2 col-6 mx-auto">
 
                                        <button type="submit" class="btn btn-warning btn-user btn-block my-3">
                                            Login
                                        </button>
</div>
                                    
                                     
                                    
                                    </form>
                                    <hr>
                                  
                                    <div class="text-center">
                                        <a class="small" href="${pageContext.request.contextPath }/memberJoinForm">회원가입</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/assets/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath }/resources/assets/js/sb-admin-2.min.js"></script>

	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>

	<script type="text/javascript">
		function checkInputVal(formObj) {
			var inputId = formObj.inputMid;
			var inputPw = formObj.inputMpw;
			if (inputId.value.length == 0) {
				alert("아이디를 입력해주세요.");
				inputId.focus();
				return false;
			} else if (inputPw.value.length == 0) {
				alert("비밀번호를 입력해주세요.");
				inputPw.focus();
				return false;
			} else {
				return true;
			}
		}
	</script>

</body>

</html>