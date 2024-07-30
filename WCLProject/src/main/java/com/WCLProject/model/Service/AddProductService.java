package com.WCLProject.model.Service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.WCLProject.model.DAO.DressDAO;
import com.WCLProject.model.DAO.MakeupDAO;
import com.WCLProject.model.DAO.StudioDAO;
import com.WCLProject.model.DTO.Dress;
import com.WCLProject.model.DTO.Makeup;
import com.WCLProject.model.DTO.Studio;
import com.WCLProject.model.DTO.VendorMemberDTO;

@WebServlet("/AddProductService")
public class AddProductService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();
		VendorMemberDTO vendorInfo = (VendorMemberDTO) session.getAttribute("vendorInfo");
		String vendorId = null;
		String category = null;
		if (vendorInfo != null) {
			vendorId = vendorInfo.getId();
			category = vendorInfo.getCategory();
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
        int price = 0; // 초기값 설정
        price = Integer.parseInt(priceStr);

		if (photoPath == null)
			photoPath = "not photo";
		
		int cnt = 0;
		
		if (category.equals("스튜디오")) {
			StudioDAO dao = new StudioDAO();
			String id = dao.generateStudioId();
			Studio studio = new Studio();
			cnt = dao.addStudio(studio);
		} else if (category.equals("메이크업")) {
			MakeupDAO dao = new MakeupDAO();
			String id = dao.generateMakeupId();
			Makeup makeup = new Makeup();
			cnt = dao.addMakeup(makeup);
		} else {
			System.out.println("업종을 확인해 주세요.");
			response.sendRedirect("productManagement.jsp");
			return;
		}

		if (cnt > 0) {
			System.out.println("상품 등록 성공");
			response.sendRedirect("productDressManagement.jsp");
		} else {
			System.out.println("상품 등록 실패");
			response.sendRedirect("addProduct.jsp");
		}

	}

}
