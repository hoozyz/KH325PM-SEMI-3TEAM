package review.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import board.controller.PageInfo;
import review.service.ReviewService;
import vo.Review;

@WebServlet(name = "reviewList", urlPatterns = "/review/list")
public class ReviewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ReviewService service = new ReviewService();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String showId = req.getParameter("showId");
		int page = 1;
		int revCount = 0;
		String sort = "";
		if (req.getParameter("sort") == null) {
			sort = "new";
		} else {
			sort = req.getParameter("sort");
		}
		PageInfo pageInfo = null;
		List<Review> revList = new ArrayList<>();

		revCount = service.getRevCount(showId);

		if (req.getParameter("pageNo") != null) {
			page = Integer.parseInt(req.getParameter("pageNo"));
		}
		
		JSONArray arrayObj = new JSONArray();
		
		pageInfo = new PageInfo(page, 5, revCount, 5);
		revList = service.findAllByShowId(showId, pageInfo, sort);

		for (int i = 0; i < revList.size(); i++) { // 게시판 글 수의 사이즈 만큼 담는다.

			String user_id = revList.get(i).getUser_id();
			int star = revList.get(i).getRev_star();
			String content = revList.get(i).getRev_content();
			String date = revList.get(i).getRev_date();
			int like = revList.get(i).getRev_like();

			JSONObject obj = new JSONObject();
			obj.put("user_id", user_id);
			obj.put("star", star);
			obj.put("content", content);
			obj.put("date", date);
			obj.put("like", like);

			int maxPage = pageInfo.getMaxPage();
			int startPage = pageInfo.getStartPage();
			int endPage = pageInfo.getEndPage();
			int currentPage = pageInfo.getCurrentPage();
			int prevPage = pageInfo.getPrevPage();
			int nextPage = pageInfo.getNextPage();
			int startList = pageInfo.getStartList();
			int endList = pageInfo.getEndList();

			obj.put("maxPage", maxPage);
			obj.put("startPage", startPage);
			obj.put("endPage", endPage);
			obj.put("currentPage", currentPage);
			obj.put("prevPage", prevPage);
			obj.put("nextPage", nextPage);
			obj.put("startList", startList);
			obj.put("endList", endList);

			arrayObj.add(obj);
		}

		PrintWriter out = resp.getWriter();
		out.println(arrayObj.toJSONString());
		out.flush();
		out.close();
		return;
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/show/showDetail.jsp").forward(req, resp);
	}
}
