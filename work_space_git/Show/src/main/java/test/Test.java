package test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Test {
	public static void main(String[] args) {
		String timeStr = "화요일(19:30), 목요일 ~ 수요일(14:30,19:30), 목요일 ~ 금요일(19:30), 토요일 ~ 일요일(14:00,19:00), HOL(14:00, 16:30)";
//		String timeStr = "화요일 ~ 금요일(20:00), 토요일(16:00,19:00), 일요일(16:00)";
		
		Map<String, String> timeMap = new HashMap<>();
		
		int i = 0;
		int day = 0;
		int time = 0;
		int brac1 = 0;
		int brac2 = 0;
		int dayCheck = 0;
		String times = "";
		
		
		List<String> dayList = new ArrayList<>();
		List<String> timeList = new ArrayList<>();
		List<Integer> disList = new ArrayList<>();
		List<Integer> checkList = new ArrayList<>();
		
		// HOL 포함 경우 HOL관련 삭제 
		if (timeStr.contains("HOL")) {
			timeStr = timeStr.replace("HOL", "공요일");
			System.out.println(timeStr);
		}
		
		if(timeStr.equals("")) {
			timeMap.put("", "");
//			return timeMap;
		}
		
		
		while(true) {
			// 괄호 안 시간 개수
			brac1 = timeStr.indexOf("(",brac1);
			brac2 = timeStr.indexOf(")",brac2);
			
			int dis = (brac2 - brac1)/6;
			disList.add(dis);
			if(brac2 >= timeStr.length() - 3) {
				break;
			}

			brac1 = timeStr.indexOf("(",brac1) + 1; 
			brac2 = timeStr.indexOf("(",brac2) + 1; 
		}
		
		while(true) {
			// ~ 인덱스
			dayCheck = timeStr.indexOf("~", dayCheck) + 1;
			
			checkList.add(dayCheck);
			
			if(timeStr.indexOf("~", dayCheck) == -1) {
				break;
			}
		}
		
		while(true) { 
			// 요일
			dayList.add(String.valueOf(timeStr.charAt(timeStr.indexOf("요",day)-1)) + "요일");
			day = timeStr.indexOf("요",day) + 1;
			
			for(int j = 0; j < checkList.size(); j++) {
				if(checkList.get(j) + 3 == day) {
					String days = String.valueOf(timeStr.charAt(day-8)) + "요일" + "-" + String.valueOf(timeStr.charAt((day-2))) + "요일";
					dayList.set(i-1, days);
					dayList.remove(i);
					i--;
				}
			}
			
			i++;
			if(timeStr.indexOf("요",day) == -1) {
				break;
			}
			
		}
		
		while(true) {
			// 시간
			timeList.add(String.valueOf(timeStr.substring(timeStr.indexOf(":",time)-2, timeStr.indexOf(":",time)+3)));
			time = timeStr.indexOf(":",time) + 1;
			
			if(timeStr.indexOf(":", time) == -1) {
				break;
			}
		}
		
		// 괄호 개수만큼 시간 합치기
		for(int j = 0; j < disList.size(); j++) {
			if(disList.get(j) >= 2) {
				for(int k = 0; k < disList.get(j); k++) { 
					if (k == disList.get(j) - 1) {
						times += timeList.get(j);
						timeList.remove(j);
					} else {
						times += timeList.get(j) + "-";
						timeList.remove(j);
					}
				}
				timeList.add(j, times);
				times = "";
			}
		}

		for (int j = 0; j < dayList.size(); j++) {
			if (dayList.get(j).equals("공요일")) {
				dayList.set(j,"공휴일");
			}
			timeMap.put(dayList.get(j), timeList.get(j));
		}

	
		
		System.out.println(dayList.toString());
		System.out.println(timeList.toString());
		System.out.println(disList.toString());
		
	}			
}
