package review.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vo.Review;

public class ReviewDao {
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
			
			if (rs.next() == false) {
				return null;
			}

			while (rs.next()) {
				Review rev = new Review();
				rev.setRev_no(rs.getString("rev_no"));
				rev.setShow_id(rs.getString("show_id"));
				rev.setUser_id(rs.getString("user_id"));
				rev.setRev_content(rs.getString("rev_content"));
				rev.setPrfnm(rs.getString("prfnm"));
				rev.setPrfpdfrom(rs.getString("prfpdfrom"));
				rev.setPrfpdto(rs.getString("prfpdto"));
				rev.setRev_star(rs.getString("rev_star"));
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
	
	// 나의 리뷰 목록 조회
	public List<Review> findReviewByShowId(Connection conn, String id) {
		List<Review> revList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM TBL_REVIEW WHERE show_id = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next() == false) {
				return null;
			}

			while (rs.next()) {
				Review rev = new Review();
				rev.setRev_no(rs.getString("rev_no"));
				rev.setShow_id(rs.getString("show_id"));
				rev.setUser_id(rs.getString("user_id"));
				rev.setRev_content(rs.getString("rev_content"));
				rev.setPrfnm(rs.getString("prfnm"));
				rev.setPrfpdfrom(rs.getString("prfpdfrom"));
				rev.setPrfpdto(rs.getString("prfpdto"));
				rev.setRev_star(rs.getString("rev_star"));
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
		String query = "INSERT INTO TBL_REVIEW VALUES(SEQ_REVIEW_NO.nextval,?,?,?,?,?,?,?,?,SYSDATE)";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, rev.getShow_id());
			pstmt.setString(2, rev.getUser_id());
			pstmt.setString(3, rev.getRev_content());
			pstmt.setString(3, rev.getPrfnm());
			pstmt.setString(3, rev.getPrfpdfrom());
			pstmt.setString(3, rev.getPrfpdto());
			pstmt.setString(4, rev.getRev_star());
			pstmt.setInt(5, rev.getRev_like());
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

	// 리뷰 좋아요 1개 추가
	public int changeLikeOfReview(Connection conn, Review rev) {
		PreparedStatement pstmt = null;
		String query = "UPDATE TBL_USER SET rev_like=? WHERE rev_no=?";
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
}
