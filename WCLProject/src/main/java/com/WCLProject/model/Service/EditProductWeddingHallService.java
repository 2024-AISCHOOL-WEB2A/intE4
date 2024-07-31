package com.WCLProject.model.Service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.WCLProject.model.DAO.DressDAO;
import com.WCLProject.model.DAO.WeddingHallDAO;
import com.WCLProject.model.DTO.Dress;
import com.WCLProject.model.DTO.WeddingHall;

@WebServlet("/EditProductWeddingHallService")
public class EditProductWeddingHallService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String productId = request.getParameter("productId");
        System.out.println(productId);
        if (productId == null || productId.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "상품 ID가 누락되었습니다.");
            return;
        }

        WeddingHallDAO dao = new WeddingHallDAO();
        WeddingHall weddinghall = dao.getWeddingHallById(productId);
        
        if (weddinghall == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "상품을 찾을 수 없습니다.");
            return;
        }

        request.setAttribute("weddinghall", weddinghall);
        RequestDispatcher dispatcher = request.getRequestDispatcher("editProductWeddingHall.jsp");
        dispatcher.forward(request, response);
	}

}
