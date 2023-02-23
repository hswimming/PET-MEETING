package com.petmeeting.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmeeting.mvc.board.model.service.Walk_BoardService;
import com.petmeeting.mvc.board.model.vo.Walk_Board;

@WebServlet(name = "walkBoardView", urlPatterns = { "/walk_board/view" })
public class BoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardViewServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Walk_Board walk_Board = null;
    	int wbNo = Integer.parseInt(request.getParameter("wbNo"));
    	
    	System.out.println("게시글 번호 : " + wbNo);
    	
    	Cookie[] cookies = request.getCookies();
    	String boardHistory = "";
    	boolean hasRead = false;
    	
    	if (cookies != null) {
    		
    		for (Cookie cookie : cookies) {
    			
    			if (cookie.getName().equals("boardHistory")) {
    				boardHistory = cookie.getValue();
    				
    				if (boardHistory.contains("|" + wbNo + "|")) {
    					hasRead = true;
    					
    					break;
    				}
    			}
    		}
    	}
    	
    	if (!hasRead) {
    		Cookie cookie = new Cookie("boardHistory", boardHistory + "|" + wbNo + "|");
    		
    		cookie.setMaxAge(-1);
    		response.addCookie(cookie);
    		
    	}
    	
    	walk_Board = new Walk_BoardService().getWalk_BoardBywbNo(wbNo, hasRead);
    	
    	System.out.println(walk_Board);
    	
    	request.setAttribute("walk_board", walk_Board);
    	request.getRequestDispatcher("/views/walk_board/view.jsp").forward(request, response);
    	
	}
}