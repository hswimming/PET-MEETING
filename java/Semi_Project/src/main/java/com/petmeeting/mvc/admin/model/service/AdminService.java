package com.petmeeting.mvc.admin.model.service;

import static com.petmeeting.mvc.common.jdbc.JDBCTemplate.close;
import static com.petmeeting.mvc.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.petmeeting.mvc.admin.model.vo.Admin;
import com.petmeeting.mvc.member.model.dao.MemberDao;

public class AdminService {

	public Admin login(String id, String password) {
		Admin admin = this.findAdminById(id);
		
		if(admin == null || !admin.getPassword().equals(password)) {
			
			return null;
		}

		return admin;
	}

	private Admin findAdminById(String id) {
		Connection connection = getConnection();
		
		Admin admin = new MemberDao().findAdminById(connection, id);
		
		close(connection);
		
		return admin;
		
	}

}