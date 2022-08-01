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

@WebServlet("/user/delete")
public class UserDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UserService service = new UserService();
	
	@Override
	public String getServletName() {
		return "UserDeleteServlet";
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			User loginUser = (User) session.getAttribute("loginUser");
			if(loginUser == null) {
				req.setAttribute("msg", "잘못된 접근입니다.");
				req.getRequestDispatcher("/showHome.jsp").forward(req, resp);
				return;
			}
			
			int result = service.delete(loginUser.getUser_id());
			
			if(result > 0) {
				req.setAttribute("msg", "회원탈퇴에 성공하였습니다.");
				req.getRequestDispatcher("/logout").forward(req, resp);
				return;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		req.setAttribute("msg", "회원 탈퇴에 실패하였습니다.");
		req.getRequestDispatcher("/logout").forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
