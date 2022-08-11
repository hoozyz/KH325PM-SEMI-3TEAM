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

@WebServlet("/kakao")
public class UserKakaoServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	UserService service = new UserService();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId = req.getParameter("userId");
		System.out.println(userId);
		User user = new User(userId, "", "kakao", "", "", "", "");
		
		int result = service.save(user);
		
		if(result > 0) {
			HttpSession session = req.getSession();
			session.setAttribute("loginUser", user);
			return;
		}
		
		resp.sendRedirect(req.getContextPath() +"/");
		return;
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath()+"/");
	}
}
