package api;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import vo.HallVO;
import vo.RankVO;
import vo.ShowVO;

public class ApiManager {
	
	public List<ShowVO> showApi(String startDate, String endDate) {
		List<ShowVO> list = new ArrayList<>();
		try {
			int page = 1;
			while (true) {
				String url1 = "http://kopis.or.kr/openApi/restful/pblprfr?service=b3e488556abe4df29d325f391436027c&rows=500&stdate="
				+ startDate + "&eddate=" + endDate + "&cpage=" + page;

				DocumentBuilderFactory dbFactoty1 = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder1 = dbFactoty1.newDocumentBuilder();
				Document doc1 = dBuilder1.parse(url1);

				// 'db' 태그 안에 있는 모든 태그들 가져옴.
				NodeList nList1 = doc1.getElementsByTagName("db");

				for (int i = 0; i < nList1.getLength(); i++) {
					Node node1 = nList1.item(i);
					if (node1.getNodeType() == Node.ELEMENT_NODE) {
						Element eElement1 = (Element) node1;
						String show_id = getTagValue("mt20id", eElement1);

						String url2 = "http://www.kopis.or.kr/openApi/restful/pblprfr/" + 
						show_id + "?service=b3e488556abe4df29d325f391436027c";

						DocumentBuilderFactory dbFactoty2 = DocumentBuilderFactory.newInstance();
						DocumentBuilder dBuilder2 = dbFactoty2.newDocumentBuilder();
						Document doc2 = dBuilder2.parse(url2);
						
						NodeList nList2 = doc2.getElementsByTagName("db");

						for (int j = 0; j < nList2.getLength(); j++) {
							Node node2 = nList2.item(j);
							if (node2.getNodeType() == Node.ELEMENT_NODE) {
								Element eElement2 = (Element) node2;
								String thea_id = getTagValue("mt10id", eElement2);
								String prfnm = getTagValue("prfnm", eElement2);
								String prfpdfrom = getTagValue("prfpdfrom", eElement2);
								String prfpdto = getTagValue("prfpdto", eElement2);
								String genrenm = getTagValue("genrenm", eElement2);
								String fcltynm = getTagValue("fcltynm", eElement2);
								String poster = getTagValue("poster", eElement2);
								String prfcast = getTagValue("prfcast", eElement2);
								String prfruntime = getTagValue("prfruntime", eElement2);
								String prfage = getTagValue("prfage", eElement2);
								String entrpsnm = getTagValue("entrpsnm", eElement2);
								String pcseguidance = getTagValue("pcseguidance", eElement2);
								String dtguidance = "";
								if (getTagValue("dtguidance", eElement2).length() > 8) {
									dtguidance = String.valueOf(parsingTime(getTagValue("dtguidance", eElement2)).entrySet());
								}
								
								// 문자열 인코딩
								String awardName = URLEncoder.encode(prfnm, "utf-8");
								
								String url3 = "https://kopis.or.kr/openApi/restful/prfawad?service=b3e488556abe4df29d325f391436027c&cpage=1&rows=5&stdate="
								+ prfpdfrom.replace(".", "") +"&eddate=" + prfpdto.replace(".", "") + "&shprfnm=" + awardName;

								DocumentBuilderFactory dbFactoty3 = DocumentBuilderFactory.newInstance();
								DocumentBuilder dBuilder3 = dbFactoty3.newDocumentBuilder();
								Document doc3 = dBuilder3.parse(url3);
								
								NodeList nList3 = doc3.getElementsByTagName("db");
								
								String awards = "";
								for (int k = 0; k < nList3.getLength(); k++) {
									Node node3 = nList3.item(k);
									if (node3.getNodeType() == Node.ELEMENT_NODE) {
										Element eElement3 = (Element) node3;
										awards = getTagValue("awards", eElement3);
									}
								}
								
								ShowVO show = new ShowVO(show_id, thea_id, prfnm, prfpdfrom, prfpdto, genrenm,
										fcltynm, poster, prfcast, prfruntime, prfage, entrpsnm, pcseguidance,
										dtguidance, awards,"");
								
								list.add(show);
							}
						}
					}
				}
				page++;
				if (page > 4) {
					System.out.println("파싱 성공!!");
					break;
				}
			}
		} catch (Exception e) {
			System.out.println("데이터가 잘못되었습니다.");
			e.printStackTrace();
		}

		return list;
	}
	
	public List<HallVO> hallApi() {
		List<HallVO> list = new ArrayList<>();
		try {
			int page = 1;
			while (true) {
				String url1 = "http://kopis.or.kr/openApi/restful/prfplc?service=b3e488556abe4df29d325f391436027c&rows=500&cpage="
						+ page;

				DocumentBuilderFactory dbFactoty1 = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder1 = dbFactoty1.newDocumentBuilder();
				Document doc1 = dBuilder1.parse(url1);

				// 'db' 태그 안에 있는 모든 태그들 가져옴.
				NodeList nList1 = doc1.getElementsByTagName("db");

				for (int i = 0; i < nList1.getLength(); i++) {
					Node node1 = nList1.item(i);
					if (node1.getNodeType() == Node.ELEMENT_NODE) {
						Element eElement1 = (Element) node1;
						String hall_id = getTagValue("mt10id", eElement1);

						String url2 = "http://www.kopis.or.kr/openApi/restful/prfplc/" + hall_id + "?service=b3e488556abe4df29d325f391436027c";

						DocumentBuilderFactory dbFactoty2 = DocumentBuilderFactory.newInstance();
						DocumentBuilder dBuilder2 = dbFactoty2.newDocumentBuilder();
						Document doc2 = dBuilder2.parse(url2);
						
						NodeList nList2 = doc2.getElementsByTagName("db");

						for (int j = 0; j < nList2.getLength(); j++) {
							Node node2 = nList2.item(j);
							if (node2.getNodeType() == Node.ELEMENT_NODE) {
								Element eElement2 = (Element) node2;
								String fcltynm     =     getTagValue("fcltynm", eElement2);
								int seatscale      =    Integer.parseInt(getTagValue("seatscale", eElement2));
								String telno       =    getTagValue("telno", eElement2);
								String relateurl   =    getTagValue("relateurl", eElement2);
								String adres       =    getTagValue("adres", eElement2);
								String la          =    getTagValue("la", eElement2);
								String lo          =    getTagValue("lo", eElement2);
								
								HallVO hall = new HallVO(hall_id, fcltynm, seatscale, telno, relateurl, adres, la, lo);

								list.add(hall);
							}
						}
					}
				}
				page++;
				if (page > 4) {
					System.out.println("파싱 성공!!");
					break;
				}
			}
		} catch (Exception e) {
			System.out.println("데이터가 잘못되었습니다.");
			e.printStackTrace();
		}

		return list;
	}

	public List<RankVO> rankApi(String date) {
		List<RankVO> list = new ArrayList<>();
		List<String> rangeList = new ArrayList<>();
		
		rangeList.add("day");
		rangeList.add("week");
		rangeList.add("month");
		try {
			for (int j = 0; j < rangeList.size(); j++) {
				String url = "http://kopis.or.kr/openApi/restful/boxoffice?"
						+ "service=b3e488556abe4df29d325f391436027c&ststype=" + rangeList.get(j) +"&date=" + date;
				
				DocumentBuilderFactory dbFactoty1 = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder1 = dbFactoty1.newDocumentBuilder();
				Document doc1 = dBuilder1.parse(url);
				
				// boxof 태그안에만
				NodeList nList1 = doc1.getElementsByTagName("boxof");
		
				for (int k = 0; k < 10; k++) { // 상위 10개만
					Node node1 = nList1.item(k);
					if (node1.getNodeType() == Node.ELEMENT_NODE) {
						Element eElement1 = (Element) node1;
						String show_id	=  getTagValue("mt20id", eElement1);
						String area		=  getTagValue("area", eElement1);
						String prfdtcnt	=  getTagValue("prfdtcnt", eElement1);
						String prfpd	=  getTagValue("prfpd", eElement1);
						String cate	=  getTagValue("cate", eElement1);
						String prfplcnm	=  getTagValue("prfplcnm", eElement1);
						String prfnm	=  getTagValue("prfnm", eElement1);
						int rnum		=  Integer.parseInt(getTagValue("rnum", eElement1));
						int seatcnt		=  Integer.parseInt(getTagValue("seatcnt", eElement1));
						String poster	=  getTagValue("poster", eElement1);
						String date_range = rangeList.get(j);
						
						String urlShow = "http://www.kopis.or.kr/openApi/restful/pblprfr/" + 
								show_id + "?service=b3e488556abe4df29d325f391436027c";
		
						DocumentBuilderFactory dbFactoty2 = DocumentBuilderFactory.newInstance();
						DocumentBuilder dBuilder2 = dbFactoty2.newDocumentBuilder();
						Document doc2 = dBuilder2.parse(urlShow);
						
						NodeList nList2 = doc2.getElementsByTagName("db");
		
						for (int m = 0; m < nList2.getLength(); m++) {
							Node node2 = nList2.item(m);
							if (node2.getNodeType() == Node.ELEMENT_NODE) {
								Element eElement2 = (Element) node2;
								String thea_id	=  getTagValue("mt10id", eElement2);
								
								RankVO rankVO = new RankVO(show_id, thea_id, area, prfdtcnt, prfpd, 
										cate, prfplcnm, prfnm, rnum, seatcnt, poster, date_range, date);
								
								list.add(rankVO);
							}
						}
					}
				}
			}
			System.out.println("파싱 성공!!");
		} catch (Exception e) {
			System.out.println("데이터가 잘못되었습니다.");
			e.printStackTrace();
		}

		return list;
	}
	
	public List<RankVO> rankGenreApi(String date) { // 장르별 탑10 파싱
		List<RankVO> list = new ArrayList<>();
		List<String> genreList = new ArrayList<>(); 
		List<String> rangeList = new ArrayList<>();
		
		rangeList.add("day");
		rangeList.add("week");
		rangeList.add("month");
		
		genreList.add("AAAA");
		genreList.add("AAAB");
		genreList.add("BBBA");
		genreList.add("CCCA");
		genreList.add("CCCB");
		genreList.add("CCCC");
		genreList.add("EEEA");
		try {
			for(int i = 0; i < genreList.size(); i++) { // 장르 구분
				
				for (int j = 0; j < rangeList.size(); j++) {
					String url = "http://kopis.or.kr/openApi/restful/boxoffice?"
							+ "service=b3e488556abe4df29d325f391436027c&ststype=" + rangeList.get(j) + "&"
							+ "date=" + date + "&catecode=" + genreList.get(i);
					
					DocumentBuilderFactory dbFactoty1 = DocumentBuilderFactory.newInstance();
					DocumentBuilder dBuilder1 = dbFactoty1.newDocumentBuilder();
					Document doc1 = dBuilder1.parse(url);
					
					// boxof 태그안에만
					NodeList nList1 = doc1.getElementsByTagName("boxof");
			
					for (int k = 0; k < 10; k++) { // 상위 10개만
						Node node1 = nList1.item(k);
						if (node1.getNodeType() == Node.ELEMENT_NODE) {
							Element eElement1 = (Element) node1;
							String show_id	=  getTagValue("mt20id", eElement1);
							String area;
							if(getTagValue("area", eElement1) == null) {
								area = "";
							} else {
								area =  getTagValue("area", eElement1);
							}
							String prfdtcnt	=  getTagValue("prfdtcnt", eElement1);
							String prfpd	=  getTagValue("prfpd", eElement1);
							String cate	=  getTagValue("cate", eElement1);
							String prfplcnm	=  getTagValue("prfplcnm", eElement1);
							String prfnm	=  getTagValue("prfnm", eElement1);
							int rnum		=  Integer.parseInt(getTagValue("rnum", eElement1));
							int seatcnt		=  Integer.parseInt(getTagValue("seatcnt", eElement1));
							String poster	=  getTagValue("poster", eElement1);
							String date_range = rangeList.get(j);
							
							String urlShow = "http://www.kopis.or.kr/openApi/restful/pblprfr/" + 
									show_id + "?service=b3e488556abe4df29d325f391436027c";
			
							DocumentBuilderFactory dbFactoty2 = DocumentBuilderFactory.newInstance();
							DocumentBuilder dBuilder2 = dbFactoty2.newDocumentBuilder();
							Document doc2 = dBuilder2.parse(urlShow);
							
							NodeList nList2 = doc2.getElementsByTagName("db");
			
							for (int m = 0; m < nList2.getLength(); m++) {
								Node node2 = nList2.item(m);
								if (node2.getNodeType() == Node.ELEMENT_NODE) {
									Element eElement2 = (Element) node2;
									String thea_id	=  getTagValue("mt10id", eElement2);
									
									RankVO rankVO = new RankVO(show_id, thea_id, area, prfdtcnt, prfpd, 
											cate, prfplcnm, prfnm, rnum, seatcnt, poster, date_range, date);
									
									list.add(rankVO);
								}
							}
						}
					}
				}
			}
			System.out.println("파싱 성공!!");
		} catch (Exception e) {
			System.out.println("데이터가 잘못되었습니다.");
			e.printStackTrace();
		}

		return list;
	}


	private static String getTagValue(String tag, Element e) {
		if (e.getElementsByTagName(tag).item(0) == null) {
			return null;
		}
		NodeList nlList = e.getElementsByTagName(tag).item(0).getChildNodes();
		Node nValue = (Node) nlList.item(0);
		if (nValue == null)
			return null;
		return nValue.getNodeValue();
	}

	// 공연시간 파싱
	private Map<String, String> parsingTime(String timeStr) {
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
		}
		
		if(timeStr.equals("")) {
			timeMap.put("", "");
			return timeMap;
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
		
		return timeMap;
	}
}
