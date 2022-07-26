package rank.service;

import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.connect;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;

import rank.dao.RankDAO;
import vo.RankVO;

public class RankService {
	RankDAO dao = new RankDAO();
	private Connection con = connect();
	
	public int insertRank(RankVO rank) {
		int result = dao.insertRank(con, rank);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
	}
	
	public int insertGenreRank(RankVO rank) {
		int result = dao.insertGenreRank(con, rank);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
	}
}
