<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<%
	User user = (User) session.getAttribute("loginUser");
%>

	<main>
	<div class="position-absolute top-0 start-0 w-100 bg-dark" style="height: 398px;"></div>
      <div class="container content-overlay mb-md-4 py-5" style="margin-top:100px;">
        <!-- Breadcrumb-->
        <nav class="mb-3 mb-md-4 pt-md-3" aria-label="Breadcrumb">
          <ol class="breadcrumb breadcrumb-light">
            <li class="breadcrumb-item"><a href="<%=path%>/">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page"><a href="<%=path%>/myInfo">마이페이지</a></li>
          </ol>
        </nav>
        <!-- Page card like wrapper-->
        <div class="bg-light shadow-sm rounded-3 p-4 p-md-5 mb-2">
          <!-- Account header-->
          <div class="d-flex align-items-start justify-content-between pb-4 mb-2">
            <div class="d-flex align-items-start">
            	<div class="position-relative flex-shrink-0"><img class="rounded-circle" src="<%=path %>/resources/images/avatar.png" width="100" alt="Annette Black">
              </div>
              <div class="ps-3 ps-sm-4">
                <h3 class="h5"><%=user.getName() %></h3>
                <ul class="list-unstyled fs-sm mb-0">
                  <li class="d-flex text-nav text-break"><i class="fi-mail opacity-60 mt-1 me-2"></i><span><%= user.getEmail() %></span></li>
                  <li class="d-flex text-nav text-break"><i class="fi-phone opacity-60 mt-1 me-2"></i><span><%= user.getPhone() %></span></li>
                </ul>
              </div>
            </div><a class="nav-link p-0 d-none d-md-block" onclick="location.href='<%=path %>/logout'" style="cursor:pointer; " ><i class="fi-logout mt-n1 me-2"></i>로그 아웃</a>
          </div>
          <!-- Account menu-->
          <a class="btn btn-outline-primary btn-lg rounded-pill w-100 d-md-none" href="#account-nav" data-bs-toggle="collapse"><i class="fi-align-justify me-2"></i>회원 정보</a>
          <div class="collapse d-md-block" id="account-nav">
            <ul class="nav nav-pills flex-column flex-md-row pt-3 pt-md-0 pb-md-4 border-bottom-md">
              <li class="nav-item mb-md-0 me-md-2 pe-md-1" style="cursor:pointer; " ><a class="nav-link active" style="color:#AB69DD;" onclick="location.href='<%=path %>/myInfo'" aria-current="page"><i class="fi-info-circle mt-n1 me-2 fs-base"></i>나의 정보</a></li>
              <li class="nav-item mb-md-0 me-md-2 pe-md-1" style="cursor:pointer; " ><a class="nav-link" onclick="location.href='<%=path %>/myReview'"><i class="fi-file mt-n1 me-2 fs-base"></i>나의 리뷰</a></li>
              <li class="nav-item mb-md-0 me-md-2 pe-md-1" style="cursor:pointer; " ><a class="nav-link" onclick="location.href='<%=path %>/myLike'"><i class="fi-heart mt-n1 me-2 fs-base"></i>나의 찜</a></li>
              <li class="nav-item mb-md-0" style="cursor:pointer; " ><a class="nav-link" onclick="location.href='<%=path %>/myTicketing'"><i class="fi-cart mt-n1 me-2 fs-base"></i>나의 예매내역</a></li>
              <li class="nav-item d-md-none"><a class="nav-link" href="<%=path%>/user/delete" ><i class="fi-logout mt-n1 me-2 fs-base"></i>회원 탈퇴</a></li>
            </ul>
          </div>
          <!-- Authorization info-->
          <form name="updateForm" action="<%=path%>/user/update" method="POST">
          	<div class="row pt-4 mt-3">
                <div class="col-lg-3">
                    <h2 class="h4">로그인 정보</h2>
                </div>
                <div class="col-lg-9">
                    <div class="border rounded-3 p-3" id="auth-info">
                        <!-- Email-->
                        <div class="border-bottom pb-3 mb-3">
                            <div class="d-flex align-items-center justify-content-between">
                                <div class="pe-2">
                                    <label class="form-label fw-bold">아이디</label>
                                    <div id="id-value">
                                        <%=user.getUser_id() %>
                                    </div>
                                </div>
                                <div class="me-n3" data-bs-toggle="tooltip" title="Edit"><a class="nav-link py-0" href="#id-collapse" data-bs-toggle="collapse"><i class="fi-edit"></i></a></div>
                            </div>
                            <div class="collapse" id="id-collapse" data-bs-parent="#auth-info">
                                <input class="form-control mt-3" type="text" data-bs-binded-element="#userId" data-bs-unset-value="Not specified" placeholder="아이디는 변경할 수 없습니다." readonly>
                            </div>
                        </div>
                        <!-- Password-->
                        <div>
                            <div class="d-flex align-items-center justify-content-between">
                                <div class="pe-2">
                                    <label class="form-label fw-bold">비밀번호</label>
                                    <div>****</div>
                                </div>
                                <div class="me-n3" data-bs-toggle="tooltip" title="Edit"><a class="nav-link py-0" href="#password-collapse" data-bs-toggle="collapse"><i class="fi-edit"></i></a></div>
                            </div>
                            <div class="collapse" id="password-collapse" data-bs-parent="#auth-info">
                                <div class="row gx-3 align-items-center my-3">
                                    <label class="col-sm-4 col-md-3 col-form-label" for="account-password-current">현재 비밀번호 :</label>
                                    <div class="col-sm-8 col-md-9">
                                        <div class="password-toggle">
                                            <input class="form-control" type="password" id="pass" placeholder="현재 비밀번호 입력해주세요.">
                                            <label class="password-toggle-btn" aria-label="Show/hide password">
                            <input class="password-toggle-check" type="checkbox"><span class="password-toggle-indicator"></span>
                          </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row gx-3 align-items-center my-3">
                                    <label class="col-sm-4 col-md-3 col-form-label" for="account-password-new">변경하실 비밀번호:</label>
                                    <div class="col-sm-8 col-md-9">
                                        <div class="password-toggle">
                                            <input class="form-control" name="userPw" type="password" id="pass1" placeholder="변경하실 비밀번호를 입력해주세요.">
                                            <label class="password-toggle-btn" aria-label="Show/hide password">
                            <input class="password-toggle-check" type="checkbox"><span class="password-toggle-indicator"></span>
                          </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row gx-3 align-items-center">
                                    <label class="col-sm-4 col-md-3 col-form-label" for="account-password-confirm">변경하실 비밀번호 확인:</label>
                                    <div class="col-sm-8 col-md-9">
                                        <div class="password-toggle">
                                            <input class="form-control" type="password" id="pass2" placeholder="변경하실 비밀번호를 다시 입력해주세요.">
                                            <label class="password-toggle-btn" aria-label="Show/hide password">
                            <input class="password-toggle-check" type="checkbox"><span class="password-toggle-indicator"></span>
                          </label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Personal details-->
            <div class="row pt-4 mt-2">
                <div class="col-lg-3">
                    <h2 class="h4">개인정보</h2>
                </div>
                <div class="col-lg-9">
                    <div class="border rounded-3 p-3" id="personal-details">
                        <!-- Full name-->
                        <div class="border-bottom pb-3 mb-3">
                            <div class="d-flex align-items-center justify-content-between">
                                <div class="pe-2">
                                    <label class="form-label fw-bold">이름</label>
                                    <div id="fn-value">
                                        <%=user.getName() %>
                                    </div>
                                </div>
                                <div class="me-n3" data-bs-toggle="tooltip" title="Edit"><a class="nav-link py-0" href="#fn-collapse" data-bs-toggle="collapse"><i class="fi-edit"></i></a></div>
                            </div>
                            <div class="collapse" id="fn-collapse" data-bs-parent="#personal-details">
                                <input class="form-control mt-3" name="userName" type="text" data-bs-binded-element="#fn-value" data-bs-unset-value="Not specified" placeholder="변경하실 이름을 입력하세요." >
                            </div>
                        </div>
                        <!-- Email-->
                        <div class="border-bottom pb-3 mb-3">
                            <div class="d-flex align-items-center justify-content-between">
                                <div class="pe-2">
                                    <label class="form-label fw-bold">이메일</label>
                                    <div id="email-value">
                                        <%=user.getEmail() %>
                                    </div>
                                </div>
                                <div class="me-n3" data-bs-toggle="tooltip" title="Edit"><a class="nav-link py-0" href="#email-collapse" data-bs-toggle="collapse"><i class="fi-edit"></i></a></div>
                            </div>
                            <div class="collapse" id="email-collapse" data-bs-parent="#personal-details">
                                <input class="form-control mt-3" name="email" type="email" data-bs-binded-element="#email-value" data-bs-unset-value="Not specified" placeholder="변경하실 이메일을 입력하세요." >
                            </div>
                        </div>
                        <!-- Phone number-->
                        <div class="border-bottom pb-3 mb-3">
                            <div class="d-flex align-items-center justify-content-between">
                                <div class="pe-2">
                                    <label class="form-label fw-bold">전화번호</label>
                                    <div id="phone-value">
                                        <%=user.getPhone() %>
                                    </div>
                                </div>
                                <div class="me-n3" data-bs-toggle="tooltip" title="Edit"><a class="nav-link py-0" href="#phone-collapse" data-bs-toggle="collapse"><i class="fi-edit"></i></a></div>
                            </div>
                            <div class="collapse" id="phone-collapse" data-bs-parent="#personal-details">
                                <input class="form-control mt-3" name="phone" type="text" data-bs-binded-element="#phone-value" data-bs-unset-value="Not specified" placeholder="변경하실 전화번호를 입력하세요.">
                            </div>
                        </div>
                        <!-- Address-->
                        <div class="border-bottom pb-3 mb-3">
                            <div class="d-flex align-items-center justify-content-between">
                                <div class="pe-2">
                                    <label class="form-label fw-bold">주소</label>
                                    <div id="address-value">
                                        <%=user.getAddr() %>
                                    </div>
                                </div>
                                <div class="me-n3" data-bs-toggle="tooltip" title="Edit"><a class="nav-link py-0" href="#address-collapse" data-bs-toggle="collapse"><i class="fi-edit"></i></a></div>
                            </div>
                            <div class="collapse" id="address-collapse" data-bs-parent="#personal-details">
                                <input class="form-control mt-3" name="addr" type="text" data-bs-binded-element="#address-value" data-bs-unset-value="Not specified" placeholder="변경하실 주소를 입력하세요.">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Action buttons-->
            <div class="row pt-4 mt-2">
                <div class="col-lg-9 offset-lg-3">
                    <div class="d-flex align-items-center justify-content-between">
                        <input class="btn rounded-pill px-3 px-sm-4" style="color: #D9E2F2;background-color:#201627;"type="submit" id="updateUser" value="정보 변경">
                        <input class="btn btn-link btn-sm px-0" type="button" id="deleteUser" value="회원 탈퇴">
                    </div>
                </div>
            </div>
          </form>
        </div>
      </div>
    </main>
    
	 <script>
	 $(document).ready(() => {
		$("#deleteUser").on("click", (e) => {
			if(confirm("정말로 탈퇴하시겠습니까?!")) {
				location.replace('<%=path%>/user/delete');
			}
		});
		
		$("#updateUser").on("click", (e) => {
			let pass = $("#pass").val();
			let pass1 = $("#pass1").val();			
			let pass2 = $("#pass2").val();
			
			if(pass == "") {
				return true;
			}
			
			if(<%=user.getPw()%> != pass) {
				alert("현재 비밀번호가 일치하지 않습니다.");
				$("#pass").val("");
				$("#pass").focus();
				
				return false;
			}
			
			if(pass1.trim() != pass2.trim()) {
				alert("변경하실 비밀번호가 일치하지 않습니다.");
				
				$("#pass1").val("");
				$("#pass2").val("");
				$("#pass1").focus();
				
				return false;
			} 	
		});
		
	});
	 
	</script>
	
	<%@ include file="/views/common/footer.jsp"%>
