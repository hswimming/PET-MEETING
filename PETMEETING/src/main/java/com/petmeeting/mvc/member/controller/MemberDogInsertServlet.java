package com.petmeeting.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.petmeeting.mvc.member.model.service.MemberService;
import com.petmeeting.mvc.member.model.vo.Dog;

@WebServlet(name = "memberDogInsert", urlPatterns = { "/member/dog/insert" })
public class MemberDogInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberDogInsertServlet() {
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	
    	Dog dog = new Dog();
    	
    	dog.setName(request.getParameter("dogName1"));
    	dog.setKind(request.getParameter("dogKind1"));
    	dog.setSize(request.getParameter("dogSize1"));
    	dog.setGender(request.getParameter("dogGender1"));
    	dog.setNeutered(request.getParameter("neutered1"));
    	
    	String vaccine = request.getParameter("vaccine1") != null ?
				String.join(",", request.getParameterValues("vaccine1")) : null;
    	
    	dog.setVaccine(vaccine);
    
    	System.out.println(dog);
    	
    	int result = new MemberService().dogSave(dog);

		if (result > 0) {
			request.setAttribute("msg", "강아지 정보 저장 성공");
			request.setAttribute("location", "/member/myPage");
		} else {
			request.setAttribute("msg", "강아지 정보 저장 실패");
			request.setAttribute("location", "/member/update"); 
			// location은 replace기 때문에 url이 변경된다 따라서 다시 뒤와 같은 url설정으로 forward 되도록 한다.
		}
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    }

}
