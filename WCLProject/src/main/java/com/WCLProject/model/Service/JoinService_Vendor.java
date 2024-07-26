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

@WebServlet("/JoinService_Vendor")
public class JoinService_Vendor extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
		
		String id = request.getParameter("vendor_id");
		System.out.println("Vendor ID: " + id); 
		String pw = request.getParameter("vendor_pw");
		String name = request.getParameter("vendor_name");
		String tel = request.getParameter("vendor_tel");
		String email = request.getParameter("vendor_email");
		String address = request.getParameter("vendor_address");
		String detailAddress = request.getParameter("vendor_detailAddress");
		String extraAddress = request.getParameter("vendor_extraAddress");
		String license = request.getParameter("vendor_license");
		String category = request.getParameter("vendor_category");
        String licenseImagePath = (String) session.getAttribute("licenseImagePath");
        String logoImagePath = (String) session.getAttribute("logoImagePath");
		String intro = request.getParameter("vendor_intro");
		String site_url = request.getParameter("vendor_site_url");

		String fullAddress = address;
		if (detailAddress != null && !detailAddress.isEmpty()) {
			fullAddress += ", " + detailAddress;
		}
		if (extraAddress != null && !extraAddress.isEmpty()) {
			fullAddress += ", " + extraAddress;
		}

		// 파일 경로가 비어있으면 기본값 설정
		if (licenseImagePath == null || licenseImagePath.isEmpty()) {
			licenseImagePath = "default_license.jpg";
		}
		if (logoImagePath == null || logoImagePath.isEmpty()) {
			logoImagePath = "default_logo.jpg";
		}
		
		VendorMemberDTO vendor = new VendorMemberDTO(id, pw, name, tel, email, fullAddress, license, category,
				licenseImagePath, logoImagePath, intro, site_url);
		MemberDAO dao = new MemberDAO();

		int cnt = dao.vendorMemberJoin(vendor);

		if (cnt > 0) {
			System.out.println("회원가입 성공");
			response.sendRedirect("mainPage.jsp");
		} else {
			System.out.println("회원가입 실패");
			response.sendRedirect("sinupVendor.jsp");
		}
		
        session.removeAttribute("licenseImagePath");
        session.removeAttribute("logoImagePath");
	}

}
