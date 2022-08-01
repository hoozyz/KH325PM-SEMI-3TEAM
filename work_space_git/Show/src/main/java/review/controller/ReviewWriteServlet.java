package review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import review.service.ReviewService;
import vo.Review;
import vo.Show;
import vo.User;

@WebServlet("/reviewWrite")
public class ReviewWriteServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	ReviewService service = new ReviewService();

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
		
		String userId = req.getParameter("revId");
		String starStr = req.getParameter("revStar");
		String star = String.valueOf(starStr.charAt(3));
		String content = req.getParameter("revContent");
		Show show = (Show) req.getAttribute("show");
		
		String showId = show.getShow_id();
		
		Review rev = new Review("", showId, userId, content, "", "", "", star, 0, "");
		
		if(userId == null || star == null || content == null) {
			req.setAttribute("msg", "모든 내용을 작성해주세요.");
			req.getRequestDispatcher("/views/show/showDetail.jsp").forward(req, resp);
			return;
		} 
		
		int result = service.save(rev);
		
		if (result > 0) {
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
