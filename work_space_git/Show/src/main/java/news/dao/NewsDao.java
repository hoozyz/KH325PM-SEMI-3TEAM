package news.dao;

import static common.JDBCTemplate.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vo.News;

public class NewsDao {
	String query;
	
	public int insert(Connection con, News news) {
		PreparedStatement pstmt = null;
		int result = -1;
		
		try {
			query = "INSERT INTO TBL_NEWS VALUES(SEQ_NEWS_NUM.nextval, ?, ?, ?, ?, ?)";

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, news.getTitle());
			pstmt.setString(2, news.getCont());
			pstmt.setString(3, news.getDate());
			pstmt.setString(4, news.getPoster());
			pstmt.setString(5, news.getLink());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			 e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 소식 7개 랜덤 조회
	public List<News> findNews(Connection con) { 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<News> list = new ArrayList<>();
		
		String query = "SELECT * FROM "
				+ "(SELECT CONT, LINK, NEWS_DATE, NEWS_NUM, POSTER, TITLE, ROWNUM NUM FROM  "
				+ "(SELECT * FROM TBL_NEWS ORDER BY DBMS_RANDOM.VALUE) "
				+ "WHERE POSTER IS NOT NULL AND CONT IS NOT NULL) "
				+ "WHERE NUM BETWEEN 1 AND 7";
				
		try {
			pstmt = con.prepareStatement(query); 
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				News news = new News();
				news.setNews_num(rs.getInt("news_num"));
				news.setCont(rs.getString("cont"));
				news.setDate(rs.getString("news_date"));
				news.setLink(rs.getString("link"));
				news.setTitle(rs.getString("title"));
				news.setPoster(rs.getString("poster"));
				list.add(news);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}

	// 홈페이지 소식 3개 랜덤 조회
	public List<News> findNewsHome(Connection con) { 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<News> list = new ArrayList<>();
		
		String query = "SELECT * FROM "
				+ "(SELECT CONT, LINK, NEWS_DATE, NEWS_NUM, POSTER, TITLE, ROWNUM NUM FROM  "
				+ "(SELECT * FROM TBL_NEWS ORDER BY DBMS_RANDOM.VALUE) "
				+ "WHERE POSTER IS NOT NULL AND CONT IS NOT NULL) "
				+ "WHERE NUM BETWEEN 1 AND 3";
				
		try {
			pstmt = con.prepareStatement(query); 
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				News news = new News();
				news.setNews_num(rs.getInt("news_num"));
				news.setCont(rs.getString("cont"));
				news.setDate(rs.getString("news_date"));
				news.setLink(rs.getString("link"));
				news.setTitle(rs.getString("title"));
				news.setPoster(rs.getString("poster"));
				list.add(news);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}

	// 소식 전체 삭제 -> 실시간으로 다시 파싱
	public int deleteAll(Connection con) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			query = "TRUNCATE TABLE TBL_NEWS";

			pstmt = con.prepareStatement(query);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			 e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
