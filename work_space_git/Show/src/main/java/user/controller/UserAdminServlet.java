package user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.User;

@WebServlet(name="admin" , urlPatterns = "/admin")
public class UserAdminServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("loginUser");
		
		if(user.getRole().equals("ROLE_USER")) {
			req.setAttribute("msg", "관리자가 아닙니다!");
			resp.sendRedirect(req.getContextPath() + "/");
			return;
		} else {
			req.setAttribute("msg", "소식 관리페이지 입니다.");
			req.getRequestDispatcher("/board/news").forward(req, resp);
		}
	}
}
