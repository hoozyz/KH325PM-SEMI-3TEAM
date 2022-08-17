<%@ page import="vo.User" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String path = request.getContextPath();
	User loginUser = (User) session.getAttribute("loginUser");
	if((String) request.getAttribute("msg") != null) {
%>
	    <script>
	    	alert('${msg}');
	    </script>
<%} %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>SCENE</title>
    <!-- Viewport-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon and Touch Icons-->
    <link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="favicon-16x16.png">
    <link rel="manifest" href="<%=path %>/resources/etc/site.webmanifest">
    <link rel="mask-icon" color="#5bbad5" href="<%=path %>/resources/etc/safari-pinned-tab.svg">
    <meta name="msapplication-TileColor" content="#766df4">
    <meta name="theme-color" content="#ffffff">
    <!-- Page loading styles-->
    <style>
    	/* 아이콘 */
    	@font-face {
    	font-family: "finder-icons";
    	src: url("<%=path%>/resources/fonts/finder-icons.ttf?7648j3") format("truetype"), url("<%=path%>/resources/fonts/finder-icons.woff?7648j3") format("woff"), url("<%=path%>/resources/fonts/finder-icons.svg?7648j3#finder-icons") format("svg");
    	font-weight: normal;
    	font-style: normal;
    	font-display: block
		}
    
    	.swiper-container .img-container a>.shadow1,
        .swiper-container .img-container a>.shadow2,
        .swiper-container .img-container a>.shadow3,
        .swiper-container .img-container a>.shadow4,
        .swiper-container .img-container a>.shadow5,
        .swiper-container .img-container a>.shadow6,
        .swiper-container .img-container a>.shadow7,
        .swiper-container .img-container a>.shadow8,
        .swiper-container .img-container a>.shadow9,
        .swiper-container .img-container a>.shadow10 {
            text-align: center;
            position: absolute;
            left: 0px;
            width: 100%;
            height: 100%;
            background: url(resources/images/shadow.png) center;
            transition: 0.2s all ease-in-out;
            border-radius: 5%;
        }
        
        .page-loading.active {
            opacity: 1;
            visibility: visible;
        }
        
        .page-loading-inner {
            position: absolute;
            top: 50%;
            left: 0;
            width: 100%;
            text-align: center;
            -webkit-transform: translateY(-50%);
            transform: translateY(-50%);
            -webkit-transition: opacity .2s ease-in-out;
            transition: opacity .2s ease-in-out;
            opacity: 0;
        }
        
        .page-loading.active>.page-loading-inner {
            opacity: 1;
        }
        
        .page-loading-inner>span {
            display: block;
            font-size: 1rem;
            font-weight: normal;
            color: #666276;
            ;
        }
        
        .page-spinner {
            display: inline-block;
            width: 2.75rem;
            height: 2.75rem;
            margin-bottom: .75rem;
            vertical-align: text-bottom;
            border: .15em solid #bbb7c5;
            border-right-color: transparent;
            border-radius: 50%;
            -webkit-animation: spinner .75s linear infinite;
            animation: spinner .75s linear infinite;
        }
        
        @-webkit-keyframes spinner {
            100% {
                -webkit-transform: rotate(360deg);
                transform: rotate(360deg);
            }
        }
        
        @keyframes spinner {
            100% {
                -webkit-transform: rotate(360deg);
                transform: rotate(360deg);
            }
        }
        
        
    </style>
    <!-- Page loading scripts-->
    <script>
        (function() {
            window.onload = function() {
                var preloader = document.querySelector('.page-loading');
                preloader.classList.remove('active');
                setTimeout(function() {
                    preloader.remove();
                }, 2000);
            };
        })();
    </script>
    <!-- 제이쿼리 -->
    <script src="<%=path %>/resources/js/jquery-3.6.0.min.js"></script>
    
    <!-- swiper -->
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="<%=path %>/resources/css/swiper.css" id="theme-stylesheet">
    
    <!-- Main Theme Styles + Bootstrap-->
    <link rel="stylesheet" media="screen" href="<%=path %>/resources/css/theme.min.css">
    
    <link rel="stylesheet" href="<%=path %>/resources/css/directory/style.default.css" id="theme-stylesheet">

    <!-- Google fonts - Poppins-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,400i,700">

    <!-- Vendor Styles-->
    
    <meta name="description" content="Finder - Directory &amp; Listings Bootstrap Template">
    <meta name="keywords" content="bootstrap, business, directory, listings, e-commerce, car dealer, city guide, real estate, job board, user account, multipurpose, ui kit, html5, css3, javascript, gallery, slider, touch">
    <meta name="author" content="Createx Studio">

    <link rel="stylesheet" media="screen" href="<%=path %>/resources/css/simplebar.min.css" />
    <link rel="stylesheet" media="screen" href="<%=path %>/resources/css/tiny-slider.css" />
    <link rel="stylesheet" media="screen" href="<%=path %>/resources/css/flatpickr.min.css" />
    <!-- Vendor Styles-->
    <link rel="stylesheet" media="screen" href="<%=path %>/resources/vendor/prismjs/themes/prism.css" />
    <link rel="stylesheet" media="screen" href="<%=path %>/resources/vendor/prismjs/plugins/toolbar/prism-toolbar.css" />
    <link rel="stylesheet" media="screen" href="<%=path %>/resources/vendor/prismjs/plugins/line-numbers/prism-line-numbers.css" />
    <link rel="stylesheet" media="screen" href="<%=path %>/resources/vendor/nouislider/dist/nouislider.min.css" />

    
    <!-- Vendor scripts: js libraries and plugins-->
    <script src="<%=path %>/resources/vendor/prismjs/components/prism-core.min.js"></script>
    <script src="<%=path %>/resources/vendor/prismjs/components/prism-markup.min.js"></script>
    <script src="<%=path %>/resources/vendor/prismjs/components/prism-clike.min.js"></script>
    <script src="<%=path %>/resources/vendor/prismjs/components/prism-javascript.min.js"></script>
    <script src="<%=path %>/resources/vendor/prismjs/components/prism-pug.min.js"></script>
    <script src="<%=path %>/resources/vendor/prismjs/plugins/toolbar/prism-toolbar.min.js"></script>
    <script src="<%=path %>/resources/vendor/prismjs/plugins/copy-to-clipboard/prism-copy-to-clipboard.min.js"></script>
    <script src="<%=path %>/resources/vendor/prismjs/plugins/line-numbers/prism-line-numbers.min.js"></script>
    <script src="<%=path %>/resources/vendor/nouislider/dist/nouislider.min.js"></script>
    <!-- Vendor scripts: js libraries and plugins (calendar)-->
    <script src="<%=path %>/resources/vendor/flatpickr/dist/plugins/rangePlugin.js"></script>
    

    <!-- @@@@@@@@@@@@@@@헤더부분@@@@@@@@@@@@@@@@@@@@@@@@@ -->

    <!-- 구글 폰트 -->

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gugi&family=Jua&display=swap" rel="stylesheet">
    <!-- 나눔스퀘어라운지 -->
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">


    <style>
        h1 {
            font-family: 'Gugi', cursive;
        }
        
        h2 {
            font-family: 'NanumSquareRound', sans-serif;
            font-weight: 800;
        }
        
        h6 {
            font-family: 'NanumSquareRound', sans-serif;
            font-weight: 300;
            ;
        }
        
        #NSR {
            font-family: 'NanumSquareRound', sans-serif;
            font-size: 30px;
            font-weight: 800;
        }
        *{
          font-family: 'NanumSquareRound', sans-serif;
          font-weight: 300;
        }
    </style>
    
    <!-- @@@ 수정본 스타일 @@@-->
    <style>
        h1 {
            color: #D9E2F2;
        }
        
        .per {
            text-decoration-line: none;
            color: #201627;
            font-family: 'NanumSquareRound', sans-serif;
            font-size: 12pt;
        }
        .text-info1 {
            color: #DBAB34;
        }
    </style>
	
	<script type="text/javascript" src="<%=path %>/resources/js/simplebar.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resources/js/smooth-scroll.polyfills.min.js"></script>
    <script type="text/javascript" src="<%=path %>/resources/js/tiny-slider.js"></script>
    <script type="text/javascript" src="<%=path %>/resources/js/flatpickr.min.js"></script>
    
</head>
<!-- Body-->

<body>
    <!-- Page loading spinner-->
    <div class="page-loading active">
        <div class="page-loading-inner">
            <div class="page-spinner"></div><span>Loading...</span>
        </div>
    </div>
    <main class="page-wrapper">
    <!-- 로그인 안되어 있을 때 헤더 -->
        <!-- Sign In Modal-->
        <div class="modal fade" id="signin-modal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered p-2 my-0 mx-auto" style="max-width: 950px;">
                <div class="modal-content">
                    <div class="modal-body px-0 py-2 py-sm-0">
                        <button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal"></button>
                        <div class="row mx-0 align-items-center">
                            <div class="col-md-6 border-end-md p-4 p-sm-5">
                                <h2 class="h3 mb-4 mb-sm-5">Hey there!<br>Welcome back.</h2><img class="d-block mx-auto" src="<%=path %>/resources/etc/signin.svg" width="344" alt="Illustartion">
                                <div class="mt-4 mt-sm-5">계정이 없으신가요? <a href="#signup-modal" data-bs-toggle="modal" data-bs-dismiss="modal">회원가입</a></div>
                            </div>
                            <div class="col-md-6 px-4 pt-2 pb-4 px-sm-5 pb-sm-5 pt-md-5">
                            	<a style="width: 100%;height: 50px;margin-bottom: 15px;" href="javascript:void(0);" onclick="kakaoLogin();"><img src="<%=path %>/resources/images/kakao_login_medium_wide.png" style="margin-bottom:30px; width:370px;" /></a>
                                <div class="d-flex align-items-center py-3 mb-3">
                                    <hr class="w-100">
                                    <div class="px-3">Or</div>
                                    <hr class="w-100">
                                </div>
                                <form class="needs-validation" action="<%=path %>/login" method="POST" novalidate>
                                    <div class="mb-4">
                                        <label class="form-label mb-2" for="signin-email">아이디</label>
                                        <input class="form-control" type="text" name="userId" id="signin-id" placeholder="아이디를 입력해주세요." required>
                                    </div>
                                    <div class="mb-4">
                                        <div class="d-flex align-items-center justify-content-between mb-2">
                                            <label class="form-label mb-0" for="signin-password">비밀번호</label>
                                        </div>
                                        <div class="password-toggle">
                                            <input class="form-control" type="password" name="userPw" id="signin-password" placeholder="비밀번호를 입력해주세요" required>
                                            <label class="password-toggle-btn" aria-label="Show/hide password">
                          <input class="password-toggle-check" type="checkbox"><span class="password-toggle-indicator"></span>
                        </label>
                                        </div>
                                    </div>
                                    <input class="btn btn-primary btn-lg rounded-pill w-100" type="submit" value="로그인"></button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Sign Up Modal-->
        <div class="modal fade" id="signup-modal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered p-2 my-0 mx-auto" style="max-width: 950px;">
                <div class="modal-content">
                    <div class="modal-body px-0 py-2 py-sm-0">
                        <button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal"></button>
                        <div class="row mx-0 align-items-center">
                            <div class="col-md-6 border-end-md p-4 p-sm-5">
                                <h2 class="h3 mb-4 mb-sm-5">Join SCENE.<br>Catch a great show</h2>
                                <ul class="list-unstyled mb-4 mb-sm-5">
                                    <li class="d-flex mb-2"><i class="fi-check-circle text-primary mt-1 me-2"></i><span>다양한 공연을 만나보세요.</span></li>
                                    <li class="d-flex mb-2"><i class="fi-check-circle text-primary mt-1 me-2"></i><span>어느 곳에서나 예매가 가능합니다.</span></li>
                                    <li class="d-flex mb-0"><i class="fi-check-circle text-primary mt-1 me-2"></i><span>수많은 리뷰도 있습니다.</span></li>
                                </ul><img class="d-block mx-auto" src="<%=path %>/resources/etc/signup.svg" width="344" alt="Illustartion">
                                <div class="mt-sm-4 pt-md-3">이미 계정이 있으신가요? <a href="#signin-modal" data-bs-toggle="modal" data-bs-dismiss="modal">로그인</a></div>
                            </div>
                            <div class="col-md-6 px-4 pt-2 pb-4 px-sm-5 pb-sm-5 pt-md-5">
                                <form class="needs-validation" action="<%=path%>/user/enroll" method="POST" novalidate>
                                    <div class="mb-4">
                                        <label class="form-label" for="signup-name">이름</label>
                                        <input class="form-control" type="text" name="userName" id="userName" placeholder="이름을 입력해주세요" required>
                                    </div>
                                    <div class="mb-4">
                                        <label class="form-label" for="signup-name">전화번호</label>
                                        <input class="form-control" type="text" name="phone" id="phone" placeholder="ex)01012345678(-없이)" maxlength="11" required>
                                    </div>
                                    <div class="mb-4">
                                        <label class="form-label" for="signup-name">이메일</label>
                                        <input class="form-control" type="text" name="email" id="email" placeholder="abc@abc.com" required>
                                    </div>
                                    <div class="mb-4">
                                        <label class="form-label" for="signup-name">주소</label>
                                        <input class="form-control" type="text" name="addr" id="addr" placeholder="주소를 입력해주세요" required>
                                    </div>
                                    <div class="mb-4">
                                        <label class="form-label" for="signup-email">아이디</label>
                                        <input class="form-control" type="text" name="newId" id="newId" placeholder="4글자 이상." minlength="4" required>
                                    </div>
                                    <div class="mb-4">
                                        <label class="form-label" for="signup-password">비밀번호<span class='fs-sm text-muted'>  4글자 이상</span></label>
                                        <div class="password-toggle">
                                            <input class="form-control" type="password" name="userPw" id="userPw" minlength="4" required>
                                            <label class="password-toggle-btn" aria-label="Show/hide password">
                          <input class="password-toggle-check" type="checkbox"><span class="password-toggle-indicator"></span>
                        </label>
                                        </div>
                                    </div>
                                    <div class="mb-4">
                                        <label class="form-label" for="signup-password-confirm">비밀번호 확인</label>
                                        <div class="password-toggle">
                                            <input class="form-control" type="password" id="signup-password-confirm" minlength="4" required>
                                            <label class="password-toggle-btn" aria-label="Show/hide password">
                          <input class="password-toggle-check" type="checkbox"><span class="password-toggle-indicator"></span>
                        </label>
                                        </div>
                                    </div>
                                    <div class="form-check mb-4">
                                    </div>
                                    <button class="btn btn-primary btn-lg rounded-pill w-100" type="submit">회원가입</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- Navbar-->
        <header class="navbar navbar-expand-lg navbar-light bg-light fixed-top" data-scroll-header>
            <div class="container">
                <a class="navbar-brand me-3 me-xl-4" href="<%=path %>/"><img class="d-block" src="<%=path %>/resources/images/pjlogo.JPG" width="120" alt="SCENE"></a>
                <button class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
				<% if (loginUser == null) { %>
				<!-- 로그인 아닐 때 -->
                <a class="btn btn-sm text-primary d-none d-lg-block order-lg-3" href="#signin-modal" data-bs-toggle="modal"><i class="fi-user me-2"></i>로그인</a>
                <a class="btn btn-sm text-primary d-none d-lg-block order-lg-3" href="#signup-modal" data-bs-toggle="modal"><i class="fi-user me-2"></i>회원가입</a>
                <% } else {%>
               		 <% if (loginUser != null && loginUser.getRole().equals("ROLE_ADMIN")) { %>
                	 <button class="btn btn-sm text-primary d-none d-lg-block order-lg-3" onclick="location.href='<%=path %>/logout'" data-bs-toggle="modal"><i class="fi-user me-2"></i>로그아웃</button>
                	 <% } else if (loginUser != null && loginUser.getName().equals("ROLE_USER")) {%>
               		 <button class="btn btn-sm text-primary d none d-lg-block order-lg-3" onclick="location.href='<%=path %>/myInfo'" data-bs-toggle="modal"><i class="fi-user me-2"></i>마이페이지</button>
                	 <button class="btn btn-sm text-primary d-none d-lg-block order-lg-3" onclick="location.href='<%=path %>/logout'" data-bs-toggle="modal"><i class="fi-user me-2"></i>로그아웃</button>
                	 <% } else {%>
               		 <button class="btn btn-sm text-primary d none d-lg-block order-lg-3" onclick="location.href='<%=path %>/myInfo'" data-bs-toggle="modal"><i class="fi-user me-2"></i>마이페이지</button>
                	 <button class="btn btn-sm text-primary d-none d-lg-block order-lg-3" onclick="kakaoLogout();" data-bs-toggle="modal"><i class="fi-user me-2"></i>로그아웃</button>
                	<% } %>
                <% } %>
                <div class="collapse navbar-collapse order-lg-2 justify-content-center" id="navbarNav">
                    <ul class="navbar-nav navbar-nav-scroll" style="max-height: 35rem;">
                        <!-- Menu items-->
                        <li class="nav-item dropdown px-3 "><a class="nav-link dropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" id="NSR">공연</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="<%=path%>/showMain?category=연극&rad_date=1개월">연극</a></li>
                                <li><a class="dropdown-item" href="<%=path%>/showMain?category=뮤지컬&rad_date=1개월">뮤지컬</a></li>
                                <li><a class="dropdown-item" href="<%=path%>/showMain?category=무용&rad_date=1개월">무용</a></li>
                                <li><a class="dropdown-item" href="<%=path%>/showMain?category=복합&rad_date=1개월">복합</a></li>
                            </ul>
                        </li>
                        <li class="nav-item dropdown pe-1"><a class="nav-link dropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" id="NSR">음악</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="<%=path%>/musicMain?category=클래식&rad_date=1개월">클래식</a></li>
                                <li><a class="dropdown-item" href="<%=path%>/musicMain?category=국악&rad_date=1개월">국악</a></li>
                                <li><a class="dropdown-item" href="<%=path%>/musicMain?category=오페라&rad_date=1개월">오페라</a></li>
                            </ul>
                        </li>
                        <a class="nav-item pe-3"><a class="nav-link" href="<%=path%>/hallMain" role="button" aria-expanded="false" id="NSR">공연장</a></a>
                        <a class="nav-item pe-3"><a class="nav-link" href="<%=path%>/rankList" role="button" aria-expanded="false" id="NSR">랭킹</a></a>
                        <li class="nav-item dropdown ps-3"><a class="nav-link dropdown" href="<%=path %>/news?check=0" role="button" data-bs-toggle="dropdown" aria-expanded="false" id="NSR">게시판</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="<%=path%>/news?check=0">소식</a></li> <!-- check는 소식페이지는 파싱안하게 0으로 보냄 -->
                                <li><a class="dropdown-item" href="<%=path%>/board/list">자유</a></li>
                            </ul>
                        </li>
                        <li class="nav-item d-lg-none"><a class="nav-link" href="#signin-modal" data-bs-toggle="modal"><i class="fi-user me-2"></i>로그인</a></li>
                    </ul>
                </div>
            </div>
        </header>
        <!-- @@@@@@@@헤더끝@@@@@@@@@@@@@@@@@@@ -->

	</main>
