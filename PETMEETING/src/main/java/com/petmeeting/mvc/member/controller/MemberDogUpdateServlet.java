package com.petmeeting.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "MemberDogUpdate", urlPatterns = { "/member/dogUpdate" })
public class MemberDogUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberDogUpdateServlet() {
    }
    
    @Override
   	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	String dogName1 = request.getParameter("dogName1");
    	
    	System.out.println(dogName1);
    	
    	if(dogName1 != null) {
    		request.setAttribute("tabId", "tab-2");
    		request.setAttribute("dogname", "dogName2");
    	}
    	
    	
       	request.getRequestDispatcher("/views/member/dogUpdate.jsp").forward(request, response);
       }

}
