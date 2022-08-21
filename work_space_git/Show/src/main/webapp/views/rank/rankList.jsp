<%@page import="vo.Rank"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	List<Rank> rankList = new ArrayList<>();
	if( request.getAttribute("rankList") != null) {
	 	Object rank = request.getAttribute("rankList");
		if(rank instanceof List<?>) {
			for(Object obj : (List<?>) rank) {
				if (obj instanceof Rank) {
					rankList.add((Rank) obj);
				}
			}
		}
	} else {
		rankList = null;
	}	
	
	int count = 10;
	
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
	String today = sdf.format(date);
	
	String category = "뮤지컬";
	String range = "";
	
	if (request.getAttribute("category") != null) {
		category = (String) request.getAttribute("category");
	}
	
	if (request.getAttribute("range") != null) {
		range = (String) request.getAttribute("range");
	}
	 
%>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/rank.css"/>
	<%@ include file="/views/common/rankHeader.jsp"%>


        <!-- Page header-->
        <div class="position-absolute top-0 start-0 w-100 bg-dark" style="height: 398px;"></div>
         <div class="container content-overlay mt-5 mb-md-4 py-5">
         <nav class="mb-3 mb-md-4 pt-md-5" aria-label="Breadcrumb">
          <ol class="breadcrumb breadcrumb-light">
            <li class="breadcrumb-item"><a href="<%=path%>/">Home</a></li>
            <li class="breadcrumb-item active" aria-current="page"><a href="<%=path%>/rankList">RANKING</a></li>
          </ol>
        </nav>
         <div class="bg-light shadow-sm rounded-3 p-4 pt-2 p-md-5 pt-md-3 mb-2">
        <section class="container" style=" margin-bottom: 20px;">
            <div class="d-sm-flex align-items-center justify-content-between mb-2 pb-sm-2 mt-5">
                <span>
                    <h1 class="display-3">RANKING</h1>
                </span>
            </div>

            <div class="rank_contain">

                <!-- 탭 메뉴 상단 시작 -->
                <ul class="tabs">
                    <li class="on" data-tab="tab-1" id="tab1"><a href="<%=path %>/rankList?category=뮤지컬"
                    style="font-size: 30px;font-family: 'NanumSquareRound', sans-serif;font-weight: 800;">뮤지컬</a></li>
                    <li class data-tab="tab-2" id="tab2"><a href="<%=path %>/rankList?category=연극" 
                    style="font-size: 30px;font-family: 'NanumSquareRound', sans-serif;font-weight: 800;">연극</a></li>
                    <li class data-tab="tab-3" id="tab3"><a href="<%=path %>/rankList?category=무용"
                    style="font-size: 30px;font-family: 'NanumSquareRound', sans-serif;font-weight: 800;">무용</a></li>
                    <li class data-tab="tab-4" id="tab4"><a href="<%=path %>/rankList?category=오페라"
                    style="font-size: 30px;font-family: 'NanumSquareRound', sans-serif;font-weight: 800;">오페라</a></li>
                    <li class data-tab="tab-5" id="tab5"><a href="<%=path %>/rankList?category=클래식"
                    style="font-size: 30px;font-family: 'NanumSquareRound', sans-serif;font-weight: 800;">클래식</a></li>
                    <li class data-tab="tab-6" id="tab6"><a href="<%=path %>/rankList?category=국악"
                    style="font-size: 30px;font-family: 'NanumSquareRound', sans-serif;font-weight: 800;">국악</a></li>
                    <li class data-tab="tab-7" id="tab7"><a href="<%=path %>/rankList?category=복합"
                    style="font-size: 30px;font-family: 'NanumSquareRound', sans-serif;font-weight: 800;">복합</a></li>
                </ul>
                <!-- 탭 메뉴 상단 끝 -->
                <!-- 탭 메뉴 내용 시작 -->
                <div class="rankBody">
                    <div id="tab-1" class="tab-content on">
                        <div class="rank_bx">
                            <!-- 인터파크 -->
                            <div class="rankTop">
                                <div class="detailTopMid"><%=today%>일&nbsp;</div>
                                <ul class="period-ul" style="padding-left: 5px;width: 255px;margin-top: 30px;margin-left: 10px;">
                       				<li class="on">
                       		     		<a href="<%=path %>/rankList?range=day&category=<%=category %>" class id="day">일간</a>
                       				</li>
                       				<li class>
                       			     	<a href="<%=path %>/rankList?range=week&category=<%=category %>" class id="week">주간</a>
                        			</li>
                        			<li class>
                        			    <a href="<%=path %>/rankList?range=month&category=<%=category %>" class id="month">월간</a>
                       				</li>
                   			 	</ul>
                            </div>

                            <div class="basic_tbl rank_tbl">
                                <table class="table">
                                    <colgroup>
                                        <col style="width:80px; font-family: 'NanumSquareRound', sans-serif; font-size: 20px; ">
                                        <col style="width:180px;">
                                        <col style="width:330px;">
                                        <col style="width:140px;">
                                        <col style="width:150px">
                                        <col style="width:110px">
                                        <col style="width:160px">
                                    </colgroup>
                                    <thead>
                                        <tr>
                                            <th class ="rankHead" scope="col">랭킹</th>
                                            <th class ="rankHead" scope="col" colspan="2">공연명</th>
                                            <th class ="rankHead" scope="col">기간</th>
                                            <th class ="rankHead" scope="col" colspan="2">장소</th>
                                            <th class ="rankHead" scope="col">상세보기</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<% if (rankList.size() < 10) { %>
                                    		<% count = rankList.size(); %>
                                    	<% } %>
                                        <% for (int i = 0; i < count; i++) { %> <!-- 상위 10개만 -->
                                        <tr>
                                            <th>
                                                <div class="rankNumber"><%=i+1 %></div>
                                            </th>
                                            <th class="img_box">
                                                <a class="detail_link" href="javascript:void(0);"><img src="http://www.kopis.or.kr<%=rankList.get(i).getPoster()%>" width="180px" height="350px" alt="공연 포스터"></a>
                                            </th>
                                            <th style="font-size: 20px;"><%=rankList.get(i).getPrfnm() %></th>
                                              <th style="font-size: 20px;"><%=rankList.get(i).getPrfpd() %></th>
                                            <th colspan="2" style="font-size: 20px;"><%=rankList.get(i).getPrfplcnm() %></th>
                                            <th>
                                                <div class="atag">
                                                    <a class="btn btn-outline-primary rounded" href="<%=path %>/showDetail?showId=<%=rankList.get(i).getShow_id() %>">상세보기</a>
                                                </div>
                                            </th>
                                        </tr>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        </div>
        </div>
        </main>
        
        <script>
        	$(document).ready(function() {
				
        		// 장르 on 변경
        		var category = '${category}';
        		var num = "";
        		
        		$('.tabs li').removeClass('on');
        		
        		if(category == "뮤지컬") {
        			num = 1;
        		}
        		if(category == "연극") {
        			num = 2;
        		}
        		if(category == "무용") {
        			num = 3;
        		}
        		if(category == "오페라") {
        			num = 4;
        		}
        		if(category == "클래식") {
        			num = 5;
        		}
        		if(category == "국악") {
        			num = 6;
        		}
        		if(category == "복합") {
        			num = 7;
        		}
        		
        		$('#tab' + num).addClass('on');
        		
        		// 기간 on 변경
        		var range = '${range}';
        		
        		$('.period-ul li').removeClass('on');
        		$('.period-ul li a').removeClass('on');
        		
        		$('#' + range).parent().addClass('on');
        		$('#' + range).addClass('on');
        	})
        </script>
        
		<!-- Vendor scrits: js libraries and plugins-->
		<script type="text/javascript" src="<%=path%>/resources/lightgallery.min.js "></script>
		
		<%@ include file="/views/common/rankFooter.jsp"%>
		
