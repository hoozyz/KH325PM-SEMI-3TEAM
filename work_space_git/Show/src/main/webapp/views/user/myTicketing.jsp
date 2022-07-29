<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.Ticketing"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	User user = (User) session.getAttribute("loginUser"); 
	List<Ticketing> ticList = new ArrayList<>();
	if( request.getAttribute("ticList") != null) {
	 	Object tic = request.getAttribute("ticList");
		if(tic instanceof ArrayList<?>) {
			for(Object obj : (ArrayList<?>) tic) {
				if (obj instanceof Ticketing) {
					ticList.add((Ticketing) obj);
				}
			}
		}
	} else {
		ticList = null;
	}
	request.setAttribute("ticList", ticList);
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
              <li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link" onclick="location.href='<%=path %>/myReview'"><i class="fi-file mt-n1 me-2 fs-base"></i>나의 리뷰</a></li>
              <li class="nav-item mb-md-0 me-md-2 pe-md-1"><a class="nav-link" onclick="location.href='<%=path %>/myLike'"><i class="fi-heart mt-n1 me-2 fs-base"></i>나의 찜</a></li>
              <li class="nav-item mb-md-0"><a class="nav-link  active" onclick="location.href='<%=path %>/myTicketing'"  aria-current="page"><i class="fi-bell mt-n1 me-2 fs-base"></i>나의 예매내역</a></li>
              <li class="nav-item d-md-none"><a class="nav-link" href="<%=path%>/user/delete"><i class="fi-logout mt-n1 me-2 fs-base"></i>회원 탈퇴</a></li>
            </ul>
			</div>
			<div class="d-flex align-items-center justify-content-between py-4 mt-3 mb-2">
            <h1 class="h3 mb-0">나의 예매내역</h1><a class="fw-bold text-decoration-none" href="#"></a>
            </div>
            <%if(ticList == null) { %>
			<div class="row g-2 g-md-4"></div>
			<% } else { %>
			<div class="row g-2 g-md-4">
			<% for (int i = 0; i < ticList.size(); i++) { %>
            	<div class="col-md-6 col-lg-4">
              	<div class="card bg-secondary card-hover h-100">
                <div class="card-body">
                   <div class="d-flex align-items-center mb-3">
                   <span class="fs-sm text-dark opacity-80 px-1"><%=ticList.get(i).getTic_no() %></span>
                   <span class="badge bg-faded-info rounded-pill fs-sm ms-auto"><%=ticList.get(i).getView_time() %></span></div>
                  <h3 class="h6 card-title mb-2">
                  <a class="text-nav text-decoration-none" href="<%=path%>/show?showId=<%=ticList.get(i).getShow_id()%>"><%=ticList.get(i).getPrfnm() %></a>
                  <input type="button" data-bs-toggle="tooltip" class="btn btn-icon btn-light text-primary rounded-circle shadow-sm " onclick="deleteTicketing(<%=ticList.get(i	).getTic_no()%>);" style="float:right;" value="삭제">
                  </h3>
                  <p class="fs-sm mb-0">관람일 : <%=ticList.get(i).getTicket_viewdate() %> <br><br>
                  						예매일 : <%=ticList.get(i).getTicket_date() %> </p>
                </div>
                <div class="card-footer d-flex align-items-center justify-content-between border-0 pt-0">
                  <div class="fs-sm"> <div class="fs-sm"><span class="text-nowrap me-3"><i class="fi-map-pin text-muted me-1"> </i><%=ticList.get(i).getFcltynm() %></span>
                  <span class="text-nowrap me-3"><i class="fi-cash fs-base text-muted me-1"></i>인원 : <%=ticList.get(i).getCount() %>명 &nbsp;&nbsp;&nbsp;&nbsp; 가격 : <%=ticList.get(i).getPrice() %>원</span></div>
                  <span></span></div>
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
	function deleteTicketing(a) {
 		if(confirm("정말로 삭제하시겠습니까?!")) {
 			let val = a.toString();
			location.href="<%=path%>/deleteTicketing?ticNo=" + val;
		}
	}
</script>


<%@ include file="/views/common/footer.jsp"%>