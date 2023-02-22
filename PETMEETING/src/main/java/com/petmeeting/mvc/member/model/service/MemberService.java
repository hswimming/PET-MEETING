package com.petmeeting.mvc.member.model.service;

import static com.petmeeting.mvc.common.jdbc.JDBCTemplate.close;
import static com.petmeeting.mvc.common.jdbc.JDBCTemplate.commit;
import static com.petmeeting.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.petmeeting.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;

import com.petmeeting.mvc.member.model.dao.MemberDao;
import com.petmeeting.mvc.member.model.vo.Dog;
import com.petmeeting.mvc.member.model.vo.Member;

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
	
	
	// 강아지 정보 인서트
	public int dogSave(Dog dog, Member member) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new MemberDao().insertDog(connection, dog, member);
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}
	
	public Dog findDogById(String id) {
		Connection connection = getConnection();
		
		Dog dog = new MemberDao().findDogById(connection, id);
		
		close(connection);
		
		return dog;
	}

	public Boolean isDuplicateNick(String nickname) {
		return this.findMemberById(nickname) != null;
	}

}
