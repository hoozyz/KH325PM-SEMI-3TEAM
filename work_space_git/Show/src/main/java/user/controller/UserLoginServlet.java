package user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.service.UserService;
import vo.User;

@WebServlet(name="login", urlPatterns="/login")
public class UserLoginServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private UserService service = new UserService();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId = req.getParameter("userId");
		String userPw = req.getParameter("userPw");
		
		User loginUser = service.login(userId, userPw);
		
		if(loginUser != null) { // 로그인 성공한 경우
			HttpSession session = req.getSession();
			session.setAttribute("loginUser", loginUser); // 세션에 loginUser 정보 저장 
			resp.sendRedirect(req.getContextPath() + "/"); 
		}else { // 로그인 실패한 경우
			resp.sendRedirect(req.getContextPath() + "/");
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath()+"/"); // get 요청 튕겨내기!
	}
}









