package show.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
}
