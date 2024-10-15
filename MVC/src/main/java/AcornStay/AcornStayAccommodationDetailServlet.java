package AcornStay;

import java.io.IOException;
import java.sql.Date;

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
		String region = req.getParameter("region");
	    int guest = Integer.parseInt(req.getParameter("guest"));
	    Date checkIn = Date.valueOf(req.getParameter("check_in"));
	    Date checkOut = Date.valueOf(req.getParameter("check_out"));
		
		AcornStayAccommodationDAO dao = new AcornStayAccommodationDAO();
		AcornStayAccommodationDTO dto = dao.getAccommodation(Integer.parseInt(id));
		
		req.setAttribute("dto", dto);
	    req.setAttribute("region", region);
	    req.setAttribute("guest", guest);
	    req.setAttribute("check_in", checkIn);
	    req.setAttribute("check_out", checkOut);
		
		req.getRequestDispatcher("WEB-INF/views/detail.jsp").forward(req, resp);
		
	}
}
