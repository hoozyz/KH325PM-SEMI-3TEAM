<%@page import="java.util.ArrayList"%>
<%@page import="vo.Show"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%
	String keyword = "";
	String category = "";
	String startDate = "";
	String endDate = "";
	String rad_date = "";
	
	if(request.getAttribute("rad_date") != null) {
		rad_date = (String)request.getAttribute("rad_date");
	}
	if(request.getAttribute("keyword") != null) {
		keyword = (String)request.getAttribute("keyword");
	}
	if(request.getAttribute("category") != null) {
		category = (String)request.getAttribute("category");
	}
	if(request.getAttribute("startDate") != null) {
		startDate = (String)request.getAttribute("startDate");
	}
	if(request.getAttribute("endDate") != null) {
		endDate = (String)request.getAttribute("endDate");
	}
	
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
	
	int count = 5;

%>

  <style>
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
        .cat {
            text-decoration-line: none;
            color: #D9E2F2;
            font-family: 'Gugi', cursive;
            font-size: 20pt;
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
        .text-dark{
            font-family: 'NanumSquareRound', sans-serif;
            font-size: 32px;
            font-weight: 800;
        }
         h4{
       	 font-weight: 500;
       	 line-height: 0.75;
       	 
       	 }
    </style>
 <!-- Page content-->
        <!--@@@@@@@@@ hero @@@@@@@@@-->
        <section class="container-fluid pt-1 mt-5 mb-3" style="height: 320px; background-image: url(<%=path%>/resources/images/performHeroBg.png);">
            <section class="container pt-0 mt-5 my-0 ">
                <div style="position:relative;">
                    <img src="<%=path %>/resources/images/music/musicHeroImg.png" alt="" style=" width:100%; position:relative;">
                    <div class="hero_category" style="position:absolute; top: 40%; left: 8%">
                        <a class="cat" href="<%=path%>/showSearch?category=클래식&rad_date=1개월&keyword=클래식">클래식&nbsp;</a>|
                        <a class="cat" href="<%=path%>/showSearch?category=국악&rad_date=1개월&keyword=국악">&nbsp;국악&nbsp;</a>|
                        <a class="cat" href="<%=path%>/showSearch?category=오페라&rad_date=1개월&keyword=오페라">&nbsp;오페라&nbsp;</a>
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
                        <input class="form-control date-picker startDate" type="text" name="startDate"placeholder="&nbsp;&nbsp;&nbsp;시작 날짜" style="font-size:23px; data-datepicker-options="{&quot;altInput&quot;: true, &quot;altFormat&quot;: &quot;F j, Y&quot;, &quot;dateFormat&quot;: &quot;Y-m-d&quot;}">
                        <span style="font-size: 45px;color: #7E6ECD; font-weight: 500;"> ~ </span>
                        <input class="form-control date-picker endDate" type="text" name="endDate" placeholder="&nbsp;&nbsp;&nbsp;마감 날짜" style="font-size:23px; data-datepicker-options="{&quot;altInput&quot;: true, &quot;altFormat&quot;: &quot;F j, Y&quot;, &quot;dateFormat&quot;: &quot;Y-m-d&quot;}">
                    </div>
                </div>
                <!-- calendar End-->
            </div>
            <div class="input-group input-group-lg border-end-md"><span class="input-group-text text-muted rounded-pill ps-3"><i class="fi-search"></i></span>
                <input class="form-control" type="text" name="keyword" placeholder="어떤 공연을 찾고 있나요?" style="font-size:30px;" value="<%=keyword %>">
            </div>
            <hr class="d-md-none my-2">
            <div class="d-sm-flex">
                <div class="dropdown w-100 mb-sm-0 mb-3" data-bs-toggle="select">
                    <button class="btn btn-link btn-lg dropdown-toggle ps-2 ps-sm-3" name="category" type="button" data-bs-toggle="dropdown" style="font-size:26px;"><i class="fi-list me-2"></i>
                    <span class="dropdown-toggle-label">
                    <%if (category != null) { %>
                    	<%=category%>
                    <% } else {%>
                    	카테고리
                    <% } %>
                    </span></button>
                    <input type="hidden" name="category">
                    <ul class="dropdown-menu" style="font-size:23px;">
                        <li><a class="dropdown-item" href="#"><i class="fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">클래식</span></a></li>
                        <li><a class="dropdown-item" href="#"><i class="fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">국악</span></a></li>
                        <li><a class="dropdown-item" href="#"><i class="fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">오페라</span></a></li>
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
        <section class="container py-1 mt-1 mb-1 ">
            <div display="inline-block;" style="text-align: center;background-color:#F2F2F2;margin-left: 3%;margin-right:3%;margin-bottom:0px;">
                <p style="font-size: 26pt;font-weight: bold;color: black;margin-bottom: 0px;">
                    '<span id="category_name" name="category_name"><%=keyword %></span>'에 대한 검색 결과입니다.
                </p>
            </div>
        </section>

        <!-- @@@ 검색결과 @@@ -->
        <section class="container mb-sm-5 pb-lg-4 ">
            <!-- Sorting-->
            <div class="d-flex flex-sm-row flex-column align-items-sm-center align-items-stretch my-4 ">
                <hr class="d-none d-sm-block w-100 mx-4 ">
                <div class="d-none d-sm-flex align-items-center flex-shrink-0 text-muted "><i class="fi-check-circle me-2 "></i>
                <span class="fs-sm mt-n1 ">
                <% if (showList != null) { %>
            	총 <%= showList.size()%>건
	            <% } else {%>
	            	총 0건
	            <% } %>
                </span>
                </div>
            </div>
            <!-- Item-->
            <!-- @@@ Card-1 @@@ -->
            <% if (showList.size() < 5) { %>
            	<% count = showList.size(); %>
            <% } %>
            <% for (int i = 0; i < count; i++) { %> <!-- 상위 5개만 -->
            <div class="card card-flush card-stretched-vertical " style="margin-bottom: 30px; ">
                <div class="row ">
                    <div class="col-sm-3 ">
                        <img class="card-img " src="<%=showList.get(i).getPoster() %>" alt="Image Description " id="music_id_5 " name="music_id_5 " style="width:200px; min-height : 282px; ">
                    </div>
                    <!-- End Col -->

                    <div class="col-sm-9">
                        <!-- Card Body -->
                        
                        <div class="card-body row " style="height:100%; ">
                        
                            <div>
                                <div style="width: 80%;float:left; ">
                                    <span class="badge bg-faded-primary "><%=showList.get(i).getGenrenm() %></span>
                                    <h3 class="card-title " style="margin-top: 1%;margin-bottom: 1%; ">
                                        <a class="text-dark " href="./blog-article.html " id="title_1 " name="title_1 " style="text-decoration: none; "><%=showList.get(i).getPrfnm() %></a>
                                    </h3>
                                </div>
                            </div>

                            <%-- <div class="musicInfo">
                                <p id="cost_1 " name="cost_1 " style="margin-bottom: 1%; "><%=showList.get(i).getPrfpdfrom() %>&nbsp~&nbsp<%=showList.get(i).getPrfpdto() %></p>
                                <div><a href="# " id="hall_info_1 " name="hall_info_1 " style="color: black;text-decoration: none; "><%=showList.get(i).getFcltynm() %></a></div>
                             
                                <a style="text-align: right; " class="btn btn-translucent-info rounded-pill px-3 " href="<%=path %>/showDetail?showId=<%=showList.get(i).getShow_id() %> " id="detail_1 " name="detail_1 ">공연 보러가기</a>
                            </div> --%>
                            
                            <div class="musicInfo">
                                    <p id="cost_2 " name="cost_2 "><h4><%=showList.get(i).getPrfpdfrom() %>&nbsp;&nbsp; ~ &nbsp;&nbsp;  <%=showList.get(i).getPrfpdfrom() %></h4></p>
                                    <div><h4><%=showList.get(i).getFcltynm() %>
                                    <a style="float: right;" class="btn btn-translucent-info rounded-pill px-3 " href="<%=path %>/showDetail?showId=<%=showList.get(i).getShow_id() %>" id="detail_2 " name="detail_2 ">공연 보러가기</a></h4></div>
                                </div>

                        </div>
                        
                        <!-- End Card Body -->
                    </div>
                    <!-- End Col -->
                </div>
                <!-- End Row -->
            </div>
            <% } %>
            <!-- @@@ Card-1 end @@@ -->
           	<script>
           	$('ul.period-ul li').find('a').click(function() {
    	        var on_id = $(this).attr('id');
    	
    	        // 클릭 시 버튼 바뀌는 jquery
    	        $('ul.period-ul li a').removeClass('on');
    	        $('ul.period-ul li').removeClass('on');
    	
    	        $(this).addClass('on');
    	        $("#" + on_id).addClass('on');
    	        
    	        var endDay = new Date();
    			var startDay = "";
    			if(on_id == 'day') {
    				startDay = new Date(endDay);
    				startDay = dateFormat(startDay);
    			}
    			if(on_id == 'week') {
    				startDay = lastWeek();
    			}
    			if(on_id == 'month') {
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
    	    });
        </script>   
<%@ include file="/views/common/footer.jsp"%>



