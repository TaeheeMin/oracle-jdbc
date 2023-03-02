package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
	public static Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@193.122.124.61:8080:xe","admin","java1234Gdj58");
		//System.out.println("연결 성공");
		conn.setAutoCommit(false);
		return conn;
	}
}
