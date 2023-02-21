package com.petmeeting.mvc.member.model.service;

import static com.petmeeting.mvc.common.jdbc.JDBCTemplate.close;
import static com.petmeeting.mvc.common.jdbc.JDBCTemplate.commit;
import static com.petmeeting.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.petmeeting.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;

import com.petmeeting.mvc.member.model.dao.MemberDao;
import com.petmeeting.mvc.member.model.vo.Dog;

public class MemberService {

	public int dogSave(Dog dog) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new MemberDao().insertDog(connection, dog);
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

}
