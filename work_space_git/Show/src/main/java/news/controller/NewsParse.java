package news.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class NewsParse {

	public String imageSearch(String clientId, String secret, String _url) { // 이미지 파싱 (검색어을 가지고)
		HttpURLConnection con = null;
		String imageUrl = "https://openapi.naver.com/v1/search/image?display=1&sort=sim&filter=medium&query="; // 이미지 1개만
		String result = "";

		try {
			URL url = new URL(imageUrl + _url);
			con = (HttpURLConnection) url.openConnection();

			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", secret);

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK)
				result = readBody(con.getInputStream());
			else
				result = readBody(con.getErrorStream());

		} catch (Exception e) {
			System.out.println("연결 오류 : " + e);
		} finally {
			con.disconnect();
		}

		return result;
	}

	public String newsSearch(String clientId, String secret, String _url) {
		HttpURLConnection con = null;
		String newsUrl = "https://openapi.naver.com/v1/search/news.json?display=100&query=";
		String result = "";

		try {
			URL url = new URL(newsUrl + _url);
			con = (HttpURLConnection) url.openConnection();

			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", secret);

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK)
				result = readBody(con.getInputStream());
			else
				result = readBody(con.getErrorStream());

		} catch (Exception e) {
			System.out.println("연결 오류 : " + e);
		} finally {
			con.disconnect();
		}

		return result;
	}

	public String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}

			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}

	public Map<String, Object> getResult(String response, String[] fields) {
		Map<String, Object> rtnObj = new HashMap<>();

		try {
			JSONParser parser = new JSONParser();
			JSONObject result = (JSONObject) parser.parse(response);

			rtnObj.put("total", (long) result.get("total"));

			JSONArray items = (JSONArray) result.get("items");
			List<Map<String, Object>> itemList = new ArrayList<>();
			Thread.sleep(40); // 네이버 api 1초에 10건 제한으로 sleep 으로 코드 안끊기게

			for (int i = 0; i < items.size(); i++) {
				JSONObject item = (JSONObject) items.get(i);
				Map<String, Object> itemMap = new HashMap<>();

				for (String field : fields) {
					itemMap.put(field, item.get(field));
				}
				itemList.add(itemMap);
			}

			rtnObj.put("result", itemList);
		} catch (Exception e) {
		}
		
		return rtnObj;
	}

	// 문자열 html 태그 제거 알고리즘
	public static String htmlRemove(String data) {
		// [리턴 데이터 변수 선언 실시]
		String result = "";

		// [문자열 데이터 널 판단 수행 실시]
		if (data != null && data.length() > 0 && data.trim().equals("") == false && data.trim().equals("null") == false
				&& data.trim().equals("undefined") == false) { // [널이 아닌 경우]

			try {
				String tag_pattern = "<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>"; // [<p> 등 태그 제거]
				Pattern num_reg_entity_pattern = Pattern.compile("&#[0-9]+;"); // [&#09; 형태 제거]
				Pattern char_reg_entity_pattern = Pattern.compile("&[a-zA-Z]+;"); // [&amp; 형태 제거]
				Pattern char_normal_entity_pattern = Pattern.compile(" [a-zA-Z]+;"); // [amp; 형태 제거]

				// [html 태그 1차 제거 실시]
				result = data.replaceAll(tag_pattern, " ");

				// [html 태그 2차 제거 실시]
				Matcher num_reg_mat = num_reg_entity_pattern.matcher(result);
				result = num_reg_mat.replaceAll("");

				Matcher char_reg_mat = char_reg_entity_pattern.matcher(result);
				result = char_reg_mat.replaceAll("");

				Matcher char_normal_mat = char_normal_entity_pattern.matcher(result);
				result = char_normal_mat.replaceAll("");

				// [html 태그 연속 공백 제거 실시]
				result = result.replaceAll("\\s+", " ");

				// [문자열 양쪽 끝 공백 제거 실시]
				result = result.trim();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
}