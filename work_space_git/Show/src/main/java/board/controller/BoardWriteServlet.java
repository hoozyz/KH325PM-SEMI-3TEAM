package board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.service.BoardService;
import vo.Board;
import vo.User;

@WebServlet("/board/write")
public class BoardWriteServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	BoardService service = new BoardService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/board/boardList").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		HttpSession session = req.getSession(true);
		User loginUser = (User) session.getAttribute("loginUser");
		String userId = loginUser.getUser_id();
		
		Board board = new Board(0, userId, name, title, content, 0, "", "");
		
		int page = 1;
		int boardCount = 0;
		PageInfo pageInfo = null;
		List<Board> boardList = new ArrayList<>();
		boardList = null;
		
		int result = service.save(board);
		
		boardCount = service.getBoardCount();
		
		pageInfo = new PageInfo(page, 5, boardCount, 10);
		
		boardList = service.getBoardList(pageInfo);
		
		
		if(result > 0 && boardList != null) {
			req.setAttribute("msg", "게시글 작성이 성공하였습니다.");
			req.setAttribute("boardList", boardList);
			req.setAttribute("pageInfo", pageInfo);
			req.getRequestDispatcher("/views/board/boardList.jsp").forward(req, resp);
			return;
		} else {
			req.setAttribute("msg", "작성에 실패하였습니다.");
			req.getRequestDispatcher("/views/board/boardList").forward(req, resp);
		}
	}
}
