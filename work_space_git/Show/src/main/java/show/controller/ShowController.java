package show.controller;

import java.util.List;

import api.ApiManager;
import show.service.ShowService;
import vo.Show;

public class ShowController {
	ApiManager api = new ApiManager();
	ShowService ss = new ShowService();
	
	public void showIdParse(String id) {
		Show show = api.showIdApi(id);
		
		if(show != null) {
			ss.insert(show);
		}
	}
	
	
	public void initShow() { // 2000개
		String startDate = "20200101";
		String endDate = "20220930";
		List<Show> list = api.showApi(startDate, endDate);
	
		for(Show show : list) {
			ss.insert(show);
		}
	}
	
	public static void main(String[] args) {
		ShowController sc = new ShowController();
		
		sc.initShow(); // 전체 파싱
//		sc.showIdParse("PF186855"); // 안에 showid 적으면 파싱
	}
}
