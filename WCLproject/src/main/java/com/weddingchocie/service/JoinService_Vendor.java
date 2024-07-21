package com.weddingchocie.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.weddingchocie.model.WCLMember_Vendor;
import com.weddingchocie.model.WeddingChocieDAO;

@WebServlet("/JoinService_Vendor")
public class JoinService_Vendor extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("vendor_id");
		String pw = request.getParameter("vendor_pw");
		String name = request.getParameter("vendor_name");
		String tel = request.getParameter("vendor_tel");
		String email = request.getParameter("vendor_email");
		String address = request.getParameter("vendor_address");
		String detailAddress = request.getParameter("vendor_detailAddress");
		String extraAddress = request.getParameter("vendor_extraAddress");
		String license = request.getParameter("vendor_license");
		String category = request.getParameter("vendor_category");
		String license_image = request.getParameter("vendor_license_image");
		String logo_image = request.getParameter("vendor_logo_image");
		String intro = request.getParameter("vendor_intro");
		String site_url = request.getParameter("vendor_site_url");
		
		String fullAddress = address;
        if (detailAddress != null && !detailAddress.isEmpty()) {
            fullAddress += ", " + detailAddress;
        }
        if (extraAddress != null && !extraAddress.isEmpty()) {
            fullAddress += ", " + extraAddress;
        }
		System.out.println("아이디 : " + email + ", 기업명 : " + name + ", 업종 : " + category);
		System.out.println(fullAddress);
		WCLMember_Vendor vendor = new WCLMember_Vendor(id, pw, name, tel, email, fullAddress, license, category, license_image, logo_image, intro, site_url);
		WeddingChocieDAO dao = new WeddingChocieDAO();
		
		int cnt = dao.vendorMemberJoin(vendor);
		
		if (cnt > 0) {
			System.out.println("회원가입 성공");
		} else {
			response.sendRedirect("sinup_vendor.html");
		}
	}

}
