package board.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import board.controller.PageInfo;
import board.dao.BoardDao;
import vo.Board;

public class BoardService {
	BoardDao dao = new BoardDao();
	
	public int getBoardCount() {
		Connection conn = getConnection();
		int result = dao.getBoardCount(conn);
		close(conn);
		return result;
	}
	
	public List<Board> getBoardList(PageInfo pageinfo){
		Connection conn = getConnection();
		List<Board> list = dao.findAll(conn, pageinfo);
		close(conn);
		return list;
	}
	
	public int save(Board board) {
		int result = 0;
		Connection conn = getConnection();
		
		if(board.getBoard_no() != 0) {
			result = dao.updateBoard(conn, board);
		}else {
			result = dao.insertBoard(conn, board);
		}
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public Board findBoardByNo(int no, boolean hasRead) {
		Connection conn = getConnection();
		Board board = dao.findBoardByNo(conn, no);

		// 조회수 증가 로직
		if(hasRead == true && board != null) {
			int result = dao.updateReadCount(conn, board);
			if(result > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
		}
		
		close(conn);
		return board;
	}
	
	
	public int delete(int no) {
		Connection conn = getConnection();
		int result = dao.delete(conn, no);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
