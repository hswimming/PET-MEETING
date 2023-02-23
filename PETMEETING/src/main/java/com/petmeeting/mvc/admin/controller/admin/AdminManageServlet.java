package com.petmeeting.mvc.admin.controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "adminManage", urlPatterns = { "/admin/manage" })
public class AdminManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminManageServlet() {
    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("/views/admin/adminPage.jsp").forward(request, response);
	}

}
