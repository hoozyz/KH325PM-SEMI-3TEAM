package user.service;

import static common.JDBCTemplate.*;


import java.sql.Connection;

import user.dao.UserDAO;
import vo.User;

/**
 * 멤버에 관련된 기능 구현
 * 기능 : 로그인, 로그아웃, 회원가입, 회원탈퇴, 정보수정
 */
public class UserService {
	private UserDAO dao = new UserDAO();
	
	public User findUserById(String id) {
		Connection conn = getConnection();
		User user = dao.findUserById(conn, id);
		return user;
	}
	
	// 로그인기능, id pw를 DB에서 대조하여 인증된 사용자인지 검증하는 기능
	public User login(String id, String pw) {
		User user = findUserById(id);
		
		if(user != null && user.getPw().equals(pw)) {
			return user;
		}else {
			return null;
		}
	}
	
	public int save(User user) {
		int result = 0;
		Connection conn = getConnection();
		
		if(findUserById(user.getUser_id()) == null) {
			result = dao.insertUser(conn, user);
		} else {
			result = dao.updateUser(conn, user);
		}
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int delete(String id) {
		Connection conn = getConnection();
		int result = dao.deleteUser(conn, id);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int updatePassword(String id, String password) {
		Connection conn = getConnection();
		int result = dao.updatePassword(conn, id, password);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	
	// 중복 가입 방지용
	public boolean isDuplicated(String id) {
		Connection conn = getConnection();
		User user = dao.findUserById(conn, id);
		close(conn);
		
		if(user != null) {
			return true; // id 중복됨
		}else {
			return false; // id 중복되지 않음 -> 회원가입 가능
		}
	}
}





