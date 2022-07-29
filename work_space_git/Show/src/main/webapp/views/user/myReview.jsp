<%@page import="vo.Review"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	User user = (User) session.getAttribute("loginUser"); 
	List<Review> revList = new ArrayList<>();
	if( request.getAttribute("revList") != null) {
	 	Object review = request.getAttribute("revList");
		if(review instanceof List<?>) {
			for(Object obj : (List<?>) review) {
				if (obj instanceof Review) {
					revList.add((Review) obj);
				}
			}
		}
	} else {
		revList = null;
	}
	request.setAttribute("revList", revList);
%>

<%@ include file="/views/common/header.jsp"%>


<main>
	<div class="position-absolute top-0 start-0 w-100 bg-dark" style="height: 398px;"></div>
	<div class="container content-overlay mt-5 mb-md-4 py-5">
		<!-- Breadcrumb-->
		<nav class="mb-3 mb-md-4 pt-md-3" aria-label="Breadcrumb">
			<ol class="breadcrumb breadcrumb-light">
				<li class="breadcrumb-item"><a href="<%=path%>/">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page"><a href="<%=path%>/myInfo">마이페이지</a></li>
			</ol>
		</nav>
		<!-- Page card like wrapper-->
		<div class="bg-light shadow-sm rounded-3 p-4 p-md-5 mb-2">
			<!-- Aci header-->
			<div
				class="d-flex align-items-start justify-content-between pb-4 mb-2">
				<div class="d-flex align-items-start">
					<div class="position-relative flex-shrink-0">
						<img class="rounded-circle" src="<%=path %>/resources/images/avatars.png" width="100" alt="Annette Black">
					</div>
					<div class="ps-3 ps-sm-4">
						<h3 class="h5"> &nbsp;&nbsp;&nbsp; <%=user.getName() %></h3>
						<ul class="list-unstyled fs-sm mb-0">
							<li class="d-flex text-nav text-break"><i class="fi-mail opacity-60 mt-1 me-2"></i><span><%= user.getEmail() %></span></li>
							<li class="d-flex text-nav text-break"><i class="fi-phone opacity-60 mt-1 me-2"></i><span><%= user.getPhone() %></span></li>
						</ul>
					</div>
				</div>
				<a class="nav-link p-0 d-none d-md-block" href="<%=path %>/logout"><i class="fi-logout mt-n1 me-2"></i>로그 아웃</a>
			</div>
			<!-- Aci menu-->
			<a
				class="btn btn-outline-primary btn-lg rounded-pill w-100 d-md-none"
				href="#aci-nav" data-bs-toggle="collapse"><i
				class="fi-align-justify me-2"></i>회원 정보</a>
			<div class="collapse d-md-block" id="aci-nav">
				<ul class="nav nav-pills flex-column flex-md-row pt-3 pt-md-0 pb-md-4 border-bottom-md">
              <li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link" onclick="location.href='<%=path %>/myInfo'"><i class="fi-settings mt-n1 me-2 fs-base"></i>나의 정보</a></li>
              <li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link active" onclick="location.href='<%=path %>/myReview'"  aria-current="page"><i class="fi-file mt-n1 me-2 fs-base"></i>나의 리뷰</a></li>
              <li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link" onclick="location.href='<%=path %>/myLike'"><i class="fi-heart mt-n1 me-2 fs-base"></i>나의 찜</a></li>
              <li class="nav-item mb-md-0"><a class="nav-link" onclick="location.href='<%=path %>/myTicketing'"><i class="fi-bell mt-n1 me-2 fs-base"></i>나의 예매내역</a></li>
              <li class="nav-item d-md-none"><a class="nav-link" href="<%=path%>/user/delete"><i class="fi-logout mt-n1 me-2 fs-base"></i>회원 탈퇴</a></li>
            </ul>
			</div>
			<div class="d-flex align-items-center justify-content-between py-4 mt-3 mb-2">
            <h1 class="h3 mb-0">나의 리뷰</h1>
            </div>
            <% if(revList == null) { %>
			<div class="row g-2 g-md-4""></div>
			<% } else { %>
			<div class="row g-2 g-md-4"">
			<% for (int i = 0; i < revList.size(); i++) { %>
            	<div class="col-md-6 col-lg-4">
              	<div class="card bg-secondary card-hover h-100">
                <div class="card-body">
                  <h3 class="h6 card-title mb-2">
                  	<a class="text-nav text-decoration-none" href="<%=path%>/show?showId=<%=revList.get(i).getShow_id()%>"><%=revList.get(i).getPrfnm() %></a>
                  	<input type="button" data-bs-toggle="tooltip" class="btn btn-icon btn-light text-primary rounded-circle shadow-sm" id="deleteRev" onclick="deleteRev(<%=revList.get(i).getRev_no()%>);" style="float:right;" value="삭제">
                  </h3>
                  <p class="fs-sm mb-0"><%=revList.get(i).getRev_content() %></p>
                </div>
                <div class="card-footer d-flex align-items-center justify-content-between border-0 pt-0">
                  <div class="fs-sm">
                  <span class="text-nowrap me-3"><i class="fi-cash fs-base text-muted me-1"></i><%=revList.get(i).getPrfpdfrom() %> ~ <%=revList.get(i).getPrfpdto() %></span></div>
                  <div class="d-flex align-items-end justify-content-between">
					<div class="dropdown position-relative zindex-10 mb-3"></div>
					<strong class="fs-sm"><%=revList.get(i).getRev_like() %> likes</strong>
				  </div>
                </div>
              </div>
            </div>
            <% } %>
            <% } %>
            <!-- Item-->
         </div>
       </div>
      </div>
 </main>
 
 <script type="text/javascript">
	function deleteRev(a) {
 		if(confirm("정말로 삭제하시겠습니까?!")) {
 			let val = a.toString();
			location.href="<%=path%>/deleteReview?revNo=" + val;
		}
	}
</script>

<%@ include file="/views/common/footer.jsp"%>