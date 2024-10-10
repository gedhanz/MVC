package AcornStay;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AcornStayRegisterDAO {
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
	
	public int register(AcornStayUserDTO dto) {
		Connection connection = dbCon();
		String sql = "INSERT INTO users_mvc VALUES (?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?, ?)";
		int result = 0;
		
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setString(1, dto.getUser_id());
			pst.setString(2, dto.getPassword());
			pst.setString(3, dto.getName());
			pst.setString(4, dto.getDate().substring(0, 4) + "-" + dto.getDate().substring(4, 6) + "-" + dto.getDate().substring(6, 8));
			pst.setString(5, dto.getPhone().substring(0, 3) + "-" + dto.getPhone().substring(3, 7) + "-" + dto.getPhone().substring(7, 11));
			pst.setString(6, dto.getNickname());
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
}
