package review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.service.ReviewService;

@WebServlet(name="deleteReview", urlPatterns = "/deleteReview")
public class ReviewDeleteServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	ReviewService service = new ReviewService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int revNo =  Integer.parseInt(req.getParameter("revNo"));
		
		// 예매내역 삭제
		int result = service.delete(revNo);
		
		if(result > 0) {
			req.setAttribute("msg", "리뷰를 삭제했습니다.");
			req.getRequestDispatcher("/myReview").forward(req, resp);
			return;
		} else {
			req.setAttribute("msg", "리뷰 삭제를 실패하였습니다.");
			req.getRequestDispatcher("/views/user/myReview.jsp").forward(req, resp);
			return;
		}
		
	}
}
