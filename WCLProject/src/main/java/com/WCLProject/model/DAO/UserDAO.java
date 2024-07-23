package com.WCLProject.model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.WCLProject.model.DTO.UserVO;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;

	// 데이터베이스 연결기능cz
	public void connect() {

		try {
			// 1. OracleDriver 동적 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// 2. Connection객체 생성(DB연결)
			// -url, user, password 필요

			String url = "jdbc:oracle:thin:@project-db-stu3.smhrd.com:1524:xe";
			String user = "Insa5_SpringA_hacksim_3";
			String password = "aishcool3";

			conn = DriverManager.getConnection(url, user, password);
			// 커넥트 객체 생성했으니까 선언만 해줌

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

	// 데이터베이스 연결 종료 기능
	public void close() {

		try {
			if (rs != null) {
				rs.close();
			}
			if (pst != null) {
				pst.close();
			}
			if (conn != null) {
				conn.close(); // 연결을 끊어주는
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public UserVO login(String user_id, String user_pw) {
		UserVO vo = null;

		connect();

		try {
			String sql = "SELECT * FROM USERS WHERE USER_ID = ? AND USER_PW = ?";
			pst = conn.prepareStatement(sql);

			pst.setString(1, user_id);
			pst.setString(2, user_pw);

			rs = pst.executeQuery();

			if (rs.next()) {
				String user_name = rs.getString("USER_NAME");
				String user_rrn = rs.getString("USER_RRN");
				String user_tel = rs.getString("USER_TEL");
				String user_nick = rs.getString("USER_NICK");
				String user_email = rs.getString("USER_EMAIL");
				String user_address = rs.getString("USER_ADDRESS");
				String user_join = rs.getString("USER_JOIN");
				String user_referrer = rs.getString("USER_REFERRER");

				vo = new UserVO(user_id, user_pw, user_name, user_rrn, user_tel, user_nick, user_email, user_address,
						user_join, user_referrer);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return vo;
	}

}
