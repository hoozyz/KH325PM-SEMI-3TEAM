package like.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vo.Like;

public class LikeDao {
	
	// 찜 목록 조회
	public List<Like> findLikeById(Connection conn, String id) {
		List<Like> likeList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM TBL_LIKE WHERE user_id = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id); 
			rs = pstmt.executeQuery(); 
			
			if (rs.next() == false) {
				return null;
			}
			
			while(rs.next()) {
				Like like = new Like();
				like.setLike_no(rs.getInt("like_no"));
				like.setUser_id(id);
				like.setShow_id(rs.getString("show_id"));
				like.setPrfnm(rs.getString("prfnm"));
				like.setPoster(rs.getString("poster"));
				like.setFcltynm(rs.getString("fcltynm"));
				like.setLike_date(rs.getString("like_date"));
				
				likeList.add(like);
			} 
			return likeList;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return null;
	}
	
	// 찜하기
	public int save(Connection conn, Like like) {
		PreparedStatement pstmt = null;
		String query = "INSERT INTO TBL_LIKE VALUES(SEQ_LIKE_NO.nextval, ?, ?, ?, ?, ?, SYSDATE)";
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, like.getUser_id()); 
			pstmt.setString(2, like.getShow_id()); 
			pstmt.setString(3, like.getPrfnm()); 
			pstmt.setString(4, like.getPoster()); 
			pstmt.setString(5, like.getFcltynm()); 
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 찜삭제
	public int deleteLike(Connection conn, int likeNo) {
		PreparedStatement pstmt = null;
		String query = "DELETE FROM TBL_LIKE WHERE like_no=?";
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, likeNo); 
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
