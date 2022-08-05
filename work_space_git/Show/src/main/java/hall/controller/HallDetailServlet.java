package hall.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hall.service.HallService;
import vo.Hall;

@WebServlet(name = "hallDetail", urlPatterns = "/hallDetail")
public class HallDetailServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	HallService service = new HallService(); 

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String hallId = req.getParameter("hallId");
		
		Hall hall = service.selectHallById(hallId);
		
		if (hall != null) {
			req.setAttribute("hall", hall);
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
