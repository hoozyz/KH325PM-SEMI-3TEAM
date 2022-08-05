package ticketing.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vo.Ticketing;

public class TicketingDao {

	// 예매 목록 조회
	public List<Ticketing> findTicketById(Connection conn, String id) {
		List<Ticketing> ticList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM TBL_TICKETING WHERE user_id = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next() == false) {
				return null;
			}

			while (rs.next()) {
				Ticketing tic = new Ticketing();
				tic.setTic_no(rs.getInt("tic_no"));
				tic.setShow_id(rs.getString("show_id"));
				tic.setUser_id(rs.getString("user_id"));
				tic.setPrfnm(rs.getString("prfnm"));
				tic.setTicket_viewdate(rs.getString("ticket_viewdate"));
				tic.setTicket_date(rs.getString("ticket_date"));
				tic.setFcltynm(rs.getString("fcltynm"));
				tic.setCount(rs.getInt("ticket_count"));
				tic.setPrice(rs.getInt("price"));

				ticList.add(tic);
			}
			return ticList;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return null;
	}

	// 예매하기
	public int save(Connection conn, Ticketing tic) {
		PreparedStatement pstmt = null;
		String query = "INSERT INTO TBL_TICKETING VALUES(SEQ_TIC_NO.nextval, ?, ?, ?, ?, SYSDATE, ?,?, ?)";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, tic.getShow_id());
			pstmt.setString(2, tic.getUser_id());
			pstmt.setString(3, tic.getPrfnm());
			pstmt.setString(4, tic.getTicket_viewdate());
			pstmt.setString(5, tic.getFcltynm());
			pstmt.setInt(6, tic.getCount());
			pstmt.setInt(7, tic.getPrice());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 예매 삭제
	public int deleteTicket(Connection conn, int ticNo) {
		PreparedStatement pstmt = null;
		String query = "DELETE FROM TBL_TICKETING WHERE tic_no=?";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, ticNo);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
