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
import com.WCLProject.model.DAO.WeddingHallDAO;
import com.WCLProject.model.DTO.Dress;
import com.WCLProject.model.DTO.WeddingHall;
import com.google.gson.Gson;

@WebServlet("/ProductWeddingHallManagementService")
public class ProductWeddingHallManagementService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("vendorId");

        if (id == null || id.isEmpty()) {
            resp.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Vendor ID is not available in session.");
            return;
        }

        WeddingHallDAO dao = new WeddingHallDAO();
        ArrayList<WeddingHall> weddingHallList = dao.getProductWeddingHall(id);

        // JSON 형식으로 변환
        String json = new Gson().toJson(weddingHallList);
        // 응답 설정
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        out.print(json); // Gson을 사용하여 JSON으로 변환
        out.flush();
	}
}
