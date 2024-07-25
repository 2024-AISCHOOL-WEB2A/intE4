package com.WCLProject.model.Service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.WCLProject.model.DAO.DressDAO;
import com.WCLProject.model.DTO.Dress;
import com.WCLProject.model.DTO.VendorMemberDTO;

@WebServlet("/DressRegistrationService")
public class DressRegistrationService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		VendorMemberDTO vendorInfo = (VendorMemberDTO) session.getAttribute("vendorInfo");
		String vendorId = null;

		if (vendorInfo != null) {
			vendorId = vendorInfo.getId();
		} else {
			response.sendRedirect("LoginWcl.jsp");
			return;
		}

		String brand = request.getParameter("dress_brand");
		String fabric = request.getParameter("dress_fabric");
		String line = request.getParameter("dress_line");
		String style = request.getParameter("dress_style");
		String priceStr = request.getParameter("dress_price");
		String content = request.getParameter("dress_content");
		String photoPath = request.getParameter("dress_photoPath");
		String title = request.getParameter("dress_title");
		int price = Integer.parseInt(priceStr);

		if (photoPath == null)
			photoPath = "not photo";

		DressDAO dao = new DressDAO();
		String id = dao.generateDressId();
		Dress dress = new Dress(id, brand, fabric, line, style, price, content, vendorId, photoPath, title);

		int cnt = dao.addDress(dress);

		if (cnt > 0) {
			System.out.println("상품 등록 성공");
			response.sendRedirect("productManagement.jsp");
		} else {
			System.out.println("상품 등록 실패");
			response.sendRedirect("Loginfail.jsp");
		}

	}

}
