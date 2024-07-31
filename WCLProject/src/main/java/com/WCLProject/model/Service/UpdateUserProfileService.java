package com.WCLProject.model.Service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.WCLProject.model.DAO.MemberDAO;
import com.WCLProject.model.DTO.UserMemberDTO;

@WebServlet("/UpdateUserProfileService")
public class UpdateUserProfileService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 1. 요청 파라미터 받아오기
        String postcode = request.getParameter("user_postcode");
        String address = request.getParameter("user_address");
        String detailAddress = request.getParameter("user_detailAddress");
        String extraAddress = request.getParameter("user_extraAddress");
        String email = request.getParameter("user_email");
        String tel = request.getParameter("user_tel");
        String nick = request.getParameter("user_nick");
        String pw = request.getParameter("user_pw");

        String fullAddress = address;
		if (detailAddress != null && !detailAddress.isEmpty()) {
			fullAddress += ", " + detailAddress;
		}
		if (extraAddress != null && !extraAddress.isEmpty()) {
			fullAddress += ", " + extraAddress;
		}
        
        // 2. 세션에서 현재 사용자 정보 가져오기
        HttpSession session = request.getSession();
        UserMemberDTO currentUser = (UserMemberDTO) session.getAttribute("userInfo");
		
        if (currentUser == null) {
            response.sendRedirect("login.jsp"); // 사용자가 로그인하지 않은 경우 로그인 페이지로 리다이렉트
            return;
        }
        
        String id = currentUser.getId();
        MemberDAO dao = new MemberDAO();
		UserMemberDTO user = new UserMemberDTO(id, fullAddress, email, tel, nick, pw);
		int cnt = dao.updateUserProfile(user);
		
		if (cnt > 0) {
			System.out.println("회원정보 수정 성공");
			response.sendRedirect("mainPage.jsp");
		} else {
			System.out.println("회원정보 수정 실패");
			response.sendRedirect("mainPage.jsp");
		}

	}

}
