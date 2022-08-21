package review.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import board.controller.PageInfo;
import vo.Review;

public class ReviewDao {
	
	// 공연당 리뷰 평점 평균
	public String getStar(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT TRUNC(AVG(rev_star),1) FROM TBL_REVIEW WHERE show_id = ?";
		String result = "";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return result;
	}
	
	// 나의 리뷰 목록 조회
	public List<Review> findReviewByUserId(Connection conn, String id) {
		List<Review> revList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM TBL_REVIEW WHERE user_id = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Review rev = new Review();
				rev.setRev_no(rs.getString("rev_no"));
				rev.setShow_id(rs.getString("show_id"));
				rev.setUser_id(rs.getString("user_id"));
				rev.setRev_content(rs.getString("rev_content"));
				rev.setPrfnm(rs.getString("prfnm"));
				rev.setPrfpdfrom(rs.getString("prfpdfrom"));
				rev.setPrfpdto(rs.getString("prfpdto"));
				rev.setRev_star(rs.getInt("rev_star"));
				rev.setRev_like(rs.getInt("rev_like"));
				rev.setRev_date(rs.getString("rev_date"));

				revList.add(rev);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return revList;
	}
	
	// 공연 리뷰 정렬별 조회(페이징)
	public List<Review> findAllByShowId(Connection conn, String id, PageInfo pageInfo, String sort) {
		List<Review> revList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "";
		if(sort.equals("new")) {
			query = "SELECT rev_no, user_id, rev_star, rev_date, rev_like, show_id, rev_content FROM\r\n"
					+ "(SELECT rev_no, user_id, rev_star, rev_date, rev_like, show_id, rev_content, ROWNUM NUM FROM\r\n"
					+ "(SELECT rev_no, user_id, rev_star, rev_date, rev_like, show_id, rev_content FROM\r\n"
					+ "(SELECT rev_no, user_id, rev_star, rev_date, rev_like, show_id, rev_content FROM TBL_REVIEW ORDER BY REV_DATE DESC)) \r\n"
					+ "WHERE show_id=?) WHERE NUM BETWEEN ? and ?";
		}
		if(sort.equals("old")) {
			query = "SELECT rev_no, user_id, rev_star, rev_date, rev_like, show_id, rev_content FROM\r\n"
					+ "(SELECT rev_no, user_id, rev_star, rev_date, rev_like, show_id, rev_content, ROWNUM NUM FROM\r\n"
					+ "(SELECT rev_no, user_id, rev_star, rev_date, rev_like, show_id, rev_content FROM\r\n"
					+ "(SELECT rev_no, user_id, rev_star, rev_date, rev_like, show_id, rev_content FROM TBL_REVIEW ORDER BY REV_DATE ASC)) \r\n"
					+ "WHERE show_id=?) WHERE NUM BETWEEN ? and ?";
		}
		if(sort.equals("like")) {
			query = "SELECT rev_no, user_id, rev_star, rev_date, rev_like, show_id, rev_content FROM\r\n"
					+ "(SELECT rev_no, user_id, rev_star, rev_date, rev_like, show_id, rev_content, ROWNUM NUM FROM\r\n"
					+ "(SELECT rev_no, user_id, rev_star, rev_date, rev_like, show_id, rev_content FROM\r\n"
					+ "(SELECT rev_no, user_id, rev_star, rev_date, rev_like, show_id, rev_content FROM TBL_REVIEW ORDER BY REV_LIKE DESC)) \r\n"
					+ "WHERE show_id=?) WHERE NUM BETWEEN ? and ?";
		}
		if(sort.equals("star")) {
			query = "SELECT rev_no, user_id, rev_star, rev_date, rev_like, show_id, rev_content FROM\r\n"
					+ "(SELECT rev_no, user_id, rev_star, rev_date, rev_like, show_id, rev_content, ROWNUM NUM FROM\r\n"
					+ "(SELECT rev_no, user_id, rev_star, rev_date, rev_like, show_id, rev_content FROM\r\n"
					+ "(SELECT rev_no, user_id, rev_star, rev_date, rev_like, show_id, rev_content FROM TBL_REVIEW ORDER BY REV_STAR DESC)) \r\n"
					+ "WHERE show_id=?) WHERE NUM BETWEEN ? and ?";
		}
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setInt(2, pageInfo.getStartList());
			pstmt.setInt(3, pageInfo.getEndList());
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Review rev = new Review();
				rev.setRev_no(rs.getString("rev_no"));
				rev.setShow_id(rs.getString("show_id"));
				rev.setUser_id(rs.getString("user_id"));
				rev.setRev_content(rs.getString("rev_content"));
				rev.setRev_star(rs.getInt("rev_star"));
				rev.setRev_like(rs.getInt("rev_like"));
				rev.setRev_date(rs.getString("rev_date"));
				revList.add(rev);
			}
			return revList;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return null;
	}

	// 리뷰 작성
	public int save(Connection conn, Review rev) {
		PreparedStatement pstmt = null;
		String query = "INSERT INTO TBL_REVIEW VALUES(SEQ_REV_NO.nextval,?,?,?,?,?,?,?,?,SYSDATE)";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, rev.getShow_id());
			pstmt.setString(2, rev.getUser_id());
			pstmt.setString(3, rev.getRev_content());
			pstmt.setString(4, rev.getPrfnm());
			pstmt.setString(5, rev.getPrfpdfrom());
			pstmt.setString(6, rev.getPrfpdto());
			pstmt.setInt(7, rev.getRev_star());
			pstmt.setInt(8, rev.getRev_like());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 리뷰 삭제
	public int deleteReview(Connection conn, int revNo) {
		PreparedStatement pstmt = null;
		String query = "DELETE FROM TBL_REVIEW WHERE rev_no=?";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, revNo);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 리뷰 총 개수
	public int getRevCount(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM TBL_REVIEW WHERE show_id = ?";

		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
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

	// 공연 리뷰 전체 조회
	public List<Review> findReviewByShowId(Connection conn, String id) {
		List<Review> revList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM TBL_REVIEW WHERE show_id = ? ORDER BY rev_date DESC";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Review rev = new Review();
				rev.setRev_no(rs.getString("rev_no"));
				rev.setShow_id(rs.getString("show_id"));
				rev.setUser_id(rs.getString("user_id"));
				rev.setRev_content(rs.getString("rev_content"));
				rev.setPrfnm(rs.getString("prfnm"));
				rev.setPrfpdfrom(rs.getString("prfpdfrom"));
				rev.setPrfpdto(rs.getString("prfpdto"));
				rev.setRev_star(rs.getInt("rev_star"));
				rev.setRev_like(rs.getInt("rev_like"));
				rev.setRev_date(rs.getString("rev_date"));
				revList.add(rev);
			}
			return revList;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return null;
	}
	
	// 별점 1인 리뷰 개수
	public int getCount1(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM tbl_review where show_id = ? and rev_star = ?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setInt(2, 1);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
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
	
	public int getCount2(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM tbl_review where show_id = ? and rev_star = ?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setInt(2, 2);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
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
	
	public int getCount3(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM tbl_review where show_id = ? and rev_star = ?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setInt(2, 3);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
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
	
	public int getCount4(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM tbl_review where show_id = ? and rev_star = ?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setInt(2, 4);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
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
	
	public int getCount5(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM tbl_review where show_id = ? and rev_star = ?";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setInt(2, 5);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
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

	// 리뷰 좋아요 추가
	public int plusLike(Connection conn, Review rev) {
		PreparedStatement pstmt = null;
		String query = "UPDATE TBL_REVIEW SET rev_like=? WHERE rev_no=?";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rev.getRev_like() + 1);
			pstmt.setString(2, rev.getRev_no());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 리뷰 좋아요 취소
	public int minusLike(Connection conn, Review rev) {
		PreparedStatement pstmt = null;
		String query = "UPDATE TBL_REVIEW SET rev_like=? WHERE rev_no=?";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rev.getRev_like() - 1);
			pstmt.setString(2, rev.getRev_no());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 리뷰번호로 리뷰 조회
	public Review findReviewByNo(Connection conn, int revNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM TBL_REVIEW WHERE rev_no = ?";
		Review rev = new Review();
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, revNo);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				rev.setRev_no(rs.getString("rev_no"));
				rev.setShow_id(rs.getString("show_id"));
				rev.setUser_id(rs.getString("user_id"));
				rev.setRev_content(rs.getString("rev_content"));
				rev.setPrfnm(rs.getString("prfnm"));
				rev.setPrfpdfrom(rs.getString("prfpdfrom"));
				rev.setPrfpdto(rs.getString("prfpdto"));
				rev.setRev_star(rs.getInt("rev_star"));
				rev.setRev_like(rs.getInt("rev_like"));
				rev.setRev_date(rs.getString("rev_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return rev;
	}
}
