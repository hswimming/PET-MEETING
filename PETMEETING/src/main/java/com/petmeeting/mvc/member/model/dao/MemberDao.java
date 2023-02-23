package com.petmeeting.mvc.member.model.dao;

import static com.petmeeting.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.petmeeting.mvc.admin.model.vo.Admin;
import com.petmeeting.mvc.common.jdbc.JDBCTemplate;
import com.petmeeting.mvc.member.model.vo.Dog;
import com.petmeeting.mvc.member.model.vo.Member;

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
		String query ="UPDATE MEMBER SET MEM_NICKNAME=?, MEM_PHONE=?, MEM_ADDRESS=? WHERE MEM_CODE=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, member.getNickname());
			pstmt.setString(2, member.getPhone());
			pstmt.setString(3, member.getAddress());
			pstmt.setInt(4, member.getMemCode());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 강아지 정보 인서트
	public int insertDog(Connection connection, Dog dog, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO DOG_INFO ( "
				+ "    D_ID, "
				+ "    D_ORI_IMG, "
				+ "    D_RE_IMG, "
				+ "    D_NUM, "
				+ "    D_NAME, "
				+ "    D_KIND, "
				+ "    D_SIZE, "
				+ "    D_GENDER, "
				+ "    NEUTERED, "
				+ "    VACCINE, "
				+ "    MEM_CODE "
				+ ") VALUES('DOG' || DOG_ID.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, dog.getImgOriginName());
			pstmt.setString(2, dog.getImgReName());
			pstmt.setInt(3, dog.getNum());
			pstmt.setString(4, dog.getName());
			pstmt.setString(5, dog.getKind());
			pstmt.setString(6, dog.getSize());
			pstmt.setString(7, dog.getGender());
			pstmt.setString(8, dog.getNeutered());
			pstmt.setString(9, dog.getVaccine());
			pstmt.setInt(10, member.getMemCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		return result;
	}
	
	public Dog findDogByCode(Connection connection, int code) {
		Dog dog = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM DOG_INFO WHERE MEM_CODE=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, code);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dog = new Dog();
				
				dog.setMemCode(rs.getInt("MEM_CODE"));
				dog.setName(rs.getString("D_NAME"));
				dog.setKind(rs.getString("D_KIND"));
				dog.setSize(rs.getString("D_SIZE"));
				dog.setGender(rs.getString("D_GENDER"));
				dog.setNeutered(rs.getString("NEUTERED"));
				dog.setVaccine(rs.getString("VACCINE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return dog;
	}

	public List<Dog> findAllDogByCode(Connection connection, int memCode) {
		List<Dog> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT D_NUM, D_ORI_IMG, D_RE_IMG, D_NAME, D_KIND, D_SIZE, D_GENDER, NEUTERED, VACCINE, MEM_CODE "
					 + "FROM DOG_INFO "
					 + "WHERE MEM_CODE = ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, memCode);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Dog dog = new Dog();
				
				dog.setMemCode(rs.getInt("MEM_CODE"));
				dog.setNum(rs.getInt("D_NUM"));
				dog.setImgOriginName(rs.getString("D_ORI_IMG"));
				dog.setImgReName(rs.getString("D_RE_IMG"));
				dog.setName(rs.getString("D_NAME"));
				dog.setKind(rs.getString("D_KIND"));
				dog.setSize(rs.getString("D_SIZE"));
				dog.setGender(rs.getString("D_GENDER"));
				dog.setNeutered(rs.getString("NEUTERED"));
				dog.setVaccine(rs.getString("VACCINE"));
				
				list.add(dog);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public int countMemberDog(Connection connection, int memCode) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(D_NUM) "
					 + "FROM DOG_INFO "
					 + "WHERE MEM_CODE = ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, memCode);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			result = rs.getInt("COUNT(D_NUM)");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		
		return result;
	}

	public Admin findAdminById(Connection connection, String id) {
		Admin admin = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM ADMIN WHERE ADM_ID=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				admin = new Admin();
				
				admin.setId(rs.getString("ADM_ID"));
				admin.setPassword(rs.getString("ADM_PWD"));
				admin.setRole(rs.getString("ADM_ROLE"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return admin;
	}

	public int updateMemberPassword(Connection connection, int memCode, String userPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE MEMBER SET MEM_PWD=? WHERE MEM_CODE=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, userPwd);
			pstmt.setInt(2, memCode);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
