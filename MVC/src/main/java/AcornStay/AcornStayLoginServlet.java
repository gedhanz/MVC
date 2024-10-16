package AcornStay;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class AcornStayLoginServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		
		req.getRequestDispatcher("WEB-INF/views/login.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		
        String id = req.getParameter("id");
        String password = req.getParameter("password");

        AcornStayUserDAO aDao = new AcornStayUserDAO();
        if (aDao.loginCheck(id, password)) {
        	HttpSession session = req.getSession();
            session.setAttribute("nickname", aDao.findNickname(id));
            session.setAttribute("id", id);
        	resp.sendRedirect("/MVC/main");
		}else {
			
			resp.sendRedirect("/MVC/login");
		}
        
        
	}
}
