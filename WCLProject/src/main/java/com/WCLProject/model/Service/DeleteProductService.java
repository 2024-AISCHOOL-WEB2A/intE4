package com.WCLProject.model.Service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.WCLProject.model.DAO.ProductDAO;

@WebServlet("/DeleteProductService")
public class DeleteProductService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String productId = request.getParameter("product_id");
		System.out.println(productId);
		
        if (productId == null || productId.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "상품 ID가 누락되었습니다.");
            return;
        }
		
        ProductDAO dao = new ProductDAO();
        
        int cnt = dao.deleteProduct(productId);
        System.out.println(cnt);
        if (cnt > 0) {
        	response.setStatus(HttpServletResponse.SC_OK);         	
        } else {
        	response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);         	
        }
        
	}

}
