package review.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import board.controller.PageInfo;
import review.dao.ReviewDao;
import vo.Review;

public class ReviewService {
	ReviewDao dao = new ReviewDao();
	
	public List<Review> findReviewByUserId(String id) {
		Connection conn = getConnection();
		List<Review> revList = dao.findReviewByUserId(conn, id);
		
		return revList;
	}
	
	public List<Review> findAllByShowId(String id, PageInfo pageInfo, String sort) {
		Connection conn = getConnection();
		List<Review> revList = dao.findAllByShowId(conn, id, pageInfo, sort);
		
		return revList;
	}
	
	public String getStar(String id) {
		Connection conn = getConnection();
		String result = dao.getStar(conn, id);
		
		return result;
	}
	
	
	public int save(Review rev) {
		Connection conn = getConnection();
		
		int result = dao.save(conn, rev);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
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
		return result;
	}

	public int getRevCount(String id) {
		Connection conn = getConnection();
		int result = dao.getRevCount(conn, id);
		return result;
	}

	public List<Review> findReviewByShowId(String showId) {
		Connection conn = getConnection();
		List<Review> revList = dao.findReviewByShowId(conn, showId);
		
		return revList;
	}
}
