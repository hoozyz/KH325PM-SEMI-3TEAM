package user.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import user.dao.UserDAO;
import vo.UserVO;
 	
public class UserService {
	private UserDAO dao = new UserDAO();
	
	public UserVO findUserById(String id) {
		Connection conn = connect();
		UserVO user = dao.findUserById(conn, id);
		return user;
	}
	
	public UserVO login(String id, String pw) {
		UserVO user= findUserById(id);

		if(user != null && user.getPw().equals(pw)) {
			return user;
		}else {
			return null;
		}
	}
	
	public int insertUser(UserVO user) {
		int result = 0;
		Connection conn = connect();
		
		if(user.getUser_id() == null) {
			result = dao.insertUser(conn, user);
		}
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int updateUser(UserVO user) {
		int result = 0;
		Connection conn = connect();
		
		if(user.getUser_id() != null) {
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
	
	public int updatePassword(String id, String password) {
		Connection conn = connect();
		int result = dao.updatePassword(conn, id, password);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteUser(String id) {
		Connection conn = connect();
		int result = dao.deleteUser(conn, id);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public boolean isDuplicated(String id) {
		Connection conn = connect();
		UserVO user= dao.findUserById(conn, id);
		close(conn);
		
		if(user != null) {
			return true; 
		}else {
			return false; 
		}
	}
}
