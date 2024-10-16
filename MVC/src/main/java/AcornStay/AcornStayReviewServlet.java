package AcornStay;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/review")
public class AcornStayReviewServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		
		int acc_id = Integer.parseInt(req.getParameter("accId"));
		String dateTimeString1 = req.getParameter("checkIn");
		String dateString1 = dateTimeString1.split(" ")[0];
		Date checkIn = Date.valueOf(dateString1);
		String dateTimeString2 = req.getParameter("checkOut");
		String dateString2 = dateTimeString2.split(" ")[0];
		Date checkOut = Date.valueOf(dateString2);
		
		req.setAttribute("accId", acc_id);
		req.setAttribute("checkIn", checkIn);
		req.setAttribute("checkOut", checkOut);
		
		req.getRequestDispatcher("WEB-INF/views/review.jsp").forward(req, resp);
	}
}
