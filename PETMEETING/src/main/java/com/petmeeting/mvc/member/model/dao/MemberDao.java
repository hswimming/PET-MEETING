package com.petmeeting.mvc.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.petmeeting.mvc.common.jdbc.JDBCTemplate;
import com.petmeeting.mvc.member.model.vo.Dog;

public class MemberDao {

	public int insertDog(Connection connection, Dog dog) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO DOG_INFO ( "
				+ "    D_ID, "
				+ "    D_IMG, "
				+ "    D_NAME, "
				+ "    D_KIND, "
				+ "    D_SIZE, "
				+ "    D_GENDER, "
				+ "    NEUTERED, "
				+ "    VACCINE, "
				+ "    MEMBER_CODE "
				+ ") VALUES('DOG' || DOG_ID.NEXTVAL, 'NULL', ?, ?, ?, ?, ?, ?,'1')";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, dog.getName());
			pstmt.setString(2, dog.getKind());
			pstmt.setString(3, dog.getSize());
			pstmt.setString(4, dog.getGender());
			pstmt.setString(5, dog.getNeutered());
			pstmt.setString(6, dog.getVaccine());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		return result;
	}

}
