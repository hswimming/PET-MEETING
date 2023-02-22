package com.petmeeting.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmeeting.mvc.member.model.service.MemberService;
import com.petmeeting.mvc.member.model.vo.Member;

@WebServlet(name = "signup", urlPatterns = { "/member/signup" })
public class MemberSignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberSignUpServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/member/signup.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		Member member = new Member();
		
		member.setId(request.getParameter("id"));
		member.setPassword(request.getParameter("password"));
		member.setName(request.getParameter("name"));
		member.setNickname(request.getParameter("nickname"));
		member.setPhone(request.getParameter("phone"));
		member.setAddress(request.getParameter("address"));
		member.setEmail(request.getParameter("email"));
		member.setBirth(request.getParameter("birth"));
		member.setGender(request.getParameter("gender"));
		
		
		System.out.println(member);
		
		int result = new MemberService().memberSave(member);
		
		
		
		
		if(result > 0) {
			request.setAttribute("msg", "회원 가입 성공");
			request.setAttribute("location", "/");
		} else {
			request.setAttribute("msg", "회원 가입 실패하셨습니다, 다시 확인해 주세요.");
			request.setAttribute("location", "/");			
		}
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
		
		
	}

