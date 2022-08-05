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
 <!--@@@@@@@@@ hero @@@@@@@@@-->
    <section class="container-fluid pt-0 mt-5 mb-3" style="height: 350px; background-image: url(<%=path%>resources/images/performHeroBg.png);">
        <section class="container pt-0 mt-5 my-0 ">
            <div style="position:relative;">
                <img src="<%=path%>/resources/img/myimg/perform1.png" alt="" style=" width:100%; position:relative;">
                <div class="hero_category" style="position:absolute; top: 40%; left: 8%">
                    <a class="cat" href="#">연극&nbsp;</a>|
                    <a class="cat" href="#">&nbsp;뮤지컬&nbsp;</a>|
                    <a class="cat" href="#">&nbsp;무용&nbsp;</a>|
                    <a class="cat" href="#">&nbsp;복합&nbsp;</a>
                </div>
            </div>
        </section>
    </section>
    <!--@@@ hero End @@@-->

    <!--@@@ search @@@-->
    <section class="container py-1 mt-1 mb-1 ">
        <div class="searchbar" style="height:100px;">
            <form class="form-group d-block d-md-flex py-0 mb-3 rounded-md-pill" style="width:85%;float:left;" method="GET" action="<%=path %>/showSearch">
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
                    <input class="form-control" type="text" name="keyword" placeholder="어떤 공연을 찾고 있나요?">
                </div>
                <hr class="d-md-none my-2">
                <div class="d-sm-flex">
                    <div class="dropdown w-100 mb-sm-0 mb-3" data-bs-toggle="select">
                        <button class="btn btn-link btn-lg dropdown-toggle ps-2 ps-sm-3" type="button" data-bs-toggle="dropdown"><i class="fi-list me-2"></i><span class="dropdown-toggle-label">카테고리</span></button>
                        <input type="hidden" name="category">
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#"><i class="fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">연극</span></a></li>
                            <li><a class="dropdown-item" href="#"><i class="fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">뮤지컬</span></a></li>
                            <li><a class="dropdown-item" href="#"><i class="fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">무용</span></a></li>
                            <li><a class="dropdown-item" href="#"><i class="fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">복합</span></a></li>
                        </ul>
                    </div>
                    <input class="btn btn-warning btn-lg rounded-pill w-100 w-md-auto ms-sm-3" type="submit" value="검색" style="background-color:#DBAB34;"/>
                </div>
            </form>
            <div class="position-relative py-4" style="width:15%;height:80px;float:right; padding-left: 3%;">
                <input type="radio" name="rad_date" id="rad_day" value="rad_day" onclick="radDate('day')">오늘
                <input type="radio" name="rad_date" id="rad_week" value="rad_week" onclick="radDate('week')">1주
                <input type="radio" name="rad_date" id="rad_month" value="rad_month" onclick="radDate('month')" checked>1개월
            </div>
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
        <div class="d-flex flex-sm-row flex-column align-items-sm-center align-items-stretch my-5 ">
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
                    <img class="card-img " src="<%=showList.get(i).getPoster() %>" alt="Image Description " id="music_id_5 " name="music_id_5 " style="width:200px; ">
                </div>
                <!-- End Col -->

                <div class="col-sm-9">
                    <!-- Card Body -->
                    <div class="card-body row " style="height:100%; ">
                        <div>
                            <div style="width: 50%;float:left; ">
                                <span class="badge bg-faded-primary "><%=showList.get(i).getGenrenm() %></span>
                                <h3 class="card-title " style="margin-top: 1%;margin-bottom: 1%; ">
                                    <a class="text-dark " href="./blog-article.html " id="title_1 " name="title_1 " style="text-decoration: none; "><%=showList.get(i).getPrfnm() %></a>
                                </h3>
                            </div>
                        </div>

                        <div class="musicInfo">
                            <p id="cost_1 " name="cost_1 " style="margin-bottom: 1%; "><%=showList.get(i).getPrfpdfrom() %>&nbsp~&nbsp<%=showList.get(i).getPrfpdto() %></p>
                            <div><a href="# " id="hall_info_1 " name="hall_info_1 " style="color: black;text-decoration: none; "><%=showList.get(i).getFcltynm() %></a></div>
                        </div>

                        <!-- Card Footer -->
                        <div class="card-footer " style="text-align: right; ">
                            <a class="btn btn-translucent-info rounded-pill px-3 " href="<%=path %>/showDetail?showId=<%=showList.get(i).getShow_id() %> " id="detail_1 " name="detail_1 ">공연 보러가기</a>
                        </div>
                        <!-- End Card Footer -->
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
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
<%@ include file="/views/common/footer.jsp"%>



