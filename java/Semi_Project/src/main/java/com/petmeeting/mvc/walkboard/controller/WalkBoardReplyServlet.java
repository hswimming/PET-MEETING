package com.petmeeting.mvc.walkboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petmeeting.mvc.walkboard.model.service.WalkBoardService;
import com.petmeeting.mvc.walkboard.model.vo.WalkBoardReply;
import com.petmeeting.mvc.member.model.vo.Member;

@WebServlet(name = "walkBoardReply", urlPatterns = { "/walkBoard/reply" })
public class WalkBoardReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WalkBoardReplyServlet() {
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int result = 0;
    	
    	HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
		
		int wbNo = Integer.parseInt(request.getParameter("wbNo"));
		String wbComment = request.getParameter("wbComment");
		
		WalkBoardReply walkBoardReply = new WalkBoardReply();
		
		walkBoardReply.setWbNo(wbNo);
		walkBoardReply.setMCode(loginMember.getMCode());
//		walkBoardReply.setWcNickname(loginMember.getNickname());
		walkBoardReply.setWbComment(wbComment);
		
		result = new WalkBoardService().saveReply(walkBoardReply);
		
		if (result > 0) {
			request.setAttribute("msg", "댓글 등록 성공");
			request.setAttribute("location", "/walkBoard/view?wbNo=" + wbNo);
			
		} else {
			request.setAttribute("msg", "댓글 등록 실패");
			request.setAttribute("location", "/walkBoard/view?wbNo=" + wbNo);
		}
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}
