package hall.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vo.Board;
import vo.Hall;

public class HallDAO {
	String query;

	public int insert(Connection con, Hall hall) {

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

	public List<Hall> selectHall(Connection conn, String local, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM TBL_HALL WHERE fcltynm LIKE ? AND adres like ?";

		List<Hall> list = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setString(2, "%" + local + "%");

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Hall hall = new Hall();
				hall.setHall_id(rs.getString("hall_id"));
				hall.setAdres(rs.getString("adres"));
				hall.setFcltynm(rs.getString("fcltynm"));
				hall.setLa(rs.getString("la"));
				hall.setLo(rs.getString("lo"));
				hall.setRelateurl(rs.getString("relateurl"));
				hall.setSeatscale(rs.getInt("seatscale"));
				hall.setTelno(rs.getString("telno"));
				
				list.add(hall);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}

	public Hall selectHallById(Connection con, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM TBL_HALL WHERE hall_id = ?";

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				Hall hall = new Hall();
				hall.setHall_id(rs.getString("hall_id"));
				hall.setAdres(rs.getString("adres"));
				hall.setFcltynm(rs.getString("fcltynm"));
				hall.setLa(rs.getString("la"));
				hall.setLo(rs.getString("lo"));
				hall.setRelateurl(rs.getString("relateurl"));
				hall.setSeatscale(rs.getInt("seatscale"));
				hall.setTelno(rs.getString("telno"));
				
				return hall;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		
		return null;
	}
}
