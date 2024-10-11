package AcornStay;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/detail")
public class AcornStayAccommodationDetailServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		
		String id = req.getParameter("id");
		
		AcornStayAccommodationDAO dao = new AcornStayAccommodationDAO();
		AcornStayAccommodationDTO dto = dao.getAccommodation(Integer.parseInt(id));
		
		req.setAttribute("dto", dto);
		
		req.getRequestDispatcher("WEB-INF/views/detail.jsp").forward(req, resp);
		
	}
}
