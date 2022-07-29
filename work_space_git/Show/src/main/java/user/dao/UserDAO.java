package user.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import vo.UserVO;

public class UserDAO {
	// 유저 조회
	public UserVO findUserById(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM TBL_USER WHERE \"user_id\"=?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				UserVO u = new UserVO();
				u.setUser_id(rs.getString("user_id")); 
				u.setPw(rs.getString("pw"));    	
				u.setName(rs.getString("name"));       
				u.setPhone(rs.getString("phone"));     
				u.setEmail(rs.getString("email"));     
				u.setAddr(rs.getString("addr"));       
				u.setRole(rs.getString("role"));     
				return u;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return null;
	}

	// 유저 회원가입
	public int insertUser(Connection conn, UserVO user) {
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

	// 유저 정보 변경
	public int updateUser(Connection conn, UserVO user) {
		PreparedStatement pstmt = null;
		String query = "UPDATE TBL_USER SET \"name\"=?, \"phone\"=?, \"email\"=?, "
				+ "\"addr\"=? WHERE \"user_id\"=?";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getPhone());
			pstmt.setString(3, user.getEmail());
			pstmt.setString(4, user.getAddr());
			pstmt.setString(5, user.getUser_id());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 유저 비밀번호 변경
	public int updatePassword(Connection conn, String userId, String password) {
		PreparedStatement pstmt = null;
		String query = "UPDATE TBL_USER SET \"pw\"=? WHERE \"user_id\"=?";
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

	// 유저 삭제
	public int deleteUser(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		String query = "DELETE FROM TBL_USER WHERE \"user_id\"=?";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
