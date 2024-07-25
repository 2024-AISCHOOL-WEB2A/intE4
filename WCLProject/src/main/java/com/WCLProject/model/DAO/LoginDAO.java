package com.WCLProject.model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.WCLProject.model.DTO.MemberDTO;
import com.WCLProject.model.DTO.UserMemberDTO;
import com.WCLProject.model.DTO.VendorMemberDTO;

public class LoginDAO {
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;

	// 데이터베이스 연결
	public void connect() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String url = "jdbc:oracle:thin:@project-db-stu3.smhrd.com:1524:xe";
			String user = "Insa5_SpringA_hacksim_3";
			String password = "aishcool3";

			conn = DriverManager.getConnection(url, user, password);

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

	}

	// 데이터베이스 연결 종료_rs,pst 나영 추가
	public void close() {
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

	// 로그인 기능
	public MemberDTO login(String id, String pw) {
		connect();
		MemberDTO member = null;
		String sql = "SELECT CASE\r\n"
				+ "    WHEN EXISTS (SELECT 1 FROM users WHERE user_id = ?) THEN 'Found in users'\r\n"
				+ "    WHEN EXISTS (SELECT 1 FROM vendor WHERE vendor_id = ?) THEN 'Found in vendor'\r\n"
				+ "    ELSE 'Not found'\r\n" + "END AS result\r\n" + "FROM dual";
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			pst.setString(2, id);
			rs = pst.executeQuery();
			
			if (rs.next()) {
				if (rs.getString(1).equals("Found in users")) {
					sql = "SELECT * FROM USERS WHERE USER_ID = ? AND USER_PW = ?";
					pst = conn.prepareStatement(sql);
					pst.setString(1, id);
					pst.setString(2, pw);
					rs = pst.executeQuery();
					if (rs.next()) { 
						member = new UserMemberDTO(
							rs.getString("USER_ID"), 
							rs.getString("USER_PW"),
							rs.getString("USER_NAME"), 
							rs.getString("USER_RRN"),
							rs.getString("USER_TEL"), 
							rs.getString("USER_NICK"),
							rs.getString("USER_EMAIL"), 
							rs.getString("USER_ADDRESS"),
							rs.getString("USER_JOIN"), 
							rs.getString("USER_REFERRER")); 
						}
					return member;
				} else if (rs.getString(1).equals("Found in vendor")) {
					sql = "SELECT * FROM VENDOR WHERE VENDOR_ID = ? AND VENDOR_PW = ?";
					pst = conn.prepareStatement(sql);
					pst.setString(1, id);
					pst.setString(2, pw);
					rs = pst.executeQuery();
		            if (rs.next()) {
		            	member = new VendorMemberDTO(
		                    rs.getString("VENDOR_ID"),
		                    rs.getString("VENDOR_PW"),
		                    rs.getString("VENDOR_NAME"),
		                    rs.getString("VENDOR_TEL"),
		                    rs.getString("VENDOR_EMAIL"),
		                    rs.getString("VENDOR_ADDRESS"),
		                    rs.getString("VENDOR_LICENSE"),
		                    rs.getString("VENDOR_CATEGORY"),
		                    rs.getString("VENDOR_LICENSE_IMAGE"),
		                    rs.getString("VENDOR_LOGO_IMAGE"),
		                    rs.getString("VENDOR_INTRO"),
		                    rs.getString("VENDOR_SITE_URL")
		                );
		            }
		            return member;
				} else {
					return null;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return null;
	}
}
