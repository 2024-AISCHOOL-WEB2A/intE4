package com.WCLProject.model.Service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.WCLProject.model.DAO.MemberDAO;
import com.WCLProject.model.DTO.VendorMemberDTO;

@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String id = request.getParameter("id");
        String pw = request.getParameter("pw");

        MemberDAO dao = new MemberDAO();
        VendorMemberDTO member = dao.loginById(id, pw);

        if (member != null) { // 로그인 성공
            System.out.println("로그인 성공: " + id);  // 디버깅 메시지
            HttpSession session = request.getSession();
            session.setAttribute("loginM", member);
            response.sendRedirect("index.html");  // index.html로 리디렉션
        } else { // 로그인 실패
            System.out.println("로그인 실패: " + id);  // 디버깅 메시지
            response.sendRedirect("login_fail.jsp");
        }
    }
}
