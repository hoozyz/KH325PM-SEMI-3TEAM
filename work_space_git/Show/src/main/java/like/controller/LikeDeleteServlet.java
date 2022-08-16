package like.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import like.service.LikeService;

@WebServlet(name="deleteLike", urlPatterns = "/deleteLike")
public class LikeDeleteServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	LikeService service = new LikeService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int likeNo =  Integer.parseInt(req.getParameter("likeNo"));
		
		// 예매내역 삭제
		int result = service.deleteByNo(likeNo);
		
		if(result > 0) {
			req.setAttribute("msg", "찜을 삭제했습니다.");
			req.getRequestDispatcher("/myLike").forward(req, resp);
			return;
		} else {
			req.setAttribute("msg", "찜 삭제를 실패하였습니다.");
			req.getRequestDispatcher("/views/user/myLike.jsp").forward(req, resp);
			return;
		}
		
	}
}
