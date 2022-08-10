<%@page import="javax.swing.DefaultListModel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.File"%>
<%@page import="vo.Hall"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!-- style.default 우선순위로 인해 적용문제 발생. headerConcertHall로 해결 -->
<%@include file="/views/common/headerConcertHall.jsp"%>

<%
	List<Hall> list = new ArrayList<>();
	if(request.getAttribute("list") != null) {
		list = (List<Hall>) request.getAttribute("list");
	} else {
		list = null;
	}

	ArrayList<String> imgList = new ArrayList<>();
	imgList.add("/resources/images/concert-hall/000007.jpg");
	imgList.add("/resources/images/concert-hall/000002.jpg");
	imgList.add("/resources/images/concert-hall/000003.jpg");
	imgList.add("/resources/images/concert-hall/000004.jpg");
	imgList.add("/resources/images/concert-hall/000005.jpg");
	imgList.add("/resources/images/concert-hall/000006.jpg");
	
	int count = 6;
%>

<main>

 <section class="container pt-5 my-5 pb-lg-1">
        <div class="row pt-0 pt-md-2 pt-lg-0">
            <div class="col-xl-7 col-lg-6 col-md-5 order-md-2 mb-4 mb-lg-3"><img src="<%=path %>/resources/images/concert-hall/00600.jpg" alt="Hero image"></div>
            <div class="col-xl-5 col-lg-6 col-md-7 order-md-1 pt-xl-5 pe-lg-0 mb-3 text-center">
                <h1 class="display-4 mt-lg-7 mb-md-4 mb-3 pt-md-4 pb-lg-2">공연장 검색</h1>
            </div>
        </div>
    </section>

    <!-- Search form-->
    <main>
        <section class="container">
            <form class="form-group form-group-black d-block rounded-lg-pill mb-4" action="<%=path%>/hall/search" method="GET">
                <div class="row align-items-center g-0 ms-n2">
                    <div class="col-lg-3 col-xl-8">
                        <div class="input-group input-group-lg border-end-lg border-black"><span class="input-group-text text-light rounded-pill opacity-50 ps-3"><i class="fi-search"></i></span>
                            <input class="form-control" type="text" name="keyword" placeholder="Search Concert Hall...">
                        </div>
                    </div>
                    <hr class="hr-light d-lg-none my-2">
                    <div class="col-lg-4 col-xl-4 d-flex align-items-center">
                        <div class="dropdown w-50 w-lg-100" data-bs-toggle="select">
                            <button class="btn btn-link" type="button" data-bs-toggle="dropdown"><i class="fi-map-pin me-2"></i><span class="dropdown-toggle-label">지역</span></button>
                            <input type="hidden" name="local">
                            <ul class="dropdown-menu dropdown-menu-dark my-3">
                                <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">서울</span></a></li>
                                <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">경기</span></a></li>
                                <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">부산</span></a></li>
                                <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">인천</span></a></li>
                                <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">충북</span></a></li>
                                <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">충남</span></a></li>
                                <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">광주</span></a></li>
                                <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">대구</span></a></li>
                                <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">경북</span></a></li>
                                <li><a class="dropdown-item" href="#"><span class="dropdown-item-label">제주</span></a></li>
                            </ul>
                        </div>
                        <input class="btn btn-primary btn-lg w-50 w-lg-auto rounded-pill" type="submit" value="검색하기">
                    </div>
                </div>
            </form>
        </section>


        <!-- /Search form-->
        <!-- image -->
        <div class="container">
            <div class="row">
                <div class="col-lg-6 py-2 p-xl-5">
                    <div class="d-flex justify-content-between align-items-center flex-column flex-md-row mb-4">
                        <div class="me-3">
                            <p class="mb-3 mb-md-0">
                            <strong> 
                            <% if (list != null) { %>
                            	<%=list.size() %>	
                            <% } else {%>
                            	0
                            <% } %>
                            </strong>
                             results found</p>
                        </div>
                    </div>   
                                    
                   <% if(list != null) { %>
                    	<div class="row">                  	
                    	<% if (list.size() < count) { %>
                    	<% count = list.size(); %>
                    	<% } %>
                    	<% for (int i = 0; i < count; i++) { %>
                    			<div class="col-6 mb-5 hover-animate" style="width: 270px;" data-marker-id="59c0c8e322f3375db4d89128">
                            	<div class="card h-100 border-0 shadow">
                                <div class="card-img-top overflow-hidden dark-overlay bg-cover" style="background-image: url(<%=path %><%= imgList.get(i) %>); min-height: 200px;">
                                    <div class="card-img-overlay-bottom z-index-20">
                                    	<a class="tile-link" href="<%=path%>/hallDetail?hallId=<%=list.get(i).getHall_id()%>"></a>
                                        <h4 class="text-white text-shadow"><%=list.get(i).getFcltynm() %></h4>
                                    </div>
                                    <div class="card-img-overlay-top justify-content-between align-items-center">
                                        <a class="card-fav-icon position-relative z-index-40" onclick="goMap('<%=list.get(i).getLa() %>', '<%=list.get(i).getLo() %>', '<%=list.get(i).getFcltynm() %>')" href="javascript:void(0);" style="float: right; border: none; background: none; cursor: pointer; z-index: 100;"><i class="fi-map-pin fs-5"></i></a>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <p class="text-sm text-muted mb-3"><%=list.get(i).getAdres() %></p>
                                    <p class="text-sm text-muted text-uppercase mb-1">
                                        <a href="#" class="text-dark"></a>
                                </div>
                            </div>
                       			 </div>
                    	<% } %>
                    	</div>              
                   <% } %>
                 
                </div>
                <div class="col-lg-6">
                    <div id="map" style="width:100%;height:1130px;"></div>
                    <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=1c1e51b427ea6bc49c8cd6877c234c7f"></script>           
                    <script>
					var container = document
							.getElementById('map');
					var options = {
						center : new kakao.maps.LatLng(
								37.4791985,
								127.01176), // 나중에 예술의 전당 la lo 가져오기.
						level : 3
					};
	
					var map = new kakao.maps.Map(
							container,
							options);
	
					function goMap(
							la,
							lo,
							name) {
						var mapContainer = document
								.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center : new kakao.maps.LatLng(
								la,
								lo), // 지도의 중심좌표
						level : 3
					// 지도의 확대 레벨
					};
	
					var map = new kakao.maps.Map(
							mapContainer,
							mapOption);
	
					// 마커가 표시될 위치입니다 
					var markerPosition = new kakao.maps.LatLng(
							la,
							lo);
	
					// 마커를 생성합니다
					var marker = new kakao.maps.Marker(
							{
								position : markerPosition
							});
	
					// 마커가 지도 위에 표시되도록 설정합니다
					marker
							.setMap(map);
	
					var iwContent = '<div style="padding:5px;"><h6>'+ name +'</h6><a href="https://map.kakao.com/link/map/'+ name +',' +la+','+lo +'" style="color:blue" target="_blank">큰지도보기<br></a> <a href="https://map.kakao.com/link/to/'+ name +',' +la+','+lo +'" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
					iwPosition = new kakao.maps.LatLng(
							la,
							lo); //인포윈도우 표시 위치입니다
	
					// 인포윈도우를 생성합니다
					var infowindow = new kakao.maps.InfoWindow(
							{
								position : iwPosition,
								content : iwContent
							});
	
					// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
					infowindow
							.open(
									map,
									marker);
						}
					</script>
                </div>
            </div>
        </div>
</main>

<!-- 찜하기 하트 아이콘 버튼 시작 -->
<!-- JavaScript files-->
    <script>
        // ------------------------------------------------------- //
        //   Inject SVG Sprite - 
        //   see more here 
        //   https://css-tricks.com/ajaxing-svg-sprite/
        // ------------------------------------------------------ //
        function injectSvgSprite(path) {

            var ajax = new XMLHttpRequest();
            ajax.open("GET", path, true);
            ajax.send();
            ajax.onload = function(e) {
                var div = document.createElement("div");
                div.className = 'd-none';
                div.innerHTML = ajax.responseText;
                document.body.insertBefore(div, document.body.childNodes[0]);
            }
        }
        // to avoid CORS issues when viewing using file:// protocol, using the demo URL for the SVG sprite
        // use your own URL in production, please :)
        // https://demo.bootstrapious.com/directory/1-0/icons/orion-svg-sprite.svg
        //- injectSvgSprite('${path}icons/orion-svg-sprite.svg'); 
        injectSvgSprite('https://demo.bootstrapious.com/directory/1-4/icons/orion-svg-sprite.svg');
    </script>
    <!-- 찜하기 하튼 아이콘 버튼 끝 -->

<%@include file="/views/common/footer.jsp"%>