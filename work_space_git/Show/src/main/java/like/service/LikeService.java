package like.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.List;

import like.dao.LikeDao;
import vo.Like;

public class LikeService {
	LikeDao dao = new LikeDao();
	
	public List<Like> findLikeById(String id) {
		Connection conn = getConnection();
		List<Like> likeList = dao.findLikeById(conn, id);
		
		return likeList;
	}
	
	
	public int save(Like like) {
		Connection conn = getConnection();
		
		int result = dao.save(conn, like);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}
	
	public int deleteById(String showId, String userId) {
		Connection conn = getConnection();
		int result = dao.deleteById(conn, showId, userId);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}


	public int deleteByNo(int likeNo) {
		Connection conn = getConnection();
		int result = dao.deleteByNo(conn, likeNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
	}


	public int likeCheck(String showId, String userId) {
		Connection conn = getConnection();
		int result = -1;
		result = dao.likeCheck(conn, showId, userId);
		
		return result;
	}
}
