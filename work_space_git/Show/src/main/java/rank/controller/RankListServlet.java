package rank.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import rank.service.RankService;
import vo.Rank;

@WebServlet(name = "rankList", urlPatterns = "/rankList")
public class RankListServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private RankService service = new RankService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String category = "";
			String range = "day";
			Date today = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			String todayFormat = sdf.format(today);
			
			String date = AddDate(todayFormat, 0, -1);
			
			if(req.getParameter("category") == null) {
				category = "뮤지컬";
			} 
			
			if(req.getParameter("category") != null && req.getParameter("category") != "뮤지컬") {
				category = req.getParameter("category");
			}
			// day가 아닐때 -> default가 아니고 클릭했을때
			if(req.getParameter("range") != null) {
				range = req.getParameter("range");
			}
			
			List<Rank> rankList = service.findRankByCategory(category, range , date);
			
			if(rankList == null) { // 데이터 없을때 전전날꺼 랭킹
				date = AddDate(date, 0, -1);
				rankList = service.findRankByCategory(category, range , date);
				
				req.setAttribute("range", range);
				req.setAttribute("rankList", rankList);
				req.setAttribute("today", todayFormat);
				req.setAttribute("category", category);
				req.getRequestDispatcher("/views/rank/rankList.jsp").forward(req, resp);
				return;
			}
			
			req.setAttribute("range", range);
			req.setAttribute("rankList", rankList);
			req.setAttribute("today", todayFormat);
			req.setAttribute("category", category);
			req.getRequestDispatcher("/views/rank/rankList.jsp").forward(req, resp);
			
			return;
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("msg", "데이터 오류입니다.");
			req.getRequestDispatcher("/views/rank/rankList.jsp");
		}
	}
	
	private static String AddDate(String strDate, int month, int day) throws Exception {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
	
		Calendar cal = Calendar.getInstance();
        
		Date date = dateFormat.parse(strDate);
        
		cal.setTime(date);
        
		cal.add(Calendar.MONTH, month);
		cal.add(Calendar.DATE,  day);
        
		return dateFormat.format(cal.getTime());
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
