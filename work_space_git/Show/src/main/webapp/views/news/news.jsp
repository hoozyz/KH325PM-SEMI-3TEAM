<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/views/common/musicHeader.jsp"%>

<style>

	a:hover {
		text-decoration: underline;
		color: #DBAB34;
	}
	
</style>


<!-- @@@ 윗부분 @@@ -->
<section class="container" style="padding-top:100px;">
	<p style="font-size: 50pt;">소식게시판</p>
	<!-- Card_Main_left -->
	<div class="card-flush card-stretched-vertical"
		style="float: left; width: 50%; padding-right: 1%;">
		<div class="row">
			<div class="col-sm-12">
				<img class="card" src="<%=path%>/resources/images/news/big1.png"
					alt="Image Description" id="news_img_1" name="news_img_1">
			</div>
			<!-- End Col -->

			<div>
				<!-- Card Body -->
				<div style="height: 100%;">
					<div style="height: 70%;">
							<a>
						<h3 class="card-title" style="margin-top: 8px;">
							<a href="https://www.nocutnews.co.kr/news/5798033" id="news_title_1"
								name="news_title_1">해상왕 장보고 삶, 뮤지컬로 만든다…'오션스' 쇼케이스</a>
						</h3>

						<p class="card-text"><a class="link-dark" href="https://www.nocutnews.co.kr/news/5798033">해상왕 장보고의 삶이 뮤지컬로 제작된다. EMK뮤지컬컴퍼니는 해상왕
							장보고의 삶을 다룬 역사 픽션 뮤지컬 '오션스'의 쇼케이스를 9월 1일부터 4일까지 서울 코엑스아티움에서 연다고
							밝혔다. 대본과 가사, 연출을 맡은 추정화는 "꿈을 지니지 못한 사람들에게 꿈의 소중함을 일깨워주는 작품이 되길
							바란다"고 전했다. 내년 7월 초연할 예정이다.</a></p>
							
					</div>

					<!-- Card Footer -->
					<div>
						<div class="d-flex pt-4">
							<div class="flex-shrink-0">
								<a class="avatar avatar-circle"> <img class="avatar-img"
									src="<%=path%>/resources/images/news/nlogo1.png" alt="Image Description"
									id="news_author_img_1" name="news_author_img_1">
								</a>
							</div>

							<div class="flex-grow-1 ms-3">
								<a class="card-link link-dark" id="news_author_1"
									name="news_author_1">문수경 기자</a>
								<p class="card-text small" id="news_date_1" name="news_date_1">2022-08-05</p>
							</div>
						</div>
					</div>
					<!-- End Card Footer -->
				</div>
				<!-- End Card Body -->
			</div>
			<!-- End Col -->
		</div>
		<!-- End Row -->
	</div>
	<!-- End Card -->
	<!-- Card_Main_right -->
	<div class="card-flush card-stretched-vertical"
		style="float: right; width: 50%; padding-left: 1%;">
		<div class="row">
			<div class="col-sm-12">
				<img class="card" src="<%=path%>/resources/images/news/big2.png"
					alt="Image Description" id="news_img_1" name="news_img_1">
			</div>
			<!-- End Col -->

			<div>
				<!-- Card Body -->
				<div style="height: 100%;">
					<div style="height: 80%;">

						<h3 class="card-title" style="margin-top: 8px;">
							<a href="https://www.segye.com/newsView/20220807511675?OutUrl=naver"
								name="news_title_1">남자들을 위한 80㎝ 부츠?…2년 만에 돌아온 쇼뮤지컬 ‘킹키부츠’</a>
						</h3>

						<p class="card-text"><a class="link-dark" href="https://www.segye.com/newsView/20220807511675?OutUrl=naver">
						뮤지컬 ‘킹키부츠’는 1979년 영국 노샘프턴의 수제 신사화 공장에 있었던
							실화를 바탕으로 2005년 만들어진 동명 영화를 뮤지컬화했다. CJ ENM이 제작단계부터 공동 프로듀서로 참여한 이
							뮤지컬은 2013년 3월 미국 브로드웨이 초연 이후 토니어워즈 6관왕과 올리비에어워즈 3관왕 등 세계 유수의 뮤지컬
							시상식을 휩쓸었다. 2020년 네 번째 시즌까지 누적관객 35만명을 돌파할 정도로 국내에서 인기 뮤지컬로 입지를
							굳혔다.</a></p>
					</div>

					<!-- Card Footer -->
					<div>
						<div class="d-flex">
							<div class="flex-shrink-0">
								<a class="avatar avatar-circle"> <img class="avatar-img"
									src="<%=path%>/resources/images/news/nlogo2.png" alt="Image Description"
									id="news_author_img_1" name="news_author_img_1">
								</a>
							</div>

							<div class="flex-grow-1 ms-3">
								<a class="card-link link-dark" id="news_author_1"
									name="news_author_1">이강은 기자</a>
								<p class="card-text small" id="news_date_1" name="news_date_1">2022-08-08</p>
							</div>
						</div>
					</div>
					<!-- End Card Footer -->
				</div>
				<!-- End Card Body -->
			</div>
			<!-- End Col -->
		</div>
		<!-- End Row -->
	</div>
	<!-- End Card -->
</section>
<!-- @@@윗부분 끝 @@@ -->

<!-- @@@ 아래 리스트 @@@ -->
<div class="container content-space-2 content-space-lg-3"
	style="margin-top: 100px;">
	<div class="row justify-content-lg-between">
		<div class="mb-10 mb-lg-0">
			<div class="d-grid gap-7 mb-7">
				<!-- Card_1 -->
				<div class="card card-flush card-stretched-vertical"
					style="margin-bottom: 3%; margin-right: 5%; margin-left: 5%;">
					<div class="row">
						<div class="col-sm-5">
							<img calss="card" src="<%=path%>/resources/images/news/small1.png"
								alt="Image Description" id="news_img_1" name="news_img_1">
						</div>
						<!-- End Col -->

						<div class="col-sm-7">
							<!-- Card Body -->
							<div style="height: 100%;">
								<div style="height: 70%;">

									<h3 class="card-title">
										<a href="https://www.bloter.net/newsView/blt202208050018"
											id="news_title_1" name="news_title_1">'비공식 브리저튼 뮤지컬' 소송,
											팬 창작물에 미칠 영향은</a>
									</h3>

									<p class="card-text"><a class="link-dark" href="https://www.bloter.net/newsView/blt202208050018">
									비공식 브리저튼은 애비게일 발로우와 에밀리 베어가 넷플릭스 오리지널 시리즈 '브리저튼'에 영감을 받아 만든 뮤지컬 음악이다.
									 두 사람은 관련 영상을 틱톡에 올려 그래미상에서 '베스트 뮤지컬 앨범상'을 수상할 만큼 많은 화제를 모았다. 이를 발판삼아 두 사람은 지난달 26일 미국 워싱턴 DC 케네디센터에서 첫 비공식 브리저튼 뮤지컬 콘서트를 개최했는데 
									 그 후 넷플릭스는 두 사람이 “상업적인 이익을 위해 공연을 열었다”며 저작권 침해 혐의로 소송을 제기했다.</a></p>
								</div>

								<!-- Card Footer -->
								<div class="card-footer">
									<div class="d-flex">
										<div class="flex-shrink-0">
											<a class="avatar avatar-circle"> <img class="avatar-img"
												src="<%=path%>/resources/images/news/nlogo3.png"
												alt="Image Description" id="news_author_img_1"
												name="news_author_img_1">
											</a>
										</div>

										<div class="flex-grow-1 ms-3">
											<a class="card-link link-dark" id="news_author_1"
												name="news_author_1">최경미 기자</a>
											<p class="card-text small" id="news_date_1"
												name="news_date_1">2022-08-07</p>
										</div>
									</div>
								</div>
								<!-- End Card Footer -->
							</div>
							<!-- End Card Body -->
						</div>
						<!-- End Col -->
					</div>
					<!-- End Row -->
				</div>
				<!-- End Card -->
				<!-- Card_2 -->
				<div class="card card-flush card-stretched-vertical"
					style="margin-bottom: 3%; margin-right: 5%; margin-left: 5%;">
					<div class="row">
						<div class="col-sm-5">
							<img calss="card" src="<%=path%>/resources/images/news/small2.png"
								alt="Image Description" id="news_img_2" name="news_img_2">
						</div>
						<!-- End Col -->

						<div class="col-sm-7">
							<!-- Card Body -->
							<div style="height: 100%;">
								<div style="height: 70%;">

									<h3 class="card-title">
										<a href="https://www.yna.co.kr/view/AKR20220805142700005?input=1195m"
											id="news_title_2" name="news_title_2">'160년이 지나도 살아있는 고전의 힘…연극 '레 미제라블'</a>
									</h3>

									 <p class="card-text"><a class="link-dark" href="https://www.yna.co.kr/view/AKR20220805142700005?input=1195m">
									 프랑스 대문호 빅토르 위고의 대표작 '레 미제라블'이 5∼15일 서울 마포아트센터 아트홀맥에서 연극으로 무대에 오른다.
									5일 개막을 앞두고 기자들 앞에서 전막 시연한 '레 미제라블'은 위대한 명작인 원작의 힘을 증명했다.
									이번 공연에서 장 발장을 추격하는 경찰 자베르 역으로 합류한 배우 김명수는 선과 악, 정의와 용서 사이에서 갈등하는 상징적인 인물을 묵직한 정극 연기로 그려냈다.</a></p>
								</div>

								<!-- Card Footer -->
								<div class="card-footer">
									<div class="d-flex">
										<div class="flex-shrink-0">
											<a class="avatar avatar-circle"> <img class="avatar-img"
												src="<%=path%>/resources/images/news/nlogo4.png"
												alt="Image Description" id="news_author_img_1"
												name="news_author_img_2">
											</a>
										</div>

										<div class="flex-grow-1 ms-3">
											<a class="card-link link-dark" id="news_author_2"
												name="news_author_2">임지우 기자</a>
											<p class="card-text small" id="news_date_2"
												name="news_date_2">2022-08-05</p>
										</div>
									</div>
								</div>
								<!-- End Card Footer -->
							</div>
							<!-- End Card Body -->
						</div>
						<!-- End Col -->
					</div>
					<!-- End Row -->
				</div>
				<!-- End Card -->
				<!-- Card_3 -->
				<div class="card card-flush card-stretched-vertical"
					style="margin-bottom: 3%; margin-right: 5%; margin-left: 5%;">
					<div class="row">
						<div class="col-sm-5">
							<img calss="card" src="<%=path%>/resources/images/news/small3.png"
								alt="Image Description" id="news_img_1" name="news_img_1">
						</div>
						<!-- End Col -->

						<div class="col-sm-7">
							<!-- Card Body -->
							<div style="height: 100%;">
								<div style="height: 70%;">

									<h3 class="card-title">
										<a href="https://www.fnnews.com/news/202208021413054066"
											id="news_title_3" name="news_title_3">장성군, 세계유산 필암서원서 명품
											국악공연</a>
									</h3>

									<p class="card-text"><a class="link-dark" href="https://www.fnnews.com/news/202208021413054066">
									전남 장성군은 유네스코 세계유산인 필암서원을 무대로 오는 11월까지
										수준 높은 문화예술 행사를 펼친다고 2일 밝혔다. 특히 이번 행사는 단발성으로 그치는 이벤트가 아닌 4차례의
										정기공연과 가을축제 기간에 맞춘 기획공연까지 예정돼 있어 큰 기대를 모으고 있다.정기공연은 필암서원에 배향된
										조선시대 유학자 하서 김인후 선생의 생을 인(仁), 의(義), 예(禮), 지(智)로 구분한 스토리텔링과 퓨전국악
										콘서트가 조화를 이룬다.</a></p>
								</div>

								<!-- Card Footer -->
								<div class="card-footer">
									<div class="d-flex">
										<div class="flex-shrink-0">
											<a class="avatar avatar-circle"> <img class="avatar-img"
												src="<%=path%>/resources/images/news/nlogo5.png"
												alt="Image Description" id="news_author_img_3"
												name="news_author_img_3">
											</a>
										</div>

										<div class="flex-grow-1 ms-3">
											<a class="card-link link-dark" id="news_author_3"
												name="news_author_3">황태종 기자</a>
											<p class="card-text small" id="news_date_3"
												name="news_date_3">2022-08-02</p>
										</div>
									</div>
								</div>
								<!-- End Card Footer -->
							</div>
							<!-- End Card Body -->
						</div>
						<!-- End Col -->
					</div>
					<!-- End Row -->
				</div>
				<!-- End Card -->
				<!-- Card_4 -->
				<div class="card card-flush card-stretched-vertical"
					style="margin-bottom: 3%; margin-right: 5%; margin-left: 5%;">
					<div class="row">
						<div class="col-sm-5">
							<img calss="card" src="<%=path%>/resources/images/news/small4.png"
								alt="Image Description" id="news_img_4" name="news_img_4">
						</div>
						<!-- End Col -->

						<div class="col-sm-7">
							<!-- Card Body -->
							<div style="height: 100%;">
								<div style="height: 70%;">

									<h3 class="card-title">
										<a href="https://www.fnnews.com/news/202208021401061024"
											id="news_title_4" name="news_title_4">국립현대무용단, 세종문화회관서
											3주간 현대무용 신작 릴레이</a>
									</h3>

									<p class="card-text"><a class="link-dark" href="https://www.fnnews.com/news/202208021401061024">
									국립현대무용단은 오는 9월 세종문화회관 S씨어터에서 '무용X기술 융합
										프로젝트'와 '맨투맨'을 공연한다고 2일 밝혔다. 먼저 인공지능과 VR을 공연에 접목한 '무용X기술 융합
										프로젝트'는 과학기술과 예술에 대해 새롭게 사유하는 기회를 제공한다. 공연은 9월 16~18일, 22~25일
										진행된다. 오는 9월 30일부터 10월 2일까지는 유럽 현대무용계에서 활발히 활약하는 허성임과 랄리 아구아데의
										신작을 '맨투맨'에서 선보인다. 3주간 펼쳐지는 현대무용 신작 릴레이를 통해 무용의 현재와 미래를 만나볼 수
										있다.</a></p>

								</div>

								<!-- Card Footer -->
								<div class="card-footer">
									<div class="d-flex">
										<div class="flex-shrink-0">
											<a class="avatar avatar-circle"> <img class="avatar-img"
												src="<%=path%>/resources/images/news/nlogo5.png"
												alt="Image Description" id="news_author_img_4"
												name="news_author_img_4">
											</a>
										</div>

										<div class="flex-grow-1 ms-3">
											<a class="card-link link-dark" id="news_author_4"
												name="news_author_4">이환주 기자</a>
											<p class="card-text small" id="news_date_4"
												name="news_date_4">2022-08-02</p>
										</div>
									</div>
								</div>
								<!-- End Card Footer -->
							</div>
							<!-- End Card Body -->
						</div>
						<!-- End Col -->
					</div>
					<!-- End Row -->
				</div>
				<!-- End Card -->
				<!-- Card_1 -->
				<div class="card card-flush card-stretched-vertical"
					style="margin-bottom: 3%; margin-right: 5%; margin-left: 5%;">
					<div class="row">
						<div class="col-sm-5">
							<img calss="card" src="<%=path%>/resources/images/news/small5.png"
								alt="Image Description" id="news_img_1" name="news_img_1">
						</div>
						<!-- End Col -->

						<div class="col-sm-7">
							<!-- Card Body -->
							<div style="height: 100%;">
								<div style="height: 70%;">

									<h3 class="card-title">
										<a href="https://news.kmib.co.kr/article/view.asp?arcid=0924257815&code=13140000&cp=nv"
											id="news_title_5" name="news_title_5">멘델스존과 코른골트의 만남…
											롯데콘서트홀 ‘클래식 레볼루션’</a>
									</h3>

									<p class="card-text"><a class="link-dark" href="https://news.kmib.co.kr/article/view.asp?arcid=0924257815&code=13140000&cp=nv">
									서울 롯데콘서트홀은 오는 12일부터 21일까지 여름 클래식 페스티벌인
										‘클래식 레볼루션’(포스터)을 개최한다. 예술의전당 콘서트홀과 함께 서울을 대표하는 대형 클래식 공연장인
										롯데콘서트홀은 2020년부터 ‘클래식 레볼루션’을 열고 있다. 독일 쾰른 챔버 오케스트라 음악감독인 지휘자 겸
										바이올리니스트 크리스토프 포펜이 예술감독을 맡아 축제 첫해부터 특정 작곡가의 음악을 집중 탐구하는 프로그램을
										선보이고 있다.</a></p>
								</div>

								<!-- Card Footer -->
								<div class="card-footer">
									<div class="d-flex">
										<div class="flex-shrink-0">
											<a class="avatar avatar-circle"> <img class="avatar-img"
												src="<%=path%>/resources/images/news/nlogo7.png"
												alt="Image Description" id="news_author_img_1"
												name="news_author_img_1">
											</a>
										</div>

										<div class="flex-grow-1 ms-3">
											<a class="card-link link-dark" id="news_author_1"
												name="news_author_1">장지영 기자</a>
											<p class="card-text small" id="news_date_1"
												name="news_date_1">2022-08-06</p>
										</div>
									</div>
								</div>
								<!-- End Card Footer -->
							</div>
							<!-- End Card Body -->
						</div>
						<!-- End Col -->
					</div>
					<!-- End Row -->
				</div>
				<!-- End Card -->
			</div>

			<!-- Sticky Block End Point -->
			<div id="stickyBlockEndPoint"></div>

		</div>
		<!-- End Col -->
	</div>
</div>
<!-- @@@ 아래 리스트 끝 @@@ -->

	<%@include file="/views/common/footer.jsp"%>
