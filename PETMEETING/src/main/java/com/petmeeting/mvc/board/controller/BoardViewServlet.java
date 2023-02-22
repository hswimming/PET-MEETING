package com.petmeeting.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmeeting.mvc.board.model.service.BoardService;
import com.petmeeting.mvc.board.model.vo.Board;

@WebServlet(name = "boardView", urlPatterns = { "/board/view" })
public class BoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardViewServlet() {

    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Board board = null;
    	
    	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
    	
    	System.out.println(boardNo);
    	
    	board = new BoardService().getBoardByBoardNo(boardNo, false);
    	
    	System.out.println(board);
    	
    	request.setAttribute("board", board);
    	request.getRequestDispatcher("/views/board/view.jsp").forward(request, response);
	}

}
