package show.service;

import static common.JDBCTemplate.*;
import java.sql.Connection;

import show.dao.ShowDAO;
import vo.Show;

public class ShowService {
	ShowDAO dao = new ShowDAO();
	private Connection con = getConnection();
	
	public int insert(Show show) {
		int result = dao.insert(con, show);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
	}
}
