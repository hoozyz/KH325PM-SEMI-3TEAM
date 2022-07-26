package rank.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import vo.RankVO;

public class RankDAO {
	String query;
	
	public int insertRank(Connection con, RankVO rank) {

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
	
	public int insertGenreRank(Connection con, RankVO rank) {

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
}
