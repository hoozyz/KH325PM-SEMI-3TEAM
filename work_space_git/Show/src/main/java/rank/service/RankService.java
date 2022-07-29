package rank.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import rank.dao.RankDAO;
import vo.Rank;

public class RankService {
	RankDAO dao = new RankDAO();
	private Connection con = getConnection();
	
	public int insertRank(Rank rank) {
		int result = dao.insertRank(con, rank);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
	}
	
	public int insertGenreRank(Rank rank) {
		int result = dao.insertGenreRank(con, rank);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
	}
}
