// UserDAO.java
package com.WCLProject.model.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.WCLProject.model.DTO.UserMemberDTO;

public class UserDAO {
    private Connection conn;
    private PreparedStatement pst;
    private ResultSet rs;

    public void connect() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            String url = "jdbc:oracle:thin:@project-db-stu3.smhrd.com:1524:xe";
            String user = "Insa5_SpringA_hacksim_3";
            String password = "aishcool3";
            conn = DriverManager.getConnection(url, user, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void close() {
        try {
            if (rs != null) rs.close();
            if (pst != null) pst.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

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
                    rs.getString("USER_REFERRER")
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
