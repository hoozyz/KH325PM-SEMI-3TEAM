package review.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import review.dao.ReviewDao;
import vo.Review;

public class ReviewService {
	ReviewDao dao = new ReviewDao();
	
	public List<Review> findReviewById(String id) {
		Connection conn = getConnection();
		List<Review> revList = dao.findReviewById(conn, id);
		
		return revList;
	}
	
	
	public int save(Review rev) {
		Connection conn = getConnection();
		
		int result = dao.save(conn, rev);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int delete(int revNo) {
		Connection conn = getConnection();
		int result = dao.deleteReview(conn, revNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int changeReview(Review rev) {
		Connection conn = getConnection();
		int result = dao.changeLikeOfReview(conn, rev);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
