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
import com.WCLProject.model.DTO.VendorMemberDTO;

@WebServlet("/UpdateVendorProfileService")
public class UpdateVendorProfileService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
        String postcode = request.getParameter("vendor_postcode");
        String address = request.getParameter("vendor_address");
        String detailAddress = request.getParameter("vendor_detailAddress");
        String extraAddress = request.getParameter("vendor_extraAddress");
        String email = request.getParameter("vendor_email");
        String tel = request.getParameter("vendor_tel");
        String pw = request.getParameter("vendor_pw");
        String url = request.getParameter("vendor_site_url");
        String intro = request.getParameter("vendor_intro");
		
        String fullAddress = address;
		if (detailAddress != null && !detailAddress.isEmpty()) {
			fullAddress += ", " + detailAddress;
		}
		if (extraAddress != null && !extraAddress.isEmpty()) {
			fullAddress += ", " + extraAddress;
		}
		
		HttpSession session = request.getSession();
        VendorMemberDTO currentVendor = (VendorMemberDTO) session.getAttribute("vendorInfo");
		
        if (currentVendor == null) {
            response.sendRedirect("loginPage.jsp"); // 사용자가 로그인하지 않은 경우 로그인 페이지로 리다이렉트
            return;
        }
		
        String id = currentVendor.getId();
        MemberDAO dao = new MemberDAO();
		VendorMemberDTO vendor = new VendorMemberDTO(id, fullAddress, email, tel, pw, url, intro);
		int cnt = dao.updateVendorProfile(vendor);
		
		if (cnt > 0) {
			System.out.println("회원정보 수정 성공");
			response.sendRedirect("mainPage.jsp");
		} else {
			System.out.println("회원정보 수정 실패");
			response.sendRedirect("mainPage.jsp");
		}
		
		
		
		
		
		
		
		
	}

}
