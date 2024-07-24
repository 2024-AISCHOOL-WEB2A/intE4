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

	//기업회원 탈퇴_나영 수정
	public boolean deleteVendor(String vendorId, String vendorPw) {
        connect();
        boolean result = false;
        String sql = "DELETE FROM VENDOR WHERE VENDOR_ID = ? AND VENDOR_PW = ?";

        try {
            pst = conn.prepareStatement(sql);
            pst.setString(1, vendorId);
            pst.setString(2, vendorPw);

            int count = pst.executeUpdate();
            result = (count > 0); // 삭제 성공 시 true 반환
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return result;
    }
}

	// 로그인 기능_나영 추가
	public UserMemberDTO login(String id, String pw) {
		UserMemberDTO member = null;
		connect();

		String sql = "SELECT * FROM USERS WHERE USER_ID = ? AND USER_PW = ?";

		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			pst.setString(2, pw);

			rs = pst.executeQuery();
			if (rs.next()) {
				member = new UserMemberDTO(rs.getString("USER_ID"), rs.getString("USER_PW"), rs.getString("USER_NAME"),
						rs.getString("USER_RRN"), rs.getString("USER_TEL"), rs.getString("USER_NICK"),
						rs.getString("USER_EMAIL"), rs.getString("USER_ADDRESS"), rs.getString("USER_JOIN"),
						rs.getString("USER_REFERRER"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return member;
	}
	
	// loginById_(기업회원 아이디, 비번 맞는지 체크)나영 추가
    public VendorMemberDTO loginById(String id, String pw) {
        VendorMemberDTO member = null;
        connect();
        String sql = "SELECT * FROM VENDOR WHERE VENDOR_ID = ? AND VENDOR_PW = ?";

        try {
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
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return member;
    }
}