package show.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

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
	
	public Show findShowById(String id) {
		Show show = dao.findShowById(con, id);
		
		if(show != null) {
			return show;
		}
		
		return null;
	}
	
	public List<Show> findByKeyword(String keyword, String category, String startDate, String endDate) {
		List<Show> showList = new ArrayList<>();
		
		showList = dao.findByKeyword(con, keyword, category, startDate, endDate);
		
		if(showList != null) {
			return showList;
		}
		
		return null;
	}
	
	public List<Show> findByCategory(String category, String startDate, String endDate) {
		List<Show> showList = new ArrayList<>();
		
		showList = dao.findByCategory(con, category, startDate, endDate);
		
		if(showList != null) {
			return showList;
		}
		
		return null;
	}
}
