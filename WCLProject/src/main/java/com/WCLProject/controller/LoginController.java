package com.WCLProject.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.WCLProject.model.DAO.UserDAO;
import com.WCLProject.model.DAO.VendorDAO;
import com.WCLProject.model.DTO.UserMemberDTO;
import com.WCLProject.model.DTO.VendorMemberDTO;

@WebServlet("/LoginWcl")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String userType = request.getParameter("user_type");
        String userId = request.getParameter("user_id");
        String userPw = request.getParameter("user_pw");

        HttpSession session = request.getSession();

        if ("user".equals(userType)) {
            // 일반 회원 로그인 시도
            UserDAO userDao = new UserDAO();
            UserMemberDTO userMember = userDao.login(userId, userPw);

            if (userMember != null) {
                session.setAttribute("loginM", userMember);
                System.out.println("로그인 성공: 일반회원 ID = " + userId);
                response.sendRedirect("userdashboard.jsp"); // 일반 회원 대시보드로 리디렉션
            } else {
                System.out.println("로그인 실패: ID = " + userId);
                response.sendRedirect("LoginWcl.jsp");
            }
        } else if ("vendor".equals(userType)) {
            // 기업 회원 로그인 시도
            VendorDAO vendorDao = new VendorDAO();
            VendorMemberDTO vendorMember = vendorDao.login(userId, userPw);

            if (vendorMember != null) {
                session.setAttribute("loginM", vendorMember);
                System.out.println("로그인 성공: 기업회원 ID = " + userId);
                response.sendRedirect("vendordashboard.jsp"); // 기업 회원 대시보드로 리디렉션
            } else {
                System.out.println("로그인 실패: ID = " + userId);
                response.sendRedirect("LoginWcl.jsp");
            }
        }
    }
}
