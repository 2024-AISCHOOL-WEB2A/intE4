package com.WCLProject.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.WCLProject.model.DAO.VendorDAO;
import com.WCLProject.model.DTO.VendorMemberDTO;

@WebServlet("/DeleteService_Vendor")
public class DeleteService_Vendor extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        VendorMemberDTO member = (VendorMemberDTO) session.getAttribute("loginM");

        if (member == null) {
            response.sendRedirect("LoginWcl.jsp");
            return;
        }

        String id = member.getId();
        String pw = request.getParameter("vendor_pw");

        VendorDAO dao = new VendorDAO();
        boolean result = dao.deleteVendor(id, pw);

        if (result) {
            session.invalidate();
            System.out.println("회원탈퇴 성공: 기업회원 ID = " + id);
            response.sendRedirect("deleteSuccess.jsp");
        } else {
            System.out.println("회원탈퇴 실패: 기업회원 ID = " + id);
            response.sendRedirect("deleteFail.jsp");
        }
    }
}
