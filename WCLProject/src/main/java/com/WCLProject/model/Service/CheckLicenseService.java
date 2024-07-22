package com.WCLProject.model.Service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.WCLProject.model.DAO.MemberDAO;

@WebServlet("/CheckLicenseService")
public class CheckLicenseService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		String license = request.getParameter("vendor_license");
		Boolean result = dao.checkLicense(license);
		
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		
	    if (result) {
	        response.getWriter().write("생성 가능");
	    } else {
	        response.getWriter().write("사용 불가");
	    }
		
	}

}
