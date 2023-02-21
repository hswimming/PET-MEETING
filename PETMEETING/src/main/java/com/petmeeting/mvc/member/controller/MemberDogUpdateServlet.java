package com.petmeeting.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "MemberDogUpdate", urlPatterns = { "/member/update" })
public class MemberDogUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberDogUpdateServlet() {
    }
    
    @Override
   	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       	request.getRequestDispatcher("/views/member/update.jsp").forward(request, response);
       }
    
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("/views/member/update.jsp").forward(request, response);
	}

}
