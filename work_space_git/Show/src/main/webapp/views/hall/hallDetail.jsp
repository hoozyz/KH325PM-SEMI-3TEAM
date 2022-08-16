<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.Hall"%>
<%@page import="vo.Show"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/views/common/headerConcertHall.jsp"%>
<%
	Hall hall = (Hall) request.getAttribute("hall");
	List<Hall> halList = new ArrayList<>();
	
	List<Show> showList = new ArrayList<>();
	showList = (List<Show>) request.getAttribute("showList");
	
	
	int count = 7;
%>

<section class="container mt-5 mb-4 pt-5">
	<!-- Breadcrumb-->
	<div class="row gy-9 pt-lg-1">
		<div class="col-lg-7 p-3">
			<section class="">
				<div class="row g-2 g-md-3" style="min-width: 60rem;">
					<div class="col-9">
						<a class="gallery-item rounded rounded-md-3"><img
							src="resources/images/concert-hall/000007.jpg"></a>
					</div>
					<div class="col-12">
						<div class="row">
							<div class="col-3">
								<a class="gallery-item rounded-1 rounded-md-2"><img
									src="resources/images/concert-hall/001.jpg"></a>
							</div>
							<div class="col-3">
								<a class="gallery-item rounded-1 rounded-md-2"><img
									src="resources/images/concert-hall/002.jpg"></a>
							</div>
							<div class="col-3">
								<a class="gallery-item rounded-1 rounded-md-2"><img
									src="resources/images/concert-hall/003.jpg"></a>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>

		<div class="col-lg-5">
			<div class="card mb-4 p-2 shadow-sm">
				<div class="card-body">
					<!-- Place info-->
					<div class="d-flex align-items-start mb-3 pb-2 border-bottom">
						<img src="resources/images/concert-hall/concertHallDetailLogo.png"
							width="60" alt="Thumbnail">
								<% if (hall.getFcltynm().length() < 9 ) { %>
						<div class="detailFont" style="width: 600px;"><%=hall.getFcltynm()%></div>
						<% } else { %>
						<div class="detailFont-m" style="width: 600px; height: 150px;"><%=hall.getFcltynm()%></div>	
						<% } %>
						
					</div>
					<!-- Place contacts-->
					<div class="mb-1 pb-4 border-bottom">
						<h4 class="h5 mb-2">Contacts:</h4>
						<ul class="nav flex-column">
							<li class="nav-item mb-2"><a
								class="nav-link p-0 fw-normal d-flex align-items-start"><i
									class="fi-map-pin mt-1 me-2 align-middle opacity-70"></i>
									<%=hall.getAdres()%>&nbsp;&nbsp; </a></li>
							<li class="nav-item mb-2"><a
								class="nav-link d-inline-block p-0 fw-normal d-inline-flex align-items-start">
									<i class="fi-phone mt-1 me-2 align-middle opacity-70"></i><%=hall.getTelno()%>
									&nbsp;&nbsp;
							</a></li>
							<li class="nav-item mb-2"><a
								class="nav-link p-0 fw-normal d-flex align-items-start"
								href="<%=hall.getRelateurl()%>"><i
									class="fi-globe mt-1 me-2 align-middle opacity-60"></i><%=hall.getRelateurl()%>
									&nbsp;&nbsp;</a></li>
						</ul>
					</div>
				</div>
				
				<!--Map-->
				<div id="map" style="width: 500px; height: 250px;"></div>
				<script type="text/javascript"
					src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=1c1e51b427ea6bc49c8cd6877c234c7f"></script>
				<script>
					var infowindow = new kakao.maps.InfoWindow({
						zIndex : 1
					});

					var mapContainer = document.getElementById('map'), // 
					mapOption = {
						center : new kakao.maps.LatLng(
				<%=hall.getLa()%>
					,
				<%=hall.getLo()%>
					),
						level : 3
					};

					var map = new kakao.maps.Map(mapContainer, mapOption);

					
					var imageSrc = document.getElementById("mark").src,   
				    imageSize = new kakao.maps.Size(64, 69), 
				    imageOption = {offset: new kakao.maps.Point(27, 69)}; 
					
					
					
				    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
				    markerPosition = new kakao.maps.LatLng(<%=hall.getLa()%>, <%=hall.getLo()%>); // 마커가 표시될 위치입니다

                     // 마커를 생성합니다
                   
					var marker = new kakao.maps.Marker({
						position : markerPosition,
						image : markerImage // 마커이미지 설정 
					});

					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);
				</script>
			</div>
		</div>
		</aside>
	</div>
</section>
<section class="container mb-5 pb-2 pt-4 pb-lg-4">
	<h2 class="pt-2">전체 공연</h2>
	<div class="row">
		<div class="pb-2 mt-2">
			<!-- Item-->
			<% if (showList != null) { %>
			<% if (showList.size() < count) { %>
			<% count = showList.size(); %>
			<% } %>
			<% for (int i = 0; i < count; i++) { %>
			<article
				class="card border-0 shadow-sm card-hover card-horizontal mb-4">
				<a class="card-img-top"
					style="background-image: url(<%=showList.get(i).getPoster()%>);">

					<span
					style="background-image:  url(<%=showList.get(i).getPoster()%>);  	
					width: 450px; heigth: 700px; background-size: cover; background-position: center;"></span>
				</a>

				<div class="card-body">
					<a class="fs-xs text-uppercase text-decoration-none"
						href="<%=path%>/showDetail?showId=<%=showList.get(i).getShow_id()%>"></a>
					<h5>
						<a class="nav-link"
							href="<%=path%>/showDetail?showId=<%=showList.get(i).getShow_id()%>"><%=showList.get(i).getPrfnm() %></a>
					</h5>
					<p class="fs-sm text-muted">
					<div class=PrfcastFont>
						출연진 :
						<%=showList.get(i).getPrfcast() %>
					</div>
					</p>
					<br>
					<div class=daystFont>
						기간:&ensp;
						<%=showList.get(i).getPrfpdfrom() %>
						~
						<%=showList.get(i).getPrfpdto()%>
					</div>
				</div>
			</article>
			<% } %>
			<% } %>
		</div>
	</div>
</section>


<%@include file="/views/common/footer.jsp"%>