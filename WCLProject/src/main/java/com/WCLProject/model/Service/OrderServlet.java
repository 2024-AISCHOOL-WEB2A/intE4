package com.WCLProject.model.Service;

import java.io.IOException;
import java.util.List;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.WCLProject.model.DAO.ReservationDAO;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String[] itemIds = request.getParameterValues("itemIds");
        if (itemIds == null || itemIds.length == 0) {
            response.getWriter().write("주문할 항목을 선택하세요.");
            return;
        }

        ReservationDAO reservationDAO = new ReservationDAO();
        List<String> selectedItemIds = Arrays.asList(itemIds);
        boolean allDeleted = true;

        for (String itemId : selectedItemIds) {
            try {
                reservationDAO.deleteReservationByItemId(itemId);
            } catch (Exception e) {
                allDeleted = false;
                e.printStackTrace();
            }
        }

        if (allDeleted) {
            response.getWriter().write("성공적으로 삭제되었습니다.");
        } else {
            response.getWriter().write("삭제 과정에서 일부 오류가 발생했습니다.");
        }
    }
}https://chatgpt.com/g/g-mvHas1oxx-code-java-c-c-python-c-js-php-html-vb-vc/c/64a3f93b-05b6-4eca-88f8-a697b2073248
