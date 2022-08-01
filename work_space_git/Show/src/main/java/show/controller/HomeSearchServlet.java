package show.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "homeSearch", urlPatterns = "/homeSearch")
public class HomeSearchServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	
	
	
	
	// 검색결과 페이지로 바로
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String keyword = req.getParameter("keyword");
		String category = req.getParameter("category");
		
		if(category == null || keyword == null) {
			req.setAttribute("msg", "항목을 다 작성해주세요.");
			req.getRequestDispatcher("/showHome.jsp").forward(req, resp);
			return;
		}
		
		if (category.equals("공연")) {
			req.setAttribute("keyword", keyword);
			req.setAttribute("category", category);
			req.getRequestDispatcher("/views/show/showMain.jsp").forward(req, resp);
			return;
		}
		if (category.equals("음악")) {
			req.setAttribute("keyword", keyword);
			req.setAttribute("category", category);
			req.getRequestDispatcher("/views/show/musicMain.jsp").forward(req, resp);
			return;
		}
		if (category.equals("기타")) {
			req.setAttribute("keyword", keyword);
			req.setAttribute("category", category);
			req.getRequestDispatcher("/views/hall/hallMain.jsp").forward(req, resp);
			return;
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
