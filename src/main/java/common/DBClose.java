package common;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBClose {

 public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs){	//DQL close()
	 try {
		 rs.close();
		pstmt.close();
		conn.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
 }
 public static void close(Connection conn, Statement stmt) { //DML close()
	 try {
		 stmt.close();
		 conn.close();
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
 }
 

}
