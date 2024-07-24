package com.WCLProject.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.WCLProject.model.DAO.UserDAO;
import com.WCLProject.model.DTO.UserVO;




@WebServlet("/Login")
public class LoginController extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("EUC-KR");
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		
		UserDAO dao = new UserDAO();
		UserVO info = dao.login(user_id, user_pw);
		
		if(info != null) {
			HttpSession session = request.getSession();
			session.setAttribute("info", info);
		}
		
		response.sendRedirect("LoginfuncWcl.jsp");
		
	}
	

}
