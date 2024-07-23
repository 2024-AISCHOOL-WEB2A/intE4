package com.WCLProject.model.Service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.WCLProject.model.DAO.MemberDAO;
import com.WCLProject.model.DTO.UserMemberDTO;

@WebServlet("/JoinService_User")
public class JoinService_User extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		String name = request.getParameter("user_name");
		String rrn = request.getParameter("user_rrn");
		String tel = request.getParameter("user_tel");
		String nick = request.getParameter("user_nick");
		String email = request.getParameter("user_email");
		String address = request.getParameter("user_address");
		String detailAddress = request.getParameter("user_detailAddress");
		String extraAddress = request.getParameter("user_extraAddress");
		String referrer = request.getParameter("user_referrer");

		String fullAddress = address;
		if (detailAddress != null && !detailAddress.isEmpty()) {
			fullAddress += ", " + detailAddress;
		}
		if (extraAddress != null && !extraAddress.isEmpty()) {
			fullAddress += ", " + extraAddress;
		}
		
		UserMemberDTO user = new UserMemberDTO(id, pw, name, rrn, tel, nick, email, fullAddress, referrer);
		MemberDAO dao = new MemberDAO();

		int cnt = dao.userMemberJoin(user);

		if (cnt > 0) {
			System.out.println("회원가입 성공");
			response.sendRedirect("signupSucess.jsp");
		} else {
			System.out.println("회원가입 실패");
			response.sendRedirect("sinup_vendor.jsp");
		}
	
	}

}
