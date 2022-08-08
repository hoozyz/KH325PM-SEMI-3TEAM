package board.controller;

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

import board.service.BoardService;
import vo.Board;

// 자유게시판 리스트
@WebServlet(name = "list", urlPatterns = "/board/list")
public class BoardListServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	BoardService service = new BoardService();	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("application/x-json; charset=UTF-8");
		
		int page = 1;
		int boardCount = 0;
		PageInfo pageInfo = null;
		List<Board> boardList = new ArrayList<>();
		boardList = null;
		
		boardCount = service.getBoardCount();
		
		pageInfo = new PageInfo(page, 5, boardCount, 10);
		
		boardList = service.getBoardList(pageInfo);
		
		req.setAttribute("boardList", boardList);
		req.setAttribute("pageInfo", pageInfo);
		
		if(req.getParameter("pageNo") != null) {
			page =  Integer.parseInt(req.getParameter("pageNo"));
			
			JSONArray arrayObj = new JSONArray();
			
			pageInfo = new PageInfo(page, 5, boardCount, 10);
			boardList = service.getBoardList(pageInfo);
			
			for(int i = 0; i < boardList.size() ; i++) {                  //게시판 글 수의 사이즈 만큼 담는다.
				
				String title = boardList.get(i).getTitle();
				int readcount = boardList.get(i).getReadcount();
				String name = boardList.get(i).getName();
				int board_no = boardList.get(i).getBoard_no();
				String date = boardList.get(i).getModify_date();
				
				JSONObject obj = new JSONObject();
				obj.put("title", title);
				obj.put("readcount", readcount);
				obj.put("name", name);
				obj.put("board_no", board_no);
				obj.put("date", date);
				
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
		
		req.getRequestDispatcher("/views/board/boardList.jsp").forward(req, resp);
		return;
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
