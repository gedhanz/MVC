package AcornStay;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AcornStayAccommodationDAO {
	String driver = "oracle.jdbc.driver.OracleDriver" ;
	String url="jdbc:oracle:thin:@localhost:1521:testdb";
	String user="scott";
	String password="tiger";
	
	
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
	
	public ArrayList<AcornStayAccommodationDTO> getAllAccommodations() {
		Connection connection = dbCon();
		String sql = "select * from accommodations_mvc";
		ArrayList<AcornStayAccommodationDTO> list = new ArrayList<AcornStayAccommodationDTO>();
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				list.add(new AcornStayAccommodationDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getFloat(5),rs.getInt(6),rs.getString(7),rs.getString(8)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public AcornStayAccommodationDTO getAccommodation(int id) {
		Connection connection = dbCon();
		String sql = "select * from accommodations_mvc where accommodation_id = ?";
		AcornStayAccommodationDTO dto = new AcornStayAccommodationDTO();
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				dto.setId(id);
				dto.setRegion(rs.getString(2));
				dto.setDetail_location(rs.getString(3));
				dto.setPrice(rs.getInt(4));
				dto.setRate(rs.getFloat(5));
				dto.setMax_occupancy(rs.getInt(6));
				dto.setName(rs.getString(7));
				dto.setImage(rs.getString(8));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
	
	public ArrayList<AcornStayAccommodationImageDTO> getImages(int accommodation_id) {
		Connection connection = dbCon();
		String sql = "select * from accommodation_images where accommodation_id = ?";
		ArrayList<AcornStayAccommodationImageDTO> list = new ArrayList<AcornStayAccommodationImageDTO>();
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setInt(1, accommodation_id);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				list.add(new AcornStayAccommodationImageDTO(rs.getInt(1),rs.getInt(2),rs.getString(3)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<AcornStayAccommodationDTO> search(String region, int guestCount, Date checkIn, Date checkOut) {
		Connection connection = dbCon();
		String sql = "SELECT * FROM accommodations_mvc a " +
                "LEFT JOIN reservations_mvc r ON a.accommodation_id = r.accommodation_id " +
                "WHERE a.region = ? " +
                "AND a.max_occupancy >= ? " +
                "AND (r.accommodation_id IS NULL " +
                "OR (r.check_in > ? OR r.check_out <= ?))" +
                "ORDER BY a.accommodation_name";
		ArrayList<AcornStayAccommodationDTO> list = new ArrayList<AcornStayAccommodationDTO>();
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setString(1, region);
            pst.setInt(2, guestCount);
            pst.setDate(3, checkOut);  
            pst.setDate(4, checkIn);   
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				list.add(new AcornStayAccommodationDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getFloat(5),rs.getInt(6),rs.getString(7),rs.getString(8)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<AcornStayAccommodationDTO> sortSearch(String region, int guestCount, Date checkIn, Date checkOut, String sortBy) {
		Connection connection = dbCon();
		String sql = "SELECT * FROM accommodations_mvc a " +
                "LEFT JOIN reservations_mvc r ON a.accommodation_id = r.accommodation_id " +
                "WHERE a.region = ? " +
                "AND a.max_occupancy >= ? " +
                "AND (r.accommodation_id IS NULL " +
                "OR (r.check_in > ? OR r.check_out <= ?))";
		switch (sortBy) {
        case "price_asc":
            sql += " ORDER BY a.price ASC";
            break;
        case "price_desc":
            sql += " ORDER BY a.price DESC";
            break;
        case "rating_desc":
            sql += " ORDER BY a.average_rating DESC";
            break;
        default:
            sql += " ORDER BY a.accommodation_name";  // 기본순
            break;
		}
		ArrayList<AcornStayAccommodationDTO> list = new ArrayList<AcornStayAccommodationDTO>();
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setString(1, region);
            pst.setInt(2, guestCount);
            pst.setDate(3, checkOut);  
            pst.setDate(4, checkIn);   
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				list.add(new AcornStayAccommodationDTO(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getInt(4),rs.getFloat(5),rs.getInt(6),rs.getString(7),rs.getString(8)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
}
