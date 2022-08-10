<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- https://cors-anywhere.herokuapp.com/corsdemo <- 사이트 들어가서 demo server 클릭해야함 cors에러 해결 -->

<%@include file="/views/common/header.jsp"%>

<!-- Page content-->
        <!-- Hero-->
        <main>
       <section class="container-fluid py-5 mt-5 mb-5" style="height:470px; background-image: url(resources/images/heroBg.png)">
            <section class="container py-0 mt-0 mb-3">
                <div class="row align-items-center mt-md-2 ms-5">
                    <div class="col-lg-7 order-lg-2 mb-lg-0 mb-4 pb-2 pb-lg-0"><img class="d-block mx-auto" src="resources/images/heroPoster.png" width="450" alt="Hero image"></div>
                    <div class="col-lg-5 order-lg-1 pe-lg-0">
                        <div style="padding-left : 40px;">
                            <h1 class="display-3 mb-2 me-lg-n5 text-lg-start text-center mb-2" style="font-size: 40pt; font-weight:normal">지금 바로,</h1>
                            <h1 class="display-3 mb-2 me-lg-n5 text-lg-start text-center mb-2" style="font-size: 40pt; font-weight:normal">원하는 <span class=" type text-info1" style=" box-shadow: inset 0 -20px 0 #59f7ca;">공연</span></h1>
                            <h1 class="display-3 mb-2 me-lg-n5 text-lg-start text-center mb-2" style="font-size: 40pt; font-weight:normal"> 검색하세요!</h1>

                            <!-- type.js -->
                            <script type="text/javascript" src="resources/js/typed.js"></script>
                            <script>
                                var typed = new Typed('.type', {
                                    strings: [
                                        ' 공연을',
                                        ' 음악을',
                                        ' 공연장을'
                                    ],
                                    typeSpeed: 150,
                                    backSpeed: 150,
                                    backDelay: 1000,
                                    loop: true

                                });
                            </script>
                        </div>

                        <!-- Search form-->
                        <div class="me-lg-n5">
                            <form class="form-group d-block d-md-flex position-relative rounded-md-pill me-lg-n5" action="<%=path %>/showSearch" method="GET">
                                <div class="input-group input-group-lg border-end-md"><span class="input-group-text text-muted rounded-pill ps-3"><i class="fi-search"></i></span>
                                    <input class="form-control" name="keyword" type="text" placeholder="무엇을 찾으시나요?">
                                </div>
                                <hr class="d-md-none my-2">
                                <div class="d-sm-flex">
                                    <div class="dropdown w-100 mb-sm-0 mb-3" data-bs-toggle="select">
                                        <button class="btn btn-link btn-lg dropdown-toggle ps-2 ps-sm-3" type="button" data-bs-toggle="dropdown" ><i class="fi-list me-2"></i><span class="dropdown-toggle-label">카테고리</span></button>
                                        <input type="hidden" name="category">
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#"><i class="fi-museum fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">공연</span></a></li>
                                            <li><a class="dropdown-item" href="#"><i class="fi-music  opacity-60 me-2"></i><span class="dropdown-item-label">음악</span></a></li>
                                            <li><a class="dropdown-item" href="#"><i class="fi-dots-horisontal fs-lg opacity-60 me-2"></i><span class="dropdown-item-label">기타</span></a></li>
                                        </ul>
                                    </div>
                                    <input class="btn btn-primary btn-lg rounded-pill w-100 w-md-auto ms-sm-3" type="submit" value="검색"></button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
        </section>

        <!--@@@@@@@@@@ 실시간 랭킹 @@@@@@@@@@-->
        <section class="container" style="margin-bottom: 10px;">
            <div class="d-sm-flex justify-content-between mb-2">
                <div>
                    <h2 style="display:inline">실시간 </h2>
                    <h2 style="display:inline; color: #dbab34; ">랭킹</h2>
                    <h6 style=" display:inline; margin-left : 10px; ">기간별 인기작품을 만나보세요!</h6>
                </div>

                <!-- <div class="col-md-8 mb-3">
                    <h2 style="font-size: 40px; display:inline">실시간 </h2>
                    <h2 style="font-size: 40px; color: #dbab34; display:inline;">랭킹</h2>
                    <h6 style=" display:inline; margin-left : 10px; ">기간별 인기작품을 만나보세요!</h6>
                </div> -->
                <a class="btn btn-link fw-normal ms-sm-3 p-0" href="<%=path %>/rankList" style="margin-top: 15px;">더보기<i class="fi-arrow-long-right ms-1"></i></a>
            </div>
            <div style="width: 1200px; margin: 0 auto; display:inline-block; height: 35px;">
                <div style="position: relative; margin-bottom: 0px; display:inline-block; height: 35px;">
                    <ul class="period-ul" style="padding-left: 5px;">
                        <li class="on">
                            <a href="#n" id="day" class="on">일간</a>
                        </li>
                        <li class>
                            <a href="#n" id="week" class>주간</a>
                        </li>
                        <li class>
                            <a href="#n" id="month" class>월간</a>
                        </li>
                    </ul>
                    <p id="datestr" style="margin-left: 20px; float:left; margin-bottom: 5px; margin-top: 2px;"></p>
                </div>
            </div>
            <div class="swiper-container">
                <!-- 보여지는 영역 -->
        </section>
        <div class="all-container">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="img-container">
                            <a class="showlink1" href>
                                <div class="img">
                                    <span>1</span>
                                    <img class="rank-img-1" src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF189859_220421_102833.gif">
                                </div>
                                <div class="shadow1">
                                    <p class="tit"></p>
                                    <p class="txt1"></p>
                                    <p class="txt2"></p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="img-container">
                            <a class="showlink2" href>
                                <div class="img">
                                    <span>2</span>
                                    <img class="rank-img-2" src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF195242_220726_144628.gif">
                                </div>
                                <div class="shadow2">
                                    <p class="tit"></p>
                                    <p class="txt1"></p>
                                    <p class="txt2"></p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="img-container">
                            <a class="showlink3" href>
                                <div class="img">
                                    <span>3</span>
                                    <img class="rank-img-3" src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF192965_220617_095005.gif">
                                </div>
                                <div class="shadow3">
                                    <p class="tit"></p>
                                    <p class="txt1"></p>
                                    <p class="txt2"></p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="img-container">
                            <a class="showlink4" href>
                                <div class="img">
                                    <span>4</span>
                                    <img class="rank-img-4" src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF191916_220530_111000.gif">
                                </div>
                                <div class="shadow4">
                                    <p class="tit"></p>
                                    <p class="txt1"></p>
                                    <p class="txt2"></p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="img-container">
                            <a class="showlink5" href>
                                <div class="img">
                                    <span>5</span>
                                    <img class="rank-img-5" src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF189439_220413_125740.jpg">
                                </div>
                                <div class="shadow5">
                                    <p class="tit"></p>
                                    <p class="txt1"></p>
                                    <p class="txt2"></p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="img-container">
                            <a class="showlink6" href>
                                <div class="img">
                                    <span>6</span>
                                    <img class="rank-img-6" src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF191776_220526_115305.gif">
                                </div>
                                <div class="shadow6">
                                    <p class="tit"></p>
                                    <p class="txt1"></p>
                                    <p class="txt2"></p>
                                </div>
                            </a>
                        </div>

                    </div>
                    <div class="swiper-slide">
                        <div class="img-container">
                            <a class="showlink7" href>
                                <div class="img">
                                    <span>7</span>
                                    <img class="rank-img-7" src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF192944_220616_144920.jpg">
                                </div>
                                <div class="shadow7">
                                    <p class="tit"></p>
                                    <p class="txt1"></p>
                                    <p class="txt2"></p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="img-container">
                            <a class="showlink8" href>
                                <div class="img">
                                    <span>8</span>
                                    <img class="rank-img-8" src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF191728_220526_093828.gif">
                                </div>
                                <div class="shadow8">
                                    <p class="tit"></p>
                                    <p class="txt1"></p>
                                    <p class="txt2"></p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="img-container">
                            <a class="showlink9" href>
                                <div class="img">
                                    <span>9</span>
                                    <img class="rank-img-9" src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF186855_220217_093607.gif">
                                </div>
                                <div class="shadow9">
                                    <p class="tit"></p>
                                    <p class="txt1"></p>
                                    <p class="txt2"></p>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="img-container">
                            <a class="showlink10" href>
                                <div class="img">
                                    <span>10</span>
                                    <img class="rank-img-10" src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF191302_220519_094204.gif">
                                </div>
                                <div class="shadow10">
                                    <p class="tit"></p>
                                    <p class="txt1"></p>
                                    <p class="txt2"></p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <section style="height: 70px;">
            <div class="paging-wrap" style="position: absolute;">
                <div class="swiper-pagination" style="position: absolute;"></div>
            </div>
        </section>

        <!--@@@@@@@@@@ 실시간 랭킹 끝 @@@@@@@@@@-->

        <!--@@@@@@@@@@ 전국 공연장 @@@@@@@@@@-->
        <section class="container mb-sm-4 mb-3 pb-lg-4">
            <div class="col-md-8 mb-3" style="width: 1300px;">
                <h2 style="display:inline">전국 </h2>
                <h2 style="display:inline; color: #0B398E; ">공연장</h2>
                <h6 style=" display:inline; margin-left : 10px; ">전국 주요 공연장을 빠르게 찾아보세요!</h6>
                <a class="btn btn-link fw-normal ms-sm-3 p-0" href="<%=path %>/hallMain" style="margin-top: 20px; float:right;">더보기<i class="fi-arrow-long-right ms-1"></i></a>
            </div>
            <!-- No image-->
            <div class="card border-0 shadow-sm">
                <div class="card-header p-0 b-0" style="border:0; text-align:center;">
                    <ul class="nav nav-tabs p-0 m-0 b-0" role="tablist">
                        <li class="col m-0" style="border-radius:0;"><a class="nav-link pb-1 active" href="#sejong" data-bs-toggle="tab" role="tab" aria-controls="sejong" aria-selected="true" style="border-radius:0;">세종문화회관</a></li>
                        <li class="col m-0"><a class="nav-link pb-1" href="#lotte" data-bs-toggle="tab" role="tab" aria-controls="lotte" aria-selected="false" style="border-radius:0;">롯데콘서트홀</a></li>
                        <li class="col m-0"><a class="nav-link pb-1" href="#daejeon" data-bs-toggle="tab" role="tab" aria-controls="daejeon" aria-selected="false" style="border-radius:0;">대전예술의전당</a></li>
                        <li class="col m-0"><a class="nav-link pb-1" href="#pohang" data-bs-toggle="tab" role="tab" aria-controls="kumho" aria-selected="false" style="border-radius:0;">포항문예회관</a></li>
                        <li class="col m-0"><a class="nav-link pb-1" href="#busan" data-bs-toggle="tab" role="tab" aria-controls="busan" aria-selected="false" style="border-radius:0;">부산문화회관</a></li>
                    </ul>
                </div>
                <div class="card-body pt-4 pb-0" style="background-image: url(resources/images/stadium-logo/stadium_bg1.png);">
                    <div class="tab-content">
                        <div class="tab-pane fade row active show" id="sejong" role="tabpanel" style="background-image: url(resources/images/stadium-logo/stadium-bg6.png)">
                            <div class="card py-5 px-0" style="max-width: 15rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; ">
                                    <img src="resources/images/stadium-logo/sejong_ci.png" style="width:70%;">
                                    <br>
                                    <br>
                                    <p class="card-text fs-xs m-0 p-0">문화로 더 새롭게,</p>
                                    <p class="card-text fs-xs m-0 p-0">예술로 더 풍요롭게,</p>
                                    <p class="card-text fs-xs m-0 p-0">세종문화회관</p>
                                </div>
                            </div>

                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body" id="card-body" style="text-align: center; cursor:pointer;" onclick="location.href='<%=path%>/showDetail?showId=PF195255'">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF195255_220727_094226.jpg">
                                    <p class="card-text fs-ms pt-1 m-0" style="font-weight: bold;">해리 포터와 아즈카반의 죄수™ 인 콘서트</p>
                                    <p class="card-text fs-sm m-0 p-0">2022.10.07 ~ 2022.10.09</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; cursor:pointer;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="resources/images/perform/ex_poster3.png">
                                    <p class="card-text fs-ms pt-1 m-0" style="font-weight: bold;">공연 이름</p>
                                    <p class="card-text fs-sm m-0 p-0">날짜</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; cursor:pointer;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="resources/images/perform/ex_poster3.png">
                                    <p class="card-text fs-ms pt-1 m-0" style="font-weight: bold;">공연 이름</p>
                                    <p class="card-text fs-sm m-0 p-0">날짜</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; cursor:pointer;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="resources/images/perform/ex_poster3.png">
                                    <p class="card-text fs-ms pt-1 m-0" style="font-weight: bold;">공연 이름</p>
                                    <p class="card-text fs-sm m-0 p-0">날짜</p>
                                </div>
                            </div>

                        </div>
                        <div class="tab-pane fade row" id="lotte" role="tabpanel">
                            <div class="card py-5 px-0" style="max-width: 15rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; ">
                                    <img src="resources/images/stadium-logo/lotte_ci.png" style="width:70%;">
                                    <br>
                                    <br>
                                    <p class="card-text fs-xs m-0 p-0">문화로 더 새롭게,</p>
                                    <p class="card-text fs-xs m-0 p-0">예술로 더 풍요롭게,</p>
                                    <p class="card-text fs-xs m-0 p-0">롯데콘서트홀</p>
                                </div>
                            </div>


                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; cursor:pointer;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="resources/images/perform/ex_poster3.png">
                                    <p class="card-text fs-ms pt-1 m-0" style="font-weight: bold;">공연 이름</p>
                                    <p class="card-text fs-sm m-0 p-0">날짜</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; cursor:pointer;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="resources/images/perform/ex_poster3.png">
                                    <p class="card-text fs-ms pt-1 m-0" style="font-weight: bold;">공연 이름</p>
                                    <p class="card-text fs-sm m-0 p-0">날짜</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; cursor:pointer;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="resources/images/perform/ex_poster3.png">
                                    <p class="card-text fs-ms pt-1 m-0" style="font-weight: bold;">공연 이름</p>
                                    <p class="card-text fs-sm m-0 p-0">날짜</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; cursor:pointer;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="resources/images/perform/ex_poster3.png">
                                    <p class="card-text fs-ms pt-1 m-0" style="font-weight: bold;">공연 이름</p>
                                    <p class="card-text fs-sm m-0 p-0">날짜</p>
                                </div>
                            </div>



                        </div>
                        <div class="tab-pane fade row" id="daejeon" role="tabpanel" style="background-image: url(resources/images/stadium-logo/stadium-bg6.png)">
                            <div class="card py-5 px-0" style="max-width: 15rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; ">
                                    <img src="resources/images/stadium-logo/daejeon_ci.png" style="width:70%;">
                                    <br>
                                    <br>
                                    <p class="card-text fs-xs m-0 p-0">문화로 더 새롭게,</p>
                                    <p class="card-text fs-xs m-0 p-0">예술로 더 풍요롭게,</p>
                                    <p class="card-text fs-xs m-0 p-0">대전예술의전당</p>
                                </div>
                            </div>


                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; cursor:pointer;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="resources/images/perform/ex_poster3.png">
                                    <p class="card-text fs-ms pt-1 m-0" style="font-weight: bold;">공연 이름</p>
                                    <p class="card-text fs-sm m-0 p-0">날짜</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; cursor:pointer;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="resources/images/perform/ex_poster3.png">
                                    <p class="card-text fs-ms pt-1 m-0" style="font-weight: bold;">공연 이름</p>
                                    <p class="card-text fs-sm m-0 p-0">날짜</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; cursor:pointer;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="resources/images/perform/ex_poster3.png">
                                    <p class="card-text fs-ms pt-1 m-0" style="font-weight: bold;">공연 이름</p>
                                    <p class="card-text fs-sm m-0 p-0">날짜</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; cursor:pointer;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="resources/images/perform/ex_poster3.png">
                                    <p class="card-text fs-ms pt-1 m-0" style="font-weight: bold;">공연 이름</p>
                                    <p class="card-text fs-sm m-0 p-0">날짜</p>
                                </div>
                            </div>



                        </div>
                        <div class="tab-pane fade row" id="pohang" role="tabpanel" style="background-image: url(resources/images/stadium-logo/stadium-bg6.png)">
                            <div class="card py-5 px-0" style="max-width: 15rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; ">
                                    <img src="resources/images/stadium-logo/pohang_ci.png" style="width:70%;">
                                    <br>
                                    <br>
                                    <p class="card-text fs-xs m-0 p-0">문화로 더 새롭게,</p>
                                    <p class="card-text fs-xs m-0 p-0">예술로 더 풍요롭게,</p>
                                    <p class="card-text fs-xs m-0 p-0">포항문화예술회관</p>
                                </div>
                            </div>


                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; cursor:pointer;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="resources/images/perform/ex_poster3.png">
                                    <p class="card-text fs-ms pt-1 m-0" style="font-weight: bold;">공연 이름</p>
                                    <p class="card-text fs-sm m-0 p-0">날짜</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; cursor:pointer;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="resources/images/perform/ex_poster3.png">
                                    <p class="card-text fs-ms pt-1 m-0" style="font-weight: bold;">공연 이름</p>
                                    <p class="card-text fs-sm m-0 p-0">날짜</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; cursor:pointer;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="resources/images/perform/ex_poster3.png">
                                    <p class="card-text fs-ms pt-1 m-0" style="font-weight: bold;">공연 이름</p>
                                    <p class="card-text fs-sm m-0 p-0">날짜</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; cursor:pointer;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="resources/images/perform/ex_poster3.png">
                                    <p class="card-text fs-ms pt-1 m-0" style="font-weight: bold;">공연 이름</p>
                                    <p class="card-text fs-sm m-0 p-0">날짜</p>
                                </div>
                            </div>

                        </div>
                        <div class="tab-pane fade row" id="busan" role="tabpanel" style="background-image: url(resources/images/stadium-logo/stadium-bg6.png)">
                            <div class="card py-5 px-0" style="max-width: 15rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; ">
                                    <img src="resources/images/stadium-logo/busan_ci.png " style="width:70%; ">
                                    <br>
                                    <br>
                                    <p class="card-text fs-xs m-0 p-0">문화로 더 새롭게,</p>
                                    <p class="card-text fs-xs m-0 p-0">예술로 더 풍요롭게,</p>
                                    <p class="card-text fs-xs m-0 p-0">부산문화회관</p>
                                </div>
                            </div>


                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; cursor:pointer;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="resources/images/perform/ex_poster3.png">
                                    <p class="card-text fs-ms pt-1 m-0" style="font-weight: bold;">공연 이름</p>
                                    <p class="card-text fs-sm m-0 p-0">날짜</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; cursor:pointer;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="resources/images/perform/ex_poster3.png">
                                    <p class="card-text fs-ms pt-1 m-0" style="font-weight: bold;">공연 이름</p>
                                    <p class="card-text fs-sm m-0 p-0">날짜</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; cursor:pointer;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="resources/images/perform/ex_poster3.png">
                                    <p class="card-text fs-ms pt-1 m-0" style="font-weight: bold;">공연 이름</p>
                                    <p class="card-text fs-sm m-0 p-0">날짜</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; cursor:pointer;">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="resources/images/perform/ex_poster3.png">
                                    <p class="card-text fs-ms pt-1 m-0" style="font-weight: bold;">공연 이름</p>
                                    <p class="card-text fs-sm m-0 p-0">날짜</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--@@@@@@@@@@ 전국 공연장 끝 @@@@@@@@@@-->


        <!-- What’s new-->
        <section class="container mt-n3 mt-md-0 mb-2 pb-lg-2">
            <!-- Carousel-->
            <div class="row">
                <div class="tns-carousel-wrapper col-md-4">

                    <div class="mb-3">
                        <h2 style="display:inline;">공연중인</h2>
                        <h2 style="display:inline; color: #dbab34; ">수상작</h2>
                    </div>
                    <div class="tns-carousel-inner" data-carousel-options="{&quot;mode&quot;: &quot;gallery&quot;, &quot;nav&quot;: false, &quot;controlsContainer&quot;: &quot;#carousel-controls&quot;}">
                        <!-- 수상작1-->
                        <div>
                            <div class="row">
                                <div class="col-md-6 mb-md-0 mb-2"><img class="position-relative rounded-3 zindex-5" src="resources/images/poster2.jpg" alt="Article image"></div>
                                <div class="col-md-6">
                                    <h3 class="h4 from-top">마타하리</h3>
                                    <ul class="list-unstyled delay-2 from-end">
                                        <li class="mb-1 fs-sm"><i class="fi-map-pin text-muted me-2 fs-base"></i>Ollenhauer Str. 29, 10118</li>
                                        <li class="mb-1 fs-sm"><i class="fi-clock text-muted me-2 fs-base"></i>9:00 – 23:00</li>
                                        <li class="mb-1 fs-sm"><i class="fi-wallet text-muted me-2 fs-base"></i>$$</li>
                                    </ul>
                                    <p class="pb-2 delay-3 from-end d-none d-lg-block">Blandit lorem dictum invelit.</p>
                                </div>
                            </div>
                        </div>
                        <!-- 수상작2-->
                        <div>
                            <div class="row">
                                <div class="col-md-6 mb-md-0 mb-2"><img class="position-relative rounded-3 zindex-5" src="resources/images/poster3.jpg" alt="Article image"></div>
                                <div class="col-md-6">
                                    <h3 class="h4 from-top">번지점프를 하다</h3>
                                    <ul class="list-unstyled delay-2 from-end">
                                        <li class="mb-1 fs-sm"><i class="fi-map-pin text-muted me-2 fs-base"></i>Ollenhauer Str. 29, 10118</li>
                                        <li class="mb-1 fs-sm"><i class="fi-clock text-muted me-2 fs-base"></i>9:00 – 23:00</li>
                                        <li class="mb-1 fs-sm"><i class="fi-wallet text-muted me-2 fs-base"></i>$$</li>
                                    </ul>
                                    <p class="pb-2 delay-3 from-end d-none d-lg-block">Blandit lorem dictum in velit. Et nisi at faucibus mauris pretium enim.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="tns-carousel-wrapper col-md-4">
                    <div class="mb-3">
                        <h2 style="display:inline; color: #ab69dd; ">아동</h2>
                        <h2 style="display:inline;">공연</h2>
                    </div>
                    <div class="tns-carousel-inner" data-carousel-options="{&quot;mode&quot;: &quot;gallery&quot;, &quot;nav&quot;: false, &quot;controlsContainer&quot;: &quot;#carousel-controls&quot;}">
                        <!-- 수상작1-->
                        <div>
                            <div class="row">
                                <div class="col-md-6 mb-md-0 mb-2"><img class="position-relative rounded-3 zindex-5" src="resources/images/child.jpg" alt="Article image"></div>
                                <div class="col-md-6">
                                    <h3 class="h4 from-top">아기 돼지 삼형제</h3>
                                    <ul class="list-unstyled delay-2 from-end">
                                        <li class="mb-1 fs-sm"><i class="fi-map-pin text-muted me-2 fs-base"></i>Ollenhauer Str. 29, 10118</li>
                                        <li class="mb-1 fs-sm"><i class="fi-clock text-muted me-2 fs-base"></i>9:00 – 23:00</li>
                                        <li class="mb-1 fs-sm"><i class="fi-wallet text-muted me-2 fs-base"></i>$$</li>
                                    </ul>
                                    <p class="pb-2 delay-3 from-end d-none d-lg-block">Blandit lorem dictum in velit.</p>
                                </div>
                            </div>
                        </div>
                        <!-- 수상작2-->
                        <div>
                            <div class="row">
                                <div class="col-md-6 mb-md-0 mb-2"><img class="position-relative rounded-3 zindex-5" src="resources/images/child2.gif" alt="Article image"></div>
                                <div class="col-md-6">
                                    <h3 class="h4 from-top">우디를 도와줘</h3>
                                    <ul class="list-unstyled delay-2 from-end">
                                        <li class="mb-1 fs-sm"><i class="fi-map-pin text-muted me-2 fs-base"></i>Ollenhauer Str. 29, 10118</li>
                                        <li class="mb-1 fs-sm"><i class="fi-clock text-muted me-2 fs-base"></i>9:00 – 23:00</li>
                                        <li class="mb-1 fs-sm"><i class="fi-wallet text-muted me-2 fs-base"></i>$$</li>
                                    </ul>
                                    <p class="pb-2 delay-3 from-end d-none d-lg-block">Blandit lorem dictum in velit. Et nisi at faucibus mauris pretium enim.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="tns-carousel-wrapper col-md-4">

                    <div class="mb-3">
                        <h2 style="display:inline">관람</h2>
                        <h2 style="display:inline; color: #0B398E; ">후기</h2>
                    </div>
                    <div class="tns-carousel-inner" data-carousel-options="{&quot;mode&quot;: &quot;gallery&quot;, &quot;nav&quot;: false, &quot;controlsContainer&quot;: &quot;#carousel-controls&quot;}">
                        <!-- 수상작1-->
                        <div>
                            <div class="row">
                                <div class="col-md-6 mb-md-0 mb-2"><img class="position-relative rounded-3 zindex-5" src="resources/images/poster2.jpg" alt="Article image"></div>
                                <div class="col-md-6">
                                    <h3 class="h4 from-top">마타하리</h3>
                                    <ul class="list-unstyled delay-2 from-end">
                                        <li class="mb-1 fs-sm"><i class="fi-map-pin text-muted me-2 fs-base"></i>Ollenhauer Str. 29, 10118</li>
                                        <li class="mb-1 fs-sm"><i class="fi-clock text-muted me-2 fs-base"></i>9:00 – 23:00</li>
                                        <li class="mb-1 fs-sm"><i class="fi-wallet text-muted me-2 fs-base"></i>$$</li>
                                    </ul>
                                    <p class="pb-2 delay-3 from-end d-none d-lg-block">Blandit lorem dictum in velit.</p>
                                    <div class="delay-4 scale-up"><a class="btn btn-primary rounded-pill" href="city-guide-single.html">더보기<i class="fi-chevron-right fs-sm ms-2"></i></a></div>
                                </div>
                            </div>
                        </div>
                        <!-- 수상작2-->
                        <div>
                            <div class="row">
                                <div class="col-md-6 mb-md-0 mb-2"><img class="position-relative rounded-3 zindex-5" src="resources/images/poster3.jpg" alt="Article image"></div>
                                <div class="col-md-6">
                                    <h3 class="h4 from-top">번지점프를 하다</h3>
                                    <ul class="list-unstyled delay-2 from-end">
                                        <li class="mb-1 fs-sm"><i class="fi-map-pin text-muted me-2 fs-base"></i>Ollenhauer Str. 29, 10118</li>
                                        <li class="mb-1 fs-sm"><i class="fi-clock text-muted me-2 fs-base"></i>9:00 – 23:00</li>
                                        <li class="mb-1 fs-sm"><i class="fi-wallet text-muted me-2 fs-base"></i>$$</li>
                                    </ul>
                                    <p class="pb-2 delay-3 from-end d-none d-lg-block">Blandit lorem dictum in velit.</p>
                                    <div class="delay-4 scale-down"><a class="btn btn-primary rounded-pill" href="city-guide-single.html">더보기<i class="fi-chevron-right fs-sm ms-2"></i></a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Carousel custom controls -->
            <div class="tns-carousel-controls pt-2 mt-4" id="carousel-controls">
                <button class="me-3" type="button"><i class="fi-chevron-left fs-xs"></i></button>
                <button type="button"><i class="fi-chevron-right fs-xs"></i></button>
            </div>
        </section>


        <!-- <div class="mb-3">
            <h2 style="display:inline">관람</h2>
            <h2 style="display:inline; color: #0B398E; ">후기</h2>
        </div>
        <h2 class="h3 mb-sm-0" style="color: #0B398E;">공연 소식</h2> -->

        <!-- Blog: Latest posts-->
        <section class="container my-2 py-lg-4">
            <div class="d-sm-flex align-items-center justify-content-center mb-3">
                <h2 style="color: #0B398E;">공연 소식</h2><a class="btn btn-link fw-normal ms-sm-3 p-0" href="<%=path%>/news">더보기<i class="fi-arrow-long-right ms-2"></i></a>
            </div>
            <!-- Carousel-->
            <div class="tns-carousel-wrapper tns-nav-outside mb-md-2">
                <div class="tns-carousel-inner d-block" data-carousel-options="{&quot;controls&quot;: false, &quot;gutter&quot;: 24, &quot;autoHeight&quot;: true, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1,&quot;nav&quot;:true},&quot;500&quot;:{&quot;items&quot;:2},&quot;850&quot;:{&quot;items&quot;:3},&quot;1200&quot;:{&quot;items&quot;:3}}}">
                    <!-- Item-->
                    <article style="height: 350px;">
                        <a class="d-block mb-3" href="city-guide-blog-single.html"><img class="rounded-3" src="<%=path%>/resources/images/news/big2.png" style="height:200px;" alt="Post image"></a>
                        <h3 class="fs-base pt-1"><a class="nav-link" href="https://www.segye.com/newsView/20220807511675?OutUrl=naver">남자들을 위한 80㎝ 부츠?…2년 만에 돌아온 쇼뮤지컬 ‘킹키부츠’</a></h3>
                        <a class="d-flex align-items-center text-decoration-none" href="#"><img class="rounded-circle" src="resources/img/avatars/16.png" width="44" alt="Avatar">
                            <div class="ps-2">
                                <h6 class="fs-sm text-nav lh-base mb-1">이강은 기자</h6>
                                <div class="d-flex text-body fs-xs"><span class="me-2 pe-1"><i class="fi-calendar-alt opacity-70 mt-n1 me-1 align-middle"></i>2022-08-08</span></div>
                            </div>
                        </a>
                    </article>
                    <!-- Item-->
                    <article style="height: 350px;">
                        <a class="d-block mb-3" href="<%=path%>/resources/images/news/big1.png"><img class="rounded-3" src="resources/img/city-guide/blog/02.jpg" alt="Post image"></a>
                        <h3 class="fs-base pt-1" style="margin-bottom: 32px;"><a class="nav-link" href="https://www.nocutnews.co.kr/news/5798033">해상왕 장보고 삶, 뮤지컬로 만든다…'오션스' 쇼케이스</a></h3>
                        <a class="d-flex align-items-center text-decoration-none" href="#"><img class="rounded-circle" src="resources/img/avatars/18.png" width="44" alt="Avatar">
                            <div class="ps-2">
                                <h6 class="fs-sm text-nav lh-base mb-1">문수경 기자</h6>
                                <div class="d-flex text-body fs-xs"><span class="me-2 pe-1"><i class="fi-calendar-alt opacity-70 mt-n1 me-1 align-middle"></i>2022-08-05</span></div>
                            </div>
                        </a>
                    </article>
                    <!-- Item-->
                    <article style="height: 350px;">
                        <a class="d-block mb-3" href="city-guide-blog-single.html"><img class="rounded-3" src="<%=path%>/resources/images/news/small2.png" style="width:416px; height: 200px;" alt="Post image"></a>
                        <h3 class="fs-base pt-1" style="margin-bottom: 32px;"><a class="nav-link" href="city-guide-blog-single.html">'160년이 지나도 살아있는 고전의 힘…연극 '레 미제라블'</a></h3>
                        <a class="d-flex align-items-center text-decoration-none" href="#"><img class="rounded-circle" src="resources/img/avatars/17.png" width="44" alt="Avatar">
                            <div class="ps-2">
                                <h6 class="fs-sm text-nav lh-base mb-1">임지우 기자</h6>
                                <div class="d-flex text-body fs-xs"><span class="me-2 pe-1"><i class="fi-calendar-alt opacity-70 mt-n1 me-1 align-middle"></i>2022-08-05</span></div>
                            </div>
                        </a>
                    </article>
                </div>
            </div>
        </section>
    </main>
    
     <script>
            const swiper = new Swiper('.swiper-container', {
                //방향 셋팅 vertical 수직, horizontal 수평 설정이 없으면 수평
                direction: 'horizontal',
                //한번에 보여지는 페이지 숫자
                slidesPerView: 5,
                //페이지와 페이지 사이의 간격
                spaceBetween: 15,
                //드레그 기능 true 사용가능 false 사용불가
                debugger: true,
                //마우스 휠기능 true 사용가능 false 사용불가
                // mousewheel: true,
                //반복 기능 true 사용가능 false 사용불가
                loop: true,
                //선택된 슬라이드를 중심으로 true 사용가능 false 사용불가 djqt
                // centeredSlides: true,
                // 페이지 전환효과 slidesPerView효과와 같이 사용 불가
                // effect: 'fade',
                speed: 1000,
                //자동 스크를링
                autoplay: {
                    //시간 1000 이 1초
                    delay: 3000,
                    disableOnInteraction: false,
                },
                autoHeight: true,
                //페이징
                pagination: {
                    //페이지 기능
                    el: '.swiper-pagination',
                    //클릭 가능여부
                    type: 'bullets',
                    clickable: true,
                },
                //방향표
                navigation: {
                    //다음페이지 설정
                    nextEl: '.swiper-button-next',
                    //이전페이지 설정
                    prevEl: '.swiper-button-prev',
                },
            });
        </script>

        <script>
            $(document).ready(function() {
                // 이미지에 마우스 올릴 시 슬라이드 멈춤
                $(".swiper-container").each(function(elem, target) {
                    var swp = target.swiper;
                    $(this).hover(function() {
                        swp.autoplay.stop();

                    }, function() {
                        swp.autoplay.start();
                    });
                });

                // 페이짐 실행되었을때 일간에 데이터 넣기
                const today = new Date();
                const endday = new Date(today.setDate(today.getDate() - 1));

                function dateFormatXml(date) {
                    var yyyy = date.getFullYear();
                    var mm = date.getMonth() + 1;
                    mm = mm >= 10 ? mm : "0" + mm;
                    var dd = date.getDate();
                    dd = dd >= 10 ? dd : "0" + dd;
                    return yyyy + mm + dd;
                }

                function dateFormat(date) {
                    var yyyy = date.getFullYear();
                    var mm = date.getMonth() + 1;
                    mm = mm >= 10 ? mm : "0" + mm;
                    var dd = date.getDate();
                    dd = dd >= 10 ? dd : "0" + dd;
                    return yyyy + "." + mm + "." + dd;
                }

                $("#datestr").text(dateFormat(endday) + " ~ " + dateFormat(endday) + "  기준");

                $.ajax({
                    type: "GET",
                    dataType: "xml",
                    url: "https://cors-anywhere.herokuapp.com/http://kopis.or.kr/openApi/restful/boxoffice?service=b3e488556abe4df29d325f391436027c&ststype=day&date=" + dateFormatXml(endday),
                    success: function(xml) {
                        var i = 1;
                        $(xml).find("boxof").each(function() {
                            // 공연명, 포스터, 기간, 랭킹, 장르,  공연장명 파싱
                            var prfnm = $(this).find("prfnm").text();
                            var prfpd = $(this).find("prfpd").text();
                            var cate = $(this).find("cate").text();
                            var prfplcnm = $(this).find("prfplcnm").text();
                            var rnum = $(this).find("rnum").text();
                            var poster = $(this).find("poster").text();
                            var showid = $(this).find("mt20id").text();
                            $(".rank-img-" + i).attr("src", "http://www.kopis.or.kr" + poster);
                            $(".shadow" + i).children(".tit").text(prfnm);
                            $(".shadow" + i).children(".txt1").text(prfpd);
                            $(".shadow" + i).children(".txt2").text(prfplcnm);
                            $(".showlink" + i).attr("href", "<%=path%>/showDetail?showId=" + showid);
                            i++;
                        })
                    }
                })

                // 실시간 랭킹 jquery
                $('ul.period-ul li').find('a').click(function() {
                    var on_id = $(this).attr('id');

                    // 클릭 시 버튼 바뀌는 jquery
                    $('ul.period-ul li a').removeClass('on');
                    $('ul.period-ul li').removeClass('on');

                    $(this).addClass('on');
                    $("#" + on_id).addClass('on');

                    const today = new Date();
                    const endday = new Date(today.setDate(today.getDate() - 1));

                    function lastWeek() {
                        var d = new Date(endday);
                        var day = d.getDate();
                        d.setDate(day - 6);
                        return dateFormat(d);
                    }

                    function lastMonth() {
                        var d = new Date(endday);
                        var month = d.getMonth();
                        var day = d.getDate();
                        d.setMonth(month - 1);
                        return dateFormat(d);
                    }

                    if (on_id == "day") {
                        $("#datestr").text(dateFormat(endday) + " ~ " + dateFormat(endday) + "  기준");
                    }
                    if (on_id == "week") {
                        $("#datestr").text(lastWeek() + " ~ " + dateFormat(endday) + "  기준");
                    }
                    if (on_id == "month") {
                        $("#datestr").text(lastMonth() + " ~ " + dateFormat(endday) + "  기준");
                    }

                    //실시간 랭킹 파싱 jquery
                    // https://cors-anywhere.herokuapp.com/corsdemo <- 사이트 들어가서 demo server 클릭해야함 cors에러 해결
                    $.ajax({
                        type: "GET",
                        dataType: "xml",
                        url: "https://cors-anywhere.herokuapp.com/http://kopis.or.kr/openApi/restful/boxoffice?service=b3e488556abe4df29d325f391436027c&ststype=" + on_id + "&date=" + dateFormatXml(endday),
                        success: function(xml) {
                            var i = 1;
                            $(xml).find("boxof").each(function() {
                            	// 공연명, 포스터, 기간, 랭킹, 장르,  공연장명, 공연id 파싱
                                var prfnm = $(this).find("prfnm").text();
                                var prfpd = $(this).find("prfpd").text();
                                var cate = $(this).find("cate").text();
                                var prfplcnm = $(this).find("prfplcnm").text();
                                var poster = $(this).find("poster").text();
                                var showid = $(this).find("mt20id").text();
                                $(".rank-img-" + i).attr("src", "http://www.kopis.or.kr" + poster);
                                $(".shadow" + i).children(".tit").text(prfnm);
                                $(".shadow" + i).children(".txt1").text(prfpd);
                                $(".shadow" + i).children(".txt2").text(prfplcnm);

                                // 이미지 클릭시 showid 가지고 get방식 이동
                                $(".showlink" + i).attr("href", "<%=path%>/showDetail?showId=" + showid);
                                i++;
                            })
                        }
                    })
                })
            });
        </script>

<%@include file="/views/common/footer.jsp"%>