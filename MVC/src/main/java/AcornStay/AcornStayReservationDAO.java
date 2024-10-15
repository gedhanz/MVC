package AcornStay;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AcornStayReservationDAO {
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
	
	public int reservation(int id, String name, String nickname, Date checkIn, Date checkOut, int price, int guest) {
		Connection connection = dbCon();
		String sql = "insert into reservations_mvc values (?,?,?,?,?,?,?,?)";
		int result = 0;
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, count);
			count++;
			pst.setInt(2, id);
			pst.setString(3, name);
			pst.setString(4, nickname);
			pst.setDate(5, checkIn);
			pst.setDate(6, checkOut);
			pst.setInt(7, price);
			pst.setInt(8, guest);
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<AcornStayReservationDTO> getReservation(String id) {
		Connection connection = dbCon();
		String sql = "select * from reservations_mvc where user_id = ?";
		ArrayList<AcornStayReservationDTO> list = new ArrayList<AcornStayReservationDTO>();
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setString(1, id);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				list.add(new AcornStayReservationDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public String getaccName(int id) {
		Connection connection = dbCon();
		String sql = "select accommodation_name from accommodations_mvc where accommodation_id = ?";
		String name = null;
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				name = rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return name;
	}
	
	
	
	
}
