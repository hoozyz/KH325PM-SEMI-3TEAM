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

<section class="container mt-5 mb-5 pt-5" style="color:#201627;">
	<!-- Breadcrumb-->
	<div class="my-2" style="font-family: 'NanumSquareRound', sans-serif; font-size:45pt; font-weight:800;">
	<<%=hall.getFcltynm()%>>
	</div>
	<div class="row gy-9 pt-lg-1">
		<div class="col-lg-7">
			<section class="">
				<div class="row g-2 g-md-1" style="min-width: 60rem;">
					<div class="col-9">
						<a class="gallery-item rounded-md-2" style="border:none;"><img
							src="resources/images/concert-hall/gangdong2.jpg"></a>
					</div>
					<div class="col-12" style="margin-top: 8px;">
						<div class="row">
							<div class="col-3" style="padding-right: 3px;">
								<a class="gallery-item rounded-1 rounded-md-2" style="border:none;"><img
									src="resources/images/concert-hall/gangdong1.jpg" style="height:120px;"></a>
							</div>
							<div class="col-3" style="padding-right: 6px; padding-left: 6px;">
								<a class="gallery-item rounded-1 rounded-md-2" style="border:none;"><img
									src="resources/images/concert-hall/gangdong3.jpg" style="height:120px;"></a>
							</div>
							<div class="col-3" style="padding-left: 3px;padding-right: 6px;">
								<a class="gallery-item rounded-1 rounded-md-2" style="border:none;"><img
									src="resources/images/concert-hall/gangdong4.jpg" style="height:120px;"></a>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>

		<div class="col-lg-5 p-0">
			<div class="mb-2">
				<div class="card-body p-2 pt-0">
					
					<!-- Place contacts-->
					<div>
						<h4 class="h5 mb-2">Contacts:</h4>
						<ul class="nav flex-column" style="font-size:16pt;">
							<li class="nav-item mb-1"><a
								class="nav-link p-0 fw-bold d-flex align-items-start" style="color:#201627; font-family: 'NanumSquareRound', sans-serif;"><i
									class="fi-map-pin mt-1 me-2 align-middle opacity-70"></i>
									<%=hall.getAdres()%>&nbsp;&nbsp; </a></li>
							<li class="nav-item"><a
								class="nav-link d-inline-block p-0 fw-bold d-inline-flex align-items-start" style="color:#201627; font-family: 'NanumSquareRound', sans-serif;">
									<i class="fi-phone mt-1 me-2 align-middle opacity-70"></i><%=hall.getTelno()%>
									&nbsp;&nbsp;
							</a></li>
							<li class="nav-item"><a
								class="nav-link p-0 fw-bold d-flex align-items-start" style="color:#201627; font-family: 'NanumSquareRound', sans-serif;"
								href="<%=hall.getRelateurl()%>"><i
									class="fi-globe mt-1 me-2 align-middle opacity-60"></i><%=hall.getRelateurl()%>
									&nbsp;&nbsp;</a></li>
						</ul>
					</div>
				</div>
				</div>
				
				<!--Map-->
				<div id="map" style="width: 550px; height: 455px; border-radius:2%;"></div>
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

					
					var imageSrc = "<%=path %>/resources/images/marker/marker.png",   
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
		</aside>
	</div>
</section>
<section class="container mb-5 pb-2 pt-4 pb-lg-4">
	<p style="font-family: 'NanumSquareRound', sans-serif; font-size:40pt; color:#201627; font-weight:700;margin-bottom: 5px;"><span style="color: #0B398E; font-size:43pt; font-weight:800;"><%=hall.getFcltynm()%></span>에서 상연중인 공연</p>
	<div class="row">
		<div class="pb-2 mt-2">
			<!-- Item-->
			<% if (!showList.isEmpty()) { %>
			<% if (showList.size() < count) { %>
			<% count = showList.size(); %>
			<% } %>
			<% for (int i = 0; i < count; i++) { %>
			<article
				class="card border-0 shadow-sm card-hover card-horizontal mb-4"  onclick="location.href='<%=path%>/showDetail?showId=<%=showList.get(i).getShow_id()%>'"
				 style="cursor:pointer; color:#201627;">
				<a class="card-img-top"
					style="background-image: url(<%=showList.get(i).getPoster()%>);">

					<span
					style="background-image:  url(<%=showList.get(i).getPoster()%>);  	
					width: 450px; heigth: 700px; background-size: cover; background-position: center;"></span>
				</a>

				<div class="card-body px-4" style="padding:15px;">
				<div class="badge bg-faded-primary mb-1" style="font-size:12pt;"><%=showList.get(i).getGenrenm()%></div>
					<a class="fs-xs text-uppercase text-decoration-none"
						href="<%=path%>/showDetail?showId=<%=showList.get(i).getShow_id()%>"></a>
					<h5 class="mb-1" style="font-size:23pt;"><%=showList.get(i).getPrfnm() %>
					</h5>
					<div class="PrfcastFont" style="font-size:17pt; height:17pt; color:#201627; margin-bottom: 40px;">
						
						<%=showList.get(i).getPrfcast() %>
					</div>

					<div class="daystFont" style="font-size:19pt;">
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