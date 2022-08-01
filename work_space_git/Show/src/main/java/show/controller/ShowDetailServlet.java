package show.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.service.ReviewService;
import show.service.ShowService;
import vo.Review;
import vo.Show;

@WebServlet(name = "showDetail", urlPatterns = "/showDetail")
public class ShowDetailServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	ShowService showService = new ShowService();
	ReviewService revService = new ReviewService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String showId =  (String) req.getParameter("showId");
		
		Show show = showService.findShowById(showId);
		if(show != null) {
			req.setAttribute("show", show);
		} else {
			req.setAttribute("msg", "공연 id 오류입니다.");
			req.getRequestDispatcher("/showHome.jsp").forward(req, resp);
			return;
		}
		
		List<Review> revList = new ArrayList<>();
		revList = revService.findReviewByShowId(showId);
		
		if(revList != null) {
			req.setAttribute("revList", revList);
			req.getRequestDispatcher("/views/show/showDetail.jsp").forward(req, resp);
			return;
		} else {
			req.setAttribute("msg", "이 공연은 리뷰 내역이 없습니다.");
			req.getRequestDispatcher("/views/show/showDetail.jsp").forward(req, resp);
			return;
		}
	} 
}
