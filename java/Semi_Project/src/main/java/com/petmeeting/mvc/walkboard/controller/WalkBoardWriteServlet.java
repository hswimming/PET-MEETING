package com.petmeeting.mvc.walkboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.petmeeting.mvc.walkboard.model.service.WalkBoardService;
import com.petmeeting.mvc.member.model.vo.Dog;
import com.petmeeting.mvc.walkboard.model.vo.WalkBoard;
import com.petmeeting.mvc.member.model.service.MemberService;
import com.petmeeting.mvc.member.model.vo.Member;
import com.petmeeting.mvc.common.util.FileRename;
import com.oreilly.servlet.MultipartRequest;

@WebServlet(name = "walkBoardWrite", urlPatterns = { "/walkBoard/write" })
public class WalkBoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public WalkBoardWriteServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
    	
    	if (loginMember != null) {
    		request.getRequestDispatcher("/views/walkboard/write.jsp").forward(request, response);
    		
    	} else {
    		request.setAttribute("msg", "로그인 후 작성 해주세요.");
    		request.setAttribute("location", "/");
    		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	}
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("loginMember");
    	
    	if (loginMember != null) {
    		
    		String path = getServletContext().getRealPath("/resources/upload/walkboard");
    		
    		int maxSize = 10485760;
    		
    		String encoding = "UTF-8";
    		
    		MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());
    		
    		WalkBoard walkBoard = new WalkBoard();
    		
    		Dog dog = new Dog();
    		
    		dog = new MemberService().findDogByCode(loginMember.getMCode());
    		
    		walkBoard.setMemberCode(loginMember.getMCode());
    		walkBoard.setDogId(dog.getId());
    		walkBoard.setWbTitle(mr.getParameter("content_title"));
    		walkBoard.setWbContent(mr.getParameter("content"));
    		walkBoard.setMemNickname(loginMember.getNickname());
    		
    		walkBoard.setRenamedFileName(mr.getFilesystemName("upfile"));
    		walkBoard.setOriginalFileName(mr.getOriginalFileName("upfile"));
    		
    		System.out.println(walkBoard);
    		
    		int result = new WalkBoardService().save(walkBoard);
    		
    		if (result > 0) {
    			request.setAttribute("msg", "게시글 등록 성공");
        		request.setAttribute("location", "/walkBoard/list");
        		
    		} else {
    			request.setAttribute("msg", "게시글 등록 실패");
        		request.setAttribute("location", "/walkBoard/list");
    		}
    		
    	} else {
    		request.setAttribute("msg", "로그인 후 작성 해주세요.");
    		request.setAttribute("location", "/");

    	}
    	
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	
	}
}