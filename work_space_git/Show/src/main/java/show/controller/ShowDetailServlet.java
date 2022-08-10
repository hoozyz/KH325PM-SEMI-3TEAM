package show.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.controller.PageInfo;
import like.service.LikeService;
import review.service.ReviewService;
import show.service.ShowService;
import vo.Review;
import vo.Seat;
import vo.Show;
import vo.User;

@WebServlet(name = "showDetail", urlPatterns = "/showDetail")
public class ShowDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ShowService showService = new ShowService();
	ReviewService revService = new ReviewService();
	LikeService likeService = new LikeService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("loginUser");
		String userId = user.getUser_id();
		String showId = (String) req.getParameter("showId");
		Show show = showService.findShowById(showId);
		Set<String> set = null;
		List<String> sList = null;
		Map<String, String> map = null;

		List<String> priceList = new ArrayList<>();
		
		int likeCheck = likeService.likeCheck(showId, userId);
		req.setAttribute("likeCheck", likeCheck);

		if (show.getPcseguidance().equals("전석무료")) {
			map = parse(show.getPcseguidance());

			set = map.keySet();
			sList = new ArrayList<>(set);

			for (String key : map.values()) {
				priceList.add(key);
			}
		}

		if (show != null) {
			req.setAttribute("show", show);
			req.setAttribute("sList", sList);
			req.setAttribute("priceList", priceList);
		}

		// 별점
		if (revService.getStar(showId) != null) {
			String stars = revService.getStar(showId);
			if (stars.length() == 1) {
				show.setShow_star(stars + ".0");
			} else {
				show.setShow_star(stars);
			}
		} else {
			show.setShow_star("0");
		}

		int page = 1;
		int revCount = 0;
		String sort = "";
		if (req.getParameter("sort") == null) {
			sort = "new";
		} else {
			sort = req.getParameter("sort");
		}
		PageInfo pageInfo = null;
		List<Review> revList = new ArrayList<>();

		revCount = revService.getRevCount(showId);
		pageInfo = new PageInfo(page, 5, revCount, 5);

		revList = revService.findAllByShowId(showId, pageInfo, sort);

		req.setAttribute("pageInfo", pageInfo);
		req.setAttribute("revCount", revCount);

		// 별점 당 개수
		int count1 = revService.getCount1(showId);
		int count2 = revService.getCount2(showId);
		int count3 = revService.getCount3(showId);
		int count4 = revService.getCount4(showId);
		int count5 = revService.getCount5(showId);

		req.setAttribute("count1", count1);
		req.setAttribute("count2", count2);
		req.setAttribute("count3", count3);
		req.setAttribute("count4", count4);
		req.setAttribute("count5", count5);

		if (revList != null) {
			req.setAttribute("revList", revList);
			req.getRequestDispatcher("/views/show/showDetail.jsp").forward(req, resp);
			return;
		} else {
			req.setAttribute("msg", "이 공연은 리뷰 내역이 없습니다.");
			req.getRequestDispatcher("/views/show/showDetail.jsp").forward(req, resp);
			return;
		}
	}

	public List<Seat> parsing(String str) {
		String[] array = str.split(", ");
		List<Seat> slist = new ArrayList<>();
		for (String info : array) {
			if (info.contains("무료")) {
				slist.add(new Seat("무료", 0));
			} else {
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
		while (true) {
			list.add(test.indexOf("석", result)); // 1
			result = test.indexOf("석", result) + 1;

			if (test.indexOf("석", result) == -1) {
				break;
			}
		}

		result = list.size();

		String[] testArr = new String[result];
		String[] testArr1 = new String[result];
		Map<String, String> map = new HashMap<>();

		if (result == 1) {
			testArr = test.split(" ");
			for (int i = 0; i < testArr.length; i++) {

				if (testArr.length > 2) {
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

		for (int i = 0; i < testArr.length; i++) {
			testArr1 = testArr[i].split(" ");

			if (testArr1.length > 2) {
				for (int j = 0; j < testArr1.length; j++) {
					String str1 = testArr1[0] + "-" + testArr1[1];
					map.put(str1, testArr1[2]);
				}
			} else {
				map.put(testArr1[0], testArr1[1]);
			}
		}

		return map;
	}
}
