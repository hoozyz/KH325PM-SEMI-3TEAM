package review.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import review.service.ReviewService;
import vo.Review;

@WebServlet(name = "reviewHeart", urlPatterns = "/review/heart")
public class ReviewHeartServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	ReviewService service = new ReviewService();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int revNo = Integer.parseInt(req.getParameter("revNo"));
		int like = Integer.parseInt(req.getParameter("like"));
		
		Review rev = service.findReviewByNo(revNo);
		int revLike = rev.getRev_like();
		int result = 0;

		// 1인경우 좋아요 추가 , 0인 경우 좋아요 취소
		if(like == 1) {
			result = service.plusLike(rev);
			revLike++;
		} else {
			result = service.minusLike(rev);
			revLike--;
		}
		
		if(result > 0) {
			JSONArray arrayObj = new JSONArray();
			JSONObject obj = new JSONObject();
			
			obj.put("no", revNo);
			obj.put("like", revLike);
			
			arrayObj.add(obj);
			
			PrintWriter out = resp.getWriter();
			out.println(arrayObj.toJSONString());
			out.flush();
			out.close();
			return;
		}
		
		req.getRequestDispatcher("/views/show/showDetail.jsp").forward(req, resp);
		return;
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/show/showDetail.jsp").forward(req, resp);
	}
}
