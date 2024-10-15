package AcornStay;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/main")
public class AcornStayMainServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		
		AcornStayAccommodationDAO dao = new AcornStayAccommodationDAO();
		ArrayList<AcornStayAccommodationDTO> list = dao.getAllAccommodations();   
		
		req.setAttribute("list", list);    
		
		req.getRequestDispatcher("WEB-INF/views/main.jsp").forward(req, resp); 
	}
}
