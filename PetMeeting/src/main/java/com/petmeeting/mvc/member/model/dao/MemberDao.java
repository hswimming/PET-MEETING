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
		String query = "SELECT * FROM MEMBER WHERE M_ID=? AND M_STATUS='Y'";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				member = new Member();
				
				member.setMCode(rs.getInt("M_CODE"));
				member.setId(rs.getString("M_ID"));
				member.setPassword(rs.getString("M_PWD"));
				member.setName(rs.getString("M_NAME"));
				member.setNickname(rs.getString("M_NICKNAME"));
				member.setPhone(rs.getString("M_PHONE"));
				member.setAddress(rs.getString("M_ADDRESS"));
				member.setEmail(rs.getString("M_EMAIL"));
				member.setBirth(rs.getString("M_BIRTH"));
				member.setSignUpDate(rs.getDate("M_SU_DATE"));
				member.setGender(rs.getString("M_GENDER"));
				member.setStatus(rs.getString("M_STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return member;
	}
	
	public String findIdByEmail(Connection connection, String email) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String selectId = null;
		String query = "SELECT M_ID FROM MEMBER WHERE M_EMAIL=? AND M_STATUS='Y'";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				selectId = rs.getString("M_ID");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return selectId;
	}
	
//	public boolean findPwd(Connection connection, String id, String email) {
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String selectId = null;
//		String selectEmail = null;
//		String query = "SELECT M_ID FROM MEMBER WHERE M_EMAIL=? AND M_STATUS='Y'";
//		
//		try {
//			pstmt = connection.prepareStatement(query);
//			
//			pstmt.setString(1, email);
//			
//			rs = pstmt.executeQuery();
//			
//			if(!rs.next()) {
//				selectId = rs.getString("M_ID");
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(rs);
//			close(pstmt);
//		}
//		
//		return selectId;
//	}
	
	public int insertMember(Connection connection, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO MEMBER VALUES(M_CODE_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,DEFAULT,?,DEFAULT)";
		
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
		String query ="UPDATE MEMBER SET M_PWD=?,M_NICKNAME=?,M_PHONE=?,M_ADDRESS=? WHERE M_CODE=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, member.getPassword());
			pstmt.setString(2, member.getNickname());
			pstmt.setString(3, member.getPhone());
			pstmt.setString(4, member.getAddress());
			pstmt.setInt(5, member.getMCode());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public boolean emailDuplicateCheck(Connection connection ,String inputEmail) {
		boolean result = false;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(M_EMAIL) FROM MEMBER WHERE M_EMAIL=? AND M_STATUS='Y'";

		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, inputEmail);
			
			rs = pstmt.executeQuery();

			rs.next();
			
			result = (rs.getInt(1) == 1); // 값 없음(0, 사용가능, false) 값 있음(1, 사용 불가능, true)
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return result;
	}
	
	public boolean nickDuplicateCheck(Connection connection ,String inputNick) {
		boolean result = false;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(M_NICKNAME) FROM MEMBER WHERE M_NICKNAME=? AND M_STATUS='Y'";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, inputNick);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			result = (rs.getInt(1) == 1); // 값 없음(0, 사용가능, false) 값 있음(1, 사용 불가능, true)
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
