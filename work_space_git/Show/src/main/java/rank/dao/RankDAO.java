package rank.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vo.Rank;

public class RankDAO {
	String query;
	
	// 전체 랭킹 추가
	public int insertRank(Connection con, Rank rank) {

		try {
			query = "INSERT INTO TBL_RANK VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

			PreparedStatement pstmt = con.prepareStatement(query);

			int count = 1;
			pstmt.setString(count++, rank.getShow_id());
			pstmt.setString(count++, rank.getThea_id());
			pstmt.setString(count++, rank.getArea());
			pstmt.setString(count++, rank.getPrfdtcnt());
			pstmt.setString(count++, rank.getPrfpd());
			pstmt.setString(count++, rank.getCate());
			pstmt.setString(count++, rank.getPrfplcnm());
			pstmt.setString(count++, rank.getPrfnm());
			pstmt.setInt(count++, rank.getRnum());
			pstmt.setInt(count++, rank.getSeatcnt());
			pstmt.setString(count++, rank.getPoster());
			pstmt.setString(count++, rank.getDate_range());
			pstmt.setString(count++, rank.getDate());
			
			int result = pstmt.executeUpdate();
			pstmt.close();
			return result;
		} catch (Exception e) {
			 e.printStackTrace();
		}
		return -1;
	}
	
	// 장르별 랭킹 추가
	public int insertGenreRank(Connection con, Rank rank) {

		try {
			query = "INSERT INTO TBL_GENRERANK VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

			PreparedStatement pstmt = con.prepareStatement(query);

			int count = 1;
			pstmt.setString(count++, rank.getShow_id());
			pstmt.setString(count++, rank.getThea_id());
			pstmt.setString(count++, rank.getArea());
			pstmt.setString(count++, rank.getPrfdtcnt());
			pstmt.setString(count++, rank.getPrfpd());
			pstmt.setString(count++, rank.getCate());
			pstmt.setString(count++, rank.getPrfplcnm());
			pstmt.setString(count++, rank.getPrfnm());
			pstmt.setInt(count++, rank.getRnum());
			pstmt.setInt(count++, rank.getSeatcnt());
			pstmt.setString(count++, rank.getPoster());
			pstmt.setString(count++, rank.getDate_range());
			pstmt.setString(count++, rank.getDate());

			int result = pstmt.executeUpdate();
			pstmt.close();
			return result;
		} catch (Exception e) {
			 e.printStackTrace();
		}
		return -1;
	}
	
	// 장르별 TOP10 조회
	public List<Rank> findRankByCategory(Connection conn, String category, String dateRange, String endDate) {
		List<Rank> rankList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query;

		try {
			query = "SELECT * FROM \r\n"
					+ "(SELECT poster, prfnm, prfplcnm, prfpd, show_id, cate, date_range, rnum, genrerank_date FROM TBL_GENRERANK \r\n"
					+ "WHERE cate=? AND date_range=? AND genrerank_date = ?) \r\n"
					+ "WHERE rnum BETWEEN 1 AND 10";

			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, category);
			pstmt.setString(2, dateRange);
			pstmt.setString(3, endDate);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Rank rank = new Rank();
				rank.setPoster(rs.getString("poster"));
				rank.setPrfpd(rs.getString("prfpd"));
				rank.setPrfplcnm(rs.getString("prfplcnm"));
				rank.setPrfnm(rs.getString("prfnm"));
				rank.setShow_id(rs.getString("show_id"));
				rank.setCate(rs.getString("cate"));
				rank.setDate(endDate);
				rank.setDate_range(dateRange);

				rankList.add(rank);
			}
			return rankList;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return null;
	}
}
