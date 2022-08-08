package review.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.controller.PageInfo;
import review.service.ReviewService;
import show.service.ShowService;
import vo.Review;
import vo.Show;
import vo.User;

@WebServlet("/writeReview")
public class ReviewWriteServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	ReviewService revService = new ReviewService();
	ShowService showService = new ShowService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect("/");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User loginUser = (User) session.getAttribute("loginUser");
		if(loginUser == null) {
			req.setAttribute("msg", "잘못된 접근입니다.");
			req.getRequestDispatcher("/").forward(req, resp);
			return;
		}
		
		int page = Integer.parseInt(req.getParameter("page"));
		String showId = req.getParameter("showId");
		int revCount = revService.getRevCount(showId);
		PageInfo pageInfo = new PageInfo(page, 5, revCount, 5);
		
		
		String userId = req.getParameter("revId");
		String starStr = req.getParameter("revStar");
		int star = Integer.parseInt(String.valueOf(starStr.charAt(0)));
		String content = req.getParameter("revContent");
		
		Show show = showService.findShowById(showId);
		
		Review rev = new Review("", showId, userId, content, show.getPrfnm(), show.getPrfpdfrom(), show.getPrfpdto(), star, 0, "");
		
		if(userId == null || star == 0 || content == null) {
			req.setAttribute("msg", "모든 내용을 작성해주세요.");
			req.getRequestDispatcher("/views/show/showDetail.jsp").forward(req, resp);
			return;
		} 
		
		int result = revService.save(rev);
		
		List<Review> revList = new ArrayList<>();
		revList = revService.findReviewByShowId(showId);
		req.setAttribute("pageInfo", pageInfo);
		if (result > 0) {
			req.setAttribute("revList", revList);
			req.setAttribute("show", show);
			req.setAttribute("showId", showId);
			req.setAttribute("msg", "리뷰 작성에 성공하였습니다.");
			req.getRequestDispatcher("/views/show/showDetail.jsp").forward(req, resp);
			return;
		} else {
			req.setAttribute("msg", "리뷰 작성에 실패하였습니다.");
			req.getRequestDispatcher("/views/show/showDetail.jsp").forward(req, resp);
			return;
		}
	}
}
