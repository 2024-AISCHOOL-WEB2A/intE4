package com.WCLProject.model.Service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.WCLProject.model.DAO.MemberDAO;
import com.WCLProject.model.DTO.VendorMemberDTO;

@WebServlet("/JoinService_Vendor")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, // 1 MB
		maxFileSize = 1024 * 1024 * 10, // 10 MB
		maxRequestSize = 1024 * 1024 * 50 // 50 MB
)
public class JoinService_Vendor extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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

		VendorMemberDTO vendor = new VendorMemberDTO(id, pw, name, tel, email, fullAddress, license, category,
				license_image, logo_image, intro, site_url);
		MemberDAO dao = new MemberDAO();

		int cnt = dao.vendorMemberJoin(vendor);

		if (cnt > 0) {
			System.out.println("회원가입 성공");
			response.sendRedirect("signupSucess.jsp");
		} else {
			System.out.println("회원가입 실패");
			response.sendRedirect("sinup_vendor.jsp");
		}
	}

}
