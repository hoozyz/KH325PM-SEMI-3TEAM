package user.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import like.service.LikeService;
import vo.Like;
import vo.User;

@WebServlet("/myLike")
public class UserMyLikeServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
	
	LikeService service = new LikeService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(true);
		User user = (User) session.getAttribute("loginUser");
		String userId = user.getUser_id();

		// 나의 찜목록 가져오기
		List<Like> likeList = service.findLikeById(userId);
		
		if (likeList != null) {
			String msg = (String) req.getAttribute("msg");
			req.setAttribute("msg", msg);
			req.setAttribute("likeList", likeList);
			req.getRequestDispatcher("/views/user/myLike.jsp").forward(req, resp);
			return;
		} else {
			req.setAttribute("msg", "찜 내역이 없습니다.");
			req.getRequestDispatcher("/views/user/myLike.jsp").forward(req, resp);
			return;
		}
	}
}
