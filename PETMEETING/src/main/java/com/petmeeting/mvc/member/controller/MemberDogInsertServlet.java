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

@WebServlet(name = "memberDogInsert", urlPatterns = { "/member/dog/insert" })
public class MemberDogInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberDogInsertServlet() {
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member)session.getAttribute("loginMember");
    	Member member = new Member();
    	int num = 1;
    	int result = 0;
    	
    	Dog dog = new Dog();
    	
    	while(request.getParameter("dogName"+num) != null) {
    		num++;
    	}
    	
    	if(loginMember != null) {
    		member.setMemCode(loginMember.getMemCode());
    		dog.setNum(num);
    		dog.setName(request.getParameter("dogName"+num));
    		dog.setKind(request.getParameter("dogKind"+num));
    		dog.setSize(request.getParameter("dogSize"+num));
    		dog.setGender(request.getParameter("dogGender"+num));
    		dog.setNeutered(request.getParameter("neutered"+num));
    		String vaccine = request.getParameter("vaccine"+num) != null ?
    				String.join(",", request.getParameterValues("vaccine"+num)) : null;
    		
    		dog.setVaccine(vaccine);
    		
    		result = new MemberService().dogSave(dog, member);
		
    	
    	

			if (result > 0) {
				request.setAttribute("msg", "강아지 정보 저장 성공");
				request.setAttribute("location", "/member/myPage");
			} else {
				request.setAttribute("msg", "강아지 정보 저장 실패");
				request.setAttribute("location", "/member/update"); 
			}
    	} else {
    		request.setAttribute("msg", "로그인 후 이용하세요.");
    		request.setAttribute("location", "/"); 
    	}
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    }

}
