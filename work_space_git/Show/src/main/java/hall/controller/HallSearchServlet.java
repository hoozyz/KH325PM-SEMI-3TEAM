package hall.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hall.service.HallService;
import vo.Hall;

@WebServlet(name = "hallSearch", urlPatterns = "/hall/search")
public class HallSearchServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	HallService service = new HallService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String keyword = "";
		String local = "";
		
		if(req.getAttribute("keyword") != null) { // 홈페이지 검색
			keyword = (String) req.getAttribute("keyword");
		} else {
			keyword = req.getParameter("keyword");
		}
		
		if(req.getParameter("local") != null) {
			local = req.getParameter("local");
		}
		
		List<Hall> list = new ArrayList<>();

		list = service.selectHall(local, keyword);
		
		if (list != null) {
			req.setAttribute("list", list);
			req.getRequestDispatcher("/views/hall/concertHall.jsp").forward(req, resp);
			return;
		} else {
			req.setAttribute("msg", "검색 결과가 없습니다.");
			req.getRequestDispatcher("/views/hall/concertHall.jsp").forward(req, resp);
			return;
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
