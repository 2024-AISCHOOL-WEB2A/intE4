package com.WCLProject.model.Service;

import java.io.IOException;
import java.sql.Timestamp;

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

@WebServlet("/UpdateProductService")
public class UpdateProductService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		VendorMemberDTO vendorInfo = (VendorMemberDTO) session.getAttribute("vendorInfo");
		String vendorId = null;
		String category = null;
		
		if (vendorInfo != null) {
			vendorId = vendorInfo.getId();
			category = vendorInfo.getCategory();
		} 
		
        String id = request.getParameter("id");
        String photoPath = request.getParameter("photoPath");
        String concept = request.getParameter("concept");
        String strPrice = request.getParameter("price");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        int price = 0;
        price = Integer.parseInt(strPrice);
        
		if (photoPath == null)
			photoPath = "not photo";	
        // Dress dress = new Dress(dressId, brand, fabric, line, style, price, content, vendorId, photoPath, title);
        
        int cnt = 0;
        
        if (category.equals("스튜디오")) {
        	StudioDAO dao = new StudioDAO();
        	Studio studio = new Studio(id, photoPath, concept, price, title, content);
        	cnt = dao.editStudio(studio);
        } else if(category.equals("메이크업")) {
        	MakeupDAO dao = new MakeupDAO();
        	Makeup makeup = new Makeup(id, photoPath, concept, price, title, content);
        	cnt = dao.editMakeup(makeup);
        } else {
        	System.out.println("");
        	return;
        }

		if (cnt > 0) {
			System.out.println("상품 수정 성공");
			response.sendRedirect("productManagement.jsp");
		} else {
			System.out.println("상품 수정 실패");
			response.sendRedirect("editProduct.jsp");
		}
	}

}
