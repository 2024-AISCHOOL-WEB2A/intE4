package com.WCLProject.model.Service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.WCLProject.model.DAO.DressDAO;
import com.WCLProject.model.DTO.Dress;
import com.google.gson.Gson;

@WebServlet("/ProductDressService")
public class ProductDressService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("ProductDressService GET request is being executed");

        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("vendorId");

        if (id == null || id.isEmpty()) {
            resp.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Vendor ID is not available in session.");
            return;
        }

        DressDAO dao = new DressDAO();
        ArrayList<Dress> dressList = dao.getProductDress(id);
        System.out.println("Dress List: " + dressList);

        // JSON 형식으로 변환
        String json = new Gson().toJson(dressList);

        // 응답 설정
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        out.print(json); // Gson을 사용하여 JSON으로 변환
        out.flush();
	}

	/*
	 * protected void service(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { HttpSession session =
	 * request.getSession(); String id = (String) session.getAttribute("vendorId");
	 * 
	 * if (id == null || id.isEmpty()) {
	 * response.sendError(HttpServletResponse.SC_UNAUTHORIZED,
	 * "Vendor ID is not available in session."); return; }
	 * 
	 * DressDAO dao = new DressDAO(); ArrayList<Dress> dressList =
	 * dao.getProductDress(id); System.out.println("Dress List: " + dressList);
	 * 
	 * 
	 * request.setAttribute("dressList", dressList);
	 * System.out.println("Dress List set as request attribute: " +
	 * request.getAttribute("dressList"));
	 * System.out.println("Forwarding to dressRegistration.jsp");
	 * request.getRequestDispatcher("/dressRegistration.jsp").forward(request,
	 * response);
	 * 
	 * // JSON 형식으로 변환 String json = new Gson().toJson(dressList);
	 * 
	 * // 응답 설정 response.setContentType("application/json");
	 * response.setCharacterEncoding("UTF-8"); response.getWriter().write(json);
	 * PrintWriter out = response.getWriter(); Gson gson = new Gson();
	 * out.print(gson.toJson(dressList)); // Gson을 사용하여 JSON으로 변환 out.flush(); }
	 */

}
