package hall.controller;

import java.util.List;

import api.ApiManager;
import hall.service.HallService;
import vo.HallVO;

public class HallController {
	ApiManager api = new ApiManager();
	HallService hs = new HallService();
	
	
	public void initShow() {
		List<HallVO> list = api.hallApi();
	
		for(HallVO hall : list) {
			hs.insert(hall);
		}
	}
	
	public static void main(String[] args) {
		HallController hc = new HallController();
		
		hc.initShow();
	}
}
