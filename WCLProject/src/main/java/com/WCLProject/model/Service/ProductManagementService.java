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

import com.WCLProject.model.DAO.MakeupDAO;
import com.WCLProject.model.DAO.StudioDAO;
import com.WCLProject.model.DTO.Makeup;
import com.WCLProject.model.DTO.Studio;
import com.google.gson.Gson;

@WebServlet("/ProductManagementService")
public class ProductManagementService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("vendorId");
        String category = req.getParameter("category");
        
        if (id == null || id.isEmpty()) {
            resp.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Vendor ID is not available in session.");
            return;
        }

        String json = null;
        
        if (category.equals("스튜디오")) {
        	StudioDAO dao = new StudioDAO();
        	ArrayList<Studio> studioList = dao.getProductStudio(id);
        	json = new Gson().toJson(studioList);
        } else if(category.equals("메이크업")) {
        	MakeupDAO dao = new MakeupDAO();
        	ArrayList<Makeup> makeupList = dao.getProductMakeup(id);
        	json = new Gson().toJson(makeupList);
        } else {
        	
        }
        
        // 응답 설정
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter out = resp.getWriter();
        out.print(json); // Gson을 사용하여 JSON으로 변환
        out.flush();
	}
}
