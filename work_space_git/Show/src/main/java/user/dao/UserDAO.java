package user.dao;


import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vo.User;

public class UserDAO {

	// 유저 조회
	public User findUserById(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM TBL_USER WHERE user_id=?";

		try {
			pstmt = conn.prepareStatement(query); // 기본 쿼리 셋팅
			pstmt.setString(1, id); // ? 구간을 특정 문자열로 채워주는 코드
			rs = pstmt.executeQuery(); // 실제 DB에 쿼리를 요청하여 결과값을 받아오는 코드
			
			if(rs.next()) {
				User user = new User();
				user.setUser_id(rs.getString("user_id"));
				user.setPw(rs.getString("pw"));
				user.setName(rs.getString("name"));
				user.setPhone(rs.getString("phone"));
				user.setEmail(rs.getString("email"));
				user.setAddr(rs.getString("addr"));
				user.setRole(rs.getString("role"));
				return user;
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return null;
	}
	
	// 회원가입
	public int insertUser(Connection conn, User user) {
		PreparedStatement pstmt = null;
		String query = "INSERT INTO TBL_USER VALUES(?,?,?,?,?,?,DEFAULT)";
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user.getUser_id()); 
			pstmt.setString(2, user.getPw()); 
			pstmt.setString(3, user.getName()); 
			pstmt.setString(4, user.getPhone()); 
			pstmt.setString(5, user.getEmail()); 
			pstmt.setString(6, user.getAddr()); 
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 사용자 정보 수정
	public int updateUser(Connection conn, User user) {
		PreparedStatement pstmt = null;
		String query = "UPDATE TBL_USER SET pw=?, name=?, phone=?, email=?, addr=? WHERE user_id=?";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user.getPw()); 
			pstmt.setString(2, user.getName()); 
			pstmt.setString(3, user.getPhone()); 
			pstmt.setString(4, user.getEmail()); 
			pstmt.setString(5, user.getAddr()); 
			pstmt.setString(6, user.getUser_id()); 
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 탈퇴하기
	public int deleteUser(Connection conn, String id) {
		PreparedStatement pstmt = null;
		String query = "DELETE FROM TBL_USER WHERE user_id=?";
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id); 
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 패스워드 변경하기
	public int updatePassword(Connection conn, String userId, String password) {
		PreparedStatement pstmt = null;
		String query = "UPDATE TBL_USER SET pw=? WHERE user_id=?";
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, password); 
			pstmt.setString(2, userId); 
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}






