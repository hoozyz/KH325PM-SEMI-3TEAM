package board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
			System.out.println(page+"--------------");
			
			JSONArray arrayObj = new JSONArray();
			JSONObject obj1 = new JSONObject();
			
			pageInfo = new PageInfo(page, 5, boardCount, 10);
			boardList = service.getBoardList(pageInfo);
			
			for(int i = 0; i < boardList.size() ; i++) {                  //게시판 글 수의 사이즈 만큼 담는다.
				
				String title = boardList.get(i).getTitle();
				String content = boardList.get(i).getCont();
				String user_id = boardList.get(i).getUser_id();
				int board_no = boardList.get(i).getBoard_no();
				String date = boardList.get(i).getModify_date();
				
				JSONObject obj2 = new JSONObject();
				obj2.put("title", title);
				obj2.put("content", content);
				obj2.put("user_id", user_id);
				obj2.put("board_no", board_no);
				obj2.put("date", date);
				
				if(i == boardList.size() - 1) {
					obj2.put("pageInfo", pageInfo);
				}
				arrayObj.add(obj2);
				System.out.println(arrayObj.toJSONString());
			}
			
			PrintWriter out = resp.getWriter();
			obj1.put("data", arrayObj);
			
			out.println(obj1);
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
