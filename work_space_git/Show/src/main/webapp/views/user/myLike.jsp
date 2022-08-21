<%@page import="vo.Like"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	User user = (User) session.getAttribute("loginUser"); 
	List<Like> likeList = new ArrayList<>();
	if( request.getAttribute("likeList") != null) {
	 	Object like = request.getAttribute("likeList");
		if(like instanceof ArrayList<?>) {
			for(Object obj : (ArrayList<?>) like) {
				if (obj instanceof Like) {
					likeList.add((Like) obj);
				}
			}
		}
	} else {
		likeList = null;
	}
	request.setAttribute("likeList", likeList);
%>

<%@ include file="/views/common/header.jsp"%>
<style>
		.text-nowrap{
			font-weight:300;
		
		}		
		a:hover{
			color:#AB69DD;
		}
	

</style>
<main>
	<div class="position-absolute top-0 start-0 w-100 bg-dark"
		style="height: 398px;"></div>
	<div class="container content-overlay mb-md-4 py-5" style="margin-top:100px;">
		<nav class="mb-3 mb-md-4 pt-md-3" aria-label="Breadcrumb">
			<ol class="breadcrumb breadcrumb-light">
				<li class="breadcrumb-item"><a href="<%=path%>/">Home</a></li>
				<li class="breadcrumb-item active" aria-current="page"><a href="<%=path%>/myInfo">마이페이지</a></li>
			</ol>
		</nav>
		<!-- Page card like wrapper-->
		<div class="bg-light shadow-sm rounded-3 p-4 p-md-5 mb-2" style="min-height: 1000px;">
			<!-- Account header-->
			<div class="d-flex align-items-start justify-content-between pb-4 mb-2">
				<div class="d-flex align-items-start">
					<div class="position-relative flex-shrink-0">
						<img class="rounded-circle" src="<%=path %>/resources/images/avatar.png" width="100" alt="Annette Black">
					</div>
					<div class="ps-3 ps-sm-4">
						<h3 class="h5"> &nbsp;&nbsp;&nbsp;<%=user.getName() %></h3>
						<ul class="list-unstyled fs-sm mb-0">
							<li class="d-flex text-nav text-break"><i class="fi-mail opacity-60 mt-1 me-2"></i><span><%= user.getEmail() %></span></li>
							<li class="d-flex text-nav text-break"><i class="fi-phone opacity-60 mt-1 me-2"></i><span><%= user.getPhone() %></span></li>
						</ul>
					</div>
				</div>
				<a class="nav-link p-0 d-none d-md-block" href="<%=path %>/logout" style="cursor:pointer;" ><i class="fi-logout mt-n1 me-2"></i>로그 아웃</a>
			</div>
			<a class="btn btn-outline-primary btn-lg rounded-pill w-100 d-md-none" href="#account-nav" data-bs-toggle="collapse"><i class="fi-align-justify me-2"></i>회원 정보</a>
			<div class="collapse d-md-block" id="account-nav">
				<ul class="nav nav-pills flex-column flex-md-row pt-3 pt-md-0 pb-md-4 border-bottom-md">
              <li class="nav-item mb-md-0 me-md-2 pe-md-1" style="cursor:pointer; " ><a class="nav-link" onclick="location.href='<%=path %>/myInfo'"><i class="fi-info-circle mt-n1 me-2 fs-base"></i>나의 정보</a></li>
              <li class="nav-item mb-md-0 me-md-2 pe-md-1" style="cursor:pointer; " ><a class="nav-link" onclick="location.href='<%=path %>/myReview'"><i class="fi-file mt-n1 me-2 fs-base"></i>나의 리뷰</a></li>
              <li class="nav-item mb-md-0 me-md-2 pe-md-1" style="cursor:pointer; " ><a class="nav-link active" style="color:#AB69DD;" onclick="location.href='<%=path %>/myLike'" aria-current="page"><i class="fi-heart mt-n1 me-2 fs-base"></i>나의 찜</a></li>
              <li class="nav-item mb-md-0" style="cursor:pointer; " ><a class="nav-link" onclick="location.href='<%=path %>/myTicketing'"><i class="fi-cart mt-n1 me-2 fs-base"></i>나의 예매내역</a></li>
              <li class="nav-item d-md-none"><a class="nav-link" href="<%=path%>/user/delete" ><i class="fi-logout mt-n1 me-2 fs-base"></i>회원 탈퇴</a></li>
            </ul>
			</div>
			<!-- Page title-->
			<div class="d-flex align-items-center justify-content-between py-4 mt-3 mb-2">
				<h1 class="h3 mb-0">나의 찜</h1>
				<a class="fw-bold text-decoration-none" href="#"></a>
			</div>
			<div class="row">
				<!-- List of resumes-->
				<% if(likeList.isEmpty()) { %>
				<div class="col-md-3 mb-4 pb-3 pb-md-0">
					<div style="max-width: 13rem;">
						<ul class="list-unstyled fs-sm pb-1 pb-md-3">
							<li><a class="nav-link fw-normal d-flex align-items-center px-0 py-1" href="#"><i class="fi-file opacity-70 me-2"></i> <span style="font-size:18px">찜 개수</span><span style="font-size:18px" class="text ms-auto">0 개</span></a></li>
							</ul>
					</div>
				</div>
				<div class="col-md-9"></div>
				<% } else { %>
				<div class="col-md-3 mb-4 pb-3 pb-md-0">
					<div style="max-width: 13rem;">
						<ul class="list-unstyled fs-sm pb-1 pb-md-3">
							<li><a class="nav-link fw-normal d-flex align-items-center px-0 py-1" href="#"><i class="fi-file opacity-70 me-2"></i> <span style="font-size:18px">찜 개수</span><span style="font-size:18px;"  class="text ms-auto"><%=likeList.size() %>개</span></a></li>
							</ul>
					</div>
				</div>
				<div class="col-md-9">
					<% for(int i = 1; i <= likeList.size(); i++) { %>
					<% if(i % 2 == 1) { // 홀수번째 (왼쪽)%>
					<div class="card bg-secondary card-hover mb-2" style="width: 430px; float: left; margin-right: 20px;">
						<div class="card-body">
							<div class="d-flex justify-content-between">
								<div class="d-flex align-items-start">
									<img class="d-none d-sm-block" src="<%=likeList.get(i-1).getPoster()%>" width="100">
									<div class="ps-sm-3">
										<h3 class="h6 card-title pb-1 mb-2">
											<a class="text-nav text-decoration-none fw-bold" href="<%=path%>/showDetail?showId=<%=likeList.get(i-1).getShow_id()%>"><%=likeList.get(i-1).getPrfnm()%></a>
										</h3>
										<div class="fs-sm">
											<div class="text-nowrap mb-2">
												<i class="fi-map-pin text-muted me-1"> </i><%=likeList.get(i-1).getFcltynm() %></div>
											<div class="text-nowrap">
												<i class="fi-cash fs-base text-muted me-1"></i><%=likeList.get(i-1).getLike_date() %></div>
										</div>
									</div>
								</div>
								<input type="button" data-bs-toggle="tooltip" class="btn btn-icon btn-light text-primary rounded-circle shadow-sm " onclick="deleteLike(<%=likeList.get(i-1).getLike_no()%>);" style="float:right;" value="삭제">
							</div>
						</div>
					</div>
					<% } else { %>
					<div class="card bg-secondary card-hover mb-2" style="width: 430px; float: left;">
						<div class="card-body">
							<div class="d-flex justify-content-between">
								<div class="d-flex align-items-start">
									<img class="d-none d-sm-block" src="<%=likeList.get(i-1).getPoster()%>" width="100">
									<div class="ps-sm-3">
										<h3 class="h6 card-title pb-1 mb-2">
											<a class="stretched-link text-nav text-decoration-none fw-bold" href="<%=path%>/showDetail?showId=<%=likeList.get(i-1).getShow_id()%>"><%=likeList.get(i-1).getPrfnm()%></a>
										</h3>
										<div class="fs-sm">
											<div class="text-nowrap mb-2">
												<i class="fi-map-pin text-muted me-1"> </i><%=likeList.get(i-1).getFcltynm() %></div>
											<div class="text-nowrap">
												<i class="fi-cash fs-base text-muted me-1"></i><%=likeList.get(i-1).getLike_date() %></div>
										</div>
									</div>
								</div>
								<input type="button" data-bs-toggle="tooltip" class="btn btn-icon btn-light text-primary rounded-circle shadow-sm " onclick="deleteLike(<%=likeList.get(i-1).getLike_no()%>);" style="float:right;" value="삭제">
							</div>
						</div>
					</div>
					<% } %>
					<% } %>
				</div>
					<% } %>
			</div>
		</div>
	</div>
</main>

 <script type="text/javascript">
	function deleteLike(a) {
 		if(confirm("정말로 삭제하시겠습니까?!")) {
 			let val = a.toString();
			location.href="<%=path%>/deleteLike?likeNo=" + val;
		}
	}
</script>


<%@ include file="/views/common/footer.jsp"%>