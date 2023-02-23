package com.petmeeting.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "walkBoardMain", urlPatterns = { "/walk_board/main" })
public class BoardMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardMainServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("/views/walk_board_main/main.jsp").forward(request, response);
	}
}