package com.WCLProject.model.Service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.WCLProject.model.DAO.MemberDAO;
import com.WCLProject.model.DTO.VendorMemberDTO;

@WebServlet("/DeleteService_Vendor")
public class DeleteService_Vendor extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        VendorMemberDTO member = (VendorMemberDTO) session.getAttribute("loginM");

        if (member == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String vendor_id = request.getParameter("vendor_id");
        String vendor_pw = request.getParameter("vendor_pw");

        MemberDAO dao = new MemberDAO();

        if (dao.checkPassword(vendor_id, vendor_pw)) {
            int cnt = dao.deleteVendor(vendor_id, vendor_pw);
            if (cnt > 0) {
                session.invalidate();
                response.sendRedirect("delete_success.jsp");
            } else {
                response.sendRedirect("delete_failure.jsp");
            }
        } else {
            response.sendRedirect("delete_failure.jsp");
        }
    }
}
