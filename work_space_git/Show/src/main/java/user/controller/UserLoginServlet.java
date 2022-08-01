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
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath()+"/showHome.jsp"); // get 요청 튕겨내기!
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userId = req.getParameter("userId");
		String userPwd = req.getParameter("userPw");
		
		User loginUser = service.login(userId, userPwd);
		
		if(loginUser != null) { // 로그인 성공한 경우
			HttpSession session = req.getSession();
			session.setAttribute("loginUser", loginUser); // 세션에 loginUser 정보 저장 
			resp.sendRedirect(req.getContextPath() + "/showHome.jsp"); 
		}else { // 로그인 실패한 경우
			req.setAttribute("msg", "사용자의 아이디나 비밀번호가 맞지 않습니다.");
			req.getRequestDispatcher("/showHome.jsp").forward(req, resp);
		}
	}
}









