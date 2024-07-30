package com.WCLProject.model.Service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.WCLProject.model.DAO.DressDAO;
import com.WCLProject.model.DAO.MakeupDAO;
import com.WCLProject.model.DAO.StudioDAO;
import com.WCLProject.model.DTO.Dress;
import com.WCLProject.model.DTO.Makeup;
import com.WCLProject.model.DTO.Studio;

@WebServlet("/EditProductService")
public class EditProductService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String productId = request.getParameter("productId");
        String category = request.getParameter("vendorCategory");
        
        if (productId == null || productId.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "상품 ID가 누락되었습니다.");
            return;
        }
        
        if (category.equals("스튜디오")) {
        	StudioDAO dao = new StudioDAO();
        	Studio studio = dao.getStudioById(productId);
        	System.out.println(studio);
            request.setAttribute("studio", studio);
        } else if(category.equals("메이크업")) {
        	MakeupDAO dao = new MakeupDAO();
        	Makeup makeup = dao.getMakeupById(productId);
        	request.setAttribute("makeup", makeup);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "상품을 찾을 수 없습니다.");
            return;
        }
        
        request.setAttribute("category", category);
        RequestDispatcher dispatcher = request.getRequestDispatcher("editProduct.jsp");
        dispatcher.forward(request, response);
        
	}

}
