package show.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import board.controller.PageInfo;
import vo.Board;
import vo.Like;
import vo.Show;
import vo.News;

public class ShowDAO {
	String query;
	
	public int insert(Connection con, Show show) {

		try {
			query = "INSERT INTO TBL_SHOW VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,DEFAULT)";

			PreparedStatement pstmt = con.prepareStatement(query);

			int count = 1;
			pstmt.setString(count++, show.getShow_id());
			pstmt.setString(count++, show.getThea_id());
			pstmt.setString(count++, show.getPrfnm());
			pstmt.setString(count++, show.getPrfpdfrom());
			pstmt.setString(count++, show.getPrfpdto());
			pstmt.setString(count++, show.getGenrenm());
			pstmt.setString(count++, show.getFcltynm());
			pstmt.setString(count++, show.getPoster());
			pstmt.setString(count++, show.getPrfcast());
			pstmt.setString(count++, show.getPrfruntime());
			pstmt.setString(count++, show.getPrfage());
			pstmt.setString(count++, show.getEntrpsnm());
			pstmt.setString(count++, show.getPcseguidance());
			pstmt.setString(count++, show.getDtguidance());
			pstmt.setString(count++, show.getAwards());

			int result = pstmt.executeUpdate();
			pstmt.close();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	public Show findShowById(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT prfnm, genrenm, poster, prfpdfrom, prfpdto, fcltynm, prfruntime, prfage, prfcast, entrpsnm, pcseguidance, show_star FROM TBL_SHOW WHERE show_id=?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			Show show = new Show();
			if (rs.next()) {
				show.setPoster(rs.getString("poster"));
				show.setPrfpdfrom(rs.getString("prfpdfrom"));
				show.setPrfpdto(rs.getString("prfpdto"));
				show.setFcltynm(rs.getString("fcltynm"));
				show.setPrfruntime(rs.getString("prfruntime"));
				show.setPrfage(rs.getString("prfage"));
				show.setPrfcast(rs.getString("prfcast"));
				show.setEntrpsnm(rs.getString("entrpsnm"));
				show.setPcseguidance(rs.getString("pcseguidance"));
				show.setShow_star(rs.getString("show_star"));
				show.setShow_id(id);
				show.setPrfnm(rs.getString("prfnm"));
				show.setGenrenm(rs.getString("genrenm"));

			} 
			return show;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return null;
	}
	
	public List<Show> findByHome(Connection conn, String keyword, String category) {
		List<Show> showList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "";
	
		try {
			if(category.equals("음악")) {
				query = "SELECT * FROM \r\n"
						+ "(SELECT genrenm, show_id, poster, prfnm, prfpdfrom, prfpdto, fcltynm FROM tbl_show WHERE prfnm LIKE ?) \r\n"
						+ "WHERE genrenm = '클래식' OR genrenm = '국악' OR genrenm = '오페라'";
				
			} else if(category.equals("공연")) {
				query = "SELECT * FROM \r\n"
						+ "(SELECT genrenm, show_id, poster, prfnm, prfpdfrom, prfpdto, fcltynm FROM tbl_show WHERE prfnm LIKE ?) \r\n"
						+ "WHERE genrenm = '뮤지컬' OR genrenm = '연극' OR genrenm = '무용' OR genrenm = '복합'";
			}
		
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + keyword + "%");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Show show = new Show();
				show.setShow_id(rs.getString("show_id"));
				show.setPoster(rs.getString("poster"));
				show.setPrfnm(rs.getString("prfnm"));
				show.setPrfpdfrom(rs.getString("prfpdfrom"));
				show.setPrfpdto(rs.getString("prfpdto"));
				show.setGenrenm(rs.getString("genrenm"));
				show.setFcltynm(rs.getString("fcltynm"));

				showList.add(show);
			}
			return showList;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return null;
	}

	public List<Show> findByKeyword(Connection conn, String keyword, String category, String startDate,
			String endDate) {
		List<Show> showList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT show_id, poster, prfnm, prfpdfrom, prfpdto, genrenm, fcltynm FROM tbl_show WHERE prfnm LIKE ? AND genrenm = ? AND prfpdfrom BETWEEN TO_DATE(?, 'YYYY.MM.DD') AND TO_DATE(?, 'YYYY.MM.DD')";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setString(2, category);
			pstmt.setString(3, startDate);
			pstmt.setString(4, endDate);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Show show = new Show();
				show.setPoster(rs.getString("poster"));
				show.setPrfpdfrom(rs.getString("prfpdfrom"));
				show.setPrfpdto(rs.getString("prfpdto"));
				show.setFcltynm(rs.getString("fcltynm"));
				show.setPrfnm(rs.getString("prfnm"));
				show.setShow_id(rs.getString("show_id"));
				show.setGenrenm(rs.getString("genrenm"));

				showList.add(show);
			}
			return showList;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return null;
	}

	public List<Show> findByCategory(Connection conn, String category, String startDate, String endDate) {
		List<Show> showList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query;

		try {
			query = "SELECT poster, prfnm, prfpdfrom, prfpdto, fcltynm, show_id FROM TBL_SHOW WHERE genrenm = ? AND prfpdfrom BETWEEN TO_DATE(?, 'YYYY.MM.DD') AND TO_DATE(?, 'YYYY.MM.DD')";

			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, category);
			pstmt.setString(2, startDate);
			pstmt.setString(3, endDate);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Show show = new Show();
				show.setPoster(rs.getString("poster"));
				show.setPrfpdfrom(rs.getString("prfpdfrom"));
				show.setPrfpdto(rs.getString("prfpdto"));
				show.setFcltynm(rs.getString("fcltynm"));
				show.setPrfnm(rs.getString("prfnm"));
				show.setShow_id(rs.getString("show_id"));

				showList.add(show);
			}
			return showList;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return null;
	}
	
	public List<Show> findByOpenDate(Connection conn, String category){
		List<Show> openList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT poster, prfpdfrom, prfpdto, fcltynm, prfnm, show_id FROM TBL_SHOW where genrenm = ? AND prfpdfrom BETWEEN (TO_CHAR(SYSDATE+1, 'YYYY.MM.DD')) AND (TO_CHAR(SYSDATE+8, 'YYYY.MM.DD'))";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Show show = new Show();
				show.setPoster(rs.getString("poster"));
				show.setPrfpdfrom(rs.getString("prfpdfrom"));
				show.setPrfpdto(rs.getString("prfpdto"));
				show.setFcltynm(rs.getString("fcltynm"));
				show.setPrfnm(rs.getString("prfnm"));
				show.setShow_id(rs.getString("show_id"));
				
				openList.add(show);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}
		return openList;
	}

	
	public List<Show> selectShowByCategory(Connection conn,String category, PageInfo pageInfo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT show_id, hall_id, prfnm, prfpdfrom, prfpdto, genrenm, poster FROM \r\n"
				+ "(SELECT show_id, hall_id, prfnm, prfpdfrom, prfpdto, genrenm, poster, ROWNUM NUM FROM \r\n"
				+ "(SELECT show_id, hall_id, prfnm, prfpdfrom, prfpdto, genrenm, poster \r\n"
				+ "FROM TBL_SHOW where genrenm = ? ORDER BY show_id DESC)) WHERE NUM BETWEEN ? and ?";

		try {
			List<Show> list = new ArrayList<>();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, category);
			pstmt.setInt(2, pageInfo.getStartList());
			pstmt.setInt(3, pageInfo.getEndList());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Show show = new Show();
				show.setShow_id(rs.getString("show_id"));
				show.setThea_id(rs.getString("hall_id"));
				show.setPrfnm(rs.getString("prfnm"));
				show.setPrfpdfrom(rs.getString("prfpdfrom"));
				show.setPrfpdto(rs.getString("prfpdto"));
				show.setGenrenm(rs.getString("genrenm"));
				show.setPoster(rs.getString("poster"));
				list.add(show);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return null;
	}

//	-- 전체 공연 -> 공연시작날이 최근
//	SELECT * FROM (SELECT * FROM TBL_SHOW WHERE hall_id = ? ORDER BY prfpdfrom DESC);
	public List<Show> getShowView(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Show> list = new ArrayList<>();
		
		String query = "SELECT * FROM TBL_SHOW WHERE hall_id = ? ORDER BY prfpdfrom DESC";
				
		try {
			pstmt = conn.prepareStatement(query); 
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Show show = new Show();
				show.setShow_id(rs.getString("show_id"));
				show.setPrfnm(rs.getString("prfnm"));
				show.setPrfpdfrom(rs.getString("prfpdfrom"));
				show.setPrfpdto(rs.getString("prfpdto"));
				show.setGenrenm(rs.getString("genrenm"));
				show.setPoster(rs.getString("poster"));
				show.setPrfcast(rs.getString("prfcast"));
				list.add(show);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}
	
}
