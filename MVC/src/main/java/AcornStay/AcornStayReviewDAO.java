package AcornStay;

import java.sql.Clob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AcornStayReviewDAO{
	String driver = "oracle.jdbc.driver.OracleDriver" ;
	String url="jdbc:oracle:thin:@localhost:1521:testdb";
	String user="scott";
	String password="tiger";
	int count = 1;
	
	
	private Connection dbCon() {		
		Connection con = null;
		try {
			Class.forName(driver);
			con =DriverManager.getConnection(url, user, password);
			if( con != null) { System.out.println("db ok");}
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return con;
	}
	
	public void review(String nickname, int acc_id, float star, String text) {
		Connection connection = dbCon();
		String sql = "INSERT INTO reviews_mvc VALUES (?,?,?,?,?,?)";
		Date date = new Date(System.currentTimeMillis());
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, count);
			pst.setString(2, nickname);
			pst.setInt(3, acc_id);
			pst.setDate(4, date);
			pst.setFloat(5, star);
			pst.setString(6, text);
			int result = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<AcornStayReviewDTO> getReview(int id) {
		Connection connection = dbCon();
		String sql = "select * from reviews_mvc where accommodation_id = ?";
		ArrayList<AcornStayReviewDTO> list = new ArrayList<AcornStayReviewDTO>();
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				list.add(new AcornStayReviewDTO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getDate(4), rs.getFloat(5), rs.getString(6)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
