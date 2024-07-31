package com.WCLProject.model.Service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.WCLProject.model.DAO.DressDAO;
import com.WCLProject.model.DAO.WeddingHallDAO;
import com.WCLProject.model.DTO.Dress;
import com.WCLProject.model.DTO.VendorMemberDTO;
import com.WCLProject.model.DTO.WeddingHall;

@WebServlet("/AddProductWeddingHallService")
public class AddProductWeddingHallService extends HttpServlet {
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

		String assurance = request.getParameter("weddingHall_assurance");
		String type = request.getParameter("weddingHall_type");
		String priceStr = request.getParameter("weddingHall_price");
		String content = request.getParameter("weddingHall_content");
		String photoPath = request.getParameter("weddingHall_photoPath");
		String brand = vendorInfo.getName();
		String title = request.getParameter("weddingHall_title");
		String mealCostStr = request.getParameter("weddingHall_mealCost");
        int price = 0, mealCost; // 초기값 설정
        price = Integer.parseInt(priceStr);
        mealCost = Integer.parseInt(mealCostStr);
        
		if (photoPath == null) {
			photoPath = "not photo";			
		}

		WeddingHallDAO dao = new WeddingHallDAO();
		String id = dao.generateWeddingHallId();
		WeddingHall weddingHall = new WeddingHall(id, assurance, type, price, content, vendorId, photoPath, brand, title, mealCost);

		int cnt = dao.addWeddingHall(weddingHall);

		if (cnt > 0) {
			System.out.println("상품 등록 성공");
			response.sendRedirect("productWeddingHallManagement.jsp");
		} else {
			System.out.println("상품 등록 실패");
			response.sendRedirect("addProductWeddingHall.jsp");
		}

	}

}
