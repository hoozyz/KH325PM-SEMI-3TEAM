<%@page import="board.controller.PageInfo"%>
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
	
	PageInfo pageInfo = null;
	if(request.getAttribute("pageInfo") != null) {
		pageInfo = (PageInfo) request.getAttribute("pageInfo");
	}
	
%>
	<%@include file="/views/common/header.jsp"%>   
	
	<Style>
		.board-page>a {
	        display: inline-block;
	        width: 30px;
	        height: 30px;
	        color: #222;
	        line-height: 30px;
	        text-align: center;
	        background: #fff;
	        margin-right: 8px;
	        text-decoration: none;
	        cursor: pointer;
	    }
	    
	    .board-page>.page-on {
	        border: 1px solid #293243;
	        background: #222;
	        color: #fff;
	        cursor: pointer;
	    }
	    
	    .board-page>.page-prev {
	        background-color: #fff;
	    }
	    
	    .board-page>.page-next {
	        background-color: #fff;
	    }
	
        .title1 {
            font-family: 'NanumSquareRound', sans-serif;
            font-size: 50px;
            font-weight: 800;
            color: #201627;
        }
        
        .cat {
            text-decoration-line: none;
            color: #D9E2F2;
            font-family: 'Gugi', cursive;
            font-size: 20pt;
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
        .card-text {
           	font-family: 'NanumSquareRound', sans-serif;
	        overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;

             
        }
        *{
        font-family: 'NanumSquareRound', sans-serif;
        }
        
        
        
        
    </Style> 
	
	<!--@@@@@@@@@ hero @@@@@@@@@-->
     <section class="container-fluid pt-0 mt-5 mb-3" style="height: 350px; background-image: url(<%=path%>/resources/images/performHeroBg.png);">
        <section class="container pt-0 mt-5 my-0 ">
            <div style="position:relative;">
                <img src="<%=path%>/resources/img/myimg/perform1.png" alt="" style=" width:100%; height:280px; position:relative;">
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
        
        <!--@@@ search @@@-->
    <section class="container py-1 mt-1 mb-1 ">
        <form class="form-group d-block d-md-flex rounded-md-pill" style="width:85%;float:left; height:60pt;" method="GET" action="<%=path%>/showSearch">
            <div class="input-group input-group-lg border-end-md">
                <!--calendar-->
                <div class="mb-8">
                    <div class="input-group"><span class="input-group-text"><i class="fi-calendar"></i></span>
                        <input class="form-control date-picker startDate" type="text" name="startDate"placeholder="&nbsp;&nbsp;&nbsp;시작 날짜" style="font-size:21px; data-datepicker-options="{&quot;altInput&quot;: true, &quot;altFormat&quot;: &quot;F j, Y&quot;, &quot;dateFormat&quot;: &quot;Y-m-d&quot;}">
                        <span style="font-size: 45px;color: #7E6ECD; font-weight: 500;"> ~ </span>
                        <input class="form-control date-picker endDate" type="text" name="endDate" placeholder="&nbsp;&nbsp;&nbsp;마감 날짜" style="font-size:21px; data-datepicker-options="{&quot;altInput&quot;: true, &quot;altFormat&quot;: &quot;F j, Y&quot;, &quot;dateFormat&quot;: &quot;Y-m-d&quot;}">
                    </div>
                </div>
                <!-- calendar End-->
            </div>
            <div class="input-group input-group-lg border-end-md"><span class="input-group-text text-muted rounded-pill ps-3" style="font-size:25px;"><i class="fi-search"></i></span>
                <input class="form-control" type="text" name="keyword" placeholder="어떤 공연을 찾고 있나요?" style="font-size:25px;">
            </div>
            <hr class="d-md-none my-2">
            <div class="d-sm-flex">
                <div class="dropdown w-100 mb-sm-0 mb-3" data-bs-toggle="select">
                    <button class="btn btn-link btn-lg dropdown-toggle ps-2 ps-sm-3" type="button" data-bs-toggle="dropdown" style="font-size:26px;"><i class="fi-list me-2"></i>
                    <span class="dropdown-toggle-label">
                    <%if (category != null) { %>
                    	<%=category%>
                    	</span></button>
                    	<input type="hidden" name="category" value="<%=category%>">
                    <% } else {%>
                    	카테고리
                   	 	</span></button>
                    	<input type="hidden" name="category">
                    <% } %>
                    <input type="hidden" name="category">
                    <ul class="dropdown-menu" style="font-size:23px;">
                        <li><a class="dropdown-item" href="#"><i class="fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">연극</span></a></li>
                        <li><a class="dropdown-item" href="#"><i class="fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">뮤지컬</span></a></li>
                        <li><a class="dropdown-item" href="#"><i class="fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">무용</span></a></li>
                        <li><a class="dropdown-item" href="#"><i class="fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">복합</span></a></li>
                    </ul>
                </div>
                <input class="btn btn-info btn-lg rounded-pill w-100 w-md-auto ms-sm-3" type="submit" value="검색" style="background-color:#0B398E; border:none; font-size:27px;"/>
            </div>
        </form>
        	<div class="position-relative" style="position: relative; display:inline-block; width:15%;height:80px;float:right;">
                    <ul class="period-ul" style="padding-left: 5px;width: 255px;margin-top: 30px;margin-left: 10px;">
                        <li class="on">
                            <a href="#n" id="day" class="on">오늘</a>
                        </li>
                        <li class>
                            <a href="#n" id="week" class >1주</a>
                        </li>
                        <li class>
                            <a href="#n" id="month" class>1개월</a>
                        </li>
                    </ul>
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
 			<a class="card shadow-sm card-hover border-0" href="<%=path %>/showDetail?showId=PF189859" style="width: 400px; height: 480px; float: left;">
                <div class="card-img-top card-img-hover" style="background-image: url(resources/images/showRank1.gif); background-size:cover; border-radius:0; height: 400px;"><span class="img-overlay opacity-65"></span><img src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF189859_220421_102833.gif" alt="" style="width:250px; padding-top:30px;">
                    <div class="content-overlay start-0 top-0 d-flex align-items-center justify-content-center w-100 h-100 p-3">
                        <button type="button" class="btn btn-outline-warning" style="width:200px; height:80px; font-size:20pt;">상세보기</button>
                    </div>
                    <div class="badge me-3 m-1" style="float:left; width:60px; height:60px; border-radius:40%; border-top-left-radius:0; background-color:#EF5B5B; font-size:28pt; font-weight:800; padding-left: 15px; color:#ffffff;">1</div>
                </div>
                <div class="card-body text-center" style="text-align: center; py-0;padding-top: 10px; height:80px;">
                    <h3 class="mb-0 text-nav py-0">웃는 남자</h3>
                    <div class=" text-body fs-lg "><span class="me-2 pe-1 "><i class="fi-calendar-alt opacity-70 me-1 "></i>2022.06.10 ~ 2022.08.22</span></div>
                </div>
            </a>
          
           
            <!--@@ rank 1 End@@-->
            <!--@@ rank 2 @@-->
           <a class="card shadow-sm card-hover border-0" href="<%=path %>/showDetail?showId=PF191728" style="width: 400px; height: 480px; float: left; margin-left: 2%; margin-right: 2%;">
                <div class="card-img-top card-img-hover" style="background-image: url(resources/images/showRank2.gif); background-size:cover; border-radius:0; height:400px;"><span class="img-overlay opacity-65"></span><img src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF191728_220526_093828.gif" alt="" style="width:250px; padding-top:30px;">
                    <div class="content-overlay start-0 top-0 d-flex align-items-center justify-content-center w-100 h-100 p-3">
                        <button type="button" class="btn btn-outline-warning" style="width:200px; height:80px; font-size:20pt;">상세보기</button>
                    </div>
                    <div class="badge me-3 m-1" style="float:left; width:60px; height:60px; border-radius:40%; border-top-left-radius:0; background-color:#EF5B5B; font-size:28pt; font-weight:800; padding-left: 17px; color:#ffffff;">2</div>
                </div>
                <div class="card-body text-center" style="text-align: center; py-0;padding-top: 10px; height:80px;">
                    <h3 class="mb-0 text-nav py-0">데스노트</h3>
                    <div class="text-body fs-lg "><span class="me-2 pe-1 "><i class="fi-calendar-alt opacity-70 me-1 "></i>2022.07.01 ~ 2022.08.14</span></div>
                </div>
            </a>
            <!--@@ rank 2 End@@-->

            <!--@@ rank 3 @@-->
            <a class="card shadow-sm card-hover border-0 " href="<%=path %>/showDetail?showId=PF191916" style="width: 400px; height: 480px; float: left; margin-right: 2%;">
               <div class="card-img-top card-img-hover" style="background-image: url(resources/images/showRank3.gif); background-size:cover; border-radius:0; height:266px; height: 400px;"><span class="img-overlay opacity-65"></span><img src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF191916_220530_111000.gif" alt="" style="width:250px; padding-top:30px;">
                    <div class="content-overlay start-0 top-0 d-flex align-items-center justify-content-center w-100 h-100 p-3">
                        <button type="button" class="btn btn-outline-warning" style="width:200px; height:80px; font-size:20pt;">상세보기</button>
                    </div>
                    <div class="badge me-3 m-1" style="float:left; width:60px; height:60px; border-radius:40%; border-top-left-radius:0; background-color:#EF5B5B; font-size:28pt; font-weight:800; padding-left: 17px; color:#ffffff;">3</div>
                </div>
                <div class="card-body text-center" style="text-align: center; py-0;padding-top: 10px; height:80px;">
                    <h3 class="mb-0 text-nav py-0">킹키부츠</h3>
                    <div class="text-body fs-lg"><span class="me-2 pe-1 "><i class="fi-calendar-alt opacity-70 me-1 "></i>2022.07.20 ~ 2022.10.23</span></div>
                </div>
            </a>
            <!--@@ rank 3 End@@-->
           
        </div>
    </section>

    <!--@@@@@@@@@@@@@@@@@@@@ RANKING body 끝 @@@@@@@@@@@@@@@@@@@@-->

    <!--@@@@@@@@@@@@@@@@@@@@ 전체 공연 body @@@@@@@@@@@@@@@@@@@@-->

    <section class="container mb-5 pb-lg-3">
        <div class="card-body px-0 mt-3 allShow" style=" margin: 0 auto;">
            <div class="title1">전체 공연</div>
            <div style="display:inline-block; margin-bottom: 25px;  width:1266px;">
            	<a href="<%=path%>/showDetail?showId=<%=showList.get(0).getShow_id() %>" style="overflow: hidden;">
            	<div class="tab-content me-1" style="float: left;width:19%">
                <div class="tab-pane fade show active" id="result5" role="tabpanel">
                    <div class="card" style="height:430px; width: 246px;"><img class="card-img-top" style="height:327px;" src="<%=showList.get(0).getPoster() %>" alt="Card image">
                        <div class="card-body" style="height: 100px; padding: 10px; color: black;">
                            <div class="card-text fs-lg fw-bold" style="margin-bottom: 10px;"><%=showList.get(0).getPrfnm() %></div>
                            <div class="card-text fs"><%=showList.get(0).getFcltynm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(0).getPrfpdfrom() %>&nbsp;&nbsp; ~ &nbsp;&nbsp;<%=showList.get(0).getPrfpdto() %></div>
                        </div>
                    </div>
                </div>
            </div>
            </a>
           <a href="<%=path%>/showDetail?showId=<%=showList.get(1).getShow_id() %>" style="overflow: hidden;">
            	<div class="tab-content mx-1" style="float: left; width:19% ">
                <div class="tab-pane fade show active" id="result5" role="tabpanel">
                    <div class="card" style="height:430px; width: 246px;"><img class="card-img-top" style="height:327px;" src="<%=showList.get(1).getPoster() %>" alt="Card image">
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
                    <div class="card" style="height:430px; width: 246px;"><img class="card-img-top" style="height:327px;" src="<%=showList.get(2).getPoster() %>" alt="Card image">
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
                    <div class="card" style="height:430px; width: 246px;"><img class="card-img-top" style="height:327px;" src="<%=showList.get(3).getPoster() %>" alt="Card image">
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
                    <div class="card" style="height:430px; width: 246px;"><img class="card-img-top" style="height:327px;" src="<%=showList.get(4).getPoster() %>" alt="Card image">
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
          	<div style="display:inline-block; width:1266px;">
          	<a href="<%=path%>/showDetail?showId=<%=showList.get(5).getShow_id() %>" style="overflow: hidden;">
          		<div class="tab-content me-1" style="float: left; width:19% ">
                <div class="tab-pane fade show active" id="result5" role="tabpanel">
                    <div class="card" style="height:430px; width: 246px;"><img class="card-img-top" style="height:327px;" src="<%=showList.get(5).getPoster() %>" alt="Card image">
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
                    <div class="card" style="height:430px; width: 246px;"><img class="card-img-top" style="height:327px;" src="<%=showList.get(6).getPoster() %>" alt="Card image">
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
                    <div class="card" style="height:430px; width: 246px;"><img class="card-img-top" style="height:327px;" src="<%=showList.get(7).getPoster() %>" alt="Card image">
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
                    <div class="card" style="height:430px; width: 246px;"><img class="card-img-top" style="height:327px;" src="<%=showList.get(8).getPoster() %>" alt="Card image">
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
                    <div class="card" style="height:430px; width: 246px;"><img class="card-img-top" style="height:327px;" src="<%=showList.get(9).getPoster() %>" alt="Card image">
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
          
          <div class="board-bottom" style="width:1300px; margin: 0 auto; padding-top: 25px;">
                <div class="board-page" style="text-align: center;">
	                <% for (int i = pageInfo.getStartPage(); i <= pageInfo.getEndPage(); i++) { %>
	                	<% if (i == pageInfo.getCurrentPage()) { %>
	                		<a class="page-on" id="page(<%=i %>)" onclick="goPage(<%=i %>, '<%=category %>'); return false;"><%=i %></a>
	                	<% } else {%>
	                		<a class="page" id="page(<%=i %>)" onclick="goPage(<%=i %>, '<%=category %>'); return false;"><%=i %></a>
	                	<% } %>
	                <% } %>
	                <a class="page-next" onclick="goPage(<%=pageInfo.getNextPage() %>, '<%=category %>'); return false;"><i class="fi-chevron-right align-middle"></i></a>
	                <a class="page-end" onclick="goPage(<%=pageInfo.getMaxPage() %>, '<%=category %>'); return false;"><i class="fi-chevrons-right align-middle"></i></a>
                </div>
            </div>
    </section>
    <!--@@@@@@@@@@@@@@@@@@@@ 전체 공연 body 끝 @@@@@@@@@@@@@@@@@@@@-->
    <script>
	    function goPage(pageNo, category) {
	 		$.ajax({
	 			url: "<%=path%>/showMain",
	 			type: "POST",
	 			dataType: "text",
	 			data: { "pageNo" : pageNo , "category" : category },
	 			progress: true,
	 			
	 			// 성공시
	     		success: function(list) {
	     			data = JSON.parse(list);
	     			var str = "";
	     			var up = "'";
	     			
	     			var url = "<%=path%>/showDetail?showId=";
	     			console.log(data)
	     			
	     			str += '<div class="title1">전체 공연</div>'
	     			str += '<div style="display:inline-block; margin-bottom: 25px; width:1266px;">'
	     			
	     			$.each(data, (i, obj) => {
	     				if(i == 0 || i == 1 || i == 2 || i == 3) {
	     					str += '<a href="'+ url + obj.show_id +'" style="overflow: hidden;">'
		     			    str += ' <div class="tab-content mx-1" style="float: left; width:19% ">'
		     			    str += '   <div class="tab-pane fade show active" id="result5" role="tabpanel">'
		     			    str += '  <div class="card" style="height:430px; width: 246px;"><img class="card-img-top" style="height:327px;" src="'+ obj.poster +'" alt="Card image">'
		     			    str += ' <div class="card-body" style="height: 100px; padding: 10px; color: black;">'
		     			    str += '  <div class="card-text fs-lg fw-bold" style="margin-bottom: 10px;">'+ obj.prfnm +'</div>'
		     			    str += '  <div class="card-text fs-sm">'+ obj.fcltynm +'</div>'
		     				str += '  <div class="card-text fs-sm">'+obj.prfpdfrom + '~' + obj.prfpdto +'</div>'
		     				str += ' </div></div></div></div></a>'
	     				}
	     				if(i == 4) {
	     					str += '<a href="'+ url + obj.show_id +'" style="overflow: hidden;">'
		     			    str += ' <div class="tab-content mx-1 me-0" style="float: left; width:19% ">'
		     			    str += '   <div class="tab-pane fade show active" id="result5" role="tabpanel">'
		     			    str += '  <div class="card" style="height:430px; width: 246px;"><img class="card-img-top" style="height:327px;" src="'+ obj.poster +'" alt="Card image">'
		     			    str += ' <div class="card-body" style="height: 100px; padding: 10px; color: black;">'
		     			    str += '  <div class="card-text fs-lg fw-bold" style="margin-bottom: 10px;">'+ obj.prfnm +'</div>'
		     			    str += '  <div class="card-text fs-sm">'+ obj.fcltynm +'</div>'
		     				str += '  <div class="card-text fs-sm">'+obj.prfpdfrom + '~' + obj.prfpdto +'</div>'
		     				str += ' </div></div></div></div></a>'
	     					str += '</div>'
	     					str += '<div style="display:inline-block; width:1266px;">'
	     				}
	     				if(i == 5 || i == 6 || i == 7 || i == 8) {
	     					str += '<a href="'+ url + obj.show_id +'" style="overflow: hidden;">'
		     			    str += ' <div class="tab-content mx-1" style="float: left; width:19% ">'
		     			    str += '   <div class="tab-pane fade show active" id="result5" role="tabpanel">'
		     			    str += '  <div class="card" style="height:430px; width: 246px;"><img class="card-img-top" style="height:327px;" src="'+ obj.poster +'" alt="Card image">'
		     			    str += ' <div class="card-body" style="height: 100px; padding: 10px; color: black;">'
		     			    str += '  <div class="card-text fs-lg fw-bold" style="margin-bottom: 10px;">'+ obj.prfnm +'</div>'
		     			    str += '  <div class="card-text fs-sm">'+ obj.fcltynm +'</div>'
		     				str += '  <div class="card-text fs-sm">'+obj.prfpdfrom + '~' + obj.prfpdto +'</div>'
		     				str += ' </div></div></div></div></a>'
	     				}
	     				if(i == 9) {
	     					str += '<a href="'+ url + obj.show_id +'" style="overflow: hidden;">'
		     			    str += ' <div class="tab-content mx-1 me-0" style="float: left; width:19% ">'
		     			    str += '   <div class="tab-pane fade show active" id="result5" role="tabpanel">'
		     			    str += '  <div class="card" style="height:430px; width: 246px;"><img class="card-img-top" style="height:327px;" src="'+ obj.poster +'" alt="Card image">'
		     			    str += ' <div class="card-body" style="height: 100px; padding: 10px; color: black;">'
		     			    str += '  <div class="card-text fs-lg fw-bold" style="margin-bottom: 10px;">'+ obj.prfnm +'</div>'
		     			    str += '  <div class="card-text fs-sm">'+ obj.fcltynm +'</div>'
		     				str += '  <div class="card-text fs-sm">'+obj.prfpdfrom + '~' + obj.prfpdto +'</div>'
		     				str += ' </div></div></div></div></a>'
	  		   				str += '</div>'
	     				}
	     			}); 
	     			
	     			$('.allShow').html(str);
	
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
 	            		str += '<a class="page-first" onclick="goPage(1'+ ',' + up + category + up + '); return false;"><i class="fi-chevrons-left align-middle"></i></a>';
 	            		str += '<a class="page-prev" onclick="goPage('+ prevPage + ',' + up + category + up + '); return false;"><i class="fi-chevron-left align-middle"></i></a>';
 	            	}
 	
 	            	for (var i = startPage; i <= endPage; i++) { // 페이지 5개마다 페이지 바뀜
 	            		if(i == currentPage) {
 	            			str += '<a class="page-on" id="page('+ i +')" onclick="goPage('+ i + ',' + up + category + up + '); return false;">'+ i +'</a>';
 	            		} else {
 	            			str += '<a class="page" id="page'+ i +'" onclick="goPage('+ i + ',' + up + category + up + '); return false;">'+ i +'</a>';
 	            		}
 	            	}
 	
 	            	if(currentPage != maxPage) {
 	            		str += '<a class="page-next" onclick="goPage('+ nextPage + ',' + up + category + up + '); return false;"><i class="fi-chevron-right align-middle"></i></a>';
 	            		str += '<a class="page-end" onclick="goPage('+ maxPage + ',' + up + category + up + '); return false;"><i class="fi-chevrons-right align-middle"></i></a>';
 	            	}
	     			
	     			$('.board-page').html(str);
	     			
	     		},	
	 			
	 			error: function(e) {
	     			console.log(e);
	     		}
	 		})
	 	};
    
	    $('ul.period-ul li').find('a').click(function() {
	        var on_id = $(this).attr('id');
	
	        // 클릭 시 버튼 바뀌는 jquery
	        $('ul.period-ul li a').removeClass('on');
	        $('ul.period-ul li').removeClass('on');
	
	        $(this).addClass('on');
	        $("#" + on_id).addClass('on');
	        
	        var startDay = new Date();
			var endDay = "";
			if(on_id == 'day') {
				endDay = new Date(startDay);
				endDay = dateFormat(endDay);
			}
			if(on_id == 'week') {
				endDay = nextWeek();
			}
			if(on_id == 'month') {
				endDay = nextMonth();
			}
			
			$('.input-group .startDate').val(dateFormat(startDay));
			$('.input-group .endDate').val(endDay);
	
			
			function nextWeek() {
	            var d = new Date(startDay);
	            var day = d.getDate();
	            d.setDate(day + 6);
	            return dateFormat(d);
	        }
	
	        function nextMonth() {
	            var d = new Date(startDay);
	            var month = d.getMonth();
	            var day = d.getDate();
	            d.setMonth(month + 1);
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
	    });
	    </script>        
    
    <%@include file="/views/common/footer.jsp"%>