<%@page import="board.controller.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.Show"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/views/common/musicHeader.jsp"%>


<%
	String keyword = "";
	if(request.getAttribute("keyword") != null){
		keyword = (String)request.getAttribute("keyword");
	}
	String category = (String) request.getAttribute("category");
	List<Show> showList = new ArrayList<>();
	if(request.getAttribute("showList") != null){
		Object show = request.getAttribute("showList");
		if(show instanceof ArrayList<?>){
			for(Object obj : (ArrayList<?>) show){
				if(obj instanceof Show){
					showList.add((Show) obj);
				}
			}
		}
	}else{
		showList = null;
	}
	
	PageInfo pageInfo = null;
	if(request.getAttribute("pageInfo") != null) {
		pageInfo = (PageInfo) request.getAttribute("pageInfo");
	}
%>
    
    <style>
        .cat {
            text-decoration-line: none;
            color: #D9E2F2;
        }
        
        .hero_category {
            font-family: 'Gugi', cursive;
            color: #D9E2F2;
            font-size: 20pt;
        }
        
        .hero_category a:hover {
            color: #AB69DD;
            ;
        }
        
        .title1 {
            font-family: 'NanumSquareRound', sans-serif;
            font-size: 35pt;
            font-weight: 800;
            color: #201627;
        }
    </style>
    
    <!--@@@@@@@@@ hero @@@@@@@@@-->
        <section class="container-fluid pt-1 mt-5 mb-3" style="height: 320px; background-image: url(<%=path %>/resources/images/performHeroBg.png);">
            <section class="container pt-0 mt-5 my-0 ">
                <div style="position:relative;">
                    <img src="<%=path %>/resources/images/music/musicHeroImg.png" alt="" style=" width:100%; position:relative;">
                    <div class="hero_category" style="position:absolute; top: 40%; left: 8%">
                        <a class="cat" href="#">클래식&nbsp;</a>|
                        <a class="cat" href="#">&nbsp;국악&nbsp;</a>|
                        <a class="cat" href="#">&nbsp;오페라&nbsp;</a>
                    </div>
                </div>
            </section>
        </section>
        <!--@@@ hero End @@@-->
        
        <!--@@@ search @@@-->
        <section class="container py-1 mt-1 mb-1 ">
            <form class="form-group d-block d-md-flex py-0 mb-3 rounded-md-pill" style="width:85%;float:left;">
                <div class="input-group input-group-lg border-end-md">
                     <!--calendar-->
                <div class="mb-3" style="max-width: 30rem;">
                    <div class="input-group" style="padding-top: 15px;"><span class="input-group-text"><i class="fi-calendar"></i></span>
                        <input class="form-control date-picker date-range" name="startDate" type="text" placeholder="From date" data-datepicker-options="{&quot;altInput&quot;: true, &quot;altFormat&quot;: &quot;F j, Y&quot;, &quot;dateFormat&quot;: &quot;Y-m-d&quot;}" data-linked-input="#end-date">
                        <input class="form-control date-picker" name="endDate" type="text" placeholder="To date" data-datepicker-options="{&quot;altInput&quot;: true, &quot;altFormat&quot;: &quot;F j, Y&quot;, &quot;dateFormat&quot;: &quot;Y-m-d&quot;}" id="end-date">
                    </div>
                </div>
                <!-- calendar End-->
                </div>
                <div class="input-group input-group-lg border-end-md"><span class="input-group-text text-muted rounded-pill ps-3"><i class="fi-search"></i></span>
                    <input class="form-control" type="text" placeholder="어떤 음악을 찾고 있나요?" value="<%=keyword%>">
                </div>
                <hr class="d-md-none my-2">
                <div class="d-sm-flex">
                    <div class="dropdown w-100 mb-sm-0 mb-3" data-bs-toggle="select">
                        <button class="btn btn-link btn-lg dropdown-toggle ps-2 ps-sm-3" type="button" data-bs-toggle="dropdown"><i class="fi-list me-2"></i>
                        <span class="dropdown-toggle-label">
                        <%if(category != null){ %>
                        <%=category%>
                        <%}else { %>
                        카테고리
                        <%} %>
                    	</span></button>
                        <input type="hidden">
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#"><i class="fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">클래식</span></a></li>
                            <li><a class="dropdown-item" href="#"><i class="fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">국악</span></a></li>
                            <li><a class="dropdown-item" href="#"><i class="fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">오페라</span></a></li>
                        </ul>
                    </div>
                    <button class="btn btn-warning btn-lg rounded-pill w-100 w-md-auto ms-sm-3" type="button" style="background-color:#DBAB34;">검색</button>
                </div>
            </form>
            <div class="position-relative py-4" style="width:15%;height:80px;float:right; padding-left: 3%;">
                <input type="radio" name="rad_date" id="rad_day" value="rad_day" checked="">오늘
                <input type="radio" name="rad_date" id="rad_week" value="rad_week">1주
                <input type="radio" name="rad_date" id="rad_month" value="rad_month">1개월
            </div>
        </section>
        <!--@@@ search End @@@-->
        
        <!-- @@@@ 추천작 @@@@ -->
         <!-- Upcoming events-->
        <section class="container mb-2 pb-lg-3 ">
            <div class="d-md-flex align-items-center justify-content-between " style="width: 100%; ">
                <p class="title1">
                    <span class="title1" style="color: #A468D7;font-size: 130%; ">scene</span>의 추천작
                    <span class="mt-4 " style="font-size: 15pt;">
                        scene이 추천하는 작품을 만나보세요!
                    </span>
                </p>
                <!-- Sorting by date-->

            </div>
            <!-- Carousel-->
            <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside tns-center">
                <div class="tns-carousel-inner" data-carousel-options="{&quot;items&quot;: 1, &quot;edgePadding&quot;: true, &quot;responsive&quot;: {&quot;0&quot;:{&quot;controls&quot;: false, &quot;gutter&quot;: 16},&quot;500&quot;:{&quot;controls&quot;:
                    true, &quot;gutter&quot;: 16}, &quot;768&quot;: {&quot;gutter&quot;: 24}}} ">
                    <!-- Item-->
                    <div>
                        <div class="card border-0 bg-size-cover pt-5 " onclick="location.href=<%=path%>/showDetail?showId=PF195185" style="background-image: url(<%=path%>/resources/images/music/musicAcc1.png); cursor:pointer; height:350px;">
                        </div>
                    </div>
                    <!-- Item-->
                    <div>
                        <div class="card border-0 bg-size-cover pt-5" onclick="location.href=<%=path%>/showDetail?showId=PF194485" style="background-image: url(<%=path%>/resources/images/music/musicAcc2.png); cursor:pointer; height:350px;">
                        </div>
                    </div>
                    <!-- Item-->
                    <div>
                        <div class="card border-0 bg-size-cover pt-5" onclick="location.href=<%=path%>/showDetail?showId=PF194882" style="background-image: url(<%=path%>/resources/images/music/musicAcc3.png); cursor:pointer; height:350px;">
                        </div>
                    </div>
                </div>
        </section>
        <!-- @@@@ 추천작 끝 @@@@ -->

        <!-- @@@ 오픈임박공연 @@@ -->
       <section class="container mb-2 pb-lg-3">
            <div display="inline-block; " style="vertical-align:bottom;align-self: center; width: 100%;">
                <p>
                    <p class="title1">오픈 임박 공연</pstyle=>
                    </p>
            </div>
            <!-- Carousel-->
            <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside tns-center tns-latest ">
                <div class="tns-carousel-inner " data-carousel-options="{&quot;items&quot;: 1, &quot;edgePadding&quot;: true, &quot;responsive&quot;: {&quot;0&quot;:{&quot;controls&quot;: false, &quot;gutter&quot;: 16},&quot;500&quot;:{&quot;controls&quot;:
                        true, &quot;gutter&quot;: 16}, &quot;768&quot;: {&quot;gutter&quot;: 24}}} ">
                    <!-- Item-->
                    <div>
                        <div class="card border-0 bg-size-cover pt-5 " style="background-image: url(<%=path%>/resources/images/perform/ex_poster4.png); ">
                            <div class="d-none d-md-block " style="height: 13rem; "></div>
                            <div class="card-body text-center text-md-start pt-4 pt-xl-0 ">
                                <div class="d-md-flex justify-content-between align-items-end ">
                                    <div class="me-2 mb-4 mb-md-0 ">
                                        <div class="d-flex justify-content-center justify-content-md-start text-light fs-sm mb-2 ">
                                            <div class="text-nowrap me-3 "><i class="fi-calendar-alt me-1 opacity-70 "></i><span class="align-middle ">Nov 15</span></div>
                                            <div class="text-nowrap "><i class="fi-clock me-1 opacity-70 "></i><span class="align-middle ">21:00</span></div>
                                        </div>
                                        <h3 class="h5 text-light mb-0 ">Simon Rock Concert</h3>
                                    </div>
                                    <div class="btn-group ">
                                        <a class=" btn btn-translucent-warning rounded-pill rounded-end-0 px-3 " href="# ">상세보기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div>
                        <div class="card border-0 bg-size-cover pt-5 " style="background-image: url(<%=path%>/resources/images/perform/ex_poster3.png); ">
                            <div class="d-none d-md-block " style="height: 14.5rem; "></div>
                            <div class="card-body text-center text-md-start pt-4 pt-xl-0 ">
                                <div class="d-md-flex justify-content-between align-items-end ">
                                    <div class="me-2 mb-4 mb-md-0 ">
                                        <div class="d-flex justify-content-center justify-content-md-start text-light fs-sm mb-2 ">
                                            <div class="text-nowrap me-3 "><i class="fi-calendar-alt me-1 opacity-70 "></i><span class="align-middle ">Dec 2</span></div>
                                            <div class="text-nowrap "><i class="fi-clock me-1 opacity-70 "></i><span class="align-middle ">10:00</span></div>
                                        </div>
                                        <h3 class="h5 text-light mb-0 ">Holi Festival</h3>
                                    </div>
                                    <div class="btn-group "><a class=" btn btn-translucent-warning rounded-pill rounded-end-0 px-3 " href="# ">상세보기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div>
                        <div class="card border-0 bg-size-cover pt-5 " style="background-image: url(<%=path%>/resources/images/perform/ex_poster2.png); ">
                            <div class="d-none d-md-block " style="height: 14.5rem; "></div>
                            <div class="card-body text-center text-md-start pt-4 pt-xl-0 ">
                                <div class="d-md-flex justify-content-between align-items-end ">
                                    <div class="me-2 mb-4 mb-md-0 ">
                                        <div class="d-flex justify-content-center justify-content-md-start text-light fs-sm mb-2 ">
                                            <div class="text-nowrap me-3 "><i class="fi-calendar-alt me-1 opacity-70 "></i><span class="align-middle ">No 11</span></div>
                                            <div class="text-nowrap "><i class="fi-clock me-1 opacity-70 "></i><span class="align-middle ">18:00</span></div>
                                        </div>
                                        <h3 class="h5 text-light mb-0 ">Football Match</h3>
                                    </div>
                                    <div class="btn-group "><a class=" btn btn-translucent-warning rounded-pill rounded-end-0 px-3 " href="# ">상세보기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="card border-0 bg-size-cover pt-5 " style="background-image: url(<%=path%>/resources/images/perform/ex_poster5.png); ">
                            <div class="d-none d-md-block " style="height: 13rem; "></div>
                            <div class="card-body text-center text-md-start pt-4 pt-xl-0 ">
                                <div class="d-md-flex justify-content-between align-items-end ">
                                    <div class="me-2 mb-4 mb-md-0 ">
                                        <div class="d-flex justify-content-center justify-content-md-start text-light fs-sm mb-2 ">
                                            <div class="text-nowrap me-3 "><i class="fi-calendar-alt me-1 opacity-70 "></i><span class="align-middle ">Nov 15</span></div>
                                            <div class="text-nowrap "><i class="fi-clock me-1 opacity-70 "></i><span class="align-middle ">21:00</span></div>
                                        </div>
                                        <h3 class="h5 text-light mb-0 ">Simon Rock Concert</h3>
                                    </div>
                                    <div class="btn-group ">
                                        <a class=" btn btn-translucent-warning rounded-pill rounded-end-0 px-3 " href="# ">상세보기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div>
                        <div class="card border-0 bg-size-cover pt-5 " style="background-image: url(<%=path%>/resources/images/perform/ex_poster4.png); ">
                            <div class="d-none d-md-block " style="height: 14.5rem; "></div>
                            <div class="card-body text-center text-md-start pt-4 pt-xl-0 ">
                                <div class="d-md-flex justify-content-between align-items-end ">
                                    <div class="me-2 mb-4 mb-md-0 ">
                                        <div class="d-flex justify-content-center justify-content-md-start text-light fs-sm mb-2 ">
                                            <div class="text-nowrap me-3 "><i class="fi-calendar-alt me-1 opacity-70 "></i><span class="align-middle ">Dec 2</span></div>
                                            <div class="text-nowrap "><i class="fi-clock me-1 opacity-70 "></i><span class="align-middle ">10:00</span></div>
                                        </div>
                                        <h3 class="h5 text-light mb-0 ">Holi Festival</h3>
                                    </div>
                                    <div class="btn-group "><a class=" btn btn-translucent-warning rounded-pill rounded-end-0 px-3 " href="# ">상세보기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div>
                        <div class="card border-0 bg-size-cover pt-5 " style="background-image: url(<%=path%>/resources/images/perform/ex_poster3.png); ">
                            <div class="d-none d-md-block " style="height: 14.5rem; "></div>
                            <div class="card-body text-center text-md-start pt-4 pt-xl-0 ">
                                <div class="d-md-flex justify-content-between align-items-end ">
                                    <div class="me-2 mb-4 mb-md-0 ">
                                        <div class="d-flex justify-content-center justify-content-md-start text-light fs-sm mb-2 ">
                                            <div class="text-nowrap me-3 "><i class="fi-calendar-alt me-1 opacity-70 "></i><span class="align-middle ">No 11</span></div>
                                            <div class="text-nowrap "><i class="fi-clock me-1 opacity-70 "></i><span class="align-middle ">18:00</span></div>
                                        </div>
                                        <h3 class="h5 text-light mb-0 ">Football Match</h3>
                                    </div>
                                    <div class="btn-group "><a class=" btn btn-translucent-warning rounded-pill rounded-end-0 px-3 " href="# ">상세보기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="card border-0 bg-size-cover pt-5 " style="background-image: url(<%=path%>/resources/images/perform/ex_poster2.png); ">
                            <div class="d-none d-md-block " style="height: 13rem; "></div>
                            <div class="card-body text-center text-md-start pt-4 pt-xl-0 ">
                                <div class="d-md-flex justify-content-between align-items-end ">
                                    <div class="me-2 mb-4 mb-md-0 ">
                                        <div class="d-flex justify-content-center justify-content-md-start text-light fs-sm mb-2 ">
                                            <div class="text-nowrap me-3 "><i class="fi-calendar-alt me-1 opacity-70 "></i><span class="align-middle ">Nov 15</span></div>
                                            <div class="text-nowrap "><i class="fi-clock me-1 opacity-70 "></i><span class="align-middle ">21:00</span></div>
                                        </div>
                                        <h3 class="h5 text-light mb-0 ">Simon Rock Concert</h3>
                                    </div>
                                    <div class="btn-group ">
                                        <a class=" btn btn-translucent-warning rounded-pill rounded-end-0 px-3 " href="# ">상세보기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div>
                        <div class="card border-0 bg-size-cover pt-5 " style="background-image: url(<%=path%>/resources/images/perform/ex_poster5.png); ">
                            <div class="d-none d-md-block " style="height: 14.5rem; "></div>
                            <div class="card-body text-center text-md-start pt-4 pt-xl-0 ">
                                <div class="d-md-flex justify-content-between align-items-end ">
                                    <div class="me-2 mb-4 mb-md-0 ">
                                        <div class="d-flex justify-content-center justify-content-md-start text-light fs-sm mb-2 ">
                                            <div class="text-nowrap me-3 "><i class="fi-calendar-alt me-1 opacity-70 "></i><span class="align-middle ">Dec 2</span></div>
                                            <div class="text-nowrap "><i class="fi-clock me-1 opacity-70 "></i><span class="align-middle ">10:00</span></div>
                                        </div>
                                        <h3 class="h5 text-light mb-0 ">Holi Festival</h3>
                                    </div>
                                    <div class="btn-group "><a class=" btn btn-translucent-warning rounded-pill rounded-end-0 px-3 " href="# ">상세보기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div>
                        <div class="card border-0 bg-size-cover pt-5 " style="background-image: url(<%=path%>/resources/images/perform/ex_poster4.png); ">
                            <div class="d-none d-md-block " style="height: 14.5rem; "></div>
                            <div class="card-body text-center text-md-start pt-4 pt-xl-0 ">
                                <div class="d-md-flex justify-content-between align-items-end ">
                                    <div class="me-2 mb-4 mb-md-0 ">
                                        <div class="d-flex justify-content-center justify-content-md-start text-light fs-sm mb-2 ">
                                            <div class="text-nowrap me-3 "><i class="fi-calendar-alt me-1 opacity-70 "></i><span class="align-middle ">No 11</span></div>
                                            <div class="text-nowrap "><i class="fi-clock me-1 opacity-70 "></i><span class="align-middle ">18:00</span></div>
                                        </div>
                                        <h3 class="h5 text-light mb-0 ">Football Match</h3>
                                    </div>
                                    <div class="btn-group "><a class=" btn btn-translucent-warning rounded-pill rounded-end-0 px-3 " href="# ">상세보기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div class="card border-0 bg-size-cover pt-5 " style="background-image: url(<%=path%>/resources/images/perform/ex_poster3.png); ">
                            <div class="d-none d-md-block " style="height: 13rem; "></div>
                            <div class="card-body text-center text-md-start pt-4 pt-xl-0 ">
                                <div class="d-md-flex justify-content-between align-items-end ">
                                    <div class="me-2 mb-4 mb-md-0 ">
                                        <div class="d-flex justify-content-center justify-content-md-start text-light fs-sm mb-2 ">
                                            <div class="text-nowrap me-3 "><i class="fi-calendar-alt me-1 opacity-70 "></i><span class="align-middle ">Nov 15</span></div>
                                            <div class="text-nowrap "><i class="fi-clock me-1 opacity-70 "></i><span class="align-middle ">21:00</span></div>
                                        </div>
                                        <h3 class="h5 text-light mb-0 ">Simon Rock Concert</h3>
                                    </div>
                                    <div class="btn-group ">
                                        <a class=" btn btn-translucent-warning rounded-pill rounded-end-0 px-3 " href="# ">상세보기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div>
                        <div class="card border-0 bg-size-cover pt-5 " style="background-image: url(<%=path%>/resources/images/perform/ex_poster2.png); ">
                            <div class="d-none d-md-block " style="height: 14.5rem; "></div>
                            <div class="card-body text-center text-md-start pt-4 pt-xl-0 ">
                                <div class="d-md-flex justify-content-between align-items-end ">
                                    <div class="me-2 mb-4 mb-md-0 ">
                                        <div class="d-flex justify-content-center justify-content-md-start text-light fs-sm mb-2 ">
                                            <div class="text-nowrap me-3 "><i class="fi-calendar-alt me-1 opacity-70 "></i><span class="align-middle ">Dec 2</span></div>
                                            <div class="text-nowrap "><i class="fi-clock me-1 opacity-70 "></i><span class="align-middle ">10:00</span></div>
                                        </div>
                                        <h3 class="h5 text-light mb-0 ">Holi Festival</h3>
                                    </div>
                                    <div class="btn-group "><a class=" btn btn-translucent-warning rounded-pill rounded-end-0 px-3 " href="# ">상세보기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Item-->
                    <div>
                        <div class="card border-0 bg-size-cover pt-5 " style="background-image: url(<%=path%>/resources/images/perform/ex_poster5.png); ">
                            <div class="d-none d-md-block " style="height: 14.5rem; "></div>
                            <div class="card-body text-center text-md-start pt-4 pt-xl-0 ">
                                <div class="d-md-flex justify-content-between align-items-end ">
                                    <div class="me-2 mb-4 mb-md-0 ">
                                        <div class="d-flex justify-content-center justify-content-md-start text-light fs-sm mb-2 ">
                                            <div class="text-nowrap me-3 "><i class="fi-calendar-alt me-1 opacity-70 "></i><span class="align-middle ">No 11</span></div>
                                            <div class="text-nowrap "><i class="fi-clock me-1 opacity-70 "></i><span class="align-middle ">18:00</span></div>
                                        </div>
                                        <h3 class="h5 text-light mb-0 ">Football Match</h3>
                                    </div>
                                    <div class="btn-group "><a class=" btn btn-translucent-warning rounded-pill rounded-end-0 px-3 " href="# ">상세보기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- @@@ 오픈임박공연 끝 @@@ -->
        
        <!-- @@@ 전체 음악공연 @@@ -->
         <section class="container mb-sm-5 pb-lg-4 ">
            <!-- 목차 제목 -->
            <div display="inline-block; " style="vertical-align:bottom;align-self: center; ">
                <p class="title1">전체 음악공연</p>
            </div>

            <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside " style="margin-left: 5%;margin-right: 5%; ">

                <!-- Sorting-->
                <div class="d-flex flex-sm-row flex-column align-items-sm-center align-items-stretch my-2 ">
                    <hr class="d-none d-sm-block w-100 mx-4 ">

                    <div class="d-none d-sm-flex align-items-center flex-shrink-0 text-muted "><i class="fi-check-circle me-2 "></i><span class="fs-sm mt-n1 ">148 results</span></div>
                </div>
                <!-- Item-->
                <!-- @@@ Card-1 @@@ -->
                <% if (showList != null) { %>
                	<% for (int i = 0; i < showList.size(); i++) { %>
                		<div class="card card-flush card-stretched-vertical " style="margin-bottom: 30px; ">
                    <div class="row ">
                        <div class="col-sm-3 ">
                            <img class="card-img " src="<%=path %>/resources/images/perform/ex_poster5.png " alt="Image Description " id="music_id_2" name="music_id_2 " style="width:200px; ">
                        </div>
                        <div class="col-sm-9 ">
                            <div class="card-body row " style="height:100%; ">
                                <div>
                                    <div style="width: 50%;float:left; ">
                                        <span class="badge bg-faded-primary "><%=category %></span>
                                        <h3 class="card-title " style="margin-top: 1%;margin-bottom: 1%; ">
                                            <a class="text-dark " href="./blog-article.html " id="title_2 " name="title_2 " style="text-decoration: none; "><%=showList.get(i).getPrfnm() %></a>
                                        </h3>
                                    </div>
                                </div>
                                <div class="musicInfo">
                                    <p id="cost_2 " name="cost_2 " style="margin-bottom: 1%; "><%=showList.get(i).getPrfpdfrom() %>&nbsp;&nbsp; ~ &nbsp;&nbsp;  <%=showList.get(i).getPrfpdfrom() %></p>
                                    <div><a href="<%=path %>/" id="hall_info_2 " name="hall_info_2 " style="color: black;text-decoration: none; ">공연장 가기</a></div>
                                </div>
                                <div class="card-footer " style="text-align: right; ">
                                    <a class="btn btn-translucent-info rounded-pill px-3 " href="<%=path %>/showDetail?showId=<%=showList.get(i).getShow_id() %>" id="detail_2 " name="detail_2 ">공연 보러가기</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                	<% } %>
              	<% } %>
                <div class="board-bottom" style="width:1300px; margin: 0 auto; padding-top: 25px;">
                <div class="board-page" style="text-align: center;">
	                <a class="page-prev" onclick="goPage($<%=pageInfo.getPrevPage() %>}); return false;"><i class="fi-chevron-left align-middle"></i></a>
	                <% for (int i = pageInfo.getStartPage(); i <= pageInfo.getEndPage(); i++) { %>
	                	<% if (i == pageInfo.getCurrentPage()) { %>
	                		<a class="page-on" id="page(<%=i %>)" onclick="goPage(<%=i %>); return false;"><%=i %></a>
	                	<% } else {%>
	                		<a class="page" id="page(<%=i %>)" onclick="goPage(<%=i %>); return false;"><%=i %></a>
	                	<% } %>
	                <% } %>
	                <a class="page-next" onclick="goPage(<%=pageInfo.getNextPage() %>); return false;"><i class="fi-chevron-right align-middle"></i></a>
                </div>
            </div>
                
                
                
                

                <!-- Pagination: with icons -->
                <!-- <nav aria-label="Page navigation ">
                    <ul class="pagination pagination-lg ">
                        <li style="width:40%; "></li>
                        <li class="page-item ">
                            <a href="# " class="page-link " aria-label="Previous ">
                                <i class="fi-chevron-left "></i>
                            </a>
                        </li>
                        <li class="page-item d-sm-none ">
                            <span class="page-link page-link-static ">2 / 5</span>
                        </li>
                        <li class="page-item d-none d-sm-block ">
                            <a href="# " class="page-link ">1</a>
                        </li>
                        <li class="page-item active d-none d-sm-block " aria-current="page ">
                            <span class="page-link ">2<span class="visually-hidden ">(current)</span>
                            </span>
                        </li>
                        <li class="page-item d-none d-sm-block ">
                            <a href="# " class="page-link ">3</a>
                        </li>
                        <li class="page-item d-none d-sm-block ">
                            <a href="# " class="page-link ">4</a>
                        </li>
                        <li class="page-item d-none d-sm-block ">
                            <a href="# " class="page-link ">5</a>
                        </li>
                        <li class="page-item ">
                            <a href="# " class="page-link " aria-label="Next ">
                                <i class="fi-chevron-right "></i>
                            </a>
                        </li>
                    </ul>
                </nav> -->
            </div>
        </section>
        <!-- @@@ 전체 음악공연 끝 @@@ -->
        
        <script>
        function goPage(pageNo) {
     		$.ajax({
     			url: "<%=path%>/musicMain",
     			type: "POST",
     			dataType: "text",
     			data: { "pageNo" : pageNo },
     			progress: true,
     			
     			// 성공시
         		success: function(list) {
         			data = JSON.parse(list);
         			var str = "";
         			
         			$.each(data, (i, obj) => {
         				str += '<tr style="width: 100%; height: 70px;  background-color: #f1f1f1;">'
         			    str += '<td class="td-no">'+obj.board_no +'</td>';
         			    str += '<td class="td-title"><a href="#view-modal" data-bs-toggle="modal" data-bs-dismiss="modal" onclick="goView('+ obj.boar_no +'); return false;">'+ obj.title +'</a></td>';
         			    str += '<td class="td-writer">'+obj.name +'</td>';
         			    str += '<td class="td-date">'+obj.date +'</td>';
         			    str += '<td class="td-count">'+obj.readcount +'</td>';
         				str += '</tr>'
         			});

         			$('.board-data').html(str);

         			var maxPage =     data[0].maxPage     ;
         			var startPage =   data[0].startPage   ;
         			var endPage =     data[0].endPage     ;
         			var currentPage = data[0].currentPage ;
         			var prevPage =    data[0].prevPage    ;
         			var nextPage =    data[0].nextPage    ;
         			var startList =   data[0].startList   ;
         			var endList =     data[0].endList     ;  

         			str = ""; 
         			var prevEndPage = endPage;

 	        		if(currentPage != 1) {
 	            		str += '<a class="page-first" onclick="goPage(1); return false;"><i class="fi-chevrons-left align-middle"></i></a>';
 	            		str += '<a class="page-prev" onclick="goPage('+ prevPage +'); return false;"><i class="fi-chevron-left align-middle"></i></a>';
 	            	}
 	
 	            	for (var i = startPage; i <= endPage; i++) { // 페이지 5개마다 페이지 바뀜
 	            		if(i == currentPage) {
 	            			str += '<a class="page-on" id="page('+ i +')" onclick="goPage('+ i +'); return false;">'+ i +'</a>';
 	            		} else {
 	            			str += '<a class="page" id="page'+ i +'" onclick="goPage('+ i +'); return false;">'+ i +'</a>';
 	            		}
 	            	}
 	
 	            	if(currentPage != maxPage) {
 	            		str += '<a class="page-next" onclick="goPage('+ nextPage +'); return false;"><i class="fi-chevron-right align-middle"></i></a>';
 	            		str += '<a class="page-end" onclick="goPage('+ maxPage +'); return false;"><i class="fi-chevrons-right align-middle"></i></a>';
 	            	}
         			
         			$('.board-page').html(str);
         			
         		},	
     			
     			error: function(e) {
         			console.log(e);
         		}
     		})
     	}
        
        </script>

	<%@include file="/views/common/footer.jsp"%>