<%@page import="board.controller.PageInfo"%>
<%@page import="vo.Review"%>
<%@page import="vo.Show"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Show show = (Show) request.getAttribute("show");
	List<Review> revList = new ArrayList<>();
	
	if( request.getAttribute("revList") != null) {
	 	Object review = request.getAttribute("revList");
		if(review instanceof List<?>) {
			for(Object obj : (List<?>) review) {
				if (obj instanceof Review) {
					revList.add((Review) obj);
				}
			}
		}
	} else {
		revList = null;
	}		
	
	int likeCheck = (Integer) request.getAttribute("likeCheck");
	
	List<String> slist = null;
	List<String> priceList = null;
	
	if (request.getAttribute("slist") != null) {
		slist = (List<String>) request.getAttribute("slist");
	}
	
	if (request.getAttribute("priceLists") != null) {
		priceList = (List<String>) request.getAttribute("priceLists");
	}
	
	String[] priceArr = null;
	if(show.getPcseguidance().equals("전석무료") == false) {
		priceArr = show.getPcseguidance().split(", ");
	} 
	
	int count1 = (Integer) request.getAttribute("count1");
	int count2 = (Integer) request.getAttribute("count2");
	int count3 = (Integer) request.getAttribute("count3");
	int count4 = (Integer) request.getAttribute("count4");
	int count5 = (Integer) request.getAttribute("count5");
	
	double total1 = 0;
	double total2 = 0;
	double total3 = 0;
	double total4 = 0;
	double total5 = 0;
	
	int i = 0;
	
	int total = count1 + count2 + count3 + count4 + count5;
	
	if(total != 0) {
		total1 = ((double)count1 / total) * 100;
		total2 = ((double)count2 / total) * 100;
		total3 = ((double)count3 / total) * 100;
		total4 = ((double)count4 / total) * 100;
		total5 = ((double)count5 / total) * 100;
	}
	
	int revCount = (Integer) request.getAttribute("revCount");
	
	request.setAttribute("show", show);
	
	PageInfo pageInfo = null;
	if(request.getAttribute("pageInfo") != null) {
		pageInfo = (PageInfo) request.getAttribute("pageInfo");
	}
	
	int count = 5;
%>    

	<style>
	.board tr {
        cursor: pointer;
    }
    
    .td-no,
    .td-title,
    .td-writer,
    .td-date {
        border-right: 1px solid lightgray;
    }
    
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
    
    .board-write>a {
        background: #2a2a4e;
        color: #fff;
        padding: 3px 15px 3px;
        display: inline-block;
        text-align: center;
        border-radius: 50px;
        text-decoration: none;
    }
    
    .board-data > tr {
    	border-bottom: 1px solid lightgray; height: 70px;
    }
    

    

</style>

  <!-- 공연자세히css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/showDetail/showDetail.css">

<%@include file="/views/common/header.jsp"%>
    
    <!-- Page content-->

        <!-- Review modal 리뷰남기기-->
        <form name="writeForm" action="<%=path%>/writeReview" method="POST">
        	<div class="modal fade" id="modal-review" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
            	<input name="showId" value="<%=show.getShow_id()%>" type="hidden">
            	<input name="page" value="<%=pageInfo.getCurrentPage()%>" type="hidden">
                <div class="modal-content">
                    <div class="modal-header d-block position-relative border-0 pb-0 px-sm-5 px-4">
                        <h3 class="modal-title mt-4 text-center">관람후기 등록 </h3>
                        <button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body px-sm-5 px-4">
                            <div class="mb-3">
                                <label class="form-label" for="review-name">닉네임 <span class='text-danger'>*</span></label>
                                <input class="form-control" name="revId" type="text" id="review-name" placeholder="닉네임" required>
                                <div class="invalid-feedback">닉네임을 입력해주세요.</div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="review-rating">평점 <span class='text-danger'>*</span></label>
                                <select class="form-control form-select" name="revStar" id="review-rating" required>
                    <option value="" selected disabled hidden>평점 선택</option>
                    <option value="5 stars">⭐⭐⭐⭐⭐</option>
                    <option value="4 stars">⭐⭐⭐⭐</option>
                    <option value="3 stars">⭐⭐⭐</option>
                    <option value="2 stars">⭐⭐</option>
                    <option value="1 star">⭐</option>
                  </select>
                                <div class="invalid-feedback">평점을 선택해주세요.</div>
                            </div>
                            <div class="mb-4">
                                <label class="form-label" for="review-text">관람후기 <span class='text-danger'>*</span></label>
                                <textarea class="form-control" name="revContent" id="review-text" rows="5" placeholder="공연은 어떠셨나요?" required></textarea>
                                <div class="invalid-feedback">관람후기를 등록해주세요</div>
                            </div>
                            <input class="btn d-block rounded-pill w-100 mb-4" style="background-color:#201627; color:#D9E2F2; font-weight:800; font-size:15pt;" type="submit" value="리뷰 등록">
                    </div>
                </div>
            </div>
        </div>
        </form>
        
        <!-- 예매결과 팝업 -->
        	<div class="modal fade" id="modal-ticket" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                     <div class="window">
                         <div class="popup" style="border-radius:4%">
                             <div class="row ticResult11111" style="margin: 0; bottom: 0;">
                                
                                 <div class="popup_left col-6"><div style="text-align: left; border-radius:4%; margin-top: 40px;margin-left: 40px;margin-bottom: 40px;margin-right: 30px;">
                                         <h1 class="display-2" style=" color: #dbab34; font-size:40pt;">예매완료</h1>
                                         <div class="popup_left my-5" style="text-align:center;"><img src=<%=show.getPoster() %> alt="image" style="width: 300px;"></div>
                                         <div class="popup_left_detail"><h2 style="color: #d9e2f2"><%=show.getPrfnm() %></h2><h4 style="color: #d9e2f2"><%=show.getFcltynm() %></h4>
                                             <h4 style="color: #d9e2f2"><%=show.getPrfpdfrom() %> &nbsp;&nbsp; ~ &nbsp;&nbsp; <%=show.getPrfpdto() %></h4></div></div></div>
                                 	<div class="popup_right col-6"><div class="ticketing"><div class="ticketing_body">
                                 	<button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" id="Rclose" ></button>
                                         	<img alt="" src=""></div><hr> 
                                         <form action="<%=path%>/ticketing/view" method="POST">
                                         	<div class="ticketing_result"><div>관람일 :&nbsp;<input name="viewDate" style="border:0 solid black" readonly></div><div>인원 :&nbsp;<input name="count" style="border:0 solid black" readonly></div>
                                             <div>좌석 :&nbsp;<input name="seat" style="border:0 solid black" readonly></div><input type="hidden" name="showId" value="<%=show.getShow_id()%>">
                                             <div class="popup_price"><span>원</span></div>
                                             <input class="btn btn-outline-accent rounded ms-5 px-0" type="submit" onclick="location.href='<%=path%>/ticketing/view'" style="width:130px;height:60px;background-color:#201627; value="예매 내역 확인">
                                             <div>
                                             <p>[예매 취소 안내]예매 취소 시 주의사항</p>
                                             <p>티켓 예매 후 7일 이내에 취소 시, 취소수수료가 없습니다.단, 예매 후 7일 이내라도 취소 시점이 공연일로부터 10일 이내라면 그에 해당하는 취소수수료가 부과됩니다.예매 당일 자정(12:00) 전에 취소할 경우 예매 수수료가 환불되며, 그 이후에는 환불되지 않습니다.예매티켓 취소는 아래 안내된 취소가능일 이내에만 할 수 있습니다.</p>
                                             </div>
                                             </div></div></form></div>
                                     
                                </div>
                             </div>
                         </div>
                     </div>
                </div>
			</div>        

        <!-- Page header-->
        <section class="container pt-5 mt-5 mb-4" style="margin-bottom: 20px;">
            <!-- Breadcrumb-->
            <div class="d-sm-flex align-items-center justify-content-between mb-0">
                <span class="show_titie"><%=show.getPrfnm() %><span class="badge bg-accent" style="font-size: 20px; margin-left: 10px;"><%=show.getGenrenm() %></span></span>
                <div class="text-nowrap like-button">
                    <% if (loginUser != null) { %>
                    	<% if (likeCheck == 1) { %>
                    		<button class="btn btn-icon btn-light-primary btn shadow-sm rounded-circle" onclick="likeShowMinus('<%=show.getShow_id() %>')" type="button" data-bs-toggle="tooltip" title="찜하기"><i class="fi-heart-filled"></i></button>
                    	<% } else {%>
                    		<button class="btn btn-icon btn-light-primary btn shadow-sm rounded-circle" onclick="likeShowPlus('<%=show.getShow_id() %>')" type="button" data-bs-toggle="tooltip" title="찜하기"><i class="fi-heart"></i></button>
                    	<% } %>
                    <% } %>
                    <div class="dropdown d-inline-block" data-bs-toggle="tooltip" title="공유하기">
                        <button class="btn btn-icon btn-light-primary btn shadow-sm rounded-circle ms-2" type="button" data-bs-toggle="dropdown"><i class="fi-share"></i></button>
                        <div class="dropdown-menu dropdown-menu-end my-1">
                            <button class="dropdown-item" type="button"><i class="fi-facebook fs-base opacity-75 me-2"></i>Facebook</button>
                            <button class="dropdown-item" type="button"><i class="fi-twitter fs-base opacity-75 me-2"></i>Twitter</button>
                            <button class="dropdown-item" type="button"><i class="fi-instagram fs-base opacity-75 me-2"></i>Instagram</button>
                        </div>
                    </div>
                </div>
            </div>
            <hr><br>
            <div class="row">
                <div class="col-5 mt-3">
                    <div>
                        <img src="<%=show.getPoster() %>" alt="images" width="400" height="500">
                    </div>
                </div>
                <div class="col-7 mt-4" style="font-size:20pt;">
                    <div class="info_show mt-4 mb-2">
                        <div class="row">
                            <div class="col-3">
                                <div class="info_tit" style="font-size:20pt;">기간</div>
                            </div>
                            <div class="col-9">
                                <div class="info_txt" style="font-weight:500;"><%=show.getPrfpdfrom() %> &nbsp;&nbsp; ~ &nbsp;&nbsp; <%=show.getPrfpdto() %></div>
                            </div>
                            <div class="col-3">
                                <div class="info_tit" style="font-size:20pt;">장소</div>
                            </div>
                            <div class="col-9">
                                <div class="info_txt" style="font-weight:500;"><%=show.getFcltynm() %></div>
                            </div>
                            <div class="col-3">
                                <div class="info_tit" style="font-size:20pt;">런타임</div>
                            </div>
                            <div class="col-9">
                                <div class="info_txt" style="font-weight:500;"><%=show.getPrfruntime() %></div>
                            </div>
                            <div class="col-3">
                                <div class="info_tit" style="font-size:20pt;">관람 연령</div>
                            </div>
                            <div class="col-9">
                                <div class="info_txt" style="font-weight:500;"><%=show.getPrfage() %></div>
                            </div>
                            <div class="col-3">
                                <div class="info_tit" style="font-size:20pt;">출연진</div>
                            </div>
                            <div class="col-9">
                                <div class="info_txt" style="font-weight:500;"><%=show.getPrfcast() %></div>
                            </div>
                            <div class="col-3">
                                <div class="info_tit" style="font-size:20pt;">제작사</div>
                            </div>
                            <div class="col-9">
                                <div class="info_txt" style="font-weight:500;"><%=show.getEntrpsnm() %></div>
                            </div>
                            <hr>
                            <div class="col-3 mt-3">
                                <div class="info_tit" style="font-size:20pt;">가격</div>
                            </div>
                            <div class="col-9 mt-3" style="background-color: #f6f6f6;">
                                <div>
                                    <% if (show.getPcseguidance().equals("전석무료")) { %>
                                    	전석무료
                                    <% } else { %>
                                    	<% for (int j = 0; j < priceArr.length; j++) { %>
                                    	<div class="info_txt" style="font-weight:500;"><%=priceArr[j].trim() %></div>
                                    	<% } %>
                                    <% } %>
                                </div>
                            </div>
                        </div>
                    </div>
                
                
                   <% if(loginUser != null) { %>
                   			 <div style="text-align: end; margin-right: 10px; margin-top: 40px;">
                        <div class="btn btn rounded-pill ms-5"  id="show" data-bs-toggle="modal" data-bs-dismiss="modal" style="display: inline-block; width: 230px; height: 60px; background-color:#201627; border:none;">
                            <div style="font-size: 25pt; font-weight:800; color:#D9E2F2;">예매 하기</div>
                        </div>
                   <% } else {%>
                   		 <div style="text-align: end; margin-right: 10px; margin-top: 40px;">
                        <div class="btn btn rounded-pill ms-5" href="#signin-modal" data-bs-toggle="modal" data-bs-dismiss="modal" style="display: inline-block; width: 230px; height: 60px; background-color:#201627; border:none;">
                            <div style="font-size: 25pt; font-weight:800; color: #D9E2F2;">예매 하기</div>
                        </div>
                   <% } %>
                        </div>
                        
<!--            		
            				str +=  '<div class="popup_left_detail"><h2 style="color: #d9e2f2">'+obj.prfnm+'</h2><h4 style="color: #d9e2f2">'+obj.fcltynm+'</h4> 	      '
            				str +=  '<h4 style="color: #d9e2f2">'+obj.from  +'&nbsp;&nbsp;~&nbsp;&nbsp;'+ obj.to+'</h4></div></div></div>                         	       '
            				str +=  '<div class="popup_right col-6"><button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button"  id="ajaxClose"></button><div class="ticketing" style= "padding-right: 20px; margin-top:60px;"><div class="ticketing_body">                                                                                                                         '
            				str +=  '<div style=" text-align: center;">	<i class = "fi-check display-2"></i></div><br></i><h4 style="text-align: center;">예매가 성공적으로 완료되었습니다<h4></div> <hr><br>                                                                                                                                                                     '
            				str +=  '<form action="' + url1 +'" method="POST">                                                                                                                                                '
            				str +=  '<div class="ticketing_result" style="text-align: center;"><div>관람일 :&nbsp;<input name="viewDate" style="border:0 solid black" value="'+ obj.date +'" readonly></div><div style="padding-left: 26px;">인원 :&nbsp;<input name="count" style="border:0 solid black" value="'+ obj.count +'명" readonly></div>'
            				str +=  '<div style="padding-left: 26px;">좌석 :&nbsp;<input name="seat" style="border:0 solid black" value="'+ obj.seat +'" readonly></div><input type="hidden" name="showId" value="'+obj.show_id+'">                                                '
            				str +=  '<div style="padding-left: 26px;">가격 :&nbsp;<input name="price" style="border:0 solid black" value="'+ obj.price +'원" readonly></div>                                                                                                                 '
            				str +=  '<div style=" text-align: center;"><input class="btn btn-outline-accent rounded px-0" type="submit" style="width:130px;height:60px;background-color:#201627; color: #d9e2f2; font-size:14pt; font-weight:800;" value="예매 내역 확인"></div>   				'
            				str +=  '<br><div style><p style="font-size:13pt; font-weight:700; text-align:left; margin-bottom: 0px;">[예매 취소 안내]예매 취소 시 주의사항</p><p style="font-size:11pt; text-align:left;">티켓 예매 후 7일 이내에 취소 시, 취소수수료가 없습니다. 단, 예매 후 7일 이내라도 취소 시점이 공연일로부터 10일 이내라면 그에 해당하는 취소수수료가 부과됩니다.예매 당일 자정(12:00) 전에 취소할 경우 예매 수수료가 환불되며, 그 이후에는 환불되지 않습니다.예매티켓 취소는 아래 안내된 취소가능일 이내에만 할 수 있습니다.</p></div>' -->
                       <!-- 팝업시작 -->
                      <%--   <form name="ticketingForm" action="<%=path%>/showDetail/Ticketing" method="POST"> --%>
                      <div class="ticketResult">
                        <div class="background">
                            <div class="window">
                                <div class="popup" style="border-radius:4%">
                                    <div class="row " style="margin: 0; bottom: 0;">
                                        <div class="popup_left col-6" style="border-radius:4%;">
                                            <div style="text-align: left; margin-top: 40px;margin-left: 40px;margin-bottom: 40px;margin-right: 30px;">
                                                <h1 class="display-2" style=" color: #dbab34; font-size:40pt;">예매하기</h1>
                                                <div class="popup_left my-5" style="text-align:center;">
                                                	<img src=<%=show.getPoster() %> alt="image" style="width: 300;">
                                                </div>
                                                <div class="popup_left_detail">
                                                    <h2 style="color: #d9e2f2"><%=show.getPrfnm() %></h2>
                                                    <h4 style="color: #d9e2f2"><%=show.getFcltynm() %></h4>
                                                    <h4 style="color: #d9e2f2"><%=show.getPrfpdfrom() %>&nbsp;&nbsp;~&nbsp;&nbsp;<%=show.getPrfpdto() %></h4>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="popup_right col-6">
                                        <button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button"  id="pClose"></button>
                                            <div class="ticketing">
                                                <div class="ticketing_body">
                                                    <span class="popup_date">날짜선택<i class="fi-calendar ps-1"></i></span>
                                                    <div>
                                                        <input class="form-control date-picker rounded-pill pi-5 " id="datepicker" type="date" placeholder="날짜를 선택해주세요 " data-datepicker-options="{&quot;altInput&quot;: true, &quot;altFormat&quot;: &quot;Y. m. d &quot;, &quot;dateFormat&quot;: &quot;Y-m-d&quot;, &quot;language&quot;: &quot;ko&quot;} ">
                                                    </div>
                                                    <div class="popup_count">인원선택</div>
                                                    <div class="row">
                                                        <div class="col-2" style="text-align: right;">
                                                            <select id="headcnt" required>
                                                            <option value="" selected disabled hidden></option>
                                                            <option value= "1명">1</option>
                                                            <option value= "2명">2</option>
                                                            <option value= "3명">3</option>
                                                            <option value= "4명">4</option>
                                                            <option value= "5명">5</option>
                                                            <option value= "6명">6</option>
                                                            <option value= "7명">7</option>
                                                            <option value= "8명">8</option>
                                                            <option value= "9명">9</option>
                                                        </select>
                                                        </div>
                                                        <div class="col-4">
                                                            <div>명</div>
                                                        </div>
                                                    </div>
                                                    <div class="popup_seat">좌석선택</div>
                                                    <div class="row">
                                                        <div class="col-2" style="text-align: right;">
                                                            <select id="selectSeat" onchange="changeSeat()" required>
                                                            <option value="" selected disabled hidden></option>
						                                    <% if (show.getPcseguidance().equals("전석무료")) { %>
						                                    	<option>전석무료</option>
						                                    <% } else { %>
						                                    	<% for (int j = 0; j < priceArr.length; j++) { %>
				                                    			<option><%= priceArr[j].trim() %></option>
						                                    	<% } %>
						                                    <% } %>
                                                        </select> 
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr> 
                                                <div class="ticketing_result">
                                                    <div>관람일 :&nbsp;<span id="viewDataPicker"></span></div>
                                                    <div>인원 :&nbsp;<span id="viewCnt"></span></div>
                                                   	<div>좌석 :&nbsp;<span id="viewSeat"></span></div>
                                                    <div class="popup_price">
                                                        <span class="final_price" id="total-price" style="font-weight:800;">0</span> <span>원</span>
                                                    </div>
                                                    <div class="ticketing_check" style="font-size:18pt;">선택하신 정보가 맞으시다면,</div>
                                                    <div class="deleteTic" style="margin-left: 30px;">
                                                    <a onclick="ticketView('<%=show.getShow_id()%>'); return false;" href="javascript:void(0)">
                                                    	<button class="btn btn-outline-accent rounded ms-5" style="width:130px;height:60px;background-color:#201627" id="ticketing">
                                                            <div style="color: #d9e2f2; font-size: 20px; font-weight:800;">예매하기</div>
                                                    	</button>
                                                    </a>
                                                    <button class="btn btn-outline-accent rounded ms-5" style="width:130px;height:60px;background-color:#201627" id="close">
                                                         <div style="color: #d9e2f2; font-size: 20px; font-weight:800;">취소하기</div>
                                                    </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                      </div>
<!--                         </form>  -->      

		             </div>
                </div>
            </div>
            
            <script>
            
            	function ticketView(showId) {
            		var date = document.getElementById("viewDataPicker").innerText;
            		var people = document.getElementById("viewCnt").innerText;
            		var seat = document.getElementById("viewSeat").innerText;
            		var total = document.getElementById("total-price").innerText;
            		
            		$.ajax({
	         			url: "<%=path%>/ticketing/view",
	         			type: "POST",
	         			dataType: "text",
	         			data: { "date" : date, "people" : people , "seat" : seat , "total" : total , "showId" : showId },
	         			progress: true,
	             	
	         			success: function(list) {
            				var tic = JSON.parse(list);
            				console.log(tic);
            				
            				var str = "";      
            				
            				var url1 = "<%=path%>/myTicketing";
            				
            				$.each(tic, (i, obj) => {
                                    
                            str +=  '<div class="background show"><div class="window"> <div class="popup" style="border-radius:4%"> <div class="row">											 '           
            				str +=  '<div class="popup_left col-6" style="border-radius:4%;"><div style="text-align: left; margin-top: 40px;margin-left: 40px;margin-bottom: 40px;margin-right: 30px;">              '
            				str +=  '<h1 class="display-2" style=" color: #dbab34; font-size:40pt;">예매 완료</h1>																		  '
            				str +=  '<div class="popup_left my-5" style="text-align:center;"><img src="'+obj.poster+'" alt="image" style="width: 300;"></div>            '
            				str +=  '<div class="popup_left_detail"><h2 style="color: #d9e2f2">'+obj.prfnm+'</h2><h4 style="color: #d9e2f2">'+obj.fcltynm+'</h4> 	      '
            				str +=  '<h4 style="color: #d9e2f2">'+obj.from  +'&nbsp;&nbsp;~&nbsp;&nbsp;'+ obj.to+'</h4></div></div></div>                         	       '
            				str +=  '<div class="popup_right col-6"><button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button"  id="ajaxClose"></button><div class="ticketing" style= "padding-right: 20px; margin-top:60px;"><div class="ticketing_body">                                                                                                                         '
            				str +=  '<div style=" text-align: center;">	<i class = "fi-check display-2"></i></div><br></i><h4 style="text-align: center;">예매가 성공적으로 완료되었습니다<h4></div> <hr><br>                                                                                                                                                                     '
            				str +=  '<form action="' + url1 +'" method="POST">                                                                                                                                                '
            				str +=  '<div class="ticketing_result" style="text-align: center;"><div>관람일 :&nbsp;<input name="viewDate" style="border:0 solid black" value="'+ obj.date +'" readonly></div><div style="padding-left: 26px;">인원 :&nbsp;<input name="count" style="border:0 solid black" value="'+ obj.count +'명" readonly></div>'
            				str +=  '<div style="padding-left: 26px;">좌석 :&nbsp;<input name="seat" style="border:0 solid black" value="'+ obj.seat +'" readonly></div><input type="hidden" name="showId" value="'+obj.show_id+'">                                                '
            				str +=  '<div style="padding-left: 26px;">가격 :&nbsp;<input name="price" style="border:0 solid black" value="'+ obj.price +'원" readonly></div>                                                                                                                 '
            				str +=  '<div style=" text-align: center;"><input class="btn btn-outline-accent rounded px-0" type="submit" style="width:130px;height:60px;background-color:#201627; color: #d9e2f2;" value="예매 내역 확인"></div>   				'
            				str +=  '<br><br><div style><p style="font-size:13pt; font-weight:700; text-align:left; margin-bottom: 0px;">[예매 취소 안내]예매 취소 시 주의사항</p><p style="font-size:11pt; text-align:left;">티켓 예매 후 7일 이내에 취소 시, 취소수수료가 없습니다. 단, 예매 후 7일 이내라도 취소 시점이 공연일로부터 10일 이내라면 그에 해당하는 취소수수료가 부과됩니다.</p></div>'
            				str +=  '</div></div></form></div>  </div></div></div></div>'
            				
            				});
            				
            				$('.ticketResult').html(str);
	         			},
	         			
	         			error: function(e) {
	         				console.log(e);			
            			}
            		});
            	}
            
            
                function show() {
                    document.querySelector(".background").className = "background show";
                };

                function close() {
                    document.querySelector(".background").className = "background";
                };

                document.querySelector("#show").addEventListener("click", show);
                document.querySelector("#close").addEventListener("click", close);
                document.querySelector("#pClose").addEventListener("click", close);
                document.querySelector("#ajaxClose").addEventListener("click", close);
                
                
                
                /* <select id="selectSeat" onchange="changeSeat()" required> */
                function changeSeat(){
                	var seatSelect = document.getElementById("selectSeat").value;
                	var headcnt = document.getElementById("headcnt").value;
                	var datepicker = document.getElementById("datepicker").value;
                	
                	console.log(datepicker);
                	var seat = "";
                	var price = "";
                	
                	var total = "";
                	
                    var splitStr = seatSelect.split(' ');
                    
                    if(splitStr.length == 2) {
                    	seat = splitStr[0];
                    	price = splitStr[1].replace(",","").replace("원","");
                    } else {
                    	seat = splitStr[0] + "-" + splitStr[1];
                    	price = splitStr[2].replace(",","").replace("원","");
                    }
                    
                    total = parseInt(price) * parseInt(headcnt.replace("명",""));
                    
                    
                	document.getElementById("viewDataPicker").innerHTML = datepicker;
                	document.getElementById("viewCnt").innerHTML = headcnt;
                	document.getElementById("viewSeat").innerHTML = seat;
                	document.getElementById("total-price").innerHTML = total;
                };
            </script>
            
            
        </section>
        <!-- Page content-->
        <section class="container pb-5 mb-md-4 mt-5 ">
            <div class="row">
                <!-- Left column-->
                <div class="col-md-12 mb-md-0 mb-4 pb-md-0 pb-2 ">
                    <div style="margin-bottom: 10px; ">
                        <h2 class="fi-edit me-2 "></h2>
                        <h3 style="display: inline; font-family: 'NanumSquareRound',san-serif; font-weight:800;" >관람 후기</h3>
                    </div>
                    <div class="row mb-md-5 mb-4">
                        <!-- Rating breakdown-->
                        <div class="col-sm-8 order-sm-1 order-2 ">
                            <div class="d-flex align-items-center mb-2 fs-sm ">
                                <div class="text-nowrap ">5<i class="fi-star mt-n1 ms-1 align-middle opacity-70 "></i></div>
                                <div class="progress w-100 mx-3 ">
                                    <div class="progress-bar bg-warning " role="progressbar " style="width: <%=total5 %>% " aria-valuenow="80" aria-valuemin="0 " aria-valuemax="100 "></div>
                                </div><span style="min-width: 48px; "><%=count5 %></span>
                            </div>
                            <div class="d-flex align-items-center mb-2 fs-sm ">
                                <div class="text-nowrap ">4<i class="fi-star mt-n1 ms-1 align-middle opacity-70 "></i></div>
                                <div class="progress w-100 mx-3 ">
                                    <div class="progress-bar bg-warning " role="progressbar " style="width: <%=total4 %>% " aria-valuenow="10 " aria-valuemin="0 " aria-valuemax="100 "></div>
                                </div><span style="min-width: 48px; "><%=count4 %></span>
                            </div>
                            <div class="d-flex align-items-center mb-2 fs-sm ">
                                <div class="text-nowrap ">3<i class="fi-star mt-n1 ms-1 align-middle opacity-70 "></i></div>
                                <div class="progress w-100 mx-3 ">
                                    <div class="progress-bar bg-warning " role="progressbar " style="width: <%=total3 %>% " aria-valuenow="0 " aria-valuemin="0 " aria-valuemax="100 "></div>
                                </div><span style="min-width: 48px; "><%=count3 %></span>
                            </div>
                            <div class="d-flex align-items-center mb-2 fs-sm ">
                                <div class="text-nowrap ">2<i class="fi-star mt-n1 ms-1 align-middle opacity-70 "></i></div>
                                <div class="progress w-100 mx-3 ">
                                    <div class="progress-bar bg-warning " role="progressbar " style="width: <%=total2 %>% " aria-valuenow="0 " aria-valuemin="0 " aria-valuemax="100 "></div>
                                </div><span style="min-width: 48px; "><%=count2 %></span>
                            </div>
                            <div class="d-flex align-items-center mb-2 fs-sm ">
                                <div class="text-nowrap ">1<i class="fi-star mt-n1 ms-1 align-middle opacity-70 "></i></div>
                                <div class="progress w-100 mx-3 ">
                                    <div class="progress-bar bg-warning " role="progressbar " style="width: <%=total1 %>% " aria-valuenow="0" aria-valuemin="0 " aria-valuemax="100 "></div>
                                </div><span style="min-width: 48px; "><%=count1 %></span>
                            </div>
                        </div>
                        <!-- Score-->
                        <div class="col-sm-4 order-sm-2 order-1 mb-sm-0 mb-3 text-center ">
                            <h5 class="display-2 mb-1 ">
                            <% if (show.getShow_star() != null) { %>
                            	<%=show.getShow_star() %>
                            <% } else {%>
                            	0.0
                            <% } %>
							</h5>
                            <div>
                            <span class="star-rating ">
                             <% for (int k = 0; k < 5; k++) {%>
                                    	<% if (k < Character.getNumericValue(show.getShow_star().charAt(0))) { %>
                                    		<i class="star-rating-icon fi-star-filled active"></i>
                                    	<% } else {%>
                                    		<i class="star-rating-icon fi-star"></i>
                                    	<% } %>
                                    <% } %>
                            </span>
                            </div><span style="font-size: 20px; margin-top: 10px; ">
                            <%=total %>개							
                            </span>
                        </div>
                    </div>
                    <!-- Add review btn + Reviews sort-->
                    <% if (loginUser != null) { %>
                    	<div class="d-flex flex-sm-row flex-column align-items-sm-center justify-content-between mb-4 pb-4 border-bottom ">
                    	<a class="btn rounded-pill mb-sm-0 mb-3 "style=" color:#201627; border:2px solid #201627; font-size:17pt; font-weight:800; color:#201627;" href="#modal-review" data-bs-toggle="modal" data-bs-dismiss="modal">
                    	<i class="fi-edit mt-n1 me-2 align-middle "></i>후기 등록</a>
                    <% } else { %>
                    	<div class="d-flex flex-sm-row flex-column align-items-sm-center justify-content-between mb-4 pb-4 border-bottom ">
                    	<a class="btn rounded-pill mb-sm-0 mb-3" style="background-color:#201627; color:#D9E2F2; border:2px solid #201627; font-size:17pt; font-weight:800; color:#201627;" href="#signin-modal" data-bs-toggle="modal" data-bs-dismiss="modal">
                    	<i class="fi-edit mt-n1 me-2 align-middle "></i>후기 등록</a>
                    <% } %>
                        <div class="d-flex align-items-center ms-sm-4 ">
                            <label class="d-inline-block me-2 pe-1 text-muted text-nowrap " for="reviews-sort "><i class="fi-arrows-sort mt-n1 me-1 align-middle opacity-80"></i>정렬순:</label>
                            <select class="form-select" id="reviews-sort" onchange="reviewSort('<%=show.getShow_id() %>');" style="min-width: 180px; ">
                  				<option value="new">최신순</option>
                  				<option value="old">오래된순</option>
                  				<option value="like">좋아요순</option>
                  				<option value="star">별점 높은순</option>
                			</select>
                        </div>
                    </div>
                    
                    <!-- Review-->
                    <div class="mb-4 pb-4 border-bottom review-page">
                    <% if (revList != null) { %>
	                    <% if (revList.size() < count) { %>
	                    	<% count = revList.size(); %>
	                    <% } %>
                        <% for (int j = 0; j < count; j++) { %>
                        	<div class="d-flex justify-content-between mb-3 ">
                            <div class="d-flex align-items-center pe-2 "><img class="rounded-circle me-1 " src="<%=path %>/resources/images/avatar.png " width="60 " alt="Avatar ">
                                <div class="ps-2 ">
                                    <h6 class="fs-base mb-0 "><%=revList.get(j).getUser_id() %></h6>
                                    <span class="star-rating ">
                                    <% for (int k = 0; k < 5; k++) {%>
                                    	<% if (k < revList.get(j).getRev_star()) { %>
                                    		<i class="star-rating-icon fi-star-filled active"></i>
                                    	<% } else {%>
                                    		<i class="star-rating-icon fi-star"></i>
                                    	<% } %>
                                    <% } %>
                                    </span>
                                </div>
                            </div><span class="text-muted fs-sm "><%=revList.get(j).getRev_date() %></span>
                        </div>
                        <p><%=revList.get(j).getRev_content() %></p>
                        <div class="d-flex align-items-center" id="revLike<%=revList.get(j).getRev_no()%>">
                            <button class="heart" type="button" style="border: none;" onclick="likePlus(<%=revList.get(j).getRev_no()%>);"><i class="fi-heart"></i><span>(<%=revList.get(j).getRev_like() %>)</span></button>
                        </div>
                        	<% if (j != count - 1) { %>
                        		<hr><br>
                        	<% } %>
                        <% } %>
                    <% } else {%>
                    	<div style="text-align: center;">
                   		<h2>리뷰내역이 없습니다.</h2>
                   		</div>
                    <% } %>
                    </div>
                    
                    <div class="board-bottom" style="width:1300px; margin: 0 auto; padding-top: 15px;">
                	<div class="board-page" style="text-align: center;">
		                <% if (revList != null) { %>
		                	<% for (int j = pageInfo.getStartPage(); j <= pageInfo.getEndPage(); j++) { %>
		                	<% if (j == pageInfo.getCurrentPage()) { %>
		                		<a class="page-on" id="page(<%=j %>)" onclick="goPage(<%=j %>); return false;"><%=j %></a>
		                	<% } else {%>
		                		<a class="page" id="page(<%=j %>)" onclick="goPage(<%=j %>); return false;"><%=j %></a>
		                	<% } %>
		                <% } %>
		                <a class="page-next" onclick="goPage(<%=pageInfo.getNextPage() %>); return false;"><i class="fi-chevron-right align-middle"></i></a>
		                <a class="page-end" onclick="goPage(<%=pageInfo.getMaxPage() %>); return false;"><i class="fi-chevrons-right align-middle"></i></a>
		                <% } %>
		            </div>    
		            </div>
		            <br><hr>
		          </div>
                </div>
            </div>
        </section>
        
        <script>
        function likeShowPlus(showId) {
        	$.ajax({
     			url: "<%=path%>/like/show",
     			type: "POST",
     			dataType: "text",
     			data: { "showId" : showId , "like" : 1},
     			progress: true,
         	
     			success: function(list) {
    				var rev = JSON.parse(list);
     				
     				str = "";
					$.each(rev, (i, obj) => {
						var showId = "'" + obj.showId + "'";
						console.log(showId);
						
						str += '<button class="btn btn-icon btn-light-primary btn shadow-sm rounded-circle" onclick="likeShowMinus('+ showId +')" type="button" data-bs-toggle="tooltip" title="찜 취소하기"><i class="fi-heart-filled"></i></button>'
         				str += '<div class="dropdown d-inline-block" data-bs-toggle="tooltip" title="공유하기">                                                                                  '
         				str += '    <button class="btn btn-icon btn-light-primary btn shadow-sm rounded-circle ms-2" type="button" data-bs-toggle="dropdown"><i class="fi-share"></i></button>   '
         				str += '    <div class="dropdown-menu dropdown-menu-end my-1">                                                                                                           '
         				str += '        <button class="dropdown-item" type="button"><i class="fi-facebook fs-base opacity-75 me-2"></i>Facebook</button>                                         '
         				str += '        <button class="dropdown-item" type="button"><i class="fi-twitter fs-base opacity-75 me-2"></i>Twitter</button>                                           '
         				str += '        <button class="dropdown-item" type="button"><i class="fi-instagram fs-base opacity-75 me-2"></i>Instagram</button>                                       '
         				str += '    </div>                                                                                                                                                       '
         				str += '</div>                                                                                                                                                '
					});                                                                                                                                                                          
     				                                                                                                                                                                             
     				$('.like-button').html(str);
     			}
        	});	
        }
        
        function likeShowMinus(showId) {
        	$.ajax({
     			url: "<%=path%>/like/show",
     			type: "POST",
     			dataType: "text",
     			data: { "showId" : showId , "like" : 0 },
     			progress: true,
         	
     			success: function(list) {
    				var rev = JSON.parse(list);
     				console.log(rev[0].showId);
     				
     				str = "";
					$.each(rev, (i, obj) => {
						var showId = "'" + obj.showId + "'";
						
						str += '<button class="btn btn-icon btn-light-primary btn shadow-sm rounded-circle" onclick="likeShowPlus('+ showId +')" type="button" data-bs-toggle="tooltip" title="찜하기"><i class="fi-heart"></i></button>'
         				str += '<div class="dropdown d-inline-block" data-bs-toggle="tooltip" title="공유하기">                                                                                  '
         				str += '    <button class="btn btn-icon btn-light-primary btn shadow-sm rounded-circle ms-2" type="button" data-bs-toggle="dropdown"><i class="fi-share"></i></button>   '
         				str += '    <div class="dropdown-menu dropdown-menu-end my-1">                                                                                                           '
         				str += '        <button class="dropdown-item" type="button"><i class="fi-facebook fs-base opacity-75 me-2"></i>Facebook</button>                                         '
         				str += '        <button class="dropdown-item" type="button"><i class="fi-twitter fs-base opacity-75 me-2"></i>Twitter</button>                                           '
         				str += '        <button class="dropdown-item" type="button"><i class="fi-instagram fs-base opacity-75 me-2"></i>Instagram</button>                                       '
         				str += '    </div>                                                                                                                                                       '
         				str += '</div>                                                                                                                                                '
					});                                                                                                                                                                          
     				                                                                                                                                                                             
     				$('.like-button').html(str);
     			}
        	});	
        }
        
        
        function likePlus(revNo) {
        	$.ajax({
     			url: "<%=path%>/review/heart",
     			type: "POST",
     			dataType: "text",
     			data: { "revNo" : revNo , "like" : 1},
     			progress: true,
         	
     			success: function(list) {
    				var rev = JSON.parse(list);
     				console.log(rev[0].like);
     				console.log(rev[0].no);
     				
     				str = "";
					$.each(rev, (i, obj) => {
						str += '<button class="heart" type="button" style="border: none;" onclick="likeMinus('+ obj.no +');"><i class="fi-heart-filled"></i><span>('+ obj.like +')</span></button>'
         			});
     				
     				$('#revLike' + rev[0].no).html(str);
     			}
        	});	
        }
        
       	function likeMinus(revNo) {
           	$.ajax({
	        	url: "<%=path%>/review/heart",
	        	type: "POST",
	        	dataType: "text",
	        	data: { "revNo" : revNo , "like" : 0},
	        	progress: true,
	            	
	        	success: function(list) {
	       			var rev = JSON.parse(list);
	       			console.log(rev[0].like);
     				console.log(rev[0].no);
	        		
					str = "";
					$.each(rev, (i, obj) => {
						str += '<button class="heart" type="button" style="border: none;" onclick="likePlus('+ obj.no +');"><i class="fi-heart"></i><span>('+ obj.like +')</span></button>'
         			});
     				
     				$('#revLike' + rev[0].no).html(str);
	        	}
           	});	
       	}
        
        function reviewSort(showId) {
    		var sortVal = $('#reviews-sort').val();
    		var pageNo = 1;
    		console.log(sortVal);
    		$.ajax({
     			url: "<%=path%>/review/list",
     			type: "POST",
     			dataType: "text",
     			data: { "sort" : sortVal , "showId" : showId , "pageNo" : pageNo },
     			progress: true,
         	
     			success: function(list) {
    				var rev = JSON.parse(list);
    				console.log(rev);
    				
    				var str = "";
    				var url = "<%=path %>/resources/images/avatar.png";
    				
    				$.each(rev, (i, obj) => {
        				str += '<div class="d-flex justify-content-between mb-3 ">'
        				str += '    <div class="d-flex align-items-center pe-2 "><img class="rounded-circle me-1 " src="'+ url +'" width="60 " alt="Avatar ">'
        				str += '        <div class="ps-2 ">'
        				str += '            <h6 class="fs-base mb-0 ">'+ obj.user_id +'</h6>'
        				str += '            <span class="star-rating ">'
        				
        				for (var k = 0; k < 5; k++) {
            					if(k < obj.star) {
            						str += '<i class="star-rating-icon fi-star-filled active"></i>'
            					} else {
            						str += '<i class="star-rating-icon fi-star"></i>'
            					}
        				    }
        				
        				str += '            </span>'
        				str += '        </div>'
        				str += '    </div><span class="text-muted fs-sm ">'+ obj.date +'</span>'
        				str += '</div>'
        				str += '<p>'+ obj.content +'</p>'
        				str += '<div class="d-flex align-items-center " id="revLike'+ obj.revNo +'">'
        				str += '    <button class="heart" type="button" style="border: none;" onclick="likePlus('+ obj.revNo +');"><i class="fi-heart"></i><span>('+ obj.like +')</span></button>'
        				str += '</div>'
        				str += '<hr><br>'
    				});
    				
    				$('.review-page').html(str);
    				
    				var maxPage =     rev[0].maxPage     ;
         			var startPage =   rev[0].startPage   ;
         			var endPage =     rev[0].endPage     ;
         			var currentPage = rev[0].currentPage ;
         			var prevPage =    rev[0].prevPage    ;
         			var nextPage =    rev[0].nextPage    ;
         			var startList =   rev[0].startList   ;
         			var endList =     rev[0].endList     ;  

         			str = ""; 

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
    		});
    	};
        
        function goPage(pageNo) {
        	var sortVal = $('#reviews-sort').val();
        	var showId = '<%=show.getShow_id()%>';
     		$.ajax({
     			url: "<%=path%>/review/list",
     			type: "POST",
     			dataType: "text",
     			data: { "pageNo" : pageNo , "sort" : sortVal , "showId" : showId },
     			progress: true,
     			
     			// 성공시
         		success: function(list) {
         			var rev = JSON.parse(list);
         			var str = "";
         			console.log(rev)
         			
         			var url = "<%=path %>/resources/images/avatar.png";
         			
         			$.each(rev, (i, obj) => {
	            		str += '<div class="d-flex justify-content-between mb-3 ">'
	            		str += '    <div class="d-flex align-items-center pe-2 "><img class="rounded-circle me-1 " src="'+ url +'" width="60 " alt="Avatar ">'
	            		str += '        <div class="ps-2 ">'
	            		str += '            <h6 class="fs-base mb-0 ">'+ obj.user_id +'</h6>'
	            		str += '            <span class="star-rating ">'
	            		
	            		for (var k = 0; k < 5; k++) {
		            			if(k < obj.star) {
		            				str += '<i class="star-rating-icon fi-star-filled active"></i>'
		            			} else {
		            				str += '<i class="star-rating-icon fi-star"></i>'
		            			}
	            		    }
	            		
	            		str += '            </span>'
	            		str += '        </div>'
	            		str += '    </div><span class="text-muted fs-sm ">'+ obj.date +'</span>'
	            		str += '</div>'
	            		str += '<p>'+ obj.content +'</p>'
	            		str += '<div class="d-flex align-items-center " id="revLike'+ obj.revNo +'">'
	            		str += '    <button class="heart" type="button" style="border: none;" onclick="likePlus('+ obj.revNo +');"><i class="fi-heart"></i><span>('+ obj.like +')</span></button>'
	            		str += '</div>'
	            		str += '<hr><br>'
            		});

         			$('.review-page').html(str);

         			var maxPage =     rev[0].maxPage     ;
         			var startPage =   rev[0].startPage   ;
         			var endPage =     rev[0].endPage     ;
         			var currentPage = rev[0].currentPage ;
         			var prevPage =    rev[0].prevPage    ;
         			var nextPage =    rev[0].nextPage    ;
         			var startList =   rev[0].startList   ;
         			var endList =     rev[0].endList     ;  

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
    </main>
    
    <%@include file="/views/common/footer.jsp"%>