package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.service.BoardService;
import vo.Board;

@WebServlet("/board/delete")
public class BoardDeleteServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	BoardService service = new BoardService();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int boardNo = Integer.parseInt(req.getParameter("boardNo"));
		
		int result = service.delete(boardNo);
		
		if(result > 0) {
			req.setAttribute("msg", "삭제를 완료하였습니다.");
			req.getRequestDispatcher("/board/list").forward(req, resp);
			return;
		} else {
			req.setAttribute("msg", "삭제를 실패하였습니다");
			req.getRequestDispatcher("/board/list").forward(req, resp);
			return;
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("msg", "잘못된 접근입니다.");
		req.getRequestDispatcher("/board/list").forward(req, resp);
	}
}
