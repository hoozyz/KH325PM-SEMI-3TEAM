package user.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import review.service.ReviewService;
import vo.Review;
import vo.User;

@WebServlet("/myReview")
public class UserMyReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ReviewService service = new ReviewService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(true);
		User user = (User) session.getAttribute("loginUser");
		System.out.println(user);
		String userId = user.getUser_id();
		System.out.println(userId);

		// 나의 리뷰목록 가져오기
		List<Review> revList = service.findReviewById(userId);
		
		if (revList != null) {
			String msg = (String) req.getAttribute("msg");
			req.setAttribute("msg", msg);
			req.setAttribute("revList", revList);
			req.getRequestDispatcher("/views/user/myReview.jsp").forward(req, resp);
			return;
		} else {
			req.setAttribute("msg", "리뷰 내역이 없습니다.");
			req.getRequestDispatcher("/views/user/myReview.jsp").forward(req, resp);
			return;
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
