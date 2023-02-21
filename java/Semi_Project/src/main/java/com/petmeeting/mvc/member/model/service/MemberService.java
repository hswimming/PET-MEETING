package com.petmeeting.mvc.member.model.service;

import java.sql.Connection;

import com.petmeeting.mvc.member.model.dao.MemberDao;
import com.petmeeting.mvc.member.model.vo.Member;
import static com.petmeeting.mvc.common.jdbc.JDBCTemplate.commit;
import static com.petmeeting.mvc.common.jdbc.JDBCTemplate.rollback;
import static com.petmeeting.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.petmeeting.mvc.common.jdbc.JDBCTemplate.close;

public class MemberService {

	public Member login(String id, String password) {
		Member member = this.findMemberById(id);
		
		if(member == null || !member.getPassword().equals(password)) {
			
			return null;
		}

		return member;
	}
	
	public int memberSave(Member member) {
		int result = 0;
		Connection connection = getConnection();
		
		if(member.getMemCode() > 0) {
			result = new MemberDao().updateMember(connection, member);
		} else {
			result = new MemberDao().insertMember(connection, member);
		}
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}
	
	public Member findMemberById(String id) {
		Connection connection = getConnection();
		
		Member member = new MemberDao().findMemberById(connection, id);
		
		close(connection);
		
		
		return member;
	}
	
	
	
	
	
}
