package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBSet {
	static Connection conn;

	public static Connection getConnection() {
		String url = "jdbc:oracle:thin:@localhost:1521:XE";
		String vUser = "hr";
		String vPassword = "hr";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, vUser, vPassword);

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

}
