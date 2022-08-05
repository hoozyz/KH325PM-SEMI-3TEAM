<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.Show"%>
<%@page import="vo.User"%>
<%@page import="vo.Review"%>

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
	
	List<String> slist = (List<String>) request.getAttribute("slist");
	List<String> priceList = (List<String>) request.getAttribute("priceLists");
	
	String[] priceArr = show.getPcseguidance().split(", ");
	
	int count1 = 0;
	int count2 = 0;
	int count3 = 0;
	int count4 = 0;
	int count5 = 0;
	
	
	int i = 0;
	
	if(revList != null) {
		while(i < revList.size()) {
			if(revList.get(i).getRev_star() == "1") {
				count1++;
				i++;
			}
			if(revList.get(i).getRev_star() == "2") {
				count2++;
				i++;
			}
			if(revList.get(i).getRev_star() == "3") {
				count3++;
				i++;
			}
			if(revList.get(i).getRev_star() == "4") {
				count4++;
				i++;
			}
			if(revList.get(i).getRev_star() == "5") {
				count5++;
				i++;
			}
		}
	}
	
%>    
 
  <!-- 공연자세히css -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/showDetail/showDetail.css">

<%@include file="/views/common/header.jsp"%>
    
    <!-- Page content-->

        <!-- Review modal 리뷰남기기-->
        <form name="writeForm" action="<%=path%>/Review/writeReview" method="POST">
        	<div class="modal fade" id="modal-review" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header d-block position-relative border-0 pb-0 px-sm-5 px-4">
                        <h3 class="modal-title mt-4 text-center">관람후기 등록 </h3>
                        <button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body px-sm-5 px-4">
                        <form class="needs-validation" novalidate>
                            <div class="mb-3">
                                <label class="form-label" for="review-name">아이디 <span class='text-danger'>*</span></label>
                                <input class="form-control" name="revId" type="text" id="review-name" placeholder="이름" required>
                                <div class="invalid-feedback">아이디를 입력해주세요.</div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="review-rating">별점 <span class='text-danger'>*</span></label>
                                <select class="form-control form-select" name="revStar" id="review-rating" required>
                    <option value="" selected disabled hidden>별점 선택</option>
                    <option value="5 stars">별점 5</option>
                    <option value="4 stars">별점 4</option>
                    <option value="3 stars">별점 3</option>
                    <option value="2 stars">별점 2</option>
                    <option value="1 star">별점 1</option>
                  </select>
                                <div class="invalid-feedback">별점을 선택해주세요.</div>
                            </div>
                            <div class="mb-4">
                                <label class="form-label" for="review-text">관람후기 <span class='text-danger'>*</span></label>
                                <textarea class="form-control" name="revContent" id="review-text" rows="5" placeholder="공연은 어떠셨나요?" required></textarea>
                                <div class="invalid-feedback">관람후기를 등록해주세요</div>
                            </div>
                            <input class="btn btn-primary d-block rounded-pill w-100 mb-4" type="submit" value="리뷰 등록">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        </form>
        
        <!-- 예매결과 팝업 -->
         <form name="writeForm" action="<%=path%>/Review/writeReview" method="POST">
        	<div class="modal fade" id="modal-ticket" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header d-block position-relative border-0 pb-0 px-sm-5 px-4">
                        <h3 class="modal-title mt-4 text-center">관람후기 등록 </h3>
                        <button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body px-sm-5 px-4">
                        <form class="needs-validation" novalidate>
                            <div class="mb-3">
                                <label class="form-label" for="review-name">아이디 <span class='text-danger'>*</span></label>
                                <input class="form-control" name="revId" type="text" id="review-name" placeholder="이름" required>
                                <div class="invalid-feedback">아이디를 입력해주세요.</div>
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="review-rating">별점 <span class='text-danger'>*</span></label>
                                <select class="form-control form-select" name="revStar" id="review-rating" required>
                    <option value="" selected disabled hidden>별점 선택</option>
                    <option value="5 stars">별점 5</option>
                    <option value="4 stars">별점 4</option>
                    <option value="3 stars">별점 3</option>
                    <option value="2 stars">별점 2</option>
                    <option value="1 star">별점 1</option>
                  </select>
                                <div class="invalid-feedback">별점을 선택해주세요.</div>
                            </div>
                            <div class="mb-4">
                                <label class="form-label" for="review-text">관람후기 <span class='text-danger'>*</span></label>
                                <textarea class="form-control" name="revContent" id="review-text" rows="5" placeholder="공연은 어떠셨나요?" required></textarea>
                                <div class="invalid-feedback">관람후기를 등록해주세요</div>
                            </div>
                            <input class="btn btn-primary d-block rounded-pill w-100 mb-4" type="submit" value="리뷰 등록">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        </form>
        

        <!-- Page header-->
        <section class="container pt-5 mt-5" style="margin-bottom: 20px;">
            <!-- Breadcrumb-->
            <div class="d-sm-flex align-items-center justify-content-between mb-0">
                <span class="show_titie"><%=show.getPrfnm() %><span class="badge bg-accent" style="font-size: 20px; margin-left: 10px;"><%=show.getGenrenm() %></span></span>
                <div class="text-nowrap">
                    <button class="btn btn-icon btn-light-primary btn shadow-sm rounded-circle" type="button" data-bs-toggle="tooltip" title="찜하기"><i class="fi-heart"></i></button>
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
                <div class="col-7 mt-4">
                    <div class="info_show mt-4 mb-2">
                        <div class="row">
                            <div class="col-3">
                                <div class="info_tit">기간</div>
                            </div>
                            <div class="col-9">
                                <div class="info_txt"><%=show.getPrfpdfrom() %> &nbsp;&nbsp; ~ &nbsp;&nbsp; <%=show.getPrfpdto() %></div>
                            </div>
                            <div class="col-3">
                                <div class="info_tit">장소</div>
                            </div>
                            <div class="col-9">
                                <div class="info_txt"><%=show.getFcltynm() %></div>
                            </div>
                            <div class="col-3">
                                <div class="info_tit">런타임</div>
                            </div>
                            <div class="col-9">
                                <div class="info_txt"><%=show.getPrfruntime() %></div>
                            </div>
                            <div class="col-3">
                                <div class="info_tit">관람 연령</div>
                            </div>
                            <div class="col-9">
                                <div class="info_txt"><%=show.getPrfage() %></div>
                            </div>
                            <div class="col-3">
                                <div class="info_tit">출연진</div>
                            </div>
                            <div class="col-9">
                                <div class="info_txt"><%=show.getPrfcast() %></div>
                            </div>
                            <div class="col-3">
                                <div class="info_tit">제작사</div>
                            </div>
                            <div class="col-9">
                                <div class="info_txt"><%=show.getEntrpsnm() %></div>
                            </div>
                            <hr>
                            <div class="col-3 mt-3">
                                <div class="info_tit">가격</div>
                            </div>
                            <div class="col-9 mt-3" style="background-color: #f6f6f6;">
                                <div>
                                    <% for (int j = 0; j < priceArr.length; j++) { %>
                                    	<div class="info_txt"><%=priceArr[j].trim() %></div>
                                    <% } %>
                                </div>
                            </div>
                        </div>
                    </div>
                   <% if(loginUser != null) { %>
                   			 <div style="text-align: end; margin-right: 10px;">
                        <div class="btn btn-outline-primary rounded ms-5" href="#modal-ticketing" data-bs-toggle="modal" data-bs-dismiss="modal" style="display: inline-block; width: 230px; height: 60px;">
                            <div style="font-size: 24px;">예매 하기</div>
                        </div>
                   <% } else {%>
                   		 <div style="text-align: end; margin-right: 10px;">
                        <div class="btn btn-outline-primary rounded ms-5" href="#signin-modal" data-bs-toggle="modal" data-bs-dismiss="modal" style="display: inline-block; width: 230px; height: 60px;">
                            <div style="font-size: 24px;">예매 하기</div>
                        </div>
                   <% } %>
                        
                       <!-- 팝업시작 -->
                      <%--   <form name="ticketingForm" action="<%=path%>/showDetail/Ticketing" method="POST"> --%>
                        <div class="background">
                            <div class="window">
                                <div class="popup">
                                    <div class="row" style="margin: 0; bottom: 0;">
                                        <div class="popup_left col-6">
                                            <div style="text-align: left; margin-top: 10px; margin-left: 10px;margin-bottom: 20px;">
                                                <h1 class="display-2" style=" color: #dbab34">예매하기</h1>
                                                <div class="popup_left">
                                                	<img src=<%=show.getPoster() %> alt="image" style="width: 400; height: 500; margin-left:120px;">
                                                </div>
                                                <div class="popup_left_detail">
                                                    <h2 style="color: #d9e2f2"><%=show.getPrfnm() %></h2>
                                                    <h4 style="color: #d9e2f2"><%=show.getFcltynm() %></h4>
                                                    <h4 style="color: #d9e2f2"><%=show.getPrfpdfrom() %> &nbsp;&nbsp; ~ &nbsp;&nbsp; <%=show.getPrfpdto() %></h4>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="popup_right col-6">
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
						                                    <% for (int j = 0; j < priceArr.length; j++) { %>
				                                    		<option><%= priceArr[j].trim() %></option>
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
                                                        <span class="final_price" id="total-price">0</span> <span>원</span>
                                                    </div>


                                                    <div class="ticketing_check">선택하신 정보가 맞으시다면,</div>
                                                    <div style="margin-left: 30px;">
                                                    <a href="#modal-ticket" data-bs-toggle="modal" data-bs-dismiss="modal" onclick="ticketView('<%=show.getShow_id()%>')">
                                                    	<button class="btn btn-outline-accent rounded ms-5" style="width:130px;height:60px;background-color:#201627" id="ticketing">
                                                            <div style="color: #d9e2f2; font-size: 20px;">예매하기</div>
                                                    	</button>
                                                    </a>
                                                    <button class="btn btn-outline-accent rounded ms-5" style="width:130px;height:60px;background-color:#201627" id="close">
                                                         <div style="color: #d9e2f2; font-size: 20px;">취소하기</div>
                                                    </button>
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
            				
            				str += '<div>'+ tic[0].date +'</div>';
            				str += '<div>'+ tic[0].seat +'</div>';
            				str += '<div>'+ tic[0].fcltynm +'</div>';
            				str += '<div>'+ tic[0].show_id +'</div>';
            				str += '<div>'+ tic[0].user_id +'</div>';
            				str += '<div>'+ tic[0].price +'</div>';
            				str += '<div>'+ tic[0].count +'</div>';
            				str += '<div>'+ tic[0].pfrnm +'</div>';
            				
            				$('#modal-ticket').html(str);
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
                        <h3 style="display: inline; font-family: 'Gugi', cursive; ">관람 후기</h3>
                    </div>
                    <div class="row mb-md-5 mb-4">
                        <!-- Rating breakdown-->
                        <div class="col-sm-8 order-sm-1 order-2 ">
                            <div class="d-flex align-items-center mb-2 fs-sm ">
                                <div class="text-nowrap ">5<i class="fi-star mt-n1 ms-1 align-middle opacity-70 "></i></div>
                                <div class="progress w-100 mx-3 ">
                                    <div class="progress-bar bg-warning " role="progressbar " style="width: 80% " aria-valuenow="80" aria-valuemin="0 " aria-valuemax="100 "></div>
                                </div><span style="min-width: 48px; "><%=count5 %></span>
                            </div>
                            <div class="d-flex align-items-center mb-2 fs-sm ">
                                <div class="text-nowrap ">4<i class="fi-star mt-n1 ms-1 align-middle opacity-70 "></i></div>
                                <div class="progress w-100 mx-3 ">
                                    <div class="progress-bar bg-warning " role="progressbar " style="width: 10% " aria-valuenow="10 " aria-valuemin="0 " aria-valuemax="100 "></div>
                                </div><span style="min-width: 48px; "><%=count4 %></span>
                            </div>
                            <div class="d-flex align-items-center mb-2 fs-sm ">
                                <div class="text-nowrap ">3<i class="fi-star mt-n1 ms-1 align-middle opacity-70 "></i></div>
                                <div class="progress w-100 mx-3 ">
                                    <div class="progress-bar bg-warning " role="progressbar " style="width: 0% " aria-valuenow="0 " aria-valuemin="0 " aria-valuemax="100 "></div>
                                </div><span style="min-width: 48px; "><%=count3 %></span>
                            </div>
                            <div class="d-flex align-items-center mb-2 fs-sm ">
                                <div class="text-nowrap ">2<i class="fi-star mt-n1 ms-1 align-middle opacity-70 "></i></div>
                                <div class="progress w-100 mx-3 ">
                                    <div class="progress-bar bg-warning " role="progressbar " style="width: 0% " aria-valuenow="0 " aria-valuemin="0 " aria-valuemax="100 "></div>
                                </div><span style="min-width: 48px; "><%=count2 %></span>
                            </div>
                            <div class="d-flex align-items-center mb-2 fs-sm ">
                                <div class="text-nowrap ">1<i class="fi-star mt-n1 ms-1 align-middle opacity-70 "></i></div>
                                <div class="progress w-100 mx-3 ">
                                    <div class="progress-bar bg-warning " role="progressbar " style="width: 0% " aria-valuenow="0" aria-valuemin="0 " aria-valuemax="100 "></div>
                                </div><span style="min-width: 48px; "><%=count1 %></span>
                            </div>
                        </div>
                        <!-- Score-->
                        <div class="col-sm-4 order-sm-2 order-1 mb-sm-0 mb-3 text-center ">
                            <h5 class="display-2 mb-1 ">4.7</h5>
                            <div><span class="star-rating "><i class="star-rating-icon fi-star-filled active "></i><i class="star-rating-icon fi-star-filled active "></i><i class="star-rating-icon fi-star-filled active "></i><i class="star-rating-icon
                    fi-star-filled active "></i><i class="star-rating-icon fi-star-filled active "></i></span>
                            </div><span style="font-size: 20px; margin-top: 10px; ">
                            <%if (revList != null) { %>
                            	<%=revList.size() %>개
                            <% } else { %>
                            	0개
                            <% } %>								
                            </span>
                        </div>
                    </div>
                    <!-- Add review btn + Reviews sort-->
                    <div class="d-flex flex-sm-row flex-column align-items-sm-center justify-content-between mb-4 pb-4 border-bottom "><a class="btn btn-outline-primary rounded-pill mb-sm-0 mb-3 " href="#modal-review " data-bs-toggle="modal" data-bs-dismiss="modal"><i class="fi-edit mt-n1 me-2 align-middle "></i>후기 등록</a>
                        <div class="d-flex align-items-center ms-sm-4 ">
                            <label class="d-inline-block me-2 pe-1 text-muted text-nowrap " for="reviews-sort "><i class="fi-arrows-sort mt-n1 me-1 align-middle opacity-80"></i>정렬순:</label>
                            <select class="form-select " id="reviews-sort " style="min-width: 180px; ">
                  <option>최신순</option>
                  <option>오래된순</option>
                  <option>인기순</option>
                  <option>별점 높은순</option>
                  <option>별점 낮은순</option>
                </select>
                        </div>
                    </div>
                    <!-- Review-->
                    <div class="mb-4 pb-4 border-bottom ">
                        <div class="d-flex justify-content-between mb-3 ">
                            <div class="d-flex align-items-center pe-2 "><img class="rounded-circle me-1 " src="img/avatars/03.jpg " width="48 " alt="Avatar ">
                                <div class="ps-2 ">
                                    <h6 class="fs-base mb-0 ">Annette Black</h6><span class="star-rating "><i class="star-rating-icon fi-star-filled active "></i><i class="star-rating-icon fi-star-filled active "></i><i class="star-rating-icon fi-star-filled
                    active "></i><i class="star-rating-icon fi-star-filled active "></i><i class="star-rating-icon fi-star-filled active "></i></span>
                                </div>
                            </div><span class="text-muted fs-sm ">Jan 17, 2021</span>
                        </div>
                        <p>Elementum ut quam tincidunt egestas vitae elit, hendrerit. Ullamcorper nulla amet lobortis elit, nibh condimentum enim. Aliquam felis nisl tellus sodales lectus dictum tristique proin vitae. Odio fermentum viverra tortor quis.</p>
                        <div class="d-flex align-items-center ">
                            <button class="btn-like " type="button "><i class="fi-like "></i><span>(3)</span></button>
                        </div>
                    </div>
                    <!-- Review-->
                    <div class="mb-4 pb-4 border-bottom ">
                        <div class="d-flex justify-content-between mb-3 ">
                            <div class="d-flex align-items-center pe-2 "><img class="rounded-circle me-1 " src="img/avatars/13.png " width="48 " alt="Avatar ">
                                <div class="ps-2 ">
                                    <h6 class="fs-base mb-0 ">Darrell Steward</h6><span class="star-rating "><i class="star-rating-icon fi-star-filled active "></i><i class="star-rating-icon fi-star-filled active "></i><i class="star-rating-icon fi-star-filled
                    active "></i><i class="star-rating-icon fi-star-filled active "></i><i class="star-rating-icon fi-star "></i></span>
                                </div>
                            </div><span class="text-muted fs-sm ">Dec 1, 2020</span>
                        </div>
                        <p>Vel dictum nunc ut tristique. Egestas diam amet, ut proin hendrerit. Dui accumsan at phasellus tempus consequat dignissim.</p>
                        <div class="d-flex align-items-center ">
                            <button class="btn-like " type="button "><i class="fi-like "></i><span>(0)</span></button>
                        </div>
                    </div>
                    <!-- Review-->
                    <div class="mb-4 pb-4 border-bottom ">
                        <div class="d-flex justify-content-between mb-3 ">
                            <div class="d-flex align-items-center pe-2 "><img class="rounded-circle me-1 " src="img/avatars/13.png " width="48 " alt="Avatar ">
                                <div class="ps-2 ">
                                    <h6 class="fs-base mb-0 ">Floyd Miles</h6><span class="star-rating "><i class="star-rating-icon fi-star-filled active "></i><i class="star-rating-icon fi-star-filled active "></i><i class="star-rating-icon fi-star-filled
                    active "></i><i class="star-rating-icon fi-star-filled active "></i><i class="star-rating-icon fi-star-filled active "></i></span>
                                </div>
                            </div><span class="text-muted fs-sm ">Oct  28, 2020</span>
                        </div>
                        <p>Viverra nunc blandit sapien non imperdiet sit. Purus tempus elementum aliquam eu urna. A aenean duis non egestas at libero porttitor integer eget. Sed dictum lobortis laoreet gravida.</p>
                        <div class="d-flex align-items-center ">
                            <button class="btn-like " type="button "><i class="fi-like "></i><span>(2)</span></button>
                        </div>
                    </div>
                    <!-- Review-->
                    <div class="mb-4 pb-4 border-bottom ">
                        <div class="d-flex justify-content-between mb-3 ">
                            <div class="d-flex align-items-center pe-2 "><img class="rounded-circle me-1 " src="img/avatars/04.jpg " width="48 " alt="Avatar ">
                                <div class="ps-2 ">
                                    <h6 class="fs-base mb-0 ">Ralph Edwards</h6><span class="star-rating "><i class="star-rating-icon fi-star-filled active "></i><i class="star-rating-icon fi-star-filled active "></i><i class="star-rating-icon fi-star-filled
                    active "></i><i class="star-rating-icon fi-star-filled active "></i><i class="star-rating-icon fi-star "></i></span>
                                </div>
                            </div><span class="text-muted fs-sm ">Sep 14, 2020</span>
                        </div>
                        <p>Elementum nisl, egestas nam consectetur nisl, at pellentesque cras. Non sed ac vivamus dolor dignissim ut. Nisl sapien blandit pulvinar sagittis donec sociis ipsum arcu est. Tempus, rutrum morbi scelerisque tempor mi. Etiam urna,
                            cras bibendum leo nec faucibus velit. Tempor lectus dignissim at auctor integer neque quam amet.</p>
                        <div class="d-flex align-items-center ">
                            <button class="btn-like " type="button "><i class="fi-like "></i><span>(0)</span></button>
                        </div>
                    </div>
                    <!-- Review pagination + Add review btn-->
                    <div class="d-flex align-items-center justify-content-between ">
                        <nav aria-label="Reviews pagination ">
                            <ul class="pagination mb-0 ">
                                <li class="page-item d-sm-none "><span class="page-link page-link-static ">1 / 8</span></li>
                                <li class="page-item active d-none d-sm-block " aria-current="page "><span class="page-link ">1<span class="visually-hidden ">(current)</span></span>
                                </li>
                                <li class="page-item d-none d-sm-block "><a class="page-link " href="# ">2</a></li>
                                <li class="page-item d-none d-sm-block "><a class="page-link " href="# ">3</a></li>
                                <li class="page-item d-none d-sm-block ">...</li>
                                <li class="page-item d-none d-sm-block "><a class="page-link " href="# ">8</a></li>
                                <li class="page-item "><a class="page-link " href="# " aria-label="Next "><i class="fi-chevron-right "></i></a></li>
                            </ul>
                        </nav><a class="btn btn-outline-primary rounded-pill ms-4 " href="#modal-review " data-bs-toggle="modal" data-bs-dismiss="modal"><i class="fi-edit mt-n1 me-1 align-middle "></i>후기 등록</a>
                    </div>
                </div>
                <!-- Sidebar-->
            </div>
        </section>

        <!-- Recently viewed-->
        <section class="container pb-5 mb-lg-4 ">
            <div class="d-flex align-items-center justify-content-between mb-4 pb-2 ">
                <h2 class="h3 mb-0 ">최신 후기</h2><a class="btn btn-link fw-normal ms-sm-3 p-0 " href="city-guide-catalog.html ">더보기<i class="fi-arrow-long-right ms-2 "></i></a>
            </div>
            <div class="tns-carousel-wrapper tns-controls-outside-xxl tns-nav-outside mb-xxl-2 ">
                <div class="tns-carousel-inner " data-carousel-options="{&quot;items&quot;: 3, &quot;gutter&quot;: 24, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1,&quot;nav&quot;:true},&quot;500&quot;:{&quot;items&quot;:2},&quot;850&quot;:{&quot;items&quot;:3},&quot;1400&quot;:{&quot;items&quot;:3,&quot;nav&quot;:false}}} ">
                    <!-- Item-->
                    <div>
                        <div class="position-relative ">
                            <div class="position-relative mb-3 ">
                                <img class="rounded-3 " src="resources/images/child2.gif" alt="Article img " style="height: 400px; width: 300px;">
                            </div>
                            <h3 class=" mb-2 fs-lg "><a class="nav-link stretched-link " href="# ">Repose Hotel</a></h3>
                            <ul class="list-inline mb-0 fs-xs ">
                                <li class="list-inline-item pe-1 "><i class="fi-star-filled mt-n1 me-1 fs-base text-warning align-middle "></i><b>5.0</b><span class="text-muted ">&nbsp;(48)</span></li>
                                <li class="list-inline-item pe-1 "><i class="fi-edit mt-n1 me-1 fs-base text-muted align-middle "></i>5</li>
                            </ul>
                        </div>
                    </div>
                    <!-- Item-->
                    <div>
                        <div class="position-relative ">
                            <div class="position-relative mb-3 ">
                                <img class="rounded-3 " src="resources/images/child2.gif " alt="Article img " style="height: 400px; width: 300px; ">
                            </div>
                            <h3 class="mb-2 fs-lg "><a class="nav-link stretched-link " href="# ">Leisure Inn</a></h3>
                            <ul class="list-inline mb-0 fs-xs ">
                                <li class="list-inline-item pe-1 "><i class="fi-star-filled mt-n1 me-1 fs-base text-warning align-middle "></i><b>4.8</b><span class="text-muted ">&nbsp;(24)</span></li>
                                <li class="list-inline-item pe-1 "><i class="fi-edit mt-n1 me-1 fs-base text-muted align-middle "></i>5</li>
                            </ul>
                        </div>
                    </div>
                    <!-- Item-->
                    <div>
                        <div class="position-relative ">
                            <div class="position-relative mb-3 ">
                                <img class="rounded-3 " src="resources/images/poster2.jpg " alt="Article img " style="height: 400px; width: 300px;">
                            </div>
                            <h3 class="mb-2 fs-lg "><a class="nav-link stretched-link " href="# ">Soothe &amp; Stay</a></h3>
                            <ul class="list-inline mb-0 fs-xs ">
                                <li class="list-inline-item pe-1 "><i class="fi-star-filled mt-n1 me-1 fs-base text-warning align-middle "></i><b>4.9</b><span class="text-muted ">&nbsp;(43)</span></li>
                                <li class="list-inline-item pe-1 "><i class="fi-edit mt-n1 me-1 fs-base text-muted align-middle "></i>5</li>
                            </ul>
                        </div>
                    </div>
                    <!-- Item-->
                    <div>
                        <div class="position-relative ">
                            <div class="position-relative mb-3 ">
                                <img class="rounded-3 " src="resources/images/child.jpg " alt="Article img " style="height: 400px; width: 300px;">
                            </div>
                            <h3 class="mb-2 fs-lg "><a class="nav-link stretched-link " href="# ">Merry Berry Motel</a></h3>
                            <ul class="list-inline mb-0 fs-xs ">
                                <li class="list-inline-item pe-1 "><i class="fi-star-filled mt-n1 me-1 fs-base text-warning align-middle "></i><b>4.5</b><span class="text-muted ">&nbsp;(13)</span></li>
                                <li class="list-inline-item pe-1 "><i class="fi-credit-card mt-n1 me-1 fs-base text-muted align-middle "></i>$$</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    
    <%@include file="/views/common/footer.jsp"%>