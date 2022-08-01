package show.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vo.Like;
import vo.Show;

public class ShowDAO {
	String query;

	public int insert(Connection con, Show show) {

		try {
			query = "INSERT INTO TBL_SHOW VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)";

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
			pstmt.setString(count++, show.getShow_star());

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

			if (rs.next()) {
				Show show = new Show();
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

				return show;
			} else {
				return null;
			}
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
		String query = "SELECT poster, prfnm, prfpdfrom, prfpdto, fcltynm FROM tbl_show WHERE prfnm LIKE ? AND genrenm = ? AND prfpdfrom BETWEEN TO_DATE(?, 'YYYY.MM.DD') AND TO_DATE(?, 'YYYY.MM.DD')";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setString(2, category);
			pstmt.setString(3, startDate);
			pstmt.setString(4, endDate);
			rs = pstmt.executeQuery();

			if (rs.next() == false) {
				return null;
			}

			while (rs.next()) {
				Show show = new Show();
				show.setPoster(rs.getString("poster"));
				show.setPrfpdfrom(rs.getString("prfpdfrom"));
				show.setPrfpdto(rs.getString("prfpdto"));
				show.setFcltynm(rs.getString("fcltynm"));
				show.setPrfnm(rs.getString("prfnm"));

				showList.add(show);
				return showList;
			}
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

			if (rs.next() == false) {
				return null;
			}

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
}
