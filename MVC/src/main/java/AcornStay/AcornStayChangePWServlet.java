package AcornStay;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/changePW")
public class AcornStayChangePWServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		
		req.getRequestDispatcher("WEB-INF/views/changePW.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		String id=req.getParameter("id");
		String pw = req.getParameter("pw");
		String changePw=req.getParameter("changePW");
		
		AcornStayChangePWServletDAO dao=new AcornStayChangePWServletDAO();
		if (dao.pwCheck(id, pw)) {
			dao.register(id, changePw);
			resp.sendRedirect("/MVC/mypage");
		}else {
			resp.sendRedirect("/MVC/changePW");
		}
		
		
	}
}
