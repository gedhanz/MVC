package AcornStay;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import oracle.net.aso.c;

public class AcornStayDAO {
	
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
	
	public boolean loginCheck(String id, String pw) {
		Connection connection = dbCon();
		
		String sql = "select user_id, password from users_mvc";
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				String checkid = rs.getString(1);
				String checkpw = rs.getString(2);
				if (checkid.equals(id) && checkpw.equals(pw)) {
					return true;
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public String findNickname(String id) {
		Connection connection = dbCon();
		String sql = "select nickname from users_mvc where user_id = ?";
		String nickname = null;
		try {
			PreparedStatement pst = connection.prepareStatement(sql);
			pst.setString(1, id);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				nickname = rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return nickname;
	}
	
}
