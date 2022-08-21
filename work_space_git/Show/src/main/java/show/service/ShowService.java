package show.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import board.controller.PageInfo;
import show.dao.ShowDAO;
import vo.Show;

public class ShowService {
	ShowDAO dao = new ShowDAO();
	private Connection con = getConnection();

	public int insert(Show show) {
		int result = dao.insert(con, show);
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		return result;
	}

	public List<Show> selectShowByCategory(String category, PageInfo pageInfo) {
		List<Show> list = new ArrayList<>();
		list = dao.selectShowByCategory(con, category, pageInfo);

		return list;
	}

	public Show findShowById(String id) {
		Show show = dao.findShowById(con, id);

		return show;
	}

	public List<Show> findByKeyword(String keyword, String category, String startDate, String endDate) {
		List<Show> showList = new ArrayList<>();

		showList = dao.findByKeyword(con, keyword, category, startDate, endDate);

		return showList;
	}

	public List<Show> findByHome(String keyword, String category) {
		List<Show> showList = new ArrayList<>();

		showList = dao.findByHome(con, keyword, category);

		return showList;
	}

	public List<Show> findByCategory(String category, String startDate, String endDate, PageInfo pageInfo) {
		List<Show> showList = new ArrayList<>();

		showList = dao.findByCategory(con, category, startDate, endDate, pageInfo);

		return showList;
	}

	public List<Show> comingSoon(String category) {
		List<Show> openList = new ArrayList<>();
		openList = dao.comingSoon(con, category);

		return openList;
	}

	public List<Show> getShowView(String id) {
		List<Show> showList = new ArrayList<>();

		showList = dao.getShowView(con, id);

		return showList;
	}

}
