<%@page import="java.util.ArrayList"%>
<%@page import="vo.News"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/views/common/musicHeader.jsp"%>

<%
	List<News> list = new ArrayList<>();
	if((List<News>) request.getAttribute("list") != null) {
		list = (List<News>) request.getAttribute("list");
	} else {
		list = null;
	}
%>

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
				<img class="card" src="<%=list.get(0).getPoster() %>" style="width: 660px; height: 375px;"
					alt="Image Description" id="news_img_1" name="news_img_1">
			</div>
			<!-- End Col -->

			<div>
				<!-- Card Body -->
				<div style="height: 100%;">
					<div style="height: 70%;">
							<a>
						<h3 class="card-title" style="margin-top: 8px;">
							<a href="<%=list.get(0).getLink() %>" id="news_title_1" name="news_title_1"><%=list.get(0).getTitle() %></a>
						</h3>

						<p class="card-text"><a class="link-dark" href="https://www.nocutnews.co.kr/news/5798033"><%=list.get(0).getCont() %></a></p>
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
									name="news_author_1">관리자</a>
								<p class="card-text small" id="news_date_1" name="news_date_1"><%=list.get(0).getDate() %></p>
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
				<img class="card" src="<%=list.get(1).getPoster() %>" style="width: 660px; height: 375px;"
					alt="Image Description" id="news_img_1" name="news_img_1">
			</div>
			<!-- End Col -->

			<div>
				<!-- Card Body -->
				<div style="height: 100%;">
					<div style="height: 80%;">

						<h3 class="card-title" style="margin-top: 8px;">
							<a href="<%=list.get(1).getLink() %>"
								name="news_title_1"><%=list.get(1).getTitle() %></a>
						</h3>

						<p class="card-text"><a class="link-dark" href="<%=list.get(1).getLink() %>"><%=list.get(1).getCont() %></a></p>
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
									name="news_author_1">관리자</a>
								<p class="card-text small" id="news_date_1" name="news_date_1"><%=list.get(1).getDate() %></p>
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
							<img calss="card" src="<%=list.get(2).getPoster() %>"
								style="width: 470px; height: 300px;" alt="Image Description" id="news_img_1" name="news_img_1">
						</div>
						<!-- End Col -->

						<div class="col-sm-7">
							<!-- Card Body -->
							<div style="height: 100%;">
								<div style="height: 70%;">

									<h3 class="card-title">
										<a href="<%=list.get(2).getLink() %>"
											id="news_title_1" name="news_title_1"><%=list.get(2).getTitle() %></a>
									</h3>

									<p class="card-text"><a class="link-dark" href="<%=list.get(2).getLink() %>"><%=list.get(2).getCont() %></a></p>
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
												name="news_author_1">관리자</a>
											<p class="card-text small" id="news_date_1"
												name="news_date_1"><%=list.get(2).getDate() %></p>
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
							<img calss="card" src="<%=list.get(3).getPoster() %>" style="width: 470px; height: 300px;"
								alt="Image Description" id="news_img_2" name="news_img_2">
						</div>
						<!-- End Col -->

						<div class="col-sm-7">
							<!-- Card Body -->
							<div style="height: 100%;">
								<div style="height: 70%;">

									<h3 class="card-title">
										<a href="<%=list.get(3).getLink() %>"
											id="news_title_2" name="news_title_2"><%=list.get(3).getTitle() %></a>
									</h3>

									 <p class="card-text"><a class="link-dark" href="<%=list.get(3).getLink() %>"><%=list.get(3).getCont() %></a></p>
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
												name="news_author_2">관리자</a>
											<p class="card-text small" id="news_date_2"
												name="news_date_2"><%=list.get(3).getDate() %></p>
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
							<img calss="card" src="<%=list.get(4).getPoster() %>" style="width: 470px; height: 300px;"
								alt="Image Description" id="news_img_1" name="news_img_1">
						</div>
						<!-- End Col -->

						<div class="col-sm-7">
							<!-- Card Body -->
							<div style="height: 100%;">
								<div style="height: 70%;">

									<h3 class="card-title">
										<a href="<%=list.get(4).getLink() %>"
											id="news_title_3" name="news_title_3"><%=list.get(4).getTitle() %></a>
									</h3>

									<p class="card-text"><a class="link-dark" href="<%=list.get(4).getLink() %>"><%=list.get(4).getCont() %></a></p>
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
												name="news_author_3">관리자</a>
											<p class="card-text small" id="news_date_3"
												name="news_date_3"><%=list.get(4).getDate() %></p>
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
							<img calss="card" src="<%=list.get(5).getPoster() %>" style="width: 470px; height: 300px;"
								alt="Image Description" id="news_img_4" name="news_img_4">
						</div>
						<!-- End Col -->

						<div class="col-sm-7">
							<!-- Card Body -->
							<div style="height: 100%;">
								<div style="height: 70%;">

									<h3 class="card-title">
										<a href="<%=list.get(5).getLink() %>"
											id="news_title_4" name="news_title_4"><%=list.get(5).getTitle() %></a>
									</h3>

									<p class="card-text"><a class="link-dark" href="<%=list.get(5).getLink() %>"><%=list.get(5).getCont() %></a></p>

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
												name="news_author_4">관리자</a>
											<p class="card-text small" id="news_date_4"
												name="news_date_4"><%=list.get(5).getDate() %></p>
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
							<img calss="card" src="<%=list.get(6).getPoster() %>" style="width: 470px; height: 300px;"
								alt="Image Description" id="news_img_1" name="news_img_1">
						</div>
						<!-- End Col -->

						<div class="col-sm-7">
							<!-- Card Body -->
							<div style="height: 100%;">
								<div style="height: 70%;">

									<h3 class="card-title">
										<a href="<%=list.get(6).getLink() %>"
											id="news_title_5" name="news_title_5"><%=list.get(6).getTitle() %></a>
									</h3>

									<p class="card-text"><a class="link-dark" href="<%=list.get(6).getLink() %>"><%=list.get(6).getCont() %></a></p>
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
												name="news_author_1">관리자</a>
											<p class="card-text small" id="news_date_1"
												name="news_date_1"><%=list.get(6).getDate() %></p>
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
