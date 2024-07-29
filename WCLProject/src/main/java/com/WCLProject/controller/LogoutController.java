package com.WCLProject.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Logout")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 HttpSession session = request.getSession(false);
		
		 if (session != null) {
	            session.invalidate();
	            System.out.println("로그아웃 성공: 저장된 세션을 삭제했습니다.");
	        }
	        
	        // 로그아웃 후 메인 페이지로 리다이렉트
	        response.sendRedirect("mainPage.jsp");
	}

}
