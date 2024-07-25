package com.WCLProject.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.WCLProject.model.DAO.LoginDAO;
import com.WCLProject.model.DTO.MemberDTO;
import com.WCLProject.model.DTO.UserMemberDTO;
import com.WCLProject.model.DTO.VendorMemberDTO;

@WebServlet("/Login")
public class LoginController extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		LoginDAO dao = new LoginDAO();
        MemberDTO info =  dao.login(id, pw); // MemberDTO 타입으로 반환

        if (info != null) {
            HttpSession session = request.getSession();
            
            System.out.println("로그인 성공: 아이디 = " + info.getId() + ", 이름 = " + info.getName());
            
            // 반환된 객체가 UserMemberDTO인지 VendorMemberDTO인지 확인
            if (info instanceof UserMemberDTO) {
                UserMemberDTO userInfo = (UserMemberDTO) info;
                session.setAttribute("userInfo", userInfo); // 일반회원 정보로 세션 설정
            } else if (info instanceof VendorMemberDTO) {
                VendorMemberDTO vendorInfo = (VendorMemberDTO) info;
                session.setAttribute("vendorInfo", vendorInfo); // 기업회원 정보로 세션 설정
            }
            response.sendRedirect("LoginfuncWcl.jsp");            
        } else {
            // 로그인 실패 메시지 출력
            System.out.println("로그인 실패: 유효하지 않은 아이디 또는 비밀번호");
            
            // 로그인 실패 후 리다이렉트
            response.sendRedirect("Loginfail.jsp");
        }
	}
}
