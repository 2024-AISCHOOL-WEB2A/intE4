package com.WCLProject.model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBUtil {
	private static final String URL = "jdbc:oracle:thin:@project-db-stu3.smhrd.com:1524:xe";
	private static final String USER = "Insa5_SpringA_hacksim_3";
	private static final String PASSWORD = "aishcool3";
	private static Connection conn;
	
	
	// DB연결
	public static Connection getConnection() throws SQLException, ClassNotFoundException {		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
			
			if (conn == null) {
				System.out.println("DB연결 실패...");
			} else {
				System.out.println("DB연결 성공!");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

		}
		return conn;
	}

	// DB연결 종료
	public static void closeConnection(ResultSet rs, PreparedStatement pst, Connection conn) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pst != null) {
				pst.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
