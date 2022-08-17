<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- https://cors-anywhere.herokuapp.com/corsdemo <- 사이트 들어가서 demo server 클릭해야함 cors에러 해결 -->

<%@include file="/views/common/mainHeader.jsp"%>

<!-- Page content-->
        <!-- Hero-->
        <main>
       <section class="container-fluid py-5 mt-5 mb-5" style="height:470px; background-image: url(<%=path%>/resources/images/heroBg.png)">
            <section class="container py-0 pt-3 mt-0 mb-3">
                <div class="row align-items-center mt-md-2 ms-5">
                    <div class="col-lg-7 order-lg-2 mb-lg-0 mb-4 pb-2 pb-lg-0"><img class="d-block mx-auto" src="<%=path%>/resources/images/heroPoster.png" width="450" alt="Hero image"></div>
                    <div class="col-lg-5 order-lg-1 pe-lg-0 pb-5">
                        <div style="padding-left : 40px; padding-bottom:15px;">
                            <h1 class="display-3 mb-2 me-lg-n5 text-lg-start text-center mb-2" style="font-size: 45pt; font-weight:normal">지금 바로,</h1>
                            <h1 class="display-3 mb-2 me-lg-n5 text-lg-start text-center mb-2" style="font-size: 45pt; font-weight:normal">원하는 <span class=" type text-info1" style=" box-shadow: inset 0 -20px 0 #59f7ca;">공연</span></h1>
                            <h1 class="display-3 mb-2 me-lg-n5 text-lg-start text-center mb-2" style="font-size: 45pt; font-weight:normal"> 검색하세요!</h1>

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
                            <form class="form-group d-block d-md-flex position-relative rounded-md-pill me-lg-n5" action="<%=path %>/showSearch" method="GET" >
                                <div class="input-group input-group-lg border-end-md"><span class="input-group-text text-muted rounded-pill ps-3"><i class="fi-search"></i></span>
                                    <input class="form-control" name="keyword" type="text" placeholder="무엇을 찾으시나요?" style="font-size:20px;">
                                </div>
                                <hr class="d-md-none my-2">
                                <div class="d-sm-flex">
                                    <div class="dropdown w-100 mb-sm-0 mb-3" data-bs-toggle="select">
                                        <button class="btn btn-link btn-lg dropdown-toggle ps-2 ps-sm-3" type="button" data-bs-toggle="dropdown" style="font-size:20px;" ><i class="fi-list me-2"></i><span class="dropdown-toggle-label">카테고리</span></button>
                                        <input type="hidden" name="category">
                                        <ul class="dropdown-menu" style="font-size:20px;">
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
                    <h2 style="display:inline; font-size:50px;">실시간 </h2>
                    <h2 style="display:inline; color: #dbab34; font-size:50px; ">랭킹</h2>
                    <h6 style=" display:inline; margin-left:10px; font-size:30px; font-weight:bold;">기간별 인기작품을 만나보세요!</h6>
                </div>

                <!-- <div class="col-md-8 mb-3">
                    <h2 style="font-size: 40px; display:inline">실시간 </h2>
                    <h2 style="font-size: 40px; color: #dbab34; display:inline;">랭킹</h2>
                    <h6 style=" display:inline; margin-left : 10px; ">기간별 인기작품을 만나보세요!</h6>
                </div> -->
                <a class="btn btn-link fw-normal ms-sm-3 p-0" href="<%=path %>/rankList" style="margin-top: 15px; font-size:20px;">더보기<i class="fi-arrow-long-right ms-1"></i></a>
            </div>
            <div style="width: 1200px; margin: 0 auto; display:inline-block; height: 35px;">
                <div style="position: relative; margin-bottom: 0px; display:inline-block; height: 35px;">
                    <ul class="period-ul" style="padding-left: 5px;">
                        <li class="on">
                            <a href="#n" id="day" class="on" style=font-size:20px;>일간</a>
                        </li>
                        <li class>
                            <a href="#n" id="week" class style=font-size:20px;>주간</a>
                        </li>
                        <li class>
                            <a href="#n" id="month" class style=font-size:20px;>월간</a>
                        </li>
                    </ul>
                    <p id="datestr" style="margin-left: 20px; float:left; margin-bottom: 5px; margin-top: 2px; font-size:20px;"></p>
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
                <h2 style="display:inline; font-size:50px;">전국 </h2>
                <h2 style="display:inline; color: #0B398E; font-size:50px;">공연장</h2>
                <h6 style=" display:inline; margin-left:10px; font-size:30px; font-weight:bold;">전국 주요 공연장을 빠르게 찾아보세요!</h6>
             	<a class="btn btn-link fw-normal ms-sm-3 p-0" href="<%=path %>/hallMain" style="margin-top: 20px; float:right; font-size:20px;">더보기<i class="fi-arrow-long-right ms-1"></i></a>
            </div>
            <!-- No image-->
            <div class="card border-0 shadow-sm">
                <div class="card-header p-0 b-0" style="border:0; text-align:center;  font-family: 'NanumSquareRound', 'sans-serif'; font-size:20pt;">
                    <ul class="nav nav-tabs p-0 m-0 b-0" role="tablist">
                        <li class="col m-0" style="border-radius:0;"><a class="nav-link pb-1 active" href="#sejong" data-bs-toggle="tab" role="tab" aria-controls="sejong" aria-selected="true" style="border-radius:0; font-weight: 600;">세종문화회관</a></li>
                        <li class="col m-0"><a class="nav-link pb-1" href="#lotte" data-bs-toggle="tab" role="tab" aria-controls="lotte" aria-selected="false" style="border-radius:0; font-weight: 600;">롯데콘서트홀</a></li>
                        <li class="col m-0"><a class="nav-link pb-1" href="#daejeon" data-bs-toggle="tab" role="tab" aria-controls="daejeon" aria-selected="false" style="border-radius:0; font-weight: 600;">대전예술의전당</a></li>
                        <li class="col m-0"><a class="nav-link pb-1" href="#pohang" data-bs-toggle="tab" role="tab" aria-controls="kumho" aria-selected="false" style="border-radius:0; font-weight: 600;">포항문화예술회관</a></li>
                        <li class="col m-0"><a class="nav-link pb-1" href="#busan" data-bs-toggle="tab" role="tab" aria-controls="busan" aria-selected="false" style="border-radius:0; font-weight: 600;">부산문화회관</a></li>
                    </ul>
                </div>
                <div class="card-body pt-4 pb-0" style="background-image: url(<%=path%>/resources/images/stadium-logo/stadium_bg1.png); height:430px;">
                    <div class="tab-content">
                        <div class="tab-pane fade row active show" id="sejong" role="tabpanel" style="background-image: url(<%=path%>/resources/images/stadium-logo/stadium-bg6.png)">
                            <div class="card py-5 px-0" style="max-width: 15rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; ">
                                    <img src="<%=path %>/resources/images/stadium-logo/sejong_ci.png" style="width:70%;">
                                    <br>
                                    <br>
                                    <p class="card-text fs-lg m-0 p-0" style="font-weight:600;">문화로 더 새롭게,</p>
                                    <p class="card-text fs-lg m-0 p-0" style="font-weight:600;">예술로 더 풍요롭게,</p>
                                    <p class="card-text fs-lg m-0 p-0" style="font-weight:600;">세종문화회관</p>
									<p><button class="btn btn-outline-info mt-2 fs-sm px-0 py-0" type="button" style="width:70px; height:30px;">더보기</button></p>
                                </div>
                            </div>

                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body py-0" id="card-body" style="text-align: center; cursor:pointer;" onclick="location.href='/Show/showDetail?showId=PF195255'">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF195255_220727_094226.jpg" style="height:304px;">
                                    <p class="card-text pt-1 m-0" style="font-weight: bold; font-size:15pt;">해리 포터와 아즈카반의 죄수™ 인 콘서트</p>
                                    <p class="card-text fs-ms m-0 p-0">2022.10.07 ~ 2022.10.09</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body py-0" style="text-align: center; cursor:pointer;" onclick="location.href='<%=path%>/showDetail?showId=PF195271'">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF195271_220727_102535.jpg" style="height:304px;">
                                    <p class="card-text pt-1 pb-2 m-0" style="font-weight: bold; font-size:15pt;">로미오와 줄리엣</p><br>
                                    <p class="card-text fs-ms m-0 p-0">2022.09.22 ~ 2022.09.25</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body py-0" style="text-align: center; cursor:pointer;" onclick="location.href='<%=path%>/showDetail?showId=PF189859'">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF189859_220421_102833.gif" style="height:304px;">
                                    <p class="card-text pt-1 pb-2 m-0" style="font-weight: bold; font-size:15pt;">웃는 남자</p><br>
                                    <p class="card-text fs-ms m-0 p-0">2022.06.10 ~ 2022.08.22</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body py-0" style="text-align: center; cursor:pointer;" onclick="location.href='<%=path%>/showDetail?showId=PF195697'">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF195697_220803_132014.gif" style="height:304px;">
                                    <p class="card-text pt-1 m-0" style="font-weight: bold; font-size:15pt;">국립현대무용단 무용X기술 Part.1, 넌댄스 댄스</p>
                                    <p class="card-text fs-ms m-0 p-0">2022.09.16 ~ 2022.09.18</p>
                                </div>
                            </div>

                        </div>
                        <div class="tab-pane fade row" id="lotte" role="tabpanel">
                            <div class="card py-5 px-0" style="max-width: 15rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; ">
                                    <img src="<%=path %>/resources/images/stadium-logo/lotte_ci.png" style="width:70%;">
                                    <br>
                                    <br>
                                    <p class="card-text fs-lg m-0 p-0" style="font-weight:600;">문화로 더 새롭게,</p>
                                    <p class="card-text fs-lg m-0 p-0" style="font-weight:600;">예술로 더 풍요롭게,</p>
                                    <p class="card-text fs-lg m-0 p-0" style="font-weight:600;">롯데콘서트홀</p>
                                    <p><button class="btn btn-outline-info mt-2 fs-sm px-0 py-0" type="button" style="width:70px; height:30px;">더보기</button></p>
                                </div>
                            </div>


                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                               <div class="card-body py-0" style="text-align: center; cursor:pointer;" onclick="location.href='<%=path%>/showDetail?showId=PF195450'">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF195450_220729_140658.gif" style="height:304px;">
                                    <p class="card-text pt-1 m-0" style="font-weight: bold; font-size:15pt;">더 시네마 & 클래식 2.0 with 또모</p>
                                    <p class="card-text fs-ms m-0 p-0">2022.09.11 ~ 2022.09.11</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body py-0" style="text-align: center; cursor:pointer;" onclick="location.href='<%=path%>/showDetail?showId=PF195832'">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF195832_220805_122742.jpg" style="height:304px;">
                                    <p class="card-text pt-1 m-0" style="font-weight: bold; font-size:15pt;">W필하모닉오케스트라, 말러 교향곡 4번</p>
                                    <p class="card-text fs-ms m-0 p-0">2022.09.19 ~ 2022.09.19</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body py-0" style="text-align: center; cursor:pointer;" onclick="location.href='<%=path%>/showDetail?showId=PF195845'">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF195845_220808_095945.jpg" style="height:304px;">
                                    <p class="card-text pt-1 m-0" style="font-weight: bold; font-size:15pt;">제4회 명앙상블 정기연주회</p>
                                    <p class="card-text fs-ms m-0 p-0">2022.09.15 ~ 2022.09.15</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body py-0" style="text-align: center; cursor:pointer;" onclick="location.href='<%=path%>/showDetail?showId=PF195299'">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF195299_220727_121833.gif" style="height:304px;">
                                    <p class="card-text pt-1 m-0" style="font-weight: bold; font-size:15pt;">서울모테트합창단의 하이든 천지창조</p>
                                    <p class="card-text fs-ms m-0 p-0">2022.09.27 ~ 2022.09.27</p>
                                </div>
                            </div>



                        </div>
                        <div class="tab-pane fade row" id="daejeon" role="tabpanel" style="background-image: url(resources/images/stadium-logo/stadium-bg6.png)">
                            <div class="card py-5 px-0" style="max-width: 15rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; ">
                                    <img src="<%=path %>/resources/images/stadium-logo/daejeon_ci.png" style="width:70%;">
                                    <br>
                                    <br>
                                    <p class="card-text fs-lg m-0 p-0" style="font-weight:600;">문화로 더 새롭게,</p>
                                    <p class="card-text fs-lg m-0 p-0" style="font-weight:600;">예술로 더 풍요롭게,</p>
                                    <p class="card-text fs-lg m-0 p-0" style="font-weight:600;">대전예술의전당</p>
                                    <p><button class="btn btn-outline-info mt-2 fs-sm px-0 py-0" type="button" style="width:70px; height:30px;">더보기</button></p>
                                </div>
                            </div>


                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body py-0" style="text-align: center; cursor:pointer;" onclick="location.href='<%=path%>/showDetail?showId=PF195919'">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF195919_220809_100657.gif" style="height:304px;">
                                    <p class="card-text pt-1 m-0" style="font-weight: bold; font-size:15pt;">히사이시 조 영화음악 콘서트 [대전(앵콜)]</p>
                                    <p class="card-text fs-ms m-0 p-0">2022.09.25 ~ 2022.09.25</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body py-0" style="text-align: center; cursor:pointer;" onclick="location.href='<%=path%>/showDetail?showId=PF194710'">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF194710_220715_133842.gif" style="height:304px;">
                                    <p class="card-text pt-1 m-0" style="font-weight: bold; font-size:15pt;">살아있는 자를 수선하기 [대전]</p>
                                    <p class="card-text fs-ms m-0 p-0">2022.09.23 ~ 2022.09.24</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body py-0" style="text-align: center; cursor:pointer;" onclick="location.href='<%=path%>/showDetail?showId=PF196011'">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF196011_220810_104714.jpg" style="height:304px;">
                                    <p class="card-text pt-1 m-0" style="font-weight: bold; font-size:15pt;">제8회 앙상블 피아노소리 정기연주회</p>
                                    <p class="card-text fs-ms m-0 p-0">2022.09.08 ~ 2022.09.08</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body py-0" style="text-align: center; cursor:pointer;" onclick="location.href='<%=path%>/showDetail?showId=PF193236'">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF193236_220622_101135.jpg" style="height:304px;">
                                    <p class="card-text pt-1 m-0" style="font-weight: bold; font-size:15pt;">아침을 여는 클래식, 피아니스트 김태형 & 김규연 (9월)</p>
                                    <p class="card-text fs-ms m-0 p-0">2022.09.13 ~ 2022.09.13</p>
                                </div>
                            </div>



                        </div>
                        <div class="tab-pane fade row" id="pohang" role="tabpanel" style="background-image: url(resources/images/stadium-logo/stadium-bg6.png)">
                            <div class="card py-5 px-0" style="max-width: 15rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; ">
                                    <img src="<%=path %>/resources/images/stadium-logo/pohang_ci.png" style="width:70%;">
                                    <br>
                                    <br>
                                    <p class="card-text fs-lg m-0 p-0" style="font-weight:600;">문화로 더 새롭게,</p>
                                    <p class="card-text fs-lg m-0 p-0" style="font-weight:600;">예술로 더 풍요롭게,</p>
                                    <p class="card-text fs-lg m-0 p-0" style="font-weight:600;">포항문화예술회관</p>
                                    <p><button class="btn btn-outline-info mt-2 fs-sm px-0 py-0" type="button" style="width:70px; height:30px;">더보기</button></p>
                                </div>
                            </div>


                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body py-0" style="text-align: center; cursor:pointer;" onclick="location.href='<%=path%>/showDetail?showId=PF193005'">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF193005_220617_123639.jpg" style="height:304px;">
                                    <p class="card-text pt-1 pb-2 m-0" style="font-weight: bold; font-size:15pt;">알피 [포항]</p><br>
                                    <p class="card-text fs-ms m-0 p-0">2022.07.16 ~ 2022.07.17</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body py-0" style="text-align: center; cursor:pointer;" onclick="location.href='<%=path%>/showDetail?showId=PF192378'">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF192378_220608_102725.jpg" style="height:304px;">
                                    <p class="card-text pt-1 m-0" style="font-weight: bold; font-size:15pt;">제115회 포항시립합창단 정기연주회</p>
                                    <p class="card-text fs-ms m-0 p-0">2022.07.07 ~ 2022.07.07</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body py-0" style="text-align: center; cursor:pointer;" onclick="location.href='<%=path%>/showDetail?showId=PF195777'">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF195777_220805_100450.jpg" style="height:304px;">
                                    <p class="card-text pt-1 m-0" style="font-weight: bold; font-size:15pt;">제191회 포항시립교향악단 정기연주회</p>
                                    <p class="card-text fs-ms m-0 p-0">2022.09.01 ~ 2022.09.01</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body py-0" style="text-align: center; cursor:pointer;" onclick="location.href='<%=path%>/showDetail?showId=PF194119'">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF194119_220706_095004.jpg" style="height:304px;">
                                    <p class="card-text pt-1 m-0" style="font-weight: bold; font-size:15pt;">타악판타지 통: 공 · 기 · 결 [포항]</p>
                                    <p class="card-text fs-ms m-0 p-0">2022.08.06 ~ 2022.08.06</p>
                                </div>
                            </div>

                        </div>
                        <div class="tab-pane fade row" id="busan" role="tabpanel" style="background-image: url(resources/images/stadium-logo/stadium-bg6.png)">
                            <div class="card py-5 px-0" style="max-width: 15rem; border: none; float: left; background:none;">
                                <div class="card-body" style="text-align: center; ">
                                    <img src="<%=path %>/resources/images/stadium-logo/busan_ci.png " style="width:70%; ">
                                    <br>
                                    <br>
                                  	<p class="card-text fs-lg m-0 p-0" style="font-weight:600;">문화로 더 새롭게,</p>
                                    <p class="card-text fs-lg m-0 p-0" style="font-weight:600;">예술로 더 풍요롭게,</p>
                                    <p class="card-text fs-lg m-0 p-0" style="font-weight:600;">부산문화회관</p>
                                    <p><button class="btn btn-outline-info mt-2 fs-sm px-0 py-0" type="button" style="width:70px; height:30px;">더보기</button></p>
                                </div>
                            </div>


                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body py-0" style="text-align: center; cursor:pointer;" onclick="location.href='<%=path%>/showDetail?showId=PF190881'">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF190881_220511_101419.jpg" style="height:304px;">
                                    <p class="card-text pt-1 pb-2 m-0" style="font-weight: bold; font-size:15pt;">그때도 오늘 [부산]</p><br>
                                    <p class="card-text fs-ms m-0 p-0">2022.09.23 ~ 2022.09.24</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body py-0" style="text-align: center; cursor:pointer;" onclick="location.href='<%=path%>/showDetail?showId=PF195224'">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF195224_220726_141354.jpg" style="height:304px;">
                                    <p class="card-text pt-1 m-0" style="font-weight: bold; font-size:15pt;">부산시립교향악단 기획음악회, 심포니야夜</p>
                                    <p class="card-text fs-ms m-0 p-0">2022.09.22 ~ 2022.09.22</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body py-0" style="text-align: center; cursor:pointer;" onclick="location.href='<%=path%>/showDetail?showId=PF190869'">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF190869_220511_095105.png" style="height:304px;">
                                    <p class="card-text pt-1 pb-2 m-0" style="font-weight: bold; font-size:15pt;">에코백</p><br>
                                    <p class="card-text fs-ms m-0 p-0">2022.09.15 ~ 2022.10.09</p>
                                </div>
                            </div>
                            <div class="card p-0" style="max-width: 16rem; border: none; float: left; background:none;">
                                <div class="card-body py-0" style="text-align: center; cursor:pointer;" onclick="location.href='<%=path%>/showDetail?showId=PF195681'">
                                    <img class="card shadow-lg border-0 w-100 border-0 hover-animate" src="http://www.kopis.or.kr/upload/pfmPoster/PF_PF195681_220803_124202.jpg" style="height:304px;">
                                    <p class="card-text pt-1 m-0" style="font-weight: bold; font-size:15pt;">퀸엘리자베스 국제 콩쿠르 위너스 콘서트 [부산]</p>
                                    <p class="card-text fs-ms m-0 p-0">2022.09.14 ~ 2022.09.14</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--@@@@@@@@@@ 전국 공연장 끝 @@@@@@@@@@-->

		<!-- Blog: Latest posts-->
        <section class="container my-2 py-lg-4">
        
            
        
        
        
            <div class="d-sm-flex align-items-center justify-content-between mb-4 pb-2">
            <span>
		           <h2 style="display:inline; font-size:50px;">공연 </h2><h2 style="display:inline; color: #ab69dd; font-size:50px;">소식</h2>
		           <h6 style=" display:inline; margin-left:10px; font-size:30px; font-weight:bold;">최신 공연소식 한눈에 접해보세요!</h6>
            </span>
            	<a class="btn btn-link fw-normal ms-sm-3 p-0" href="<%=path%>/news" style="margin-top: 20px; float:right; font-size:20px;">더보기<i class="fi-arrow-long-right ms-1"></i></a>
            </div>
            <!-- Carousel-->
            <div class="tns-carousel-wrapper tns-nav-outside mb-md-2 homeNews">
                    <div style="display:inline-block">
                    	<!-- Item-->
                    <article style="height: 350px; float: left; margin-right: 21px; width: 416px;">
                        <a class="d-block mb-3" href="https://www.segye.com/newsView/20220807511675?OutUrl=naver"><img class="rounded-3" src="<%=path%>/resources/images/news/big2.png" style="width: 416px; height: 200px;" style="height:200px;" alt="Post image"></a>
                        <h3 class="fs-base pt-1"><a class="nav-link fs-6" href="https://www.segye.com/newsView/20220807511675?OutUrl=naver">남자들을 위한 80㎝ 부츠?…2년 만에 돌아온 쇼뮤지컬 ‘킹키부츠’</a></h3>
                        <a class="d-flex align-items-center text-decoration-none" href="#"><img class="rounded-circle" src="resources/img/avatars/16.png" width="44" alt="Avatar">
                            <div class="ps-2"><h6 class="fs-sm text-nav lh-base mb-1">관리자</h6>
                                <div class="d-flex text-body fs-xs"><span class="me-2 pe-1"><i class="fi-calendar-alt opacity-70 mt-n1 me-1 align-middle"></i>2022-08-08</span></div>
                            </div></a>
                    </article>
                    <!-- Item-->
                   	<article style="height: 350px; float: left; margin-right: 21px; width: 416px;">
                        <a class="d-block mb-3" href="https://www.nocutnews.co.kr/news/5798033"><img class="rounded-3" src="<%=path%>/resources/images/news/big1.png" style="width: 416px; height: 200px;" alt="Post image"></a>
                        <h3 class="fs-base pt-1" style="margin-bottom: 32px;"><a class="nav-link fs-6" href="https://www.nocutnews.co.kr/news/5798033">해상왕 장보고 삶, 뮤지컬로 만든다…'오션스' 쇼케이스</a></h3>
                        <a class="d-flex align-items-center text-decoration-none" href="#"><img class="rounded-circle" src="resources/img/avatars/18.png" width="44" alt="Avatar">
                            <div class="ps-2">
                                <h6 class="fs-sm text-nav lh-base mb-1">문수경 기자</h6>
                                <div class="d-flex text-body fs-xs"><span class="me-2 pe-1"><i class="fi-calendar-alt opacity-70 mt-n1 me-1 align-middle"></i>2022-08-05</span></div>
                            </div>
                        </a>
                    </article>
                    <!-- Item-->
                    <article style="height: 350px; float: left; width: 416px;">
                        <a class="d-block mb-3" href="https://www.yna.co.kr/view/AKR20220805142700005?input=1195m"><img class="rounded-3" src="<%=path%>/resources/images/news/small2.png" style="width:416px; height: 200px;" alt="Post image"></a>
                        <h3 class="fs-base pt-1 display-3" style="margin-bottom: 32px;"><a class="nav-link fs-6 " href="https://www.yna.co.kr/view/AKR20220805142700005?input=1195m">'160년이 지나도 살아있는 고전의 힘…연극 '레 미제라블'</a></h3>
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
                
                 // 홈페이지 뉴스 3개 파싱
                $.ajax({
                	url: "<%=path%>/news",
         			type: "POST",
         			dataType: "text",
         			progress: true,
                
         			success: function(list) {
         				var news = JSON.parse(list);
         				console.log(news);
         				
         				var str = "";
         				
         				str += '<div style="display:inline-block">'
         				
         				$.each(news, (i, obj) => {
         					if(i == 2) {
         						str += '  <article style="height: 350px; float: left; width:416px;">                                                                                                                                                                          '
	                 			str += '  <a class="d-block mb-3" href="'+ obj.link +'"><img class="rounded-3" src="'+ obj.poster +'" style="width: 416px; height:200px;" alt="Post image"></a>'
	                 			str += '  <h3 class="fs-base pt-1"><a class="nav-link fs-6" style="height: 42px;" href="'+ obj.link +'">'+ obj.title +'</a></h3>                      '
	                 			str += '  <a class="d-flex align-items-center text-decoration-none" href="#"><img class="rounded-circle" src="resources/img/avatars/15.png" width="44" alt="Avatar">                                                '
	                 			str += '    <div class="ps-2"><h6 class="fs-sm text-nav lh-base mb-1">관리자</h6>                                                                                                                                   '
	                 			str += '        <div class="d-flex text-body fs-xs"><span class="me-2 pe-1"><i class="fi-calendar-alt opacity-70 mt-n1 me-1 align-middle"></i>'+ obj.date +'</span></div>                                               '
	                 			str += '    </div></a>                                                                                                                                                                                              '
	                 			str += ' </article>  '
         					} else {
         						str += '  <article style="height: 350px; float: left; margin-right: 21px; width: 416px;">                                                                                                                                                                          '
	                 			str += '  <a class="d-block mb-3" href="'+ obj.link +'"><img class="rounded-3" src="'+ obj.poster +'" style="width: 416px; height:200px;" alt="Post image"></a>'
	                 			str += '  <h3 class="fs-base pt-1"><a class="nav-link  fs-6" style="height: 42px;" href="'+ obj.link +'">'+ obj.title +'</a></h3>                      '
	                 			str += '  <a class="d-flex align-items-center text-decoration-none" href="#"><img class="rounded-circle" src="resources/img/avatars/16.png" width="44" alt="Avatar">                                                '
	                 			str += '    <div class="ps-2"><h6 class="fs-sm text-nav lh-base mb-1">관리자</h6>                                                                                                                                   '
	                 			str += '        <div class="d-flex text-body fs-xs"><span class="me-2 pe-1"><i class="fi-calendar-alt opacity-70 mt-n1 me-1 align-middle"></i>'+ obj.date +'</span></div>                                               '
	                 			str += '    </div></a>                                                                                                                                                                                              '
	                 			str += ' </article>  '
         					}
         				});
         				
         				str += '</div>'
         				
         				$('.homeNews').html(str);
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