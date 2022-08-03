<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<%@include file="/views/common/header.jsp"%>

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
        border: 1px solid #dae0e9;
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
    
    h1 {
            font-family: 'NanumSquareRound', sans-serif;
            font-weight: 800;
            color: black;
        }
</style>

<!-- 글쓰기 팝업-->
        <div class="modal fade" id="write-modal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered p-2 my-0 mx-auto" style="width: 600px;">
                <div class="modal-content">
                    <div class="modal-body px-0 py-2 py-sm-0">
                        <button class="btn-close position-absolute top-0 end-0 mt-3 me-3" type="button" data-bs-dismiss="modal"></button>
                        <div class="row mx-0 align-items-center">
                            <div class="col-md-6 px-4 pt-2 pb-4 px-sm-5 pb-sm-5 pt-md-5" style="width: 100%;">
                                <form class="needs-validation" novalidate>
                                    <div class="mb-4">
                                        <label class="form-label mb-2" for="signin-email">이름</label>
                                        <input class="form-control" type="text" placeholder="이름을 입력해주세요" required>
                                    </div>
                                    <div class="mb-4">
                                        <label class="form-label mb-2" for="signin-email">제목</label>
                                        <input class="form-control" type="text" placeholder="제목을 입력해주세요" required>
                                    </div>
                                    <div class="mb-4" style="height: 200px;">
                                        <label class="form-label mb-2" for="signin-email">내용</label>
                                        <input class="form-control" style="height:170px;" type="text" id="signin-email" placeholder="내용을 입력해주세요" required>
                                    </div>
                                    <div style="text-align: center;">
                                        <input class="btn btn-primary btn-lg rounded-pill" style="width:60%" type="submit" value="게시글 작성">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
<!-- 자유게시판 시작 -->
        <section style="margin-top: 90px;">
            <section class="container my-2 py-lg-4">
                <div class="d-sm-flex align-items-center justify-content-center mb-3">
                    <h2 style="color: #0B398E;">공연 소식</h2><a class="btn btn-link fw-normal ms-sm-3 p-0" href="city-guide-blog.html">더보기<i class="fi-arrow-long-right ms-2"></i></a>
                </div>
                <!-- Carousel-->
                <div class="tns-carousel-wrapper tns-nav-outside mb-md-2">
                    <div class="tns-carousel-inner d-block" data-carousel-options="{&quot;controls&quot;: false, &quot;gutter&quot;: 24, &quot;autoHeight&quot;: true, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1,&quot;nav&quot;:true},&quot;500&quot;:{&quot;items&quot;:2},&quot;850&quot;:{&quot;items&quot;:3},&quot;1200&quot;:{&quot;items&quot;:3}}}">
                        <!-- Item-->
                        <article>
                            <a class="d-block mb-3" href="city-guide-blog-single.html"><img class="rounded-3" src="<%=path %>/resources/images/new1.jpg" alt="Post image"></a><a class="fs-xs text-uppercase text-decoration-none" href="#">Travelling</a>
                            <h3 class="fs-base pt-1"><a class="nav-link" href="city-guide-blog-single.html">Air Travel in the Time of COVID-19</a></h3>
                            <a class="d-flex align-items-center text-decoration-none" href="#"><img class="rounded-circle" src="<%=path %>/resources/img/avatars/16.png" width="44" alt="Avatar">
                                <div class="ps-2">
                                    <h6 class="fs-sm text-nav lh-base mb-1">Bessie Cooper</h6>
                                    <div class="d-flex text-body fs-xs"><span class="me-2 pe-1"><i class="fi-calendar-alt opacity-50 mt-n1 me-1 align-middle"></i>May 24</span><span><i class="fi-chat-circle opacity-50 mt-n1 me-1 align-middle"></i>No comments</span></div>
                                </div>
                            </a>
                        </article>
                        <!-- Item-->
                        <article>
                            <a class="d-block mb-3" href="city-guide-blog-single.html"><img class="rounded-3" src="<%=path %>/resources/img/city-guide/blog/02.jpg" alt="Post image"></a><a class="fs-xs text-uppercase text-decoration-none" href="#">Entertainment</a>
                            <h3 class="fs-base pt-1"><a class="nav-link" href="city-guide-blog-single.html">10 World-Class Museums You Can Visit Online</a></h3>
                            <a class="d-flex align-items-center text-decoration-none" href="#"><img class="rounded-circle" src="<%=path %>/resources/img/avatars/18.png" width="44" alt="Avatar">
                                <div class="ps-2">
                                    <h6 class="fs-sm text-nav lh-base mb-1">Annette Black</h6>
                                    <div class="d-flex text-body fs-xs"><span class="me-2 pe-1"><i class="fi-calendar-alt opacity-50 mt-n1 me-1 align-middle"></i>Apr 28</span><span><i class="fi-chat-circle opacity-50 mt-n1 me-1 align-middle"></i>4 comments</span></div>
                                </div>
                            </a>
                        </article>
                        <!-- Item-->
                        <article>
                            <a class="d-block mb-3" href="city-guide-blog-single.html"><img class="rounded-3" src="<%=path %>/resources/img/city-guide/blog/03.jpg" alt="Post image"></a><a class="fs-xs text-uppercase text-decoration-none" href="#">Travelling</a>
                            <h3 class="fs-base pt-1"><a class="nav-link" href="city-guide-blog-single.html">7 Tips for Solo Travelers in Africa</a></h3>
                            <a class="d-flex align-items-center text-decoration-none" href="#"><img class="rounded-circle" src="<%=path %>/resources/img/avatars/17.png" width="44" alt="Avatar">
                                <div class="ps-2">
                                    <h6 class="fs-sm text-nav lh-base mb-1">Ralph Edwards</h6>
                                    <div class="d-flex text-body fs-xs"><span class="me-2 pe-1"><i class="fi-calendar-alt opacity-50 mt-n1 me-1 align-middle"></i>Apr 15</span><span><i class="fi-chat-circle opacity-50 mt-n1 me-1 align-middle"></i>2 comments</span></div>
                                </div>
                            </a>
                        </article>
                    </div>
                </div>
            </section>
        </section>

        <form method="GET" action="<%=path%>/board/list">
        	<input type="hidden" id="pageNo" name="pageNo" val="" />
        	<section>
            <div style="width: 1300px; margin: auto; margin-bottom:30px;">
                <h1>자유게시판</h1>
            </div>

            <div>
                <table class="board" style="width:1300px; height: 800px; text-align: center; margin-top: 30px; margin: 0 auto; border-top: 1px solid black;">
                    <tr style="border-bottom: 1px solid lightgray; height: 50px;">
                        <th style="width:8%; border-right: 1px solid lightgray">번호</th>
                        <th style="border-right: 1px solid lightgray">제목</th>
                        <th style="width:10%; border-right: 1px solid lightgray">작성자</th>
                        <th style="width:15%; border-right: 1px solid lightgray">작성일</th>
                        <th style="width:8%;">조회수</th>
                    </tr>
                    <tbody class="board-data">
                    	<c:forEach var="board" items="${boardList}" varStatus="sts">
                        <tr>
                            <td class="td-no">${board.board_no}</td>
                            <td class="td-title">
                            <a href="<%=path%>/board/view?boardNo=${board.board_no}">${board.title}</a>
                            </td>
                            <td class="td-writer">${board.user_id}</td>
                            <td class="td-date">${board.create_date}</td>
                            <td class="td-count">${board.readcount}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="board-write" style="padding-top: 10px; padding-bottom: 10px; height: 60px; margin: 0 auto; width: 1300px;">
                <a href="#write-modal" data-bs-toggle="modal" data-bs-dismiss="modal" style="float: right;">글쓰기</a>
            </div>
            <div class="board-bottom" style="width:1300px; margin: 0 auto;">
                <div class="board-page" style="text-align: center;">
                	<c:set var="currentPage" value="${pageInfo.getCurrentPage()}" />
                   	<a class="page-first" onclick="goPage(1); return false;"><i class="fi-chevrons-left align-middle"></i></a>
	                <a class="page-prev" onclick="goPage(${pageInfo.getPrevPage()}); return false;"><i class="fi-chevron-left align-middle"></i></a>
	                <c:forEach var="pageNum" begin="${pageInfo.getStartPage()}" end="${pageInfo.getEndPage()}">
	                	<a class="page${currentPage eq pageNum ? '-on' : ''}" id="page${pageNum}" onclick="goPage(${pageNum}); return false;">${pageNum}</a>
	                </c:forEach>
	                <a class="page-next" onclick="goPage(${pageInfo.getNextPage()}); return false;"><i class="fi-chevron-right align-middle"></i></a>
	                <a class="page-end" onclick="goPage(${pageInfo.getMaxPage()}); return false;"><i class="fi-chevrons-right align-middle"></i></a>
                </div>
            </div>
        </section>
        </form>

        <!-- 자유게시판 끝 -->  
        
        <!-- 페이징 ajax -->     
        <script>
        function goPage(pageNo) {
    		
    		$.ajax({
    			url: "<%=path%>/board/list",
    			type: "POST",
    			dataType: "json",
    			data: { "pageNo" : pageNo },
    			progress: true,
    			
    			// 성공시
        		success: function(data) {
        			console.log(data);
        		},	
    			
    			error: function(data) {
        			alert(data)
        		}
    		})
    	}
        </script>
        
 <%@include file="/views/common/footer.jsp"%>