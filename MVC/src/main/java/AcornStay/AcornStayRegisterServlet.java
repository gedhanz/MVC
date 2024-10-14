package AcornStay;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class AcornStayRegisterServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		
		req.getRequestDispatcher("WEB-INF/views/register.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String name = req.getParameter("name");
		String birthdate = req.getParameter("birthdate");
		String phone = req.getParameter("phone");
		String nickname = req.getParameter("nickname");
		
		AcornStayUserDTO dto = new AcornStayUserDTO(username, password, name, birthdate, phone, nickname);
		
		AcornStayRegisterDAO dao = new AcornStayRegisterDAO();
		int result = dao.register(dto);
		if (result > 0) {
			resp.sendRedirect("/MVC/success");
		}else {
			resp.sendRedirect("/MVC/register");
		}
		
	}
}
