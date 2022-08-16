package show.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import show.service.ShowService;
import vo.Show;

@WebServlet(name = "showSearch", urlPatterns = "/showSearch")
public class ShowSearchServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	ShowService showService = new ShowService();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String keyword = req.getParameter("keyword");
			String category = req.getParameter("category");
			String rad_date = "";
			List<Show> showList = new ArrayList<Show>();
			
			if(req.getParameter("rad_date") == null) {
				rad_date = "1개월";
			} else {
				rad_date = req.getParameter("rad_date");
			}
			
			Date date = new Date();
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
			String endDate =  dateFormat.format(date);
			String startDate = "";
			if(rad_date != null) {
				if (rad_date.equals("오늘")) {
					startDate = AddDate(startDate, 0, -1);
					startDate = endDate;
				}
				if (rad_date.equals("1주")) {
					startDate = AddDate(endDate, 0, -7);
					
				}
				if (rad_date.equals("1개월")) {
					startDate = AddDate(endDate, -1, 0);
					endDate = AddDate(startDate, +1, -1);
				}
			}
			
			if (category == null) {
				req.setAttribute("msg", "카테고리를 선택해주세요.");
				req.getRequestDispatcher("/views/show/showMain.jsp").forward(req, resp);
				return;
			}
			
			if(req.getParameter("startDate") != null) {
				startDate = req.getParameter("startDate");
				endDate = req.getParameter("endDate");
				// 2022-08-01+to+2022-08-10 -> startDate
				startDate = startDate.replace("-", ".").trim(); // 20220801
				endDate = endDate.replace("-", ".").trim();
			}
			
			if(rad_date != null && (category.equals("뮤지컬") ||
				category.equals("연극") || category.equals("무용") || category.equals("복합"))) {

				keyword = req.getParameter("keyword");
				category = req.getParameter("category");
				showList = showService.findByKeyword(keyword, category, startDate, endDate);
				
				req.setAttribute("startDate", startDate);
				req.setAttribute("endDate", endDate);
				req.setAttribute("rad_date", rad_date);
				req.setAttribute("keyword", keyword);
				req.setAttribute("category", category);
				req.setAttribute("showList", showList);
				req.getRequestDispatcher("/views/show/showSearch.jsp").forward(req, resp);
				return;
			} else if(rad_date != null && (category.equals("클래식") ||
					category.equals("국악") || category.equals("오페라"))){
				keyword = req.getParameter("keyword");
				category = req.getParameter("category");
				showList = showService.findByKeyword(keyword, category, startDate, endDate);
				req.setAttribute("startDate", startDate);
				req.setAttribute("endDate", endDate);
				req.setAttribute("rad_date", rad_date);
				req.setAttribute("keyword", keyword);
				req.setAttribute("category", category);
				req.setAttribute("showList", showList);
				req.getRequestDispatcher("/views/show/musicSearch.jsp").forward(req, resp);
				return;
			}
			
			
			if(category.equals("공연")) {
				showList = showService.findByHome(keyword, category);
				req.setAttribute("showList", showList);
				req.setAttribute("keyword", keyword);
				req.setAttribute("category", category);
				req.getRequestDispatcher("/views/show/showSearch.jsp").forward(req, resp);
				return;
			} else if(category.equals("음악")) {
				showList = showService.findByHome(keyword, category);
				req.setAttribute("showList", showList);
				req.setAttribute("keyword", keyword);
				req.setAttribute("category", category);
				req.getRequestDispatcher("/views/show/musicSearch.jsp").forward(req, resp);
				return;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("msg", "오류입니다.");
			req.getRequestDispatcher("/views/show/showMain.jsp");
		}
	}
	
	private static String AddDate(String strDate, int month, int day) throws Exception {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
	
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
