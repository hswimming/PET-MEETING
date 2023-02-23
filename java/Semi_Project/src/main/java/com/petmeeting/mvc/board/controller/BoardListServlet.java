package com.petmeeting.mvc.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmeeting.mvc.board.model.service.Walk_BoardService;
import com.petmeeting.mvc.board.model.vo.Walk_Board;
import com.petmeeting.mvc.common.util.PageInfo;

@WebServlet(name = "walkBoardList", urlPatterns = { "/walk_board/list" })
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardListServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int page = 0;
    	int listCount = 0;
    	PageInfo pageInfo = null;
    	List<Walk_Board> list = null;
    	
    	try {
    		page = Integer.parseInt(request.getParameter("page"));
			
		} catch (NumberFormatException e) {
			page = 1;
		} 
    	
    	listCount = new Walk_BoardService().getWalk_BoardCount();
    	pageInfo = new PageInfo(page, 10, listCount, 10);
    	list = new Walk_BoardService().getWalk_BoardList(pageInfo);
    	
    	System.out.println(list);
    	
    	request.setAttribute("pageInfo", pageInfo);
    	request.setAttribute("list", list);
    	request.getRequestDispatcher("/views/walk_board/list.jsp").forward(request, response);
	}
}