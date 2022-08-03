package show.controller;

import java.io.IOException;
import java.text.ParseException;
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

import rank.service.RankService;
import show.service.ShowService;
import vo.Rank;
import vo.Show;

@WebServlet(name = "showSearch", urlPatterns = "/showSearch")
public class ShowSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ShowService showService = new ShowService();
	RankService rankService = new RankService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String keyword = req.getParameter("keyword");
			String category = req.getParameter("category");
			String period = req.getParameter("rad_date");
			
			Date date = new Date();
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
			String endDate = dateFormat.format(date);
			String startDate = "";
			String dateRange = "";
			if(period != null) {
				if (period.equals("오늘")) {
					startDate = endDate;
					dateRange = "day";
				}
				if (period.equals("1주")) {
					startDate = AddDate(endDate, 0, -6);
					dateRange = "week";
				}
				if (period.equals("1개월")) {
					startDate = AddDate(endDate, -1, 0);
					dateRange = "month";
				}
			}
			
			if(req.getParameter("startDate") != null && req.getParameter("endDate") != null) {
				startDate = (String) req.getParameter("startDate");
				endDate = (String) req.getParameter("endDate");
				
				startDate = parseDate(startDate);
				endDate = parseDate(endDate);
			}

			if (category == null) {
				req.setAttribute("msg", "카테고리를 선택해주세요.");
				req.getRequestDispatcher("/showMain.jsp").forward(req, resp);
				return;
			}
			
			
			List<Rank> list = new ArrayList<>();
			List<Show> showList = new ArrayList<>();
			List<Rank> rankList = new ArrayList<>();

			if (keyword != null) {
				showList = showService.findByKeyword(keyword, category, startDate, endDate);
				rankList = rankService.findRankByCategory(category, dateRange, AddDate(endDate, 0, -1).replace(".", ""));

				if (showList == null) {
					req.setAttribute("msg", "검색 결과가 없습니다.");
					req.getRequestDispatcher("/views/show/showMain.jsp").forward(req, resp);
					return;
				}

				req.setAttribute("rankList", rankList);
				req.setAttribute("showList", showList);
				req.setAttribute("startDate", startDate);
				req.setAttribute("endDate", endDate);
				req.setAttribute("keyword", keyword);
				req.setAttribute("category", category);
				req.getRequestDispatcher("/views/show/showMain.jsp").forward(req, resp);
				return;
			} else {
				showList = showService.findByCategory(category, startDate, endDate);
				list = rankService.findRankByCategory(category, dateRange, AddDate(endDate, 0, -1).replace(".", ""));
				
				for(int i = 0; i < 5; i++) {
					rankList.add(list.get(i));
				}
				
				if (showList == null) {
					req.setAttribute("msg", "검색 결과가 없습니다.");
					req.getRequestDispatcher("/views/show/showMain.jsp").forward(req, resp);
					return;
				}
				
				req.setAttribute("rankList", rankList);
				req.setAttribute("period", period);
				req.setAttribute("category", category);
				req.setAttribute("showList", showList);
				req.getRequestDispatcher("/views/show/showMain.jsp").forward(req, resp);
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("msg", "검색에 실패하였습니다.");
			req.getRequestDispatcher("/showHome.jsp");
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
	
	private static String parseDate(String date) throws ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
		Calendar cal = Calendar.getInstance();
		String parseDate = "";
		String[] strArr = new String[2];
		if (date.contains("January")) {
			date = date.replace("January ", "");
			strArr = date.split(", ");
			parseDate = strArr[1] + ".01." + strArr[0];
			Date date1 = dateFormat.parse(parseDate);
			cal.setTime(date1);
			return dateFormat.format(cal.getTime());
		}
		if (date.contains("Fubruary")) {
			date = date.replace("Fubruary ", "");
			strArr = date.split(", ");
			parseDate = strArr[1] + ".02." + strArr[0];
			Date date1 = dateFormat.parse(parseDate);
			cal.setTime(date1);
			return dateFormat.format(cal.getTime());
		}
		if (date.contains("March")) {
			date = date.replace("March ", "");
			strArr = date.split(", ");
			parseDate = strArr[1] + ".03." + strArr[0];
			Date date1 = dateFormat.parse(parseDate);
			cal.setTime(date1);
			return dateFormat.format(cal.getTime());
		}
		if (date.contains("April")) {
			date = date.replace("April ", "");
			strArr = date.split(", ");
			parseDate = strArr[1] + ".04." + strArr[0];
			Date date1 = dateFormat.parse(parseDate);
			cal.setTime(date1);
			return dateFormat.format(cal.getTime());
		}
		if (date.contains("May")) {
			date = date.replace("May ", "");
			strArr = date.split(", ");
			parseDate = strArr[1] + ".05." + strArr[0];
			Date date1 = dateFormat.parse(parseDate);
			cal.setTime(date1);
			return dateFormat.format(cal.getTime());
		}
		if (date.contains("June")) {
			date = date.replace("June ", "");
			strArr = date.split(", ");
			parseDate = strArr[1] + ".06." + strArr[0];
			Date date1 = dateFormat.parse(parseDate);
			cal.setTime(date1);
			return dateFormat.format(cal.getTime());
		}
		if (date.contains("July")) {
			date = date.replace("July ", "");
			strArr = date.split(", ");
			parseDate = strArr[1] + ".07." + strArr[0];
			Date date1 = dateFormat.parse(parseDate);
			cal.setTime(date1);
			return dateFormat.format(cal.getTime());
		}
		if (date.contains("August")) {
			date = date.replace("August ", "");
			strArr = date.split(", ");
			parseDate = strArr[1] + ".08." + strArr[0];
			Date date1 = dateFormat.parse(parseDate);
			cal.setTime(date1);
			return dateFormat.format(cal.getTime());
		}
		if (date.contains("September")) {
			date = date.replace("September ", "");
			strArr = date.split(", ");
			parseDate = strArr[1] + ".09." + strArr[0];
			Date date1 = dateFormat.parse(parseDate);
			cal.setTime(date1);
			return dateFormat.format(cal.getTime());
		}
		if (date.contains("October")) {
			date = date.replace("October ", "");
			strArr = date.split(", ");
			parseDate = strArr[1] + ".10." + strArr[0];
			Date date1 = dateFormat.parse(parseDate);
			cal.setTime(date1);
			return dateFormat.format(cal.getTime());
		}
		if (date.contains("November")) {
			date = date.replace("November ", "");
			strArr = date.split(", ");
			parseDate = strArr[1] + ".11." + strArr[0];
			Date date1 = dateFormat.parse(parseDate);
			cal.setTime(date1);
			return dateFormat.format(cal.getTime());
		}
		if (date.contains("December")) {
			date = date.replace("December ", "");
			strArr = date.split(", ");
			parseDate = strArr[1] + ".12." + strArr[0];
			Date date1 = dateFormat.parse(parseDate);
			cal.setTime(date1);
			return dateFormat.format(cal.getTime());
		}
		return parseDate;
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
}