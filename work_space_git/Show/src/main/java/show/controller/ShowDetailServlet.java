package show.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.service.ReviewService;
import show.service.ShowService;
import vo.Review;
import vo.Seat;
import vo.Show;

@WebServlet(name = "showDetail", urlPatterns = "/showDetail")
public class ShowDetailServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	ShowService showService = new ShowService();
	ReviewService revService = new ReviewService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String showId =  (String) req.getParameter("showId");
		
		Show show = showService.findShowById(showId);
		Map<String, String> map = parse(show.getPcseguidance());
		
		Set<String> set = map.keySet();
		List<String> sList = new ArrayList<>(set);
		
		List<String> priceList = new ArrayList<>();
		
		for (String key : map.values()) {
			  priceList.add(key);
		}
		
		if(show != null) {
			req.setAttribute("show", show);
			req.setAttribute("sList",sList);
			req.setAttribute("priceList", priceList);
		} else {
			req.setAttribute("msg", "공연 id 오류입니다.");
			req.getRequestDispatcher("/showHome.jsp").forward(req, resp);
			return;
		}
		
		
//		req.getRequestDispatcher("/views/show/showDetail.jsp").forward(req, resp);
		
		
		List<Review> revList = new ArrayList<>();
		
		
		revList = revService.findReviewByShowId(showId);
		
		if(revList != null) {
			req.setAttribute("revList", revList);
			req.getRequestDispatcher("/views/show/showDetail.jsp").forward(req, resp);
			return;
		} else {
			req.setAttribute("msg", "이 공연은 리뷰 내역이 없습니다.");
			req.getRequestDispatcher("/views/show/showDetail.jsp").forward(req, resp);
			return;
		}
		
			
	} 
	public List<Seat> parsing(String str){
		String[] array = str.split(", ");
		List<Seat> slist = new ArrayList<>();
		for(String info : array) {
			if(info.contains("무료")) {
				slist.add(new Seat("무료", 0));
			}else {
				try {
					String[] array2 = info.split(" ");
					String name = array2[0];
					int cost = Integer.parseInt(array2[1].replace(",", "").replace("원", ""));
					slist.add(new Seat(name, cost));
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return slist;
	}
	
	public Map<String, String> parse(String test) {
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
		
		return map;
//		Set<String> seat = map.keySet();
//		List<String> seatList = new ArrayList<>(seat);
//		
//		System.out.println(map);
//		System.out.println(seatList.get(0)); 
//		System.out.println(map.values());
	}
}
