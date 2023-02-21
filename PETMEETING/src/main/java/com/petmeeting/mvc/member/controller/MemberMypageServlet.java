package com.petmeeting.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "memberMypage", urlPatterns = { "/member/myPage" })
public class MemberMypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberMypageServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/member/myPage.jsp").forward(request, response);
	}

}
