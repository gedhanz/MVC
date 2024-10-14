package AcornStay;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/deleteID")
public class AcornStayDeleteIDServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		
		AcornStayUserDAO dao = new AcornStayUserDAO();
		dao.deleteID(id);
		
		if (session != null) {
        	session.invalidate();
        }
		
		req.getRequestDispatcher("WEB-INF/views/deleteID.jsp").forward(req, resp);
	}
}
