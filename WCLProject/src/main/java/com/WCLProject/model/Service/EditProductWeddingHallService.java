package com.WCLProject.model.Service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.WCLProject.model.DAO.DressDAO;
import com.WCLProject.model.DTO.Dress;

@WebServlet("/EditProductWeddingHallService")
public class EditProductWeddingHallService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String productId = request.getParameter("productId");
        
        if (productId == null || productId.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "상품 ID가 누락되었습니다.");
            return;
        }

        DressDAO dao = new DressDAO();
        Dress dress = dao.getDressById(productId); // 상품 정보 조회
        
        if (dress == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "상품을 찾을 수 없습니다.");
            return;
        }

        request.setAttribute("dress", dress);
        RequestDispatcher dispatcher = request.getRequestDispatcher("editProductDress.jsp");
        dispatcher.forward(request, response);
	}

}
