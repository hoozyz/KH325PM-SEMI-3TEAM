package show.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import board.controller.PageInfo;
import show.service.ShowService;
import vo.Rank;
import vo.Show;

@WebServlet(name = "musicMain", urlPatterns = "/musicMain")
public class MusicMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ShowService showService = new ShowService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("utf-8");
			resp.setContentType("application/x-json; charset=UTF-8");

			int page = 1;
			int musicCnt = 100;
			PageInfo pageInfo = new PageInfo(page, 5, musicCnt, 5);

			String category = req.getParameter("category");
			String period = "1개월";

			Date date = new Date();

			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
			String endDate = dateFormat.format(date);
			String startDate = "AddDate(endDate, -1, 0)";
			String dateRange = "month";

			List<Rank> list = new ArrayList<>();
			List<Show> showList = new ArrayList<>();
			

			req.setAttribute("pageInfo", pageInfo);
			showList = showService.selectShowByCategory(category, pageInfo);

			req.setAttribute("category", category);
			req.setAttribute("showList", showList);
			if(req.getParameter("pageNo") != null) {
				page =  Integer.parseInt(req.getParameter("pageNo"));
				
				JSONArray arrayObj = new JSONArray();
				
				for(int i = 0; i < showList.size() ; i++) {                  //게시판 글 수의 사이즈 만큼 담는다.
					
					String show_id = showList.get(i).getShow_id();
					String hall_id = showList.get(i).getThea_id();
					String prfnm = showList.get(i).getPrfnm();
					String prfpdfrom = showList.get(i).getPrfpdfrom();
					String prfpdto = showList.get(i).getPrfpdto();
					String genrenm = showList.get(i).getGenrenm();
					String poster = showList.get(i).getPoster();
					
					JSONObject obj = new JSONObject();
					obj.put("show_id", show_id);
					obj.put("hall_id", hall_id);
					obj.put("prfnm", prfnm);
					obj.put("prfpdfrom", prfpdfrom);
					obj.put("prfpdto", prfpdto);
					obj.put("genrenm", genrenm);
					obj.put("poster", poster);
					
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
					
					arrayObj.add(obj);
				}
				
				System.out.println(arrayObj.toJSONString());
				
				PrintWriter out = resp.getWriter();
				out.println(arrayObj.toJSONString());
				out.flush();
				out.close();
				return;
			}
			
			req.getRequestDispatcher("/views/show/musicMain.jsp").forward(req, resp);
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

	private static String parseDate(String date) throws ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
		Calendar cal = Calendar.getInstance();
		String parseDate = "";
		String[] strArr = new String[2];
		if (date.contains("January")) {
			date = date.replace("January", "");
			strArr = date.split(", ");
			parseDate = strArr[1] + ".01." + strArr[0];
			Date date1 = dateFormat.parse(parseDate);
			cal.setTime(date1);
			return dateFormat.format(cal.getTime());
		}
		if (date.contains("February")) {
			date = date.replace("February", "");
			strArr = date.split(", ");
			parseDate = strArr[1] + ".02." + strArr[0];
			Date date1 = dateFormat.parse(parseDate);
			cal.setTime(date1);
			return dateFormat.format(cal.getTime());
		}
		if (date.contains("March")) {
			date = date.replace("March", "");
			strArr = date.split(", ");
			parseDate = strArr[1] + ".03." + strArr[0];
			Date date1 = dateFormat.parse(parseDate);
			cal.setTime(date1);
			return dateFormat.format(cal.getTime());
		}
		if (date.contains("April")) {
			date = date.replace("April", "");
			strArr = date.split(", ");
			parseDate = strArr[1] + ".04." + strArr[0];
			Date date1 = dateFormat.parse(parseDate);
			cal.setTime(date1);
			return dateFormat.format(cal.getTime());
		}
		if (date.contains("May")) {
			date = date.replace("May", "");
			strArr = date.split(", ");
			parseDate = strArr[1] + ".05." + strArr[0];
			Date date1 = dateFormat.parse(parseDate);
			cal.setTime(date1);
			return dateFormat.format(cal.getTime());
		}
		if (date.contains("June")) {
			date = date.replace("June", "");
			strArr = date.split(", ");
			parseDate = strArr[1] + ".06." + strArr[0];
			Date date1 = dateFormat.parse(parseDate);
			cal.setTime(date1);
			return dateFormat.format(cal.getTime());
		}
		if (date.contains("July")) {
			date = date.replace("July", "");
			strArr = date.split(", ");
			parseDate = strArr[1] + ".70." + strArr[0];
			Date date1 = dateFormat.parse(parseDate);
			cal.setTime(date1);
			return dateFormat.format(cal.getTime());
		}
		if (date.contains("August")) {
			date = date.replace("August", "");
			strArr = date.split(", ");
			parseDate = strArr[1] + ".08." + strArr[0];
			Date date1 = dateFormat.parse(parseDate);
			cal.setTime(date1);
			return dateFormat.format(cal.getTime());
		}
		if (date.contains("September")) {
			date = date.replace("September", "");
			strArr = date.split(", ");
			parseDate = strArr[1] + ".09." + strArr[0];
			Date date1 = dateFormat.parse(parseDate);
			cal.setTime(date1);
			return dateFormat.format(cal.getTime());
		}
		if (date.contains("October")) {
			date = date.replace("October", "");
			strArr = date.split(", ");
			parseDate = strArr[1] + ".10." + strArr[0];
			Date date1 = dateFormat.parse(parseDate);
			cal.setTime(date1);
			return dateFormat.format(cal.getTime());
		}
		if (date.contains("November")) {
			date = date.replace("November", "");
			strArr = date.split(", ");
			parseDate = strArr[1] + ".11." + strArr[0];
			Date date1 = dateFormat.parse(parseDate);
			cal.setTime(date1);
			return dateFormat.format(cal.getTime());
		}
		if (date.contains("December")) {
			date = date.replace("December", "");
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