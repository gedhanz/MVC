package AcornStay;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/reviewDB")
public class AcornStayReviewDBServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		
		String nickname = req.getParameter("nickname");
		int id = Integer.parseInt(req.getParameter("accId"));
		float star = Float.parseFloat(req.getParameter("starpoint"));
		String text = req.getParameter("text");
		AcornStayReviewDAO dao = new AcornStayReviewDAO();
		dao.review(nickname, id, star, text);
		AcornStayAccommodationDAO aDao = new AcornStayAccommodationDAO();
		ArrayList<Float> list = aDao.getAllRating(id);
		float rs = 0;
		for (Float float1 : list) {
			rs += float1;
		}
		rs += aDao.getAccRating(id);
		float result = rs / (list.size() + 1);
		aDao.average_rating(Math.round(result*10)/10.0, id);
		
		resp.sendRedirect("/MVC/rvcheck");
	}
}
