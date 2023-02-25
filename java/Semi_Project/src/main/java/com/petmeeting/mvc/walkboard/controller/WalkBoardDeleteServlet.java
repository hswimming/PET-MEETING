package com.petmeeting.mvc.walkboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmeeting.mvc.walkboard.model.service.WalkBoardService;
import com.petmeeting.mvc.walkboard.model.vo.WalkBoard;

@WebServlet(name = "WalkBoardDelete", urlPatterns = { "/walkBoard/delete" })
public class WalkBoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WalkBoardDeleteServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		WalkBoard walkBoard = null;
		int result = 0;
		
		int wbNo = Integer.parseInt(request.getParameter("wbNo"));
		
		System.out.println("게시글 번호 : " + wbNo);
		
		result = new WalkBoardService().delete(wbNo);
		
		if (result > 0) {
			request.setAttribute("msg", "게시글 삭제 성공");
			request.setAttribute("location", "/walkBoard/list");
			
		} else {
			request.setAttribute("msg", "게시글 삭제 실패");
			request.setAttribute("location", "/walkBoard/view?wbNo=" + wbNo);
			
		}
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}