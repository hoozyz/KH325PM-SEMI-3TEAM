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
	
	if( request.getAttribute("deTail") != null) {
	 	Object detail = request.getAttribute("deTail");
		if(detail instanceof List<?>) {
			for(Object obj : (List<?>) detail) {
				if (obj instanceof Hall) {
					halList.add((Hall) obj);
				}
			}
		}
	} else {
		halList = null;
	}	
	
	int count = 5;
	
%>
		
        <section class="container mt-5 mb-4 pt-5">
            <!-- Breadcrumb-->
            <div class="row gy-9 pt-lg-2">
                <div class="col-lg-7 p-4">
                    <div class="d-flex flex-column">
                        <!-- Carousel with slides count-->
                        <div class="order-lg-1 order-2">
                            <div class="tns-carousel-wrapper">
                                <div class="tns-slides-count text-light"><i class="fi-image fs-lg me-2"></i>
                                    <div class="ps-1"><span class="tns-current-slide fs-5 fw-bold"></span><span class="fs-5 fw-bold">/</span><span class="tns-total-slides fs-5 fw-bold"></span></div>
                                </div>
                                <div class="tns-carousel-inner" data-carousel-options="{&quot;navAsThumbnails&quot;: true, &quot;navContainer&quot;: &quot;#thumbnails&quot;, &quot;gutter&quot;: 12, &quot;responsive&quot;: {&quot;0&quot;:{&quot;controls&quot;: false},&quot;500&quot;:{&quot;controls&quot;: true}}}">
                                    <div><img class="rounded-3" src="#" alt="Image"></div>
                                </div>
                            </div>
                            <!-- Thumbnails nav-->
                            <ul class="tns-thumbnails mb-4" id="thumbnails">
                                <li class="tns-thumbnail"><img src="img/real-estate/single/th09.jpg" alt="Thumbnail"></li>
                            </ul>
                        </div>
                        <!-- Page title + Features-->
                    </div>
                </div>


                <!-- Sidebar with details-->
                <div class="col-lg-5">
                    <div class="card mb-4 p-2 shadow-sm">
                        <div class="card-body">
                            <!-- Place info-->
                            <div class="d-flex align-items-start mb-3 pb-2 border-bottom"><img src="resources/images/concert-hall/concertHallDetailLogo.png" width="60" alt="Thumbnail">
                                <div class="ps-2 ms-1">
                                    <h3 class="h5 mb-2">&ensp;<%= hall.getFcltynm() %></h3>
                                </div>
                            </div>
                            <!-- Place contacts-->
                            <div class="mb-1 pb-4 border-bottom">
                                <h4 class="h5 mb-2">Contacts:</h4>
                                <ul class="nav flex-column">
                                    <li class="nav-item mb-2"><a class="nav-link p-0 fw-normal d-flex align-items-start" href="#"><i class="fi-map-pin mt-1 me-2 align-middle opacity-70"></i> <%=hall.getAdres() %> &nbsp;&nbsp; </a></li>                      
                                    <li class="nav-item mb-2"><a class="nav-link d-inline-block p-0 fw-normal d-inline-flex align-items-start" href="tel:#"><i class="fi-phone mt-1 me-2 align-middle opacity-70"></i><%=hall.getTelno() %> &nbsp;&nbsp;</a></li>
                                    <li class="nav-item mb-2"><a class="nav-link p-0 fw-normal d-flex align-items-start" href="<%=hall.getRelateurl() %>"><i class="fi-globe mt-1 me-2 align-middle opacity-60"></i><%=hall.getRelateurl() %> &nbsp;&nbsp;</a></li>
                                </ul>
                            </div>
                        </div>

                        <!--Map-->

                        <div id="map" style="width:500px;height:200px;"></div>
                        <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=1c1e51b427ea6bc49c8cd6877c234c7f"></script>
                        <script>
                        var infowindow = new kakao.maps.InfoWindow({zIndex:1});

                        var mapContainer = document.getElementById('map'), // 
                            mapOption = {
                                center: new kakao.maps.LatLng(<%= hall.getLa() %>, <%= hall.getLo() %>), 
                                level: 3 
                            };    
                        var map = new kakao.maps.Map(mapContainer, mapOption);
                        
                        var markerPosition  = new kakao.maps.LatLng(<%= hall.getLa() %>, <%= hall.getLo() %>); 

                     // 마커를 생성합니다
                     var marker = new kakao.maps.Marker({
                         position: markerPosition
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
            <div class="d-flex align-items-center justify-content-between mb-3">
                <h2 class="h3 mb-0">주요 공연</h2>
            </div>   
            <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside tns-nav-outside-flush mx-n2">
                <div class="tns-carousel-inner row gx-4 mx-0 pt-3 pb-4" data-carousel-options="{&quot;items&quot;: 4, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3},&quot;992&quot;:{&quot;items&quot;:4}}}">
                    <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100">
                            <div class="card-img-top card-img-hover">
                                <a class="img-overlay" href="real-estate-single-v1.html"></a>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                                </div><img src="img/real-estate/catalog/39.jpg" alt="Image">
                            </div>
                            <div class="card-body position-relative pb-3">
                                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">Concert</h4>
                                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html"></a></h3>
                                <p class="mb-2 fs-sm text-muted"></p>
                            </div>
                            <div class="container">
                                <div class="col py-3" style="float: right;">
                                    <button class="btn btn-primary" type="button" onclick="location.href='#'">보러가기</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 공연장내 전체공연 목록-->
                    <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100">
                            <div class="card-img-top card-img-hover">
                                <a class="img-overlay" href="real-estate-single-v1.html"></a>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                                </div><img src="img/real-estate/catalog/40.jpg" alt="Image">
                            </div>
                            <div class="card-body position-relative pb-3">
                                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">Concert</h4>
                                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html"></a></h3>
                                <p class="mb-2 fs-sm text-muted">공연 설명</p>
                            </div>
                            <div class="container">
                                <div class="col py-3" style="float: right;">
                                    <button class="btn btn-primary" type="button" onclick="location.href='#'">보러가기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100">
                            <div class="card-img-top card-img-hover">
                                <a class="img-overlay" href="real-estate-single-v1.html"></a>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                                </div><img src="img/real-estate/catalog/41.jpg" alt="Image">
                            </div>
                            <div class="card-body position-relative pb-3">
                                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">Concert</h4>
                                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">미정</a></h3>
                                <p class="mb-2 fs-sm text-muted">공연 설명</p>
                            </div>
                            <div class="container">
                                <div class="col py-3" style="float: right;">
                                    <button class="btn btn-primary" type="button" onclick="location.href='#'">보러가기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100">
                            <div class="card-img-top card-img-hover">
                                <a class="img-overlay" href="real-estate-single-v1.html"></a>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                                </div><img src="img/real-estate/catalog/42.jpg" alt="Image">
                            </div>
                            <div class="card-body position-relative pb-3">
                                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">Concert</h4>
                                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html"></a></h3>
                                <p class="mb-2 fs-sm text-muted">공연 설명</p>
                            </div>
                            <div class="container">
                                <div class="col py-3" style="float: right;">
                                    <button class="btn btn-primary" type="button" onclick="location.href='#'">보러가기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div class="col">
                        <div class="card shadow-sm card-hover border-0 h-100">
                            <div class="card-img-top card-img-hover">
                                <a class="img-overlay" href="real-estate-single-v1.html"></a>
                                <div class="content-overlay end-0 top-0 pt-3 pe-3">
                                    <button class="btn btn-icon btn-light btn-xs text-primary rounded-circle" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to Wishlist"><i class="fi-heart"></i></button>
                                </div><img src="img/real-estate/catalog/43.jpg" alt="Image">
                            </div>
                            <div class="card-body position-relative pb-3">
                                <h4 class="mb-1 fs-xs fw-normal text-uppercase text-primary">Concert</h4>
                                <h3 class="h6 mb-2 fs-base"><a class="nav-link stretched-link" href="real-estate-single-v1.html">미정</a></h3>
                                <p class="mb-2 fs-sm text-muted">공연 설명</p>
                            </div>
                            <div class="container">
                                <div class="col py-3" style="float: right;">
                                    <button class="btn btn-primary" type="button" onclick="location.href='#'">보러가기</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Breadcrumb + Page title-->
            <h3 class="pb-3 pt-5">전체 공연</h3>
            <div class="row">
                <div class="pt-4 pb-2 mt-2">
                    <!-- Item-->
                    <% if (showList != null) { %>
                    	<% if (showList.size() < count) { %>
                    		<% count = showList.size(); %>
                    	<% } %>
                    	<% for (int i = 0; i < count; i++) { %>
                    		<article class="card border-0 shadow-sm card-hover card-horizontal mb-4">
                        	<a class="card-img-top" href="#" style="background-image: url(<%=showList.get(i).getPoster()%>);"></a>
                        	<div class="card-body">
                        	    <a class="fs-xs text-uppercase text-decoration-none" href="<%=path%>/showDetail?showId=<%=showList.get(i).getShow_id()%>"></a>
                        	    <h3 class="fs-base pt-1 mb-2"><a class="nav-link" href="job-board-blog-single.html"><%=showList.get(i).getPrfnm() %></a></h3>
                        	    <p class="fs-sm text-muted"><%=showList.get(i).getPrfcast() %></p>
                        	</div>
                        	<button class="btn btn-outline-primary" type="button" onclick="location.href='#'">이동</button>
                    		</article>
                    	<% } %>
                    <% } %>
                </div>
            </div>
        </section>


<%@include file="/views/common/footer.jsp"%>