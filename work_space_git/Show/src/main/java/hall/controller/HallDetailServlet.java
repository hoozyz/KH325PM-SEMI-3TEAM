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
import show.service.ShowService;
import vo.Hall;
import vo.Show;

@WebServlet(name = "hallDetail", urlPatterns = "/hallDetail")
public class HallDetailServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	HallService service = new HallService(); 
	ShowService showService = new ShowService();

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String hallId = req.getParameter("hallId");
		
		Hall hall = service.selectHallById(hallId);
		
		List<Show> showList = new ArrayList<>();
		showList = showService.getShowView(hallId);
		
		if (hall != null) {
			req.setAttribute("hall", hall);
			req.setAttribute("showList", showList);
			req.getRequestDispatcher("/views/hall/hallDetail.jsp").forward(req, resp);
		} else {
			req.setAttribute("msg", "공연장 id가 잘못되었습니다.");
			req.getRequestDispatcher("/views/hall/hallDetail.jsp").forward(req, resp);
			return;
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
