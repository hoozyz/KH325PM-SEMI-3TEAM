package ticketing.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ticketing.service.TicketingService;
import vo.Ticketing;

@WebServlet(name="deleteTicketing", urlPatterns = "/deleteTicketing")
public class TicketingDeleteServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	TicketingService service = new TicketingService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int ticNo =  Integer.parseInt(req.getParameter("ticNo"));
		
		System.out.println(ticNo);
		
		// 예매내역 삭제
		int result = service.delete(ticNo);
		
		if(result > 0) {
			req.setAttribute("msg", "예매내역을 삭제했습니다.");
			req.getRequestDispatcher("/myTicketing").forward(req, resp);
			return;
		} else {
			req.setAttribute("msg", "예매내역 삭제를 실패하였습니다.");
			req.getRequestDispatcher("/myTicketing").forward(req, resp);
			return;
		}
		
	}
}
