package com.WCLProject.model.Service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.WCLProject.model.DAO.MemberDAO;


@WebServlet("/CheckIdService")
public class CheckIdService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		String id = request.getParameter("vendor_id");
		Boolean result = dao.checkId(id);
		
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		
		if (result) {
			System.out.println("생성 가능");
		} else {
			System.out.println("사용 불가");
		}
		
	}

}
