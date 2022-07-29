package ticketing.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import ticketing.dao.TicketingDao;
import vo.Ticketing;

public class TicketingService {
	TicketingDao dao = new TicketingDao();
	
	public List<Ticketing> findTicketById(String id) {
		Connection conn = getConnection();
		List<Ticketing> ticList = dao.findTicketById(conn, id);
		
		return ticList;
	}
	
	
	public int save(Ticketing tic) {
		Connection conn = getConnection();
		
		int result = dao.save(conn, tic);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int delete(int ticNo) {
		Connection conn = getConnection();
		int result = dao.deleteTicket(conn, ticNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
}
