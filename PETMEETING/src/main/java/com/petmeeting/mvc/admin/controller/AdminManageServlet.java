package com.petmeeting.mvc.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmeeting.mvc.admin.model.service.AdminService;
import com.petmeeting.mvc.board.model.vo.Board;

@WebServlet(name = "adminManage", urlPatterns = { "/admin/manage" })
public class AdminManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminManageServlet() {
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int countBoard = 0;
    	int countMember = 0;
    	Board board = null;
    	
    	countBoard = new AdminService().AllCountboard();
    	countMember = new AdminService().CountMember();
    	board = new AdminService().recentBoard();
    	
    	request.setAttribute("countBoard", countBoard);
    	request.setAttribute("countMember", countMember);
    	request.setAttribute("board", board);
    	
    	
    	
    	request.getRequestDispatcher("/views/admin/adminPage.jsp").forward(request, response);
	}

}
