package hall.controller;

import java.util.List;

import api.ApiManager;
import hall.service.HallService;
import vo.Hall;

public class HallController {
	ApiManager api = new ApiManager();
	HallService hs = new HallService();
	
	
	public void initShow() {
		List<Hall> list = api.hallApi();
	
		for(Hall hall : list) {
			hs.insert(hall);
		}
	}
	
	public static void main(String[] args) {
		HallController hc = new HallController();
		
		hc.initShow();
	}
}
