package hall.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import hall.dao.HallDAO;
import vo.Hall;

public class HallService {
	HallDAO dao = new HallDAO();
	private Connection con = getConnection();
	
	public int insert(Hall hall) {
		int result = dao.insert(con, hall);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
	}
}
