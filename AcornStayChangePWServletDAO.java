package AcornStay;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AcornStayChangePWServletDAO {
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
	
	public int register(String id, String password) {
		Connection connection = dbCon();
		String sql = "UPDATE users_mvc SET password = ? WHERE user_id=?   ";
		
		int result = 0;
		
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			
			pst.setString(1, password);
			pst.setString(2, id);
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
}
