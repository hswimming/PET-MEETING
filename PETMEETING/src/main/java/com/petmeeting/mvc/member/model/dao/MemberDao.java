package com.petmeeting.mvc.member.model.dao;

import static com.petmeeting.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.petmeeting.mvc.member.model.vo.Member;;

public class MemberDao {
	
	public Member findMemberById(Connection connection, String id) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM MEMBER WHERE MEM_ID=? AND MEM_STATUS='Y'";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				member = new Member();
				
				member.setMemCode(rs.getInt("MEM_CODE"));
				member.setId(rs.getString("MEM_ID"));
				member.setPassword(rs.getString("MEM_PWD"));
				member.setName(rs.getString("MEM_NAME"));
				member.setNickname(rs.getString("MEM_NICKNAME"));
				member.setPhone(rs.getString("MEM_PHONE"));
				member.setAddress(rs.getString("MEM_ADDRESS"));
				member.setEmail(rs.getString("MEM_EMAIL"));
				member.setBirth(rs.getString("MEM_BIRTH"));
				member.setSignUpDate(rs.getDate("MEM_SU_DATE"));
				member.setGender(rs.getString("MEM_GENDER"));
				member.setStatus(rs.getString("MEM_STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return member;
	}
	
	public int insertMember(Connection connection, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO MEMBER VALUES(MEM_CODE_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,DEFAULT,?,DEFAULT)";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getNickname());
			pstmt.setString(5, member.getPhone());
			pstmt.setString(6, member.getAddress());
			pstmt.setString(7, member.getEmail());
			pstmt.setString(8, member.getBirth());
			pstmt.setString(9, member.getGender());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateMember(Connection connection, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query ="UPDATE MEMBER SET MEM_PWD=?,MEM_NICKNAME=?,MEM_PHONE=?,MEM_ADDRESS=? WHERE MEM_CODE=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getNickname());
			pstmt.setString(3, member.getPhone());
			pstmt.setString(4, member.getAddress());
			pstmt.setInt(5, member.getMemCode());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
