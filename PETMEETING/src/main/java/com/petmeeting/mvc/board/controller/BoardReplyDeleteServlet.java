package com.petmeeting.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmeeting.mvc.board.model.service.BoardService;


@WebServlet(name = "boardReplyDelete", urlPatterns = { "/board/replydelete" })
public class BoardReplyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BoardReplyDeleteServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인체크& 본인게시글여부확인
		int result = 0;
		int replyNo = Integer.parseInt(request.getParameter("replyNo"));
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		System.out.println("게시글번호:"+ boardNo);
		System.out.println("댓글 번호:" + replyNo);
		
		result = new BoardService().deleteReply(replyNo);
		
		if(result > 0) {
			request.setAttribute("msg", "댓글이 삭제되었습니다.");
			request.setAttribute("location", "/board/view?boardNo=" + boardNo);
		} else {
			request.setAttribute("msg", "댓글이 삭제되지 않았습니다.");
			request.setAttribute("location", "/board/view?boardNo=" + boardNo);
		}
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

}