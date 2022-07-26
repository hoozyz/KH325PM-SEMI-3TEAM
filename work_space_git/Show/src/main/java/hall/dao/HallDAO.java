package hall.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import vo.HallVO;

public class HallDAO {
	String query;
	
	public int insert(Connection con, HallVO hall) {

		try {
			query = "INSERT INTO TBL_HALL VALUES(?, ?, ?, ?, ?, ?, ?, ?)";

			PreparedStatement pstmt = con.prepareStatement(query);

			int count = 1;
			pstmt.setString(count++, hall.getHall_id());
			pstmt.setString(count++, hall.getFcltynm());
			pstmt.setInt(count++, hall.getSeatscale());
			pstmt.setString(count++, hall.getTelno());
			pstmt.setString(count++, hall.getRelateurl());
			pstmt.setString(count++, hall.getAdres());
			pstmt.setString(count++, hall.getLa());
			pstmt.setString(count++, hall.getLo());

			int result = pstmt.executeUpdate();
			pstmt.close();
			return result;
		} catch (Exception e) {
			 e.printStackTrace();
		}
		return -1;
	}
}
