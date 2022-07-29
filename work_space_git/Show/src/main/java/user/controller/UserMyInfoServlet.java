package user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.service.UserService;
import vo.User;

@WebServlet("/myInfo")
public class UserMyInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	UserService service = new UserService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("loginUser");
		String userId = user.getUser_id();

		// 나의 정보 가져오기
		User userInfo = service.findUserById(userId);

		if (userInfo != null) {
			req.setAttribute("user", userInfo);
			req.getRequestDispatcher("/views/user/myInfo.jsp").forward(req, resp);
			return;
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
