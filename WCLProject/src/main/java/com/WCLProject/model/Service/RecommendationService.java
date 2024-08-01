package com.WCLProject.model.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.WCLProject.model.DAO.DressDAO;
import com.WCLProject.model.DTO.Dress;
import com.google.gson.Gson;

@WebServlet("/RecommendationService")
public class RecommendationService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		String brand = request.getParameter("brand");
		String result = request.getParameter("result");

		if (result.equals("A라인")) {
			result = "A";
		} else if (result.equals("머메이드")) {
			result = "머메이드";
		} else {
			System.out.println("추천드레스 종류 오류 발생");
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            return;
		}

		DressDAO dao = new DressDAO();
		Dress dress = new Dress(brand, result);
		ArrayList<Dress> recommendDressList = dao.recommendDress(dress);
		if (recommendDressList == null) {
			recommendDressList = new ArrayList<>();
		}
		ArrayList<Dress> randomDressList = getRandomItems(recommendDressList, 3);

        Gson gson = new Gson();
        String json = gson.toJson(randomDressList);
        response.getWriter().write(json);
	}

	private ArrayList<Dress> getRandomItems(ArrayList<Dress> list, int numberOfItems) {
		if (list == null || list.isEmpty()) {
			return new ArrayList<>(); // 빈 리스트 반환
		}
		ArrayList<Dress> copyList = new ArrayList<>(list);
		Collections.shuffle(copyList, new Random());
		return new ArrayList<>(copyList.subList(0, Math.min(numberOfItems, copyList.size())));
	}
}
