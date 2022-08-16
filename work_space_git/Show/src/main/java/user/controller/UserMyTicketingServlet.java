package user.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ticketing.service.TicketingService;
import vo.Ticketing;
import vo.User;

@WebServlet("/myTicketing")
public class UserMyTicketingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	TicketingService service = new TicketingService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(true);
		User user = (User) session.getAttribute("loginUser");
		String userId = user.getUser_id();

		// 나의 예매목록 가져오기
		List<Ticketing> ticList = service.findTicketById(userId);

		if (ticList != null) {
			String msg = (String) req.getAttribute("msg");
			req.setAttribute("msg", msg);
			req.setAttribute("ticList", ticList);
			req.getRequestDispatcher("/views/user/myTicketing.jsp").forward(req, resp);
			return;
		} else {
			req.setAttribute("msg", "예매 내역이 없습니다.");
			req.getRequestDispatcher("/views/user/myTicketing.jsp").forward(req, resp);
			return;
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
