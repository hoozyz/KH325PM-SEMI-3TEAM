package user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import user.service.UserService;
import vo.User;

/**
 * 1. get 요청이 올 경우 -> 회원가입 페이지로 이동 2. post 요청이 올 경우 -> 회원가입 기능 동작
 */
@WebServlet(name = "enroll", urlPatterns = "/user/enroll")
public class UserEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserService service = new UserService();

	public String getServletName() {
		return "MemberEnrollServlet";
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			User user = new User();
			user.setUser_id(req.getParameter("newId").strip());
			user.setPw(req.getParameter("userPw").strip());
			user.setName(req.getParameter("userName").strip());
			user.setPhone(req.getParameter("phone").strip());
			user.setEmail(req.getParameter("email").strip());
			user.setAddr(req.getParameter("addr").strip());

			System.out.println("가입 요청 : " + user);

			int result = service.save(user);

			if (result > 0) {
				resp.sendRedirect(req.getContextPath() + "/");
				return;
			}

			req.setAttribute("msg", "회원가입 실패!! (code:101=DB이슈)");
			req.getRequestDispatcher("/").forward(req, resp);
			return;

		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("msg", "회원가입 실패!! (code:100 = 입력값 문제)");
			req.getRequestDispatcher("/").forward(req, resp);
			return;
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath() + "/"); // get 요청 튕겨내기!
	}
}
