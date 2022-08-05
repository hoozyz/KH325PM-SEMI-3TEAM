package test;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class test {
	public static void main(String[] args) {
		String test = "b석 5원, c석 50원, ㅇㅇㅇㅇ A석 10,000원";
		test = test.replace("원", "");
		int result = 0;
		List<Integer> list = new ArrayList<>();
		while(true) {
			list.add(test.indexOf("석", result)); // 1
			result = test.indexOf("석", result) + 1;
			
			if(test.indexOf("석", result) == -1) {
				break;
			}
		}
		
		result = list.size();
		
		String[] testArr = new String[result];
		String[] testArr1 = new String[result];
		Map<String, String> map = new HashMap<>();
		
		if(result == 1) {
			testArr = test.split(" "); 
			for(int i = 0; i < testArr.length; i++) {
				
				if(testArr.length > 2) {
					for (int j = 0; j < testArr.length; j++) {
						String str1 = testArr[0] + "-" + testArr[1];
						map.put(str1, testArr[2]);
					}
				} else {
					map.put(testArr[0], testArr[1]);
				}
			}
		}
			
		testArr = test.split(", ");
		
		
		for(int i = 0; i < testArr.length; i++) {
			testArr1 = testArr[i].split(" ");
			
			if(testArr1.length > 2) {
				for (int j = 0; j < testArr1.length; j++) {
					String str1 = testArr1[0] + "-" + testArr1[1];
					map.put(str1, testArr1[2]);
				} 
			} else {
				map.put(testArr1[0], testArr1[1]);
			}
		}
		
		
		Set<String> seat = map.keySet();
		List<String> seatList = new ArrayList<>(seat);
		
		System.out.println(map);
		System.out.println(seatList); 
		System.out.println(map.values());
	}
}

