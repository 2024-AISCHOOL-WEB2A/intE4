package com.WCLProject.model.Service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.WCLProject.model.DAO.DressDAO;
import com.WCLProject.model.DTO.Dress;


@WebServlet("/dressRegistration")
public class ProductDressService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("vendorId");
		
        if (id == null || id.isEmpty()) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Vendor ID is not available in session.");
            return;
        }
		
		DressDAO dao = new DressDAO();
		ArrayList<Dress> dressList = dao.getProductDress(id);
		System.out.println("Dress List: " + dressList);

		request.setAttribute("dressList", dressList);
		
		request.getRequestDispatcher("/dressRegistration.jsp").forward(request, response);
	}

}
