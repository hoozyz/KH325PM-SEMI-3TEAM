package show.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import board.controller.PageInfo;
import rank.service.RankService;
import show.service.ShowService;
import vo.Rank;
import vo.Show;

@WebServlet(name = "showMain", urlPatterns = "/showMain")
public class ShowMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ShowService showService = new ShowService();
	RankService rankService = new RankService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String category = "";
			String period = "1개월";
			
			int page = 1;
			int showCnt = 100;
			PageInfo pageInfo = null;
			pageInfo =  new PageInfo(page, 5, showCnt, 10);
			if(req.getParameter("category") != null) {
				category = req.getParameter("category");
			}

			Date date = new Date();

			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
			String startDate = dateFormat.format(date);
			String endDate = AddDate(startDate, 1, 0); // 1개월 후
			String dateRange = "month";
			
			List<Show> showList = new ArrayList<>();
			List<Rank> rankList = new ArrayList<>();
			
			showList = showService.findByCategory(category, startDate, endDate, pageInfo);
			
			if(req.getParameter("pageNo") != null) {
				page =  Integer.parseInt(req.getParameter("pageNo"));
				
				JSONArray arrayObj = new JSONArray();
				pageInfo =  new PageInfo(page, 5, showCnt, 10);
				showList = showService.findByCategory(category, startDate, endDate, pageInfo);  
				
				System.out.println(showList);
				
				for(int i = 0; i < showList.size() ; i++) {         
					
					String show_id = showList.get(i).getShow_id();
					String prfnm = showList.get(i).getPrfnm();
					String prfpdfrom = showList.get(i).getPrfpdfrom();
					String prfpdto = showList.get(i).getPrfpdto();
					String poster = showList.get(i).getPoster();
					String fcltynm = showList.get(i).getFcltynm();
					
					JSONObject obj = new JSONObject();
					obj.put("show_id", show_id);
					obj.put("prfnm", prfnm);
					obj.put("prfpdfrom", prfpdfrom);
					obj.put("prfpdto", prfpdto);
					obj.put("poster", poster);
					obj.put("fcltynm", fcltynm);
					
					if(i == 0) {
						int maxPage = pageInfo.getMaxPage();
						int startPage = pageInfo.getStartPage();
						int endPage = pageInfo.getEndPage();
						int currentPage = pageInfo.getCurrentPage();
						int prevPage = pageInfo.getPrevPage();
						int nextPage = pageInfo.getNextPage();
						int startList = pageInfo.getStartList();
						int endList = pageInfo.getEndList();
						
						obj.put("maxPage", maxPage);
						obj.put("startPage", startPage);
						obj.put("endPage", endPage);
						obj.put("currentPage", currentPage);
						obj.put("prevPage", prevPage);
						obj.put("nextPage", nextPage);
						obj.put("startList", startList);
						obj.put("endList", endList);
					}
					
					arrayObj.add(obj);
				}
				
				PrintWriter out = resp.getWriter();
				out.println(arrayObj.toJSONString());
				out.flush();
				out.close();
				return;
			}

			rankList = rankService.findRankByCategory(category, dateRange, AddDate(startDate, 0, -1).replace(".", ""));
			
			if (rankList.isEmpty()) { // list null 체크 -> isEmpty()
				rankList = rankService.findRankByCategory(category, dateRange, AddDate(startDate, 0, -2).replace(".", ""));
			}

			for (int i = 0; i < 5; i++) {
				rankList.add(rankList.get(i));
			}

			if (showList.isEmpty()) {
				req.setAttribute("msg", "검색 결과가 없습니다.");
				req.getRequestDispatcher("/views/show/showMain.jsp").forward(req, resp);
				return;
			}

			req.setAttribute("rankList", rankList);
			req.setAttribute("period", period);
			req.setAttribute("category", category);
			req.setAttribute("showList", showList);
			req.setAttribute("pageInfo", pageInfo);
			req.getRequestDispatcher("/views/show/showMain.jsp").forward(req, resp);
			return;
			
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("msg", "검색에 실패하였습니다.");
			req.getRequestDispatcher("/");
		}
	}

	private static String AddDate(String strDate, int month, int day) throws Exception {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");

		Calendar cal = Calendar.getInstance();

		Date date = dateFormat.parse(strDate);

		cal.setTime(date);

		cal.add(Calendar.MONTH, month);
		cal.add(Calendar.DATE, day);

		return dateFormat.format(cal.getTime());
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
