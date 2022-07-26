package show.controller;

import java.util.List;

import api.ApiManager;
import show.service.ShowService;
import vo.ShowVO;

public class ShowController {
	ApiManager api = new ApiManager();
	ShowService ss = new ShowService();
	
	
	public void initShow() {
		String startDate = "20210601";
		String endDate = "20220701";
		List<ShowVO> list = api.showApi(startDate, endDate);
	
		for(ShowVO show : list) {
			ss.insert(show);
		}
	}
	
	public static void main(String[] args) {
		ShowController sc = new ShowController();
		
		sc.initShow();
	}
}
