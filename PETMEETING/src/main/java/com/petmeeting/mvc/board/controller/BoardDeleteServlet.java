package com.petmeeting.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmeeting.mvc.board.model.service.BoardService;
@WebServlet(name = "boardDelete", urlPatterns = { "/board/delete" })
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public BoardDeleteServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	// 로그인 체크, 본인게시글 맞아야  삭제 가능 추가하기 
		
	int no = Integer.parseInt(request.getParameter("no"));
	
	System.out.println("게시글 번호 : " + no);
		
	int result = new BoardService().delete(no); 	
	
	if(result > 0) {
		request.setAttribute("msg", "게시글 삭제 성공 ");
		request.setAttribute("location", "/board/list");
	} else {
		request.setAttribute("msg", "게시글 삭제 실패 ");
		request.setAttribute("location", "/board/view?boardNo=" + no);
	}
	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	
	
	}


}
