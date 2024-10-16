package AcornStay;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/rv")
public class AcornStayReservationServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
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
	    HttpSession session = req.getSession();
	    String user_id = (String) session.getAttribute("id");
	    
	    if (user_id != null) {
	    	req.getRequestDispatcher("WEB-INF/views/rv.jsp").forward(req, resp);
		}else {
			req.getRequestDispatcher("WEB-INF/views/login.jsp").forward(req, resp);
		}
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		
		String id =  req.getParameter("id");
		String name =  req.getParameter("name");
		String nickname =  req.getParameter("nickname");
		String checkIn =  req.getParameter("checkIn");
		String checkOut =  req.getParameter("checkOut");
		String price =  req.getParameter("price");
		String guest =  req.getParameter("guest");
		
		AcornStayReservationDAO dao = new AcornStayReservationDAO();
		int result = dao.reservation(Integer.parseInt(id), name, nickname, Date.valueOf(checkIn), Date.valueOf(checkOut), Integer.parseInt(price), Integer.parseInt(guest));
		if (result == 1) {
			resp.sendRedirect("/MVC/main");
		}else {
			req.setAttribute("id", id);
			req.setAttribute("name", name);
			req.setAttribute("nickname", nickname);
			req.setAttribute("checkIn", checkIn);
			req.setAttribute("checkOut", checkOut);
			req.setAttribute("price", price);
			req.setAttribute("guest", guest);
			resp.sendRedirect("/MVC/rv");
		}
	}
}
