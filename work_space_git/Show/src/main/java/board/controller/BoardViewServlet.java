package board.controller;

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

import board.service.BoardService;
import vo.Board;
import vo.User;

// 자유게시판 클릭시 게시글 정보

@WebServlet(name= "board/view", urlPatterns = "/board/view")
public class BoardViewServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	BoardService service = new BoardService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("application/x-json; charset=UTF-8");
		
		int boardNo = Integer.parseInt(req.getParameter("boardNo"));
		HttpSession session = req.getSession();
		
		String userId = "";
		if(session.getAttribute("loginUser") != null) {
			User user = (User) session.getAttribute("loginUser");
			
			userId = user.getUser_id();
		}
		
		Board board = new Board();
		board = service.findBoardByNo(boardNo, true);
		System.out.println(board);
		JSONObject obj = new JSONObject();
		JSONArray objArr = new JSONArray();
		obj.put("board_no", board.getBoard_no());
		obj.put("user_id", board.getUser_id());
		obj.put("name", board.getName());
		obj.put("title", board.getTitle());
		obj.put("content", board.getCont());
		obj.put("readcount", board.getReadcount());
		obj.put("create_date", board.getCreate_date());
		obj.put("modify_date", board.getModify_date());
		obj.put("userId", userId);
		
		objArr.add(obj);
		
		PrintWriter out = resp.getWriter();
		out.println(objArr.toJSONString());
		out.flush();
		out.close();
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
