package rank.controller;

import java.util.List;

import api.ApiManager;
import rank.service.RankService;
import vo.Rank;

public class RankController {
	ApiManager api = new ApiManager();
	RankService ss = new RankService();
	
	
	public void initShow() { 
		// 전체 랭킹 10위 파싱
		String date = "20220818";
		List<Rank> listRank = api.rankApi(date);
	
		for(Rank rank : listRank) {
			ss.insertRank(rank);
		}
		
		// 장르별 10위 파싱
		List<Rank> listGenre = api.rankGenreApi(date);
		
		for(Rank rank : listGenre) {
			ss.insertGenreRank(rank);
		}
	}
	
	public static void main(String[] args) {
		RankController rc = new RankController();
		
		rc.initShow();
	}
}
