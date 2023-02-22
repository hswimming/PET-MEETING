package com.petmeeting.mvc.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petmeeting.mvc.member.model.service.MemberService;
import com.petmeeting.mvc.member.model.vo.Dog;
import com.petmeeting.mvc.member.model.vo.Member;

@WebServlet(name = "login", urlPatterns = { "/member/login" })
public class MemberLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberLoginServlet() {
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/member/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = null;
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		Member loginMember = new MemberService().login(id, password);
		
		if (loginMember != null) {
			
			session = request.getSession();
			
			session.setAttribute("loginMember", loginMember);
			
			response.sendRedirect(request.getContextPath() + "/");
		} else {
			request.setAttribute("msg", "아이디나 비밀번호가 일치하지 않습니다.");
			request.setAttribute("location", "/member/login");
			
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		
		
		
		
		
		
	}

}