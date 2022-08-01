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


@WebServlet("/user/update")
public class UserUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UserService service = new UserService();
	
	
	@Override
	public String getServletName() {
		return "MemberUpdateServlet";
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			User loginUser = (User) session.getAttribute("loginUser");
			if(loginUser == null) {
				req.setAttribute("msg", "잘못된 접근입니다.");
				req.getRequestDispatcher("/showHome.jsp").forward(req, resp);
				return;
			}
			User newUser = new User();
			newUser.setUser_id(loginUser.getUser_id());
			newUser.setRole(loginUser.getRole());
			
			// 바뀐 정보 없을 때
			if (req.getParameter("userPw").equals("")){ 
				newUser.setPw(loginUser.getPw());
			}
			if (req.getParameter("userName").equals("")){ 
				newUser.setName(loginUser.getPw());
			}
			if (req.getParameter("email").equals("")){ 
				newUser.setEmail(loginUser.getEmail());
			}
			if (req.getParameter("phone").equals("")){ 
				newUser.setPhone(loginUser.getPhone());
			}
			if (req.getParameter("addr").equals("")){ 
				newUser.setAddr(loginUser.getAddr());
			}
			
			// 바뀐정보 있을 때
			if(req.getParameter("userPw").equals("") == false) {
				newUser.setPw(req.getParameter("userPw"));
			} 
			if(req.getParameter("userName").equals("") == false) {
				newUser.setName(req.getParameter("userName"));
			}
			if(req.getParameter("email").equals("") == false) {
				newUser.setEmail(req.getParameter("email"));
			}
			if(req.getParameter("phone").equals("") == false) {
				newUser.setPhone(req.getParameter("phone"));
			}
			if(req.getParameter("addr").equals("") == false) {
				newUser.setAddr(req.getParameter("addr"));
			}
			
			int result = service.save(newUser);
			
			if(result > 0 ) { // 업데이트 성공
				newUser = service.findUserById(newUser.getUser_id());
				session.setAttribute("loginUser", newUser); // 세션 변경
				
				req.setAttribute("msg", "회원정보를 수정하였습니다.");
				req.getRequestDispatcher("/views/user/myInfo.jsp").forward(req, resp);
			}else{
				req.setAttribute("msg", "회원정보를 수정할 수 없습니다.");
				req.getRequestDispatcher("/views/user/myInfo.jsp").forward(req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("msg", "인자가 잘못되었습니다.");
			req.getRequestDispatcher("/views/user/myInfo.jsp").forward(req, resp);
		}
	}
}






