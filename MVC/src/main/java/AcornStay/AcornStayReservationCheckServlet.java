package AcornStay;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/rvcheck")
public class AcornStayReservationCheckServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		
		AcornStayReservationDAO dao = new AcornStayReservationDAO();
		HttpSession session = req.getSession();
		ArrayList<AcornStayReservationDTO> list = dao.getReservation((String)session.getAttribute("id"));
		
		req.setAttribute("list", list);
		
		req.getRequestDispatcher("WEB-INF/views/rvcheck.jsp").forward(req, resp);
	}
}
