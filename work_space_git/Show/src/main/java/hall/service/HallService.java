package hall.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import hall.dao.HallDAO;
import vo.HallVO;

public class HallService {
	HallDAO dao = new HallDAO();
	private Connection con = connect();
	
	public int insert(HallVO hall) {
		int result = dao.insert(con, hall);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
	}
}
