package com.petmeeting.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.petmeeting.mvc.board.model.service.Walk_BoardService;
import com.petmeeting.mvc.board.model.vo.Walk_Board;
import com.petmeeting.mvc.member.model.vo.Member;

@WebServlet(name = "boardWrite", urlPatterns = { "/walk_board/write" })
public class BoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardWriteServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("/views/walk_board/write.jsp").forward(request, response);
    	
    	HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
    	
    	if (loginMember != null) {
    		request.getRequestDispatcher("views/walk_board/write.jsp").forward(request, response);
    		
    	} else {
    		request.setAttribute("msg", "로그인 후 작성 해주세요.");
    		request.setAttribute("location", "/");
    		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	}
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
    	
    	if (loginMember != null) {
    		
    		Walk_Board walk_Board = new Walk_Board();
    		
    		
    		walk_Board.setMemNickname(loginMember.getNickname());
    		walk_Board.setWbTitle(request.getParameter("content_title"));
    		walk_Board.setWbContent(request.getParameter("content"));
    		
    		int result = new Walk_BoardService().save(walk_Board);
    		
    		if (result > 0) {
    			request.setAttribute("msg", "게시글 등록 성공");
        		request.setAttribute("location", "/board/list");
        		
    		} else {
    			request.setAttribute("msg", "게시글 등록 실패");
        		request.setAttribute("location", "/board/list");
    		}
    		
    	} else {
    		request.setAttribute("msg", "로그인 후 작성 해주세요.");
    		request.setAttribute("location", "/");
    	}
    	
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	
	}
}