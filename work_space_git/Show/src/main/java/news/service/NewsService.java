package news.service;

import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import news.dao.NewsDao;
import vo.News;

public class NewsService {
	private Connection con = getConnection();
	NewsDao dao = new NewsDao();
	
	public int receive(List<News> list) {
		int result = 0;
		
		for(News news : list) {
			result = insert(news);
			
			if(result == 0) {
				return 0;
			}
		}
		
		return result;
	}
	
	public int insert(News news) {
		int result = 0;
		result = dao.insert(con, news);
		
		if (result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		return result;
	}
	
	public List<News> findNews() {
		List<News> list = new ArrayList<>();
		
		list = dao.findNews(con);
		
		return list;
	}
	
	public List<News> findNewsHome() {
		List<News> list = new ArrayList<>();
		
		list = dao.findNewsHome(con);
		
		return list;
	}
	
	public int deleteAll() {
		int result = 0;
		result = dao.deleteAll(con);
		
		return result;
	}
}
