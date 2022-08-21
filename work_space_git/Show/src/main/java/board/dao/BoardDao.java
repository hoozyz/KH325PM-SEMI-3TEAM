package board.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import board.controller.PageInfo;
import vo.Board;

public class BoardDao {

	// 게시글 전체 조회
	public List<Board> findAll(Connection conn, PageInfo pageInfo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList<Board>();

		String query = "SELECT board_no, cont, name, title, user_id, create_date, modify_date, readcount FROM \r\n"
				+ "(SELECT board_no, cont, name, title, user_id, create_date, modify_date, readcount, ROWNUM NUM FROM \r\n"
				+ "(SELECT board_no, cont, name, title, user_id, create_date, modify_date, readcount FROM TBL_BOARD ORDER BY board_no DESC)) WHERE NUM BETWEEN ? and ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Board board = new Board();
				board.setBoard_no(rs.getInt("board_no"));
				board.setTitle(rs.getString("title"));
				board.setUser_id(rs.getString("user_id"));
				board.setCreate_date(rs.getString("create_date"));
				board.setReadcount(rs.getInt("readcount"));
				board.setCont(rs.getString("cont"));
				board.setModify_date(rs.getString("modify_date"));
				board.setName(rs.getString("name"));
				list.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}

	// 게시글 총 개수
	public int getBoardCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM TBL_BOARD";

		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return result;
	}

	// 게시글 작성
	public int insertBoard(Connection conn, Board board) {
		PreparedStatement pstmt = null;
		String query = "INSERT INTO TBL_BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,?,?,?,?,DEFAULT,DEFAULT,DEFAULT)";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, board.getUser_id());
			pstmt.setString(2, board.getName());
			pstmt.setString(3, board.getTitle());
			pstmt.setString(4, board.getCont());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 게시글 상세 조회
	public Board findBoardByNo(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board board = null;
		String query = "SELECT * FROM TBL_BOARD WHERE board_no = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);

			rs = pstmt.executeQuery();
			if (rs.next()) {
				board = new Board();
				board.setBoard_no(rs.getInt("board_no"));
				board.setTitle(rs.getString("title"));
				board.setName(rs.getString("name"));
				board.setUser_id(rs.getString("user_id"));
				board.setReadcount(rs.getInt("readcount"));
				board.setCont(rs.getString("cont"));
				board.setCreate_date(rs.getString("CREATE_DATE"));
				board.setModify_date(rs.getString("MODIFY_DATE"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return board;
	}

	// 게시글 조회수 증가
	public int updateReadCount(Connection conn, Board board) {
		PreparedStatement pstmt = null;
		String query = "UPDATE TBL_BOARD SET readcount = ? WHERE board_no = ?";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, board.getReadcount() + 1);
			pstmt.setInt(2, board.getBoard_no());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 게시글 삭제
	public int delete(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		String query = "DELETE FROM TBL_BOARD WHERE board_no = ?";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 게시글 수정
	public int updateBoard(Connection conn, Board board) {
		PreparedStatement pstmt = null;
		String query = "UPDATE TBL_BOARD SET title = ?, cont = ?, modify_date = SYSDATE WHERE board_no = ?";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getCont());
			pstmt.setInt(3, board.getBoard_no());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
