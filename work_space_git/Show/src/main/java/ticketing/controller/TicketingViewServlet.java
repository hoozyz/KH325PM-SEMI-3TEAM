package ticketing.controller;

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

import show.service.ShowService;
import ticketing.service.TicketingService;
import vo.Show;
import vo.Ticketing;
import vo.User;

@WebServlet("/ticketing/view")
public class TicketingViewServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	TicketingService ticService = new TicketingService();
	ShowService showServcie = new ShowService();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("application/x-json; charset=UTF-8");
		HttpSession session = req.getSession();
		
		String show_id = req.getParameter("showId");
		String user_id = "";
		if(session.getAttribute("loginUser") != null) {
			User user = (User) session.getAttribute("loginUser");
			
			user_id = user.getUser_id();
		}
		
		Show show = showServcie.findShowById(show_id);
		
		String date = req.getParameter("date");
		String people = req.getParameter("people");
		people = people.replace("명", "");
		int count = Integer.parseInt(people);
		
		String seat = req.getParameter("seat");
		String total = req.getParameter("total");
		total = total.replace("원", "");
		int price = Integer.parseInt(total);
		
		String prfnm = show.getPrfnm();
		String fcltynm = show.getFcltynm();
		
		Ticketing ticket = new Ticketing(0, show_id, user_id, prfnm, date, "", fcltynm, count, price);
		int result = ticService.save(ticket);
		
		if(result > 0) {
			JSONObject obj = new JSONObject();
			JSONArray objArr = new JSONArray();
			
			obj.put("date", date);
			obj.put("count", count);
			obj.put("seat", seat);
			obj.put("price",price);
			obj.put("show_id", show_id);
			obj.put("user_id", user_id);
			obj.put("prfnm", prfnm);
			obj.put("fcltynm", fcltynm);
			
			objArr.add(obj);
			
			PrintWriter out = resp.getWriter();
			out.println(objArr.toJSONString());
			out.flush();
			out.close();
		} else {
			req.setAttribute("msg", "예매에 실패하였습니다.");
			req.getRequestDispatcher("/views/show/showMain/jsp").forward(req, resp);
			return;
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/show/showDetail.jsp").forward(req, resp);
	}
}
