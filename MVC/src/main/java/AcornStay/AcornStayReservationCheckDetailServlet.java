package AcornStay;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/rvcheckDetail")
public class AcornStayReservationCheckDetailServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		
		req.getRequestDispatcher("WEB-INF/views/rvcheckdetail.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		
		int id =  Integer.parseInt(req.getParameter("id"));
		int acc_id =  Integer.parseInt(req.getParameter("accId"));
		String checkIn = req.getParameter("checkIn");
		String checkOut = req.getParameter("checkOut");
		
		req.setAttribute("id", id);
		req.setAttribute("acc_id", acc_id);
		req.setAttribute("checkIn", checkIn);
		req.setAttribute("checkOut", checkOut);
		
		req.getRequestDispatcher("WEB-INF/views/rvcheckdetail.jsp").forward(req, resp);
	}
}
