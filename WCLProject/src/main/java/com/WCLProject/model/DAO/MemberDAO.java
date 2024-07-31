package com.WCLProject.model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.WCLProject.model.DTO.UserMemberDTO;
import com.WCLProject.model.DTO.VendorMemberDTO;

public class MemberDAO {
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

	// 회원가입_기업 기능
	public int vendorMemberJoin(VendorMemberDTO vendor) {
		int cnt = 0;
		connect();

		String sql = "INSERT INTO VENDOR (VENDOR_ID, VENDOR_PW, VENDOR_NAME, VENDOR_TEL, VENDOR_EMAIL, VENDOR_ADDRESS, VENDOR_LICENSE, VENDOR_CATEGORY, VENDOR_LICENSE_IMAGE, VENDOR_LOGO_IMAGE, VENDOR_INTRO, VENDOR_SITE_URL, VENDOR_JOIN) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, vendor.getId());
			pst.setString(2, vendor.getPw());
			pst.setString(3, vendor.getName());
			pst.setString(4, vendor.getTel());
			pst.setString(5, vendor.getEmail());
			pst.setString(6, vendor.getAddress());
			pst.setString(7, vendor.getLicense());
			pst.setString(8, vendor.getCategory());
			pst.setString(9, vendor.getLicense_image());
			pst.setString(10, vendor.getLogo_image());
			pst.setString(11, vendor.getIntro());
			pst.setString(12, vendor.getSite_url());
			pst.setTimestamp(13, new Timestamp(System.currentTimeMillis()));

			cnt = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;
	}

	// 회원가입_개인 기능
	public int userMemberJoin(UserMemberDTO user) {
		int cnt = 0;
		connect();

		String sql = "INSERT INTO USERS (USER_ID, USER_PW, USER_NAME, USER_RRN, USER_TEL, USER_NICK, USER_EMAIL, USER_ADDRESS, USER_JOIN, USER_REFERRER) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, user.getId());
			pst.setString(2, user.getPw());
			pst.setString(3, user.getName());
			pst.setString(4, user.getRrn());
			pst.setString(5, user.getTel());
			pst.setString(6, user.getNick());
			pst.setString(7, user.getEmail());
			pst.setString(8, user.getAddress());
			pst.setTimestamp(9, new Timestamp(System.currentTimeMillis()));
			pst.setString(10, user.getReferrer());

			cnt = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;
	}

	// 회원가입_기업 아이디 중복 체크
	public Boolean checkVendorId(String vendorId) {
		connect();
		String sql = "SELECT CASE\r\n"
				+ "    WHEN EXISTS (SELECT 1 FROM users WHERE user_id = ?) THEN 'Found in users'\r\n"
				+ "    WHEN EXISTS (SELECT 1 FROM vendor WHERE vendor_id = ?) THEN 'Found in vendor'\r\n"
				+ "    ELSE 'Not found'\r\n" + "END AS result\r\n" + "FROM dual";

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, vendorId);
			pst.setString(2, vendorId);
			rs = pst.executeQuery();
			boolean result = false;

			if (rs.next()) {
				if (rs.getString(1).equals("Not found")) {
					result = true;
				}
			}
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			close();
		}
	}

	// 회원가입_기업 아이디 중복 체크
	public Boolean checkUserId(String userId) {
		connect();
		String sql = "SELECT CASE\r\n"
				+ "    WHEN EXISTS (SELECT 1 FROM users WHERE user_id = ?) THEN 'Found in users'\r\n"
				+ "    WHEN EXISTS (SELECT 1 FROM vendor WHERE vendor_id = ?) THEN 'Found in vendor'\r\n"
				+ "    ELSE 'Not found'\r\n" + "END AS result\r\n" + "FROM dual";

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, userId);
			pst.setString(2, userId);
			rs = pst.executeQuery();
			boolean result = false;

			if (rs.next()) {
				if (rs.getString(1).equals("Not found")) {
					result = true;
				}
			}
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			close();
		}
	}

	// 사업자번호 중복체크
	public Boolean checkLicense(String license) {
		connect();
		String sql = "SELECT VENDOR_LICENSE FROM VENDOR WHERE VENDOR_LICENSE = ?";

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, license);
			rs = pst.executeQuery();

			return !rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			close();
		}
	}

	// 비밀번호 확인_나영 추가
	public boolean checkPassword(String vendor_id, String pw) {
		boolean isValid = false;
		connect();

		String sql = "SELECT COUNT(*) FROM VENDOR WHERE VENDOR_ID = ? AND VENDOR_PW = ?";

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, vendor_id);
			pst.setString(2, pw);

			rs = pst.executeQuery();
			if (rs.next()) {
				int count = rs.getInt(1);
				isValid = (count > 0);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return isValid;
	}

	// 기업회원 삭제_나영 추가
	public int deleteVendor(String vendor_id, String vendor_pw) {
		int cnt = 0;
		connect();

		String sql = "DELETE FROM VENDOR WHERE VENDOR_ID = ? AND VENDOR_PW = ?";

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, vendor_id);
			pst.setString(2, vendor_pw);

			cnt = pst.executeUpdate();
			System.out.println("삭제된 행의 수: " + cnt); // 디버깅 출력
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;
	}

	public int updateUserProfile(UserMemberDTO user) {
		int cnt = 0;
		connect();
		
		String sql = "UPDATE USERS SET USER_ADDRESS = ?, USER_EMAIL = ?, USER_TEL = ?, USER_NICK = ?, USER_PW = ? WHERE USER_ID = ?";
		
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, user.getAddress());
			pst.setString(2, user.getEmail());
			pst.setString(3, user.getTel());
			pst.setString(4, user.getNick());
			pst.setString(5, user.getPw());
			pst.setString(6, user.getId());
			
			cnt = pst.executeUpdate();
		} catch (SQLException  e) {
			e.printStackTrace();
		}
		
		return cnt;
	}

	public int updateVendorProfile(VendorMemberDTO vendor) {
		int cnt = 0;
		connect();
		
		String sql = "UPDATE VENDOR SET VENDOR_ADDRESS = ?, VENDOR_EMAIL = ?, VENDOR_TEL = ?, VENDOR_PW = ?, VENDOR_SITE_URL = ?, VENDOR_INTRO = ? WHERE VENDOR_ID = ?";

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, vendor.getAddress());
			pst.setString(2, vendor.getEmail());
			pst.setString(3, vendor.getTel());
			pst.setString(4, vendor.getPw());
			pst.setString(5, vendor.getSite_url());
			pst.setString(6, vendor.getIntro());
			pst.setString(7, vendor.getId());
			
			cnt = pst.executeUpdate();
		} catch (SQLException  e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
}
