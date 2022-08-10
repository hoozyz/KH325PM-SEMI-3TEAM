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
            <div class="row gy-9 pt-lg-2">
                <div class="col-lg-7 p-3">
                <div class="card shadow border-0">
                  <a href="post.html"><img class="img-fluid card-img-top" src="resources/images/concert-hall/000007.jpg" alt="..." /></a>
                </div>
                </div>

                <div class="col-lg-5">
                    <div class="card mb-4 p-2 shadow-sm">
                        <div class="card-body">
                            <!-- Place info-->
                            <div class="d-flex align-items-start mb-3 pb-2 border-bottom"><img src="resources/images/concert-hall/concertHallDetailLogo.png" width="60" alt="Thumbnail">
                                <div class="ps-2 ms-1">
                                    <h1>&ensp;&ensp;&ensp;&ensp;<%= hall.getFcltynm() %></h1>
                                </div>
                            </div>
                            <!-- Place contacts-->
                            <div class="mb-1 pb-4 border-bottom">
                                <h4 class="h5 mb-2">Contacts:</h4>
                                <ul class="nav flex-column">
                                    <li class="nav-item mb-2"><a class="nav-link p-0 fw-normal d-flex align-items-start"><i class="fi-map-pin mt-1 me-2 align-middle opacity-70"></i> <%=hall.getAdres() %> &nbsp;&nbsp; </a></li>                      
                                    <li class="nav-item mb-2"><a class="nav-link d-inline-block p-0 fw-normal d-inline-flex align-items-start"><i class="fi-phone mt-1 me-2 align-middle opacity-70"></i><%=hall.getTelno() %> &nbsp;&nbsp;</a></li>
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
            <h1 class="pb-3 pt-2">전체 공연</h1>
            <div class="row">
                <div class="pt-4 pb-2 mt-2">
                    <!-- Item-->
                    <% if (showList != null) { %>
                    	<% if (showList.size() < count) { %>
                    		<% count = showList.size(); %>
                    	<% } %>
                    	<% for (int i = 0; i < count; i++) { %>
                    		<article class="card border-0 shadow-sm card-hover card-horizontal mb-4">
                        	<a class="card-img-top" style="background-image: url(<%=showList.get(i).getPoster()%>);"> 

                        	<span style="background-image:  url(<%=showList.get(i).getPoster()%>);  	
                        	width: 90%; heigth: 90%; background-size: cover; background-position: center;"></span></a>
                        	
                        	<div class="card-body">
                        	    <a class="fs-xs text-uppercase text-decoration-none" href="<%=path%>/showDetail?showId=<%=showList.get(i).getShow_id()%>"></a>
                        	    <h5> <a class="nav-link" href="<%=path%>/showDetail?showId=<%=showList.get(i).getShow_id()%>"><%=showList.get(i).getPrfnm() %></a></h5>
                        	    <p class="fs-sm text-muted"> 출연진 : <%=showList.get(i).getPrfcast() %></p> 
                        	    <br>
                        	    <p style="text-align:right;"> 기간:<%=showList.get(i).getPrfpdfrom() %> ~ <%=showList.get(i).getPrfpdto() %> </p>   
                        	</div>
                    		</article>
                    	<% } %>
                    <% } %>
                </div>
            </div>
        </section>


<%@include file="/views/common/footer.jsp"%>