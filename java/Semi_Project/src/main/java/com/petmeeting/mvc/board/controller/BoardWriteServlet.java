package com.petmeeting.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmeeting.mvc.board.model.service.Walk_BoardService;
import com.petmeeting.mvc.board.model.vo.Walk_Board;

@WebServlet(name = "boardWrite", urlPatterns = { "/walk_board/write" })
public class BoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardWriteServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("/views/walk_board/write.jsp").forward(request, response);
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String dogId = request.getParameter("dogId");
//    	String wbTitle = request.getParameter("wbTitle");
//    	String wbContent = request.getParameter("wbContent");
//    	String createDate = request.getParameter("createDate");
//    	String modifyDate = request.getParameter("modifyDate");
//    	String wbStatus = request.getParameter("wbStatus");
    	
    	if (dogId != null) {
    		
    		Walk_Board walk_Board = new Walk_Board();
    		
    		walk_Board.setDogId(walk_Board.getDogId());
    		walk_Board.setWbTitle(walk_Board.getWbTitle());
    		walk_Board.setWbContent(walk_Board.getWbContent());
    		walk_Board.setCreateDate(walk_Board.getCreateDate());
    		walk_Board.setModifyDate(walk_Board.getModifyDate());
    		walk_Board.setWbStatus(walk_Board.getWbStatus());
    		
    		int result = new Walk_BoardService().save(walk_Board);
    		
    		if(result > 0) {
        		request.setAttribute("msg", "게시글 등록 성공");
        		request.setAttribute("location", "/board/list");
        		
        	} else {
        		request.setAttribute("msg", "게시글 등록 실패");
        		request.setAttribute("location", "/board/list");
        		
        	}
    	}
    	
    	response.setContentType("text/html;charset=UTF-8");
    	
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	
	}
}