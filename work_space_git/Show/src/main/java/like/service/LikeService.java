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
		close(conn);
		return result;
	}
	
	public int delete(int likeNo) {
		Connection conn = getConnection();
		int result = dao.deleteLike(conn, likeNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
