package com.petmeeting.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "boardSearch", urlPatterns = { "/board/search" })
public class BoardSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardSearchServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/walk_board_search/search.jsp").forward(request, response);
	}
}