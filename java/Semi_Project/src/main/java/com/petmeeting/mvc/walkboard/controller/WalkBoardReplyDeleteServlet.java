package com.petmeeting.mvc.walkboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmeeting.mvc.walkboard.model.service.WalkBoardService;

@WebServlet(name = "walkBoardReplyDelete", urlPatterns = { "/walkboard/replydelete" })
public class WalkBoardReplyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WalkBoardReplyDeleteServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		
		int wbNo = Integer.parseInt(request.getParameter("wbNo"));
		int wcNo = Integer.parseInt(request.getParameter("wcNo"));
		
		result = new WalkBoardService().deleteReply(wbNo, wcNo);
		
		if(result > 0) {
			request.setAttribute("msg", "댓글 삭제 성공");
			request.setAttribute("location", "/walkboard/walkview?wbNo=" + wbNo);
			
		} else {
			request.setAttribute("msg", "댓글 삭제 실패");
			request.setAttribute("location", "/walkboard/walkview?wbNo=" + wbNo);
			
			
		}
		
		System.out.println(wcNo);
		System.out.println(wbNo);
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		
	}

}