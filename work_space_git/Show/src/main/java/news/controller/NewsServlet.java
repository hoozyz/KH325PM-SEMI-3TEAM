package news.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import news.service.NewsService;
import vo.News;

@WebServlet(name = "news", urlPatterns = "/news")
public class NewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	NewsService service = new NewsService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = "SlmkREwMnVQKNyFUPgtq";
		String secret = "JxqU7vh8Wm";

		List<News> list = new ArrayList<>();

		// 테이블 초기화 -> 다른 뉴스
		service.deleteAll(); // 테이블 데이터만 삭제

		// 검색어 3개 저장
		List<String> listQuery = new ArrayList<>();
		listQuery.add("뮤지컬");
		listQuery.add("공연");
		listQuery.add("오페라");
		listQuery.add("무용");
		listQuery.add("연극");

		try {
			NewsParse parse = new NewsParse();
			for (int i = 0; i < listQuery.size(); i++) {
				String newsUrl = URLEncoder.encode(listQuery.get(i), "UTF-8");
				String newsResponse = parse.newsSearch(id, secret, newsUrl);

				// 필요한 파라메터 종류
				String[] fields = { "pubDate", "title", "link", "description" };
				Map<String, Object> newsResult = parse.getResult(newsResponse, fields);

				if (newsResult.size() > 0) {
					List<Map<String, Object>> newsItems = (List<Map<String, Object>>) newsResult.get("result");
					for (Map<String, Object> newsItem : newsItems) {
						News news = new News();
						String pub = (String) newsItem.get("pubDate");
						SimpleDateFormat oldFor = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss", Locale.ENGLISH);
						SimpleDateFormat newFor = new SimpleDateFormat("yyyy년 MM월 dd일", Locale.KOREAN);
						Date oldDate = oldFor.parse(pub.replace(" +0900", ""));
						String date = newFor.format(oldDate);

						if (newsItem.get("title").toString().contains(listQuery.get(i))) {
							news.setTitle((String) newsItem.get("title"));

							String imageUrl = URLEncoder.encode(parse.htmlRemove((String) newsItem.get("title")),
									"UTF-8"); // 제목을 키워드로 검색
							String imageResponse = parse.imageSearch(id, secret, imageUrl);

							// 필요한 파라메터 종류
							String[] field = { "link" };
							Map<String, Object> result = parse.getResult(imageResponse, field);

							if (result.size() > 0) {
								List<Map<String, Object>> imageItems = (List<Map<String, Object>>) result.get("result");
								for (Map<String, Object> imageItem : imageItems) {
									news.setPoster((String) imageItem.get("link")); // 이미지만 따로 넣기
								}
							}
						} else {
							continue;
						}
						news.setLink((String) newsItem.get("link"));
						news.setDate(date);
						news.setCont((String) newsItem.get("description"));
						list.add(news);
					}
				}
			}

			int newsCheck = 0;
			newsCheck = service.receive(list);
			
			if (req.getParameter("check") != null) { // 소식게시판 클릭
				list = service.findNews(); // 7개

				req.setAttribute("list", list);
				req.getRequestDispatcher("/views/news/news.jsp").forward(req, resp);
				return;
			}

			if (newsCheck > 0) {
				list = service.findNewsHome(); // 3개만 파싱

				JSONArray arrayObj = new JSONArray();

				for (int i = 0; i < list.size(); i++) {

					String poster = list.get(i).getPoster();
					String date = list.get(i).getDate();
					String link = list.get(i).getLink();
					String title = list.get(i).getTitle();

					JSONObject obj = new JSONObject();
					obj.put("poster", poster);
					obj.put("date", date);
					obj.put("link", link);
					obj.put("title", title);

					arrayObj.add(obj);

				}

				PrintWriter out = resp.getWriter();
				out.println(arrayObj.toJSONString());
				out.flush();
				out.close();
				return;
			} else {
				req.setAttribute("msg", "소식을 불러오지 못했습니다.");
				req.getRequestDispatcher("/views/news/news.jsp").forward(req, resp);
				return;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
