package like.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import like.service.LikeService;
import show.service.ShowService;
import vo.Like;
import vo.Show;
import vo.User;

@WebServlet(name = "likeShow", urlPatterns = "/like/show")
public class LikeShowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ShowService showService = new ShowService();
	LikeService likeService = new LikeService();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("loginUser");
		String userId = user.getUser_id();

		String showId = req.getParameter("showId");

		Show show = showService.findShowById(showId);

		Like like = new Like(0, userId, showId, show.getPrfnm(), show.getPoster(), show.getFcltynm(), "");
		
		int result = 0;
		if(Integer.parseInt(req.getParameter("like")) == 1) {
			result = likeService.save(like);
		} else {
			result = likeService.deleteById(showId, userId);
		}

		if (result > 0) {
			JSONArray arrayObj = new JSONArray();
			JSONObject obj = new JSONObject();
			
			obj.put("showId", showId);
			
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
