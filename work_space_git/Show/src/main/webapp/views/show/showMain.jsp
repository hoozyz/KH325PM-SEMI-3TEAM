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
            font-size: 35pt;
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
    <section class="container pt-5 mt-5 mb-3 ">
        <div style="position:relative;">
            <img src="<%=path %>/resources/img/myimg/perform1.png" alt="" style=" width:100%; position:relative;">
            <div class="hero_category" style="position:absolute; top: 40%; left: 8%">
                <a class="cat" href="#">연극&nbsp</a>|
                <a class="cat" href="#">&nbsp뮤지컬&nbsp</a>|
                <a class="cat" href="#">&nbsp무용&nbsp</a>|
                <a class="cat" href="#">&nbsp복합&nbsp</a>
            </div>
        </div>
    </section>
    <!--@@@ hero End @@@-->
    
    <section class="container py-1 mt-1 mb-1 ">
        <form class="form-group d-block d-md-flex rounded-md-pill" style="width:85%;float:left;">
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
                <input class="form-control" name="keyword" type="text" placeholder="What are you looking for?" value="<%=keyword%>">
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
                    <input type="hidden">
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#"><i class="fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">연극</span></a></li>
                        <li><a class="dropdown-item" href="#"><i class="fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">뮤지컬</span></a></li>
                        <li><a class="dropdown-item" href="#"><i class="fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">무용</span></a></li>
                        <li><a class="dropdown-item" href="#"><i class="fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">복합</span></a></li>
                    </ul>
                </div>
                <input class="btn btn-primary btn-lg rounded-pill w-100 w-md-auto ms-sm-3" type="submit" value="Search">
            </div>
        </form>
        <div class="position-relative" style="width:15%;height:80px;float:right; padding-top: 3%; padding-left: 3%;">
            <input type="radio" name="rad_date" id="rad_day" value="rad_day">오늘&nbsp
            <input type="radio" name="rad_date" id="rad_week" value="rad_week">1주&nbsp
            <input type="radio" name="rad_date" id="rad_month" value="rad_month" checked>1개월&nbsp
        </div>
    </section>
    <!--@@@ search End @@@-->

    <!--@@@@@@@@@@@@@@@@ 이달의 공연 body @@@@@@@@@@@@@@@@@@-->
    <section class="container mt-5 pb-lg-3">
        <div class="monthperform" style="margin: 0 auto;">
            <div class="title1">이달의 공연</div>
            <div class="tns-carousel-wrapper">
                <div class="tns-carousel-inner" data-carousel-options="{&quot;gutter&quot;: 16}"><img src="<%=path %>/resources/images/perform/perform2-1.png" alt="Image"><img src="<%=path %>/resources/images/perform/perform2-2.png" alt="Image"><img src="<%=path %>/resources/images/perform/perform2-3.png" alt="Image"></div>
            </div>
        </div>
    </section>
    <!--@@@@@@@@@@@@@@@@ 이달의 공연 body 끝@@@@@@@@@@@@@@@@@@-->


    <!--@@@@@@@@@@@@@@@@@@@@ RANKING body @@@@@@@@@@@@@@@@@@@@-->


    <!-- Content overlay on hover-->
    <section class="container mt-5 pb-lg-3">

        <div class="title1">공연 랭킹</div>
        <div class="tab-pane fade show active" id="result2" role="tabpanel" style="display: flex;">
            <!--@@ rank 1 @@-->
            <a class="card shadow-sm card-hover border-0" href="<%=path%>/showDetail?showId=<%=rankList.get(0).getShow_id()%>" style="max-width: 306px; float: left;">
                <div class="card-img-top card-img-hover" style="background-image: url(http://www.kopis.or.kr<%=rankList.get(0).getPoster() %>); text-align: center;"><span class="img-overlay opacity-65"></span><img class="bgBlur" src="http://www.kopis.or.kr<%=rankList.get(0).getPoster() %>" alt="" style="width:60%;">
                    <div class="content-overlay start-0 top-0 d-flex align-items-center justify-content-center w-100 h-100 p-3">
                        <button type="button" class="btn btn-warning">상세보기</button>
                    </div>
                    <div class="badge bg-warning me-2 mb-2" style="float:left;">1위</div>
                </div>
                <div class="card-body text-center" style="text-align: center;">
                    <h3 class="mb-0 fs-base text-nav "><%=rankList.get(0).getPrfnm() %></h3>
                    <div class="d-flex text-body fs-xs "><span class="genre " href=""><%=rankList.get(0).getCate() %>&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="me-2 pe-1 "><i class="fi-calendar-alt opacity-70 me-1 "></i><%=rankList.get(0).getPrfpd() %></span></div>
                </div>
            </a>
            <!--@@ rank 1 End@@-->

            <!--@@ rank 2 @@-->
           <a class="card shadow-sm card-hover border-0" href="<%=path%>/showDetail?showId=<%=rankList.get(1).getShow_id()%>" style="width: 306px; float: left; margin-left: 2%; margin-right: 2%;">
                <div class="card-img-top card-img-hover" style="background-image: url(http://www.kopis.or.kr<%=rankList.get(1).getPoster() %>); text-align: center;"><span class="img-overlay opacity-65"></span><img src="http://www.kopis.or.kr<%=rankList.get(1).getPoster() %>" alt="" style="width:60%;">
                    <div class="content-overlay start-0 top-0 d-flex align-items-center justify-content-center w-100 h-100 p-3">
                        <button type="button" class="btn btn-warning">상세보기</button>
                    </div>
                    <div class="badge bg-warning me-2 mb-2" style="float:left;">2위</div>
                </div>
                <div class="card-body text-center">
                    <h3 class="mb-0 fs-base text-nav "><%=rankList.get(1).getPrfnm() %></h3>
                    <div class="d-flex text-body fs-xs "><span class="genre " href="# "><%=rankList.get(1).getCate() %>&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="me-2 pe-1 "><i class="fi-calendar-alt opacity-70 me-1 "></i><%=rankList.get(1).getPrfpd() %></span></div>
                </div>
            </a>
            <!--@@ rank 2 End@@-->

            <!--@@ rank 3 @@-->
            <a class="card shadow-sm card-hover border-0 " href="<%=path%>/showDetail?showId=<%=rankList.get(2).getShow_id()%>" style="max-width: 306px; float: left; margin-right: 2%;">
                <div class="card-img-top card-img-hover " style="background-image: url(http://www.kopis.or.kr<%=rankList.get(2).getPoster() %>); height:255px; text-align: center; "><span class="img-overlay opacity-65 "></span><img src="http://www.kopis.or.kr<%=rankList.get(2).getPoster() %>" alt="
                                    " style="width:60%; ">
                    <div class="content-overlay start-0 top-0 d-flex align-items-center justify-content-center w-100 h-100 p-3">
                        <button type="button" class="btn btn-warning">상세보기</button>
                    </div>
                    <div class="badge bg-warning me-2 mb-2 " style="float:left; ">3위</div>
                </div>
                <div class="card-body text-center ">
                    <h3 class="mb-0 fs-base text-nav "><%=rankList.get(2).getPrfnm() %></h3>
                    <div class="d-flex text-body fs-xs "><span class="genre " href="# "><%=rankList.get(2).getCate() %>&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="me-2 pe-1 "><i class="fi-calendar-alt opacity-70 me-1 "></i><%=rankList.get(2).getPrfpd() %></span></div>
                </div>
            </a>
            <!--@@ rank 3 End@@-->
            <!--@@ rank 4 @@-->
           <a class="card shadow-sm card-hover border-0 " href="<%=path%>/showDetail?showId=<%=rankList.get(3).getShow_id()%>" style="max-width: 306px; float: left; ">
                <div class="card-img-top card-img-hover " style="background-image: url(http://www.kopis.or.kr<%=rankList.get(3).getPoster() %>); text-align: center; "><span class="img-overlay opacity-65 "></span><img src="http://www.kopis.or.kr<%=rankList.get(3).getPoster() %>" alt="
                                    " style="width:60%; ">
                    <div class="content-overlay start-0 top-0 d-flex align-items-center justify-content-center w-100 h-100 p-3">
                        <button type="button" class="btn btn-warning">상세보기</button>
                    </div>
                    <div class="badge bg-warning me-2 mb-2 " style="float:left; ">4위</div>
                </div>
                <div class="card-body text-center ">
                    <h3 class="mb-0 fs-base text-nav "><%=rankList.get(3).getPrfnm() %></h3>
                    <div class="d-flex text-body fs-xs "><span class="genre " href="# "><%=rankList.get(3).getCate() %>&nbsp;&nbsp;&nbsp;&nbsp;</span><span class="me-2 pe-1 "><i class="fi-calendar-alt opacity-70 me-1 "></i><%=rankList.get(3).getPrfpd() %></span></div>
                </div>
            </a>
            <!--@@ rank 4 End@@-->
        </div>
    </section>

    <!--@@@@@@@@@@@@@@@@@@@@ RANKING body 끝 @@@@@@@@@@@@@@@@@@@@-->

    <!--@@@@@@@@@@@@@@@@@@@@ 전체 공연 body @@@@@@@@@@@@@@@@@@@@-->

    <section class="container mb-5 pb-lg-3">
        <div class="card-body" style=" margin: 0 auto; padding: 3%;">
            <div class="title1">전체 공연</div>
            <div style="display:inline-block; height: 430px; margin-bottom: 25px;">
            	<a href="<%=path%>/showDetail?showId=<%=showList.get(0).getShow_id() %>" style="overflow: hidden;">
            	<div class="tab-content" style="float: left; margin: 5px 10px 5px 10px; width:18%">
                <div class="tab-pane fade show active" id="result5" role="tabpanel">
                    <div class="card" style="height:430px;"><img class="card-img-top" style="height:300px;" src="<%=showList.get(0).getPoster() %>" alt="Card image">
                        <div class="card-body" style="height: 100px; padding: 10px; color: black;">
                            <div class="card-text js-sm" style="margin-bottom: 10px;"><%=showList.get(0).getPrfnm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(0).getFcltynm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(0).getPrfpdfrom() %>&nbsp;&nbsp; ~ &nbsp;&nbsp;<%=showList.get(0).getPrfpdto() %></div>
                        </div>
                    </div>
                </div>
            </div>
            </a>
           <a href="<%=path%>/showDetail?showId=<%=showList.get(1).getShow_id() %>" style="overflow: hidden;">
            	<div class="tab-content" style="float: left; margin: 5px 10px 5px 10px; width:18% ">
                <div class="tab-pane fade show active" id="result5" role="tabpanel">
                    <div class="card" style="height:430px;"><img class="card-img-top" style="height:300px;" src="<%=showList.get(1).getPoster() %>" alt="Card image">
                        <div class="card-body" style="height: 100px; padding: 10px; color: black;">
                            <div class="card-text js-sm" style="margin-bottom: 10px;"><%=showList.get(1).getPrfnm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(1).getFcltynm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(1).getPrfpdfrom() %>&nbsp;&nbsp; ~ &nbsp;&nbsp;<%=showList.get(1).getPrfpdto() %></div>
                        </div>
                    </div>
                </div>
            </div>
            </a>
            <a href="<%=path%>/showDetail?showId=<%=showList.get(2).getShow_id() %>" style="overflow: hidden;">
            	<div class="tab-content" style="float: left; margin: 5px 10px 5px 10px; width:18% ">
                <div class="tab-pane fade show active" id="result5" role="tabpanel">
                    <div class="card" style="height:430px;"><img class="card-img-top" style="height:300px;" src="<%=showList.get(2).getPoster() %>" alt="Card image">
                        <div class="card-body" style="height: 100px; padding: 10px; color: black;">
                            <div class="card-text js-sm" style="margin-bottom: 10px;"><%=showList.get(2).getPrfnm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(2).getFcltynm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(2).getPrfpdfrom() %>&nbsp;&nbsp; ~ &nbsp;&nbsp;<%=showList.get(2).getPrfpdto() %></div>
                        </div>
                    </div>
                </div>
            </div>
            </a>
            <a href="<%=path%>/showDetail?showId=<%=showList.get(3).getShow_id() %>" style="overflow: hidden;">
            	<div class="tab-content" style="float: left; margin: 5px 10px 5px 10px; width:18% ">
                <div class="tab-pane fade show active" id="result5" role="tabpanel">
                    <div class="card" style="height:430px;"><img class="card-img-top" style="height:300px;" src="<%=showList.get(3).getPoster() %>" alt="Card image">
                        <div class="card-body" style="height: 100px; padding: 10px; color: black;">
                           <div class="card-text js-sm" style="margin-bottom: 10px;"><%=showList.get(3).getPrfnm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(3).getFcltynm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(3).getPrfpdfrom() %>&nbsp;&nbsp; ~ &nbsp;&nbsp;<%=showList.get(3).getPrfpdto() %></div>
                        </div>
                    </div>
                </div>
            </div>	
            </a>
           <a href="<%=path%>/showDetail?showId=<%=showList.get(4).getShow_id() %>" style="overflow: hidden;">
            	<div class="tab-content" style="float: left; margin: 5px 10px 5px 10px; width:18% ">
                <div class="tab-pane fade show active" id="result5" role="tabpanel">
                    <div class="card" style="height:430px;"><img class="card-img-top" style="height:300px;" src="<%=showList.get(4).getPoster() %>" alt="Card image">
                        <div class="card-body" style="height: 100px; padding: 10px; color: black;">
                            <div class="card-text js-sm" style="margin-bottom: 10px;"><%=showList.get(4).getPrfnm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(4).getFcltynm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(4).getPrfpdfrom() %>&nbsp;&nbsp; ~ &nbsp;&nbsp;<%=showList.get(4).getPrfpdto() %></div>
                        </div>
                    </div>
                </div>
            </div>
            </a>
            </div>
          	<a href="<%=path%>/showDetail?showId=<%=showList.get(5).getShow_id() %>" style="overflow: hidden;">
          		<div style="display:inline-block; height: 430px;">
          		<div class="tab-content" style="float: left; margin: 5px 10px 5px 10px; width:18% ">
                <div class="tab-pane fade show active" id="result5" role="tabpanel">
                    <div class="card" style="height:430px;"><img class="card-img-top" style="height:300px;" src="<%=showList.get(5).getPoster() %>" alt="Card image">
                        <div class="card-body" style="height: 100px; padding: 10px; color: black;">
                            <div class="card-text js-sm" style="margin-bottom: 10px;"><%=showList.get(5).getPrfnm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(5).getFcltynm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(5).getPrfpdfrom() %>&nbsp;&nbsp; ~ &nbsp;&nbsp;<%=showList.get(5).getPrfpdto() %></div>
                        </div>
                    </div>
                </div>
            </div>
          	</a>
            <a href="<%=path%>/showDetail?showId=<%=showList.get(6).getShow_id() %>" style="overflow: hidden;">
            	<div class="tab-content" style="float: left; margin: 5px 10px 5px 10px; width:18% ">
                <div class="tab-pane fade show active" id="result5" role="tabpanel">
                    <div class="card" style="height:430px;"><img class="card-img-top" style="height:300px;" src="<%=showList.get(6).getPoster() %>" alt="Card image">
                        <div class="card-body" style="height: 100px; padding: 10px; color: black;">
                            <div class="card-text js-sm" style="margin-bottom: 10px;"><%=showList.get(6).getPrfnm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(6).getFcltynm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(6).getPrfpdfrom() %>&nbsp;&nbsp; ~ &nbsp;&nbsp;<%=showList.get(6).getPrfpdto() %></div>
                        </div>
                    </div>
                </div>
            </div>
            </a>
         <a href="<%=path%>/showDetail?showId=<%=showList.get(7).getShow_id() %>" style="overflow: hidden;">
            	<div class="tab-content" style="float: left; margin: 5px 10px 5px 10px; width:18% ">
                <div class="tab-pane fade show active" id="result5" role="tabpanel">
                    <div class="card" style="height:430px;"><img class="card-img-top" style="height:300px;" src="<%=showList.get(7).getPoster() %>" alt="Card image">
                        <div class="card-body" style="height: 100px; padding: 10px; color: black;">
                            <div class="card-text js-sm" style="margin-bottom: 10px;"><%=showList.get(7).getPrfnm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(7).getFcltynm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(7).getPrfpdfrom() %>&nbsp;&nbsp; ~ &nbsp;&nbsp;<%=showList.get(7).getPrfpdto() %></div>
                        </div>
                    </div>
                </div>
            </div>
            </a>
            <a href="<%=path%>/showDetail?showId=<%=showList.get(8).getShow_id() %>" style="overflow: hidden;">
            	<div class="tab-content" style="float: left; margin: 5px 10px 5px 10px; width:18% ">
                <div class="tab-pane fade show active" id="result5" role="tabpanel">
                    <div class="card" style="height:430px;"><img class="card-img-top" style="height:300px;" src="<%=showList.get(8).getPoster() %>" alt="Card image">
                        <div class="card-body" style="height: 100px; padding: 10px; color: black;">
                            <div class="card-text js-sm" style="margin-bottom: 10px;"><%=showList.get(8).getPrfnm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(8).getFcltynm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(8).getPrfpdfrom() %>&nbsp;&nbsp; ~ &nbsp;&nbsp;<%=showList.get(8).getPrfpdto() %></div>
                        </div>
                    </div>
                </div>
            </div>
            </a>
            <a href="<%=path%>/showDetail?showId=<%=showList.get(9).getShow_id() %>" style="overflow: hidden;">
            	<div class="tab-content" style="float: left; margin: 5px 10px 5px 10px; width:18% ">
                <div class="tab-pane fade show active" id="result5" role="tabpanel">
                    <div class="card" style="height:430px;"><img class="card-img-top" style="height:300px;" src="<%=showList.get(9).getPoster() %>" alt="Card image">
                       <div class="card-body" style="height: 100px; padding: 10px; color: black;">
                            <div class="card-text js-sm" style="margin-bottom: 10px;"><%=showList.get(9).getPrfnm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(9).getFcltynm() %></div>
                            <div class="card-text fs-sm"><%=showList.get(9).getPrfpdfrom() %>&nbsp;&nbsp; ~ &nbsp;&nbsp;<%=showList.get(9).getPrfpdto() %></div>
                        </div>
                    </div>
                </div>
            </div>
            </a>
          	</div>
            </div>
        </div>
    </section>
    <!--@@@@@@@@@@@@@@@@@@@@ 전체 공연 body 끝 @@@@@@@@@@@@@@@@@@@@-->
    
    <%@include file="/views/common/footer.jsp"%>