package com.WCLProject.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.WCLProject.model.DAO.UserDAO;

@WebServlet("/DeleteService_User")
public class DeleteService_User extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        String userId = request.getParameter("user_id");
        String userPw = request.getParameter("user_pw");

        UserDAO dao = new UserDAO();
        boolean success = dao.deleteUser(userId, userPw);

        if (success) {
            System.out.println("일반회원 탈퇴 성공: ID = " + userId);
            session.invalidate();
            response.sendRedirect("deleteSuccess.jsp");
        } else {
            System.out.println("일반회원 탈퇴 실패: ID = " + userId);
            response.sendRedirect("deleteFail.jsp");
        }
    }
}
