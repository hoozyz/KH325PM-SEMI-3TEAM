<%@page import="vo.Rank"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.Show"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String keyword = "";
	if(request.getAttribute("keyword") != null) {
		keyword = (String) request.getAttribute("keyword");
	}
	String category = (String) request.getAttribute("category");
	List<Show> showList = new ArrayList<>();
	if( request.getAttribute("showList") != null) {
	 	Object show = request.getAttribute("showList");
		if(show instanceof ArrayList<?>) {
			for(Object obj : (ArrayList<?>) show) {
				if (obj instanceof Show) {
					showList.add((Show) obj);
				}
			}
		}
	} else {
		showList = null;
	}
	
	List<Rank> rankList = new ArrayList<>();
	if(request.getAttribute("rankList") != null) {
	 	Object rank = request.getAttribute("rankList");
		if(rank instanceof ArrayList<?>) {
			for(Object obj : (ArrayList<?>) rank) {
				if (obj instanceof Rank) {
					rankList.add((Rank) obj);
				}
			}
		}
	} else {
		rankList = null;
	}
	
%>
    
    
	<%@include file="/views/common/header.jsp"%>   
	
	<Style>
        .title1 {
            font-family: 'NanumSquareRound', sans-serif;
            font-size: 50px;
            font-weight: 800;
            color: #201627;
        }
        
        .cat {
            text-decoration-line: none;
            color: #D9E2F2;
        }
        
        .hero_category {
            font-family: 'Gugi', cursive;
            color: #D9E2F2;
            font-size: 15pt;
        }
        
        .hero_category a:hover {
            color: #AB69DD;
            ;
        }
        .card-rank {
        	width: 304px;
        }
        .card-body, .text-body {
        	text-decoration: none;
        }
        .card-rank-img-top {
        	height: 260px;
        }
    </Style> 
	
	<!--@@@@@@@@@ hero @@@@@@@@@-->
     <section class="container-fluid pt-0 mt-5 mb-3" style="height: 350px; background-image: url(<%=path%>/resources/images/performHeroBg.png);">
        <section class="container pt-0 mt-5 my-0 ">
            <div style="position:relative;">
                <img src="<%=path%>/resources/img/myimg/perform1.png" alt="" style=" width:100%; position:relative;">
                <div class="hero_category" style="position:absolute; top: 40%; left: 8%">
               <a class="cat" href="<%=path%>/showSearch?category=연극&rad_date=1개월&keyword=연극">연극&nbsp;</a>|
                    <a class="cat" href="<%=path%>/showSearch?category=뮤지컬&rad_date=1개월&keyword=뮤지컬">&nbsp;뮤지컬&nbsp;</a>|
                    <a class="cat" href="<%=path%>/showSearch?category=무용&rad_date=1개월&keyword=무용">&nbsp;무용&nbsp;</a>|
                    <a class="cat" href="<%=path%>/showSearch?category=복합&rad_date=1개월&keyword=복합">&nbsp;복합&nbsp;</a>
            </div>
            </div>
        </section>
    </section>

    <!--@@@ hero End @@@-->
    
    <div class="modal fade" id="ticket-result-modal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered p-2 my-0 mx-auto" style="max-width: 950px;">
                <div class="modal-content">
                    <div class="modal-body px-0 py-2 py-sm-0">
                        <button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal"></button>
                        <div class="row mx-0 align-items-center">
                            <div class="col-md-6 border-end-md p-4 p-sm-5">
                                <h2 class="h3 mb-4 mb-sm-5">Hey there!<br>Welcome back.</h2><img class="d-block mx-auto" src="<%=path %>/resources/etc/signin.svg" width="344" alt="Illustartion">
                                <div class="mt-4 mt-sm-5">계정이 없으신가요? <a href="#signup-modal" data-bs-toggle="modal" data-bs-dismiss="modal">회원가입</a></div>
                            </div>
                            <div class="col-md-6 px-4 pt-2 pb-4 px-sm-5 pb-sm-5 pt-md-5">
                                <form class="needs-validation" action="<%=path %>/login" method="POST" novalidate>
                                    <div class="mb-4">
                                        <label class="form-label mb-2" for="signin-email">아이디</label>
                                        <input class="form-control" type="text" name="userId" id="signin-id" placeholder="아이디를 입력해주세요." required>
                                    </div>
                                    <div class="mb-4">
                                        <div class="d-flex align-items-center justify-content-between mb-2">
                                            <label class="form-label mb-0" for="signin-password">비밀번호</label>
                                        </div>
                                        <div class="password-toggle">
                                            <input class="form-control" type="password" name="userPw" id="signin-password" placeholder="비밀번호를 입력해주세요" required>
                                            <label class="password-toggle-btn" aria-label="Show/hide password">
                          <input class="password-toggle-check" type="checkbox"><span class="password-toggle-indicator"></span>
                        </label>
                                        </div>
                                    </div>
                                    <input class="btn btn-primary btn-lg rounded-pill w-100" type="submit" value="로그인"></button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
    <section class="container py-1 mt-1 mb-1 ">
        <form class="form-group d-block d-md-flex rounded-md-pill" style="width:85%;float:left;" method="GET" action="<%=path%>/showSearch">
            <div class="input-group input-group-lg border-end-md">
                <!--calendar-->
                <div class="mb-3" style="max-width: 30rem;">
                    <div class="input-group" style="padding-top: 15px;"><span class="input-group-text"><i class="fi-calendar"></i></span>
                        <input class="form-control date-picker startDate" type="text" name="startDate"placeholder="From date" data-datepicker-options="{&quot;altInput&quot;: true, &quot;altFormat&quot;: &quot;F j, Y&quot;, &quot;dateFormat&quot;: &quot;Y-m-d&quot;}">
                        <input class="form-control date-picker endDate" type="text" name="endDate" placeholder="To date" data-datepicker-options="{&quot;altInput&quot;: true, &quot;altFormat&quot;: &quot;F j, Y&quot;, &quot;dateFormat&quot;: &quot;Y-m-d&quot;}">
                    </div>
                </div>
                <!-- calendar End-->
            </div>
            <div class="input-group input-group-lg border-end-md"><span class="input-group-text text-muted rounded-pill ps-3"><i class="fi-search"></i></span>
                <input class="form-control" type="text" name="keyword" placeholder="어떤 공연을 찾고 있나요?" value="<%=keyword %>">
            </div>
            <hr class="d-md-none my-2">
            <div class="d-sm-flex">
                <div class="dropdown w-100 mb-sm-0 mb-3" data-bs-toggle="select">
                    <button class="btn btn-link btn-lg dropdown-toggle ps-2 ps-sm-3" name="category" type="button" data-bs-toggle="dropdown" ><i class="fi-list me-2"></i>
                    <span class="dropdown-toggle-label">
                    <%if (category != null) { %>
                    	<%=category%>
                    <% } else {%>
                    	카테고리
                    <% } %>
                    </span></button>
                    <input type="hidden" name="category">
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#"><i class="fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">연극</span></a></li>
                        <li><a class="dropdown-item" href="#"><i class="fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">뮤지컬</span></a></li>
                        <li><a class="dropdown-item" href="#"><i class="fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">무용</span></a></li>
                        <li><a class="dropdown-item" href="#"><i class="fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">복합</span></a></li>
                    </ul>
                </div>
                <input class="btn btn-primary btn-lg rounded-pill w-100 w-md-auto ms-sm-3" type="submit" value="검색" style="background-color:#0B398E; border:none;"/>
            </div>
        </form>
        <div class="position-relative" style="width:15%;height:80px;float:right; padding-top: 3%; padding-left: 3%; font-size:15px;">
            <input type="radio" name="rad_date" id="rad_day" value="rad_day" onclick="radDate('day')">오늘
            <input type="radio" name="rad_date" id="rad_week" value="rad_week" onclick="radDate('week')">1주
            <input type="radio" name="rad_date" id="rad_month" value="rad_month" onclick="radDate('month')" checked>1개월
        </div>
    </section>
    <!--@@@ search End @@@-->

    <!-- @@@@ 이달의공연 body 수정본 @@@@ -->
         <!-- Upcoming events-->
        <section class="container mb-2 mt-3 pb-lg-3 ">
            <div class="d-md-flex align-items-center justify-content-between " style="width: 100%; ">
			<div class="title1">이달의 공연</div>
                <!-- Sorting by date-->

            </div>
            <!-- Carousel-->
            <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside tns-center" style="width:1800px; position:relative; right:270px;">
                <div class="tns-carousel-inner" data-carousel-options="{&quot;items&quot;: 1, &quot;edgePadding&quot;: true, &quot;responsive&quot;: {&quot;0&quot;:{&quot;controls&quot;: false, &quot;gutter&quot;: 16},&quot;500&quot;:{&quot;controls&quot;:
                    true, &quot;gutter&quot;: 16}, &quot;768&quot;: {&quot;gutter&quot;: 24}}} ">
                    <!-- Item-->
                    <div>
                        <div class="card border-0 bg-size-cover pt-5" onclick="location.href=<%=path%>/showDetail?showId=PF195185" style="background-image: url(<%=path%>/resources/images/perform/perform2-1.png); cursor:pointer; weight:1850px; height:470px;">
                        </div>
                    </div>
                    <!-- Item-->
                    <div>
                        <div class="card border-0 bg-size-cover pt-5" onclick="location.href=<%=path%>/showDetail?showId=PF194485" style="background-image: url(<%=path%>/resources/images/perform/perform2-2.png); cursor:pointer; weight:1850px; height:470px;">
                        </div>
                    </div>
                    <!-- Item-->
                    <div>
                        <div class="card border-0 bg-size-cover pt-5" onclick="location.href=<%=path%>/showDetail?showId=PF194882" style="background-image: url(<%=path%>/resources/images/perform/perform2-3.png); cursor:pointer; weight:1850px; height:470px;">
                        </div>
                    </div>
                </div>
        </section>
        <!-- @@@@ 이달의공연 body 수정본 끝 @@@@ -->


    <!--@@@@@@@@@@@@@@@@@@@@ RANKING body @@@@@@@@@@@@@@@@@@@@-->


    <!-- Content overlay on hover-->
    <section class="container mt-5 pb-lg-3">

        <div class="title1">공연 랭킹</div>
        <div class="tab-pane fade show active" id="result2" role="tabpanel" style="display: flex; justify-content:space-around">
        
            <!--@@ rank 1 @@-->
 			<a class="card shadow-sm card-hover border-0" href="/Show_20/showDetail?showId=PF189859" style="width: 400px; height: 480px; float: left;">
                <div class="card-img-top card-img-hover" style="background-image: url(http://www.kopis.or.kr/upload/pfmPoster/PF_PF189859_220421_102833.gif); background-size:cover; border-radius:0; height: 400px;"><span class="img-overlay opacity-65"></span><img src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF189859_220421_102833.gif" alt="" style="width:250px; padding-top:30px;">
                    <div class="content-overlay start-0 top-0 d-flex align-items-center justify-content-center w-100 h-100 p-3">
                        <button type="button" class="btn btn-outline-warning" style="width:200px; height:80px; font-size:20pt;">상세보기</button>
                    </div>
                    <div class="badge me-3" style="float:left; width:60px; height:60px; border-radius:0; background-color:#FDBC31; font-size:25pt; font-weight:bold; padding-left: 10px; color:#201627;">1위</div>
                </div>
                <div class="card-body text-center" style="text-align: center; py-0;padding-top: 10px; height:80px;">
                    <h3 class="mb-0 text-nav py-0">웃는 남자</h3>
                    <div class=" text-body fs-lg "><span class="me-2 pe-1 "><i class="fi-calendar-alt opacity-70 me-1 "></i>2022-12-23~2022-12-28</span></div>
                </div>
            </a>
          
           
            <!--@@ rank 1 End@@-->
            <!--@@ rank 2 @@-->
           <a class="card shadow-sm card-hover border-0" href="/Show_20/showDetail?showId=PF191728" style="width: 400px; height: 480px; float: left; margin-left: 2%; margin-right: 2%;">
                <div class="card-img-top card-img-hover" style="background-image: url(http://www.kopis.or.kr/upload/pfmPoster/PF_PF191728_220526_093828.gif); background-size:cover; border-radius:0; height:400px;"><span class="img-overlay opacity-65"></span><img src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF191728_220526_093828.gif" alt="" style="width:250px; padding-top:30px;">
                    <div class="content-overlay start-0 top-0 d-flex align-items-center justify-content-center w-100 h-100 p-3">
                        <button type="button" class="btn btn-outline-warning" style="width:200px; height:80px; font-size:20pt;">상세보기</button>
                    </div>
                    <div class="badge me-3" style="float:left; width:60px; height:60px; border-radius:0; background-color:#FDBC31; font-size:25pt; font-weight:bold; padding-left: 5px; color:#201627;">2위</div>
                </div>
                <div class="card-body text-center" style="text-align: center; py-0;padding-top: 10px; height:80px;">
                    <h3 class="mb-0 text-nav py-0">데스노트</h3>
                    <div class="text-body fs-lg "><span class="me-2 pe-1 "><i class="fi-calendar-alt opacity-70 me-1 "></i>2022-12-23~2022-12-28</span></div>
                </div>
            </a>
            <!--@@ rank 2 End@@-->

            <!--@@ rank 3 @@-->
            <a class="card shadow-sm card-hover border-0 " href="/Show_20/showDetail?showId=PF191916" style="width: 400px; height: 480px; float: left; margin-right: 2%;">
               <div class="card-img-top card-img-hover" style="background-image: url(http://www.kopis.or.kr/upload/pfmPoster/PF_PF191916_220530_111000.gif); background-size:cover; border-radius:0; height:266px; height: 400px;"><span class="img-overlay opacity-65"></span><img src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF191916_220530_111000.gif" alt="" style="width:250px; padding-top:30px;">
                    <div class="content-overlay start-0 top-0 d-flex align-items-center justify-content-center w-100 h-100 p-3">
                        <button type="button" class="btn btn-outline-warning" style="width:200px; height:80px; font-size:20pt;">상세보기</button>
                    </div>
                    <div class="badge me-3" style="float:left; width:60px; height:60px; border-radius:0; background-color:#FDBC31; font-size:25pt; font-weight:bold; padding-left: 5px; color:#201627;">3위</div>
                </div>
                <div class="card-body text-center" style="text-align: center; py-0;padding-top: 10px; height:80px;">
                    <h3 class="mb-0 text-nav py-0">킹키부츠</h3>
                    <div class="text-body fs-lg"><span class="me-2 pe-1 "><i class="fi-calendar-alt opacity-70 me-1 "></i>2022-12-23~2022-12-28</span></div>
                </div>
            </a>
            <!--@@ rank 3 End@@-->
           
        </div>
    </section>

    <!--@@@@@@@@@@@@@@@@@@@@ RANKING body 끝 @@@@@@@@@@@@@@@@@@@@-->

    <!--@@@@@@@@@@@@@@@@@@@@ 전체 공연 body @@@@@@@@@@@@@@@@@@@@-->

    <section class="container mb-5 pb-lg-3">
        <div class="card-body px-0 mt-3" style=" margin: 0 auto;">
            <div class="title1">전체 공연</div>
            <div style="display:inline-block; margin-bottom: 25px;">
            	<a href="<%=path%>/showDetail?showId=<%=showList.get(0).getShow_id() %>" style="overflow: hidden;">
            	<div class="tab-content me-1" style="float: left;width:19%">
                <div class="tab-pane fade show active" id="result5" role="tabpanel">
                    <div class="card" style="height:430px;"><img class="card-img-top" style="height:327px;" src="<%=showList.get(0).getPoster() %>" alt="Card image">
                        <div class="card-body" style="height: 100px; padding: 10px; color: black;">
                            <div class="card-text fs-lg fw-bold" style="margin-bottom: 10px;"><%=showList.get(0).getPrfnm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(0).getFcltynm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(0).getPrfpdfrom() %>&nbsp;&nbsp; ~ &nbsp;&nbsp;<%=showList.get(0).getPrfpdto() %></div>
                        </div>
                    </div>
                </div>
            </div>
            </a>
           <a href="<%=path%>/showDetail?showId=<%=showList.get(1).getShow_id() %>" style="overflow: hidden;">
            	<div class="tab-content mx-1" style="float: left; width:19% ">
                <div class="tab-pane fade show active" id="result5" role="tabpanel">
                    <div class="card" style="height:430px;"><img class="card-img-top" style="height:327px;" src="<%=showList.get(1).getPoster() %>" alt="Card image">
                        <div class="card-body" style="height: 100px; padding: 10px; color: black;">
                            <div class="card-text fs-lg fw-bold" style="margin-bottom: 10px;"><%=showList.get(1).getPrfnm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(1).getFcltynm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(1).getPrfpdfrom() %>&nbsp;&nbsp; ~ &nbsp;&nbsp;<%=showList.get(1).getPrfpdto() %></div>
                        </div>
                    </div>
                </div>
            </div>
            </a>
            <a href="<%=path%>/showDetail?showId=<%=showList.get(2).getShow_id() %>" style="overflow: hidden;">
            	<div class="tab-content mx-1" style="float: left; width:19% ">
                <div class="tab-pane fade show active" id="result5" role="tabpanel">
                    <div class="card" style="height:430px;"><img class="card-img-top" style="height:327px;" src="<%=showList.get(2).getPoster() %>" alt="Card image">
                        <div class="card-body" style="height: 100px; padding: 10px; color: black;">
                            <div class="card-text fs-lg fw-bold" style="margin-bottom: 10px;"><%=showList.get(2).getPrfnm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(2).getFcltynm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(2).getPrfpdfrom() %>&nbsp;&nbsp; ~ &nbsp;&nbsp;<%=showList.get(2).getPrfpdto() %></div>
                        </div>
                    </div>
                </div>
            </div>
            </a>
            <a href="<%=path%>/showDetail?showId=<%=showList.get(3).getShow_id() %>" style="overflow: hidden;">
            	<div class="tab-content mx-1" style="float: left; width:19% ">
                <div class="tab-pane fade show active" id="result5" role="tabpanel">
                    <div class="card" style="height:430px;"><img class="card-img-top" style="height:327px;" src="<%=showList.get(3).getPoster() %>" alt="Card image">
                        <div class="card-body" style="height: 100px; padding: 10px; color: black;">
                           <div class="card-text fs-lg fw-bold" style="margin-bottom: 10px;"><%=showList.get(3).getPrfnm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(3).getFcltynm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(3).getPrfpdfrom() %>&nbsp;&nbsp; ~ &nbsp;&nbsp;<%=showList.get(3).getPrfpdto() %></div>
                        </div>
                    </div>
                </div>
            </div>	
            </a>
           <a href="<%=path%>/showDetail?showId=<%=showList.get(4).getShow_id() %>" style="overflow: hidden;">
            	<div class="tab-content mx-1 me-0" style="float: left; width:19% ">
                <div class="tab-pane fade show active" id="result5" role="tabpanel">
                    <div class="card" style="height:430px;"><img class="card-img-top" style="height:327px;" src="<%=showList.get(4).getPoster() %>" alt="Card image">
                        <div class="card-body" style="height: 100px; padding: 10px; color: black;">
                            <div class="card-text fs-lg fw-bold" style="margin-bottom: 10px;"><%=showList.get(4).getPrfnm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(4).getFcltynm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(4).getPrfpdfrom() %>&nbsp;&nbsp; ~ &nbsp;&nbsp;<%=showList.get(4).getPrfpdto() %></div>
                        </div>
                    </div>
                </div>
            </div>
            </a>
            </div>
          		<div style="display:inline-block;">
          	<a href="<%=path%>/showDetail?showId=<%=showList.get(5).getShow_id() %>" style="overflow: hidden;">
          		<div class="tab-content me-1" style="float: left; width:19% ">
                <div class="tab-pane fade show active" id="result5" role="tabpanel">
                    <div class="card" style="height:430px;"><img class="card-img-top" style="height:327px;" src="<%=showList.get(5).getPoster() %>" alt="Card image">
                        <div class="card-body" style="height: 100px; padding: 10px; color: black;">
                            <div class="card-text fs-lg fw-bold" style="margin-bottom: 10px;"><%=showList.get(5).getPrfnm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(5).getFcltynm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(5).getPrfpdfrom() %>&nbsp;&nbsp; ~ &nbsp;&nbsp;<%=showList.get(5).getPrfpdto() %></div>
                        </div>
                    </div>
                </div>
            </div>
          	</a>
            <a href="<%=path%>/showDetail?showId=<%=showList.get(6).getShow_id() %>" style="overflow: hidden;">
            	<div class="tab-content mx-1" style="float: left; width:19%">
                <div class="tab-pane fade show active" id="result5" role="tabpanel">
                    <div class="card" style="height:430px;"><img class="card-img-top" style="height:327px;" src="<%=showList.get(6).getPoster() %>" alt="Card image">
                        <div class="card-body" style="height: 100px; padding: 10px; color: black;">
                            <div class="card-text fs-lg fw-bold" style="margin-bottom: 10px;"><%=showList.get(6).getPrfnm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(6).getFcltynm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(6).getPrfpdfrom() %>&nbsp;&nbsp; ~ &nbsp;&nbsp;<%=showList.get(6).getPrfpdto() %></div>
                        </div>
                    </div>
                </div>
            </div>
            </a>
         <a href="<%=path%>/showDetail?showId=<%=showList.get(7).getShow_id() %>" style="overflow: hidden;">
            	<div class="tab-content mx-1" style="float: left; width:19% ">
                <div class="tab-pane fade show active" id="result5" role="tabpanel">
                    <div class="card" style="height:430px;"><img class="card-img-top" style="height:327px;" src="<%=showList.get(7).getPoster() %>" alt="Card image">
                        <div class="card-body" style="height: 100px; padding: 10px; color: black;">
                            <div class="card-text fs-lg fw-bold" style="margin-bottom: 10px;"><%=showList.get(7).getPrfnm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(7).getFcltynm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(7).getPrfpdfrom() %>&nbsp;&nbsp; ~ &nbsp;&nbsp;<%=showList.get(7).getPrfpdto() %></div>
                        </div>
                    </div>
                </div>
            </div>
            </a>
            <a href="<%=path%>/showDetail?showId=<%=showList.get(8).getShow_id() %>" style="overflow: hidden;">
            	<div class="tab-content mx-1" style="float: left; width:19% ">
                <div class="tab-pane fade show active" id="result5" role="tabpanel">
                    <div class="card" style="height:430px;"><img class="card-img-top" style="height:327px;" src="<%=showList.get(8).getPoster() %>" alt="Card image">
                        <div class="card-body" style="height: 100px; padding: 10px; color: black;">
                            <div class="card-text fs-lg fw-bold" style="margin-bottom: 10px;"><%=showList.get(8).getPrfnm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(8).getFcltynm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(8).getPrfpdfrom() %>&nbsp;&nbsp; ~ &nbsp;&nbsp;<%=showList.get(8).getPrfpdto() %></div>
                        </div>
                    </div>
                </div>
            </div>
            </a>
            <a href="<%=path%>/showDetail?showId=<%=showList.get(9).getShow_id() %>" style="overflow: hidden;">
            	<div class="tab-content mx-1 me-0" style="float: left; width:19% ">
                <div class="tab-pane fade show active" id="result5" role="tabpanel">
                    <div class="card" style="height:430px;"><img class="card-img-top" style="height:327px;" src="<%=showList.get(9).getPoster() %>" alt="Card image">
                       <div class="card-body" style="height: 100px; padding: 10px; color: black;">
                            <div class="card-text fs-lg fw-bold" style="margin-bottom: 10px;"><%=showList.get(9).getPrfnm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(9).getFcltynm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(9).getPrfpdfrom() %>&nbsp;&nbsp; ~ &nbsp;&nbsp;<%=showList.get(9).getPrfpdto() %></div>
                        </div>
                    </div>
                </div>
            </div>
            </a>
          	</div>
          	</div>
    </section>
    <!--@@@@@@@@@@@@@@@@@@@@ 전체 공연 body 끝 @@@@@@@@@@@@@@@@@@@@-->
    <script>
        	$(document).ready(function() {
        		// 기간 on 변경
        		var rad_date = '${rad_date}';
        		$("'input:radio[name=rad_date]'").attr("checked", false);	// 선택	
        		$("'input:radio[name=rad_date]:input[value='rad_" + rad_date + "']").attr("checked", true);	// 선택
        	});
        	
        	function radDate(range) {
        		var endDay = new Date();
        		var startDay = "";
        		if(range == 'day') {
        			startDay = new Date(endDay);
        			startDay = dateFormat(startDay);
        		}
        		if(range == 'week') {
        			startDay = lastWeek();
        		}
        		if(range == 'month') {
        			startDay = lastMonth();
        		}
        		console.log(startDay);
        		console.log(dateFormat(endDay));
        		
        		$('.input-group .startDate').val(startDay);
        		$('.input-group .endDate').val(dateFormat(endDay));

        		
        		function lastWeek() {
                    var d = new Date(endDay);
                    var day = d.getDate();
                    d.setDate(day - 6);
                    return dateFormat(d);
                }

                function lastMonth() {
                    var d = new Date(endDay);
                    var month = d.getMonth();
                    var day = d.getDate();
                    d.setMonth(month - 1);
                    return dateFormat(d);
                }
                
                function dateFormat(date) {
                    var yyyy = date.getFullYear();
                    var mm = date.getMonth() + 1;
                    mm = mm >= 10 ? mm : "0" + mm;
                    var dd = date.getDate();
                    dd = dd >= 10 ? dd : "0" + dd;
                    return yyyy + "-" + mm + "-" + dd;
                }
        	}
        </script>        
    
    <%@include file="/views/common/footer.jsp"%>