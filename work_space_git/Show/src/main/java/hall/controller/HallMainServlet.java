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

@WebServlet("/hallMain")
public class HallMainServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	HallService service = new HallService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Hall> list = new ArrayList<>();
		
		Hall hall1 = service.selectHallById("FC000001");
		Hall hall2 = service.selectHallById("FC000028");
		Hall hall3 = service.selectHallById("FC000017");
		Hall hall4 = service.selectHallById("FC001701");
		Hall hall5 = service.selectHallById("FC000127");
		Hall hall6 = service.selectHallById("FC000178");
		
		
		list.add(hall1);
		list.add(hall2);
		list.add(hall3);
		list.add(hall4);
		list.add(hall5);
		list.add(hall6);
		
		req.setAttribute("list", list);
		req.getRequestDispatcher("/views/hall/concertHall.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
