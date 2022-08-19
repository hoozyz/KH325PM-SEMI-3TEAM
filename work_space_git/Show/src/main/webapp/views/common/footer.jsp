<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <style>
   footer{
    font-family: 'NanumSquareRound', sans-serif;
   }
   
   </style>
 
   <!-- Footer 푸터 시작@@@@@@@@@@@@@@@@@@@@@@@@-->
   <!-- Footer-->
   <!-- Footer-->
    <footer class="footer pt-3 text-light" style="background-color: #201627;">
        <div class="container mb-4 py-4 pb-lg-5">
            <div class="row ">
                <div class="col-4">
                    <a class="d-inline-block" href="#"><img src="<%=request.getContextPath() %>/resources/images/footer/footerImg.png" width="300" alt="Logo"></a>
                    <div class="nav-link-light" style="font-size:20px; margin-right:80px;">공연 통합 검색 플랫폼 SCENE에 오신 것을 환영합니다</div>
                </div>
                <!-- Links-->
                <div class="col-2">
                    <h3 class="fs-base text-light">MEMBER</h3>
                    <ul class="list-unstyled fs-sm">
                        <li class="nav-link-light"> 김상현</li>
                        <li class="nav-link-light"> 김영후</li>
                        <li class="nav-link-light"> 김현민</li>
                        <li class="nav-link-light"> 우순탁</li>
                        <li class="nav-link-light"> 이정우</li>
                        <li class="nav-link-light"> 정세은</li>
                        <li class="nav-link-light"> 정우성</li>
                    </ul>
                </div>
                <!-- Links-->
                <div class="col-lg-2">
                    <h3 class="fs-base text-light">INSTITUTION</h3>
                    <ul class="list-unstyled fs-sm">
                        <li class="nav-link-light"> KH 정보교육원</li>
                        <li class="nav-link-light"> Call 1544-9970</li>
                        <li class="nav-link-light"> www.iei.or.kr</li>
                    </ul>
                </div>
                <!-- Subscription form-->
                <div class="col-4">
                    <h3 class="h4 text-light">OPEN API</h3>
                    <img src="<%=request.getContextPath() %>/resources/images/footer/kopis.png" width="100" alt="Logo">
                    <img src="<%=request.getContextPath() %>/resources/images/footer/naver.png" width="100" alt="Logo">
                    <img src="<%=request.getContextPath() %>/resources/images/footer/kakao.png" width="100" alt="Logo">
                </div>
            </div>
        </div>
    </footer>
    <!-- @@@@@@@@@@@@@@@@@@@@@@@@푸터 끝@@@@@@@@@@@@@@@ -->


    <!-- Back to top button-->
    <a class="btn-scroll-top" href="#top" data-scroll><span class="btn-scroll-top-tooltip text-muted fs-sm me-2">Top</span><i class="btn-scroll-top-icon fi-chevron-up">   </i></a>
    <!-- Vendor scrits: js libraries and plugins-->
    
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    
<script>
Kakao.init('8cddaf5bb7b88f487cf47627b52b649b'); //발급받은 키 중 javascript키를 사용해준다.
Kakao.isInitialized();
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
       	Kakao.Auth.setAccessToken(response.access_token);
       	console.log(Kakao.Auth.getAccessToken())
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  var id = response.id;
        	  
        	  $.ajax({
        		  url: "<%=request.getContextPath()%>/kakao",
       			  type: "POST",
       			  dataType: "text",
       			  data: { "userId" : id },
       			  progress: true,
                	  
                  success: function(user) {
                	  location.href= "http://localhost/Show/";
                  }
        	  })
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
  
//카카오로그아웃  
function kakaoLogout() {
     Kakao.API.request({
     url: '/v1/user/unlink',
     success: function (response) {
    	 $.ajax({
   		  url: "<%=request.getContextPath()%>/logout",
  			  type: "POST",
  			  dataType: "text",
  			  progress: true,
           	  
             success: function(user) {
             }
   	  	})
      	location.href= "http://localhost/Show/";
       },
       fail: function (error) {
         console.log(error)
       },
     })
  }  
</script>
    
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/bootstrap.bundle.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/simplebar.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/smooth-scroll.polyfills.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/tiny-slider.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/flatpickr.min.js"></script>

    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/theme.min.js"></script>
</body>

