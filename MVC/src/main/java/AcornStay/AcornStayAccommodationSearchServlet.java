package AcornStay;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/search")
public class AcornStayAccommodationSearchServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		
		 String region = req.getParameter("region");
	     int guest = Integer.parseInt(req.getParameter("guest"));
	     Date checkIn = Date.valueOf(req.getParameter("check_in"));
	     Date checkOut = Date.valueOf(req.getParameter("check_out"));
	     
	     AcornStayAccommodationDAO dao = new AcornStayAccommodationDAO();
	     ArrayList<AcornStayAccommodationDTO> list = dao.search(region, guest, checkIn, checkOut);
	     
	     req.setAttribute("list", list);
	     req.setAttribute("region", region);
	     req.setAttribute("guest", guest);
	     req.setAttribute("check_in", checkIn);
	     req.setAttribute("check_out", checkOut);
	     req.setAttribute("sort_by", "default");
	     
	     req.getRequestDispatcher("WEB-INF/views/searchlist.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		
		String region = req.getParameter("region");
	    int guest = Integer.parseInt(req.getParameter("guest"));
	    Date checkIn = Date.valueOf(req.getParameter("check_in"));
	    Date checkOut = Date.valueOf(req.getParameter("check_out"));
	    String sortBy = req.getParameter("sort_by");
		
		AcornStayAccommodationDAO dao = new AcornStayAccommodationDAO();
	    ArrayList<AcornStayAccommodationDTO> list = dao.sortSearch(region, guest, checkIn, checkOut, sortBy);
	    
	    req.setAttribute("list", list);
	    req.setAttribute("region", region);
	    req.setAttribute("guest", guest);
	    req.setAttribute("check_in", checkIn);
	    req.setAttribute("check_out", checkOut);
	    req.setAttribute("sort_by", sortBy);
		
	    req.getRequestDispatcher("WEB-INF/views/searchlist.jsp").forward(req, resp);
		
	}
}
