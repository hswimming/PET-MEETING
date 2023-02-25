package com.petmeeting.mvc.walkboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmeeting.mvc.walkboard.model.service.WalkBoardService;
import com.petmeeting.mvc.walkboard.model.vo.WalkBoard;

@WebServlet(name = "walkBoardView", urlPatterns = { "/walkBoard/view" })
public class WalkBoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WalkBoardViewServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	WalkBoard walkBoard = new WalkBoard();
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
    	
    	walkBoard = new WalkBoardService().getWalkBoardBywbNo(wbNo, hasRead);
    	
    	// System.out.println(walkBoard);	
    	
    	request.setAttribute("walkboard", walkBoard);
    	request.getRequestDispatcher("/views/walkboard/view.jsp").forward(request, response);
    	
	}
}