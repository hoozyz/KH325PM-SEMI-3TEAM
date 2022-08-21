package show.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
			PageInfo pageInfo = null;
			String category = "";
			pageInfo =  new PageInfo(page, 5, musicCnt, 5);
			if(req.getParameter("category") != null) {
				category = req.getParameter("category");
			}

			List<Show> showList = new ArrayList<>();
			List<Show> openList = new ArrayList<>();
			
			showList = null;
			
			showList = showService.selectShowByCategory(category, pageInfo);
			openList = showService.comingSoon(category);
			
			req.setAttribute("pageInfo", pageInfo);
			req.setAttribute("category", category);
			req.setAttribute("showList", showList);
			req.setAttribute("openList", openList);
			
			if(req.getParameter("pageNo") != null) {
				
				page =  Integer.parseInt(req.getParameter("pageNo"));
				
				JSONArray arrayObj = new JSONArray();
				pageInfo =  new PageInfo(page, 5, musicCnt, 5);
				showList = showService.selectShowByCategory(category, pageInfo);
				
				for(int i = 0; i < showList.size() ; i++) {
					
					String show_id = showList.get(i).getShow_id();
					String hall_id = showList.get(i).getThea_id();
					String prfnm = showList.get(i).getPrfnm();
					String prfpdfrom = showList.get(i).getPrfpdfrom();
					String prfpdto = showList.get(i).getPrfpdto();
					String genrenm = showList.get(i).getGenrenm();
					String poster = showList.get(i).getPoster();
					String fcltynm = showList.get(i).getFcltynm();
					
					JSONObject obj = new JSONObject();
					obj.put("show_id", show_id);
					obj.put("hall_id", hall_id);
					obj.put("prfnm", prfnm);
					obj.put("prfpdfrom", prfpdfrom);
					obj.put("prfpdto", prfpdto);
					obj.put("genrenm", genrenm);
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
			
			req.getRequestDispatcher("/views/show/musicMain.jsp").forward(req, resp);
			return;
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("msg", "검색에 실패하였습니다.");
			req.getRequestDispatcher("/");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}