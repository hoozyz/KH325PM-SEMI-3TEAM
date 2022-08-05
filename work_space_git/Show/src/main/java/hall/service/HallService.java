package hall.service;

import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

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
	
	public List<Hall> selectHall(String local, String keyword) {
		List<Hall> list = new ArrayList<>();
		
		list = dao.selectHall(con, local, keyword);
		
		if(list != null) {
			return list;
		}
		
		return null;
	}
	
	public Hall selectHallById(String id) {
		Hall hall = new Hall();
		
		hall = dao.selectHallById(con, id);
		
		if(hall != null) {
			return hall;
		}
		
		return null;
	}
}
