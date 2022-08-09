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
	
	public Review findReviewByNo(int revNo) {
		Connection conn = getConnection();
		Review rev = dao.findReviewByNo(conn, revNo);
		
		return rev;
	}
	
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
	
	public int plusLike(Review rev) {
		Connection conn = getConnection();
		int result = 0;
		result = dao.plusLike(conn, rev);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}
	
	public int minusLike(Review rev) {
		Connection conn = getConnection();
		int result = 0;
		result = dao.minusLike(conn, rev);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public int getCount1(String id) {
		Connection conn = getConnection();
		int result = dao.getCount1(conn, id);
		
		return result;
	}
	
	public int getCount2(String id) {
		Connection conn = getConnection();
		int result = dao.getCount2(conn, id);
		
		return result;
	}
	
	public int getCount3(String id) {
		Connection conn = getConnection();
		int result = dao.getCount3(conn, id);
		
		return result;
	}
	
	public int getCount4(String id) {
		Connection conn = getConnection();
		int result = dao.getCount4(conn, id);
		
		return result;
	}
	
	public int getCount5(String id) {
		Connection conn = getConnection();
		int result = dao.getCount5(conn, id);
		
		return result;
	}
}
