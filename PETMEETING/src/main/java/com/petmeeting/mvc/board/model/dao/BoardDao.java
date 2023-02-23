package com.petmeeting.mvc.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import org.apache.tomcat.dbcp.dbcp2.PStmtKey;

import com.petmeeting.mvc.board.model.vo.Board;
import com.petmeeting.mvc.common.util.PageInfo;

import static com.petmeeting.mvc.common.jdbc.JDBCTemplate.close;;

public class BoardDao {

	public int getBoardCount(Connection connection) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM BOARD WHERE BOARD_STATUS='Y'";
//		String query = "SELECT COUNT(*) FROM BOARD WHERE BOARD_STATUS='Y' AND BOARD_CODE=?";
		
	     try {
	         pstmt = connection.prepareStatement(query);
	         
	         // BOARD_CODE가 '신고'일때 조건절의 ?를 "신고"로 설정해주고 갯수 조회하기
//	         pstmt.setString(1, "B3");
	         
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	            count = rs.getInt(1);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rs);
	         close(pstmt);
	      }

	      return count;
	   }


	  public List<Board> findAll(Connection connection, PageInfo pageInfo) {
	      List<Board> list = new ArrayList<>();
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;

	      String query = "SELECT RNUM, BOARD_NO, BOARD_CODE,BOARD_NAME, BOARD_NUMBER, BOARD_TITLE, MEMBER_CODE,MEM_ID, MEM_NICKNAME ,CREATE_DATE, VIEWS\r\n"
	            + "FROM(\r\n"
	            + "    SELECT ROWNUM AS RNUM, BOARD_NO, BOARD_CODE, BOARD_NAME, BOARD_NUMBER, BOARD_TITLE, MEMBER_CODE,MEM_ID, MEM_NICKNAME, CREATE_DATE, VIEWS\r\n"
	            + "    FROM (\r\n"
	            + "        SELECT BOARD_NO, B.BOARD_CODE, BC.BOARD_NAME, BOARD_NUMBER, BOARD_TITLE, MEMBER_CODE,MEM_ID, MEM_NICKNAME, CREATE_DATE, VIEWS\r\n"
	            + "        FROM BOARD B\r\n"
	            + "        JOIN MEMBER M ON(B.MEMBER_CODE = M.MEM_CODE)\r\n"
	            + "        JOIN BOARD_CODE BC ON(B.BOARD_CODE = BC.BOARD_CODE)\r\n"
	            + "        WHERE BOARD_STATUS='Y'\r\n"
	            + "        ORDER BY BOARD_NO DESC\r\n"
	            + "    )\r\n"
	            + ")\r\n"
	            + "WHERE RNUM BETWEEN ? AND ?";

	      try {
	          pstmt = connection.prepareStatement(query);
	          
	          
	          pstmt.setInt(1, pageInfo.getStartList());
	          pstmt.setInt(2, pageInfo.getEndList());

	             
//	          pstmt.setString(1, "B3");
	 //
//	          pstmt.setInt(2, pageInfo.getStartList());
//	          pstmt.setInt(3, pageInfo.getEndList());
	          
	          rs = pstmt.executeQuery();
	          
	          while(rs.next()) {
	             Board board = new Board();
	             
	             board.setRowNum(rs.getInt("RNUM"));
	             board.setBoardNo(rs.getInt("BOARD_NO"));
	             board.setBoardCode(rs.getString("BOARD_CODE"));
	             board.setBoardName(rs.getString("BOARD_NAME"));
	             board.setBoardNumber(rs.getInt("BOARD_NUMBER"));
	             board.setBoardTitle(rs.getString("BOARD_TITLE"));
	             board.setMemberCode(rs.getInt("MEMBER_CODE"));
	             board.setMemberId(rs.getString("MEM_ID"));
	             board.setMemberNickName(rs.getString("MEM_NICKNAME"));
	             board.setCreateDate(rs.getDate("CREATE_DATE"));
	             board.setViews(rs.getInt("VIEWS"));
	             
	             list.add(board);
	             
	             
	             
	          }
	       } catch (SQLException e) {
	          e.printStackTrace();
	       } finally {
	          close(rs);
	          close(pstmt);
	       }
	       
	       return list;
	    }



	   public Board findBoardByBoardNo(Connection connection, int boardNo) {
	      Board board = null;
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      String query = "SELECT BOARD_NO, B.BOARD_CODE, BOARD_NAME,  BOARD_NUMBER, CREATE_DATE,MEMBER_CODE,MEM_ID, MEM_NICKNAME,  SUBJECT_ID ,BOARD_TITLE,BOARD_CONTENT, VIEWS\r\n"
	            + "FROM BOARD B\r\n"
	            + "JOIN MEMBER M ON(B.MEMBER_CODE = M.MEM_CODE)\r\n"
	            + "JOIN BOARD_CODE BC ON(B.BOARD_CODE = BC.BOARD_CODE)\r\n"
	            + "WHERE BOARD_STATUS = 'Y' AND BOARD_NO=?";
	      
	      try {
	         pstmt = connection.prepareStatement(query);
	         
	         pstmt.setInt(1, boardNo);
	         
	         rs=pstmt.executeQuery();
	         
	         if(rs.next()) {
	            board = new Board();
	            
	            board.setBoardNo(rs.getInt("BOARD_NO"));
	            board.setBoardCode(rs.getString("BOARD_CODE"));
	            board.setBoardName(rs.getString("BOARD_NAME"));
	            board.setBoardNumber(rs.getInt("BOARD_NUMBER"));
	            board.setCreateDate(rs.getDate("CREATE_DATE"));
	            board.setMemberCode(rs.getInt("MEMBER_CODE"));
	            board.setMemberId(rs.getString("MEM_ID"));
	            board.setMemberNickName(rs.getString("MEM_NICKNAME"));
	            board.setSubjectId(rs.getString("SUBJECT_ID"));
	            board.setBoardTitle(rs.getString("BOARD_TITLE"));
	            board.setBoardContent(rs.getString("BOARD_CONTENT"));
	            board.setViews(rs.getInt("VIEWS"));
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rs);
	         close(pstmt);
	      }
	      
	      return board;
	   }
	   
	   
	public int insertBoard(Connection connection, Board board) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO BOARD VALUES SEQ_BOARD_NO.NEXTVAL, ?, ?, ?, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT, DEFAULT ";
				
				try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, board.getBoardCode());
			pstmt.setInt(2, board.getBoardNumber());
			pstmt.setString(3, board.getBoardTitle());
			pstmt.setInt(4, board.getMemberCode());
			pstmt.setString(5, board.getBoardContent());
			pstmt.setString(6, board.getSubjectId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateViews(Connection connection, Board board) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE BOARD SET VIEWS=? WHERE BOARD_NO=? AND BOARD_CODE=? ";
			
		try {
			pstmt = connection.prepareStatement(query);
			
			board.setViews(board.getViews() + 1);
			
			pstmt.setInt(1, board.getViews());
			pstmt.setInt(2, board.getBoardNo());
			pstmt.setString(3, board.getBoardCode());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
		
	}
	  public int updateBoard(Connection connection, Board board) {
	      int result = 0;
	      PreparedStatement pstmt = null;
	      String query="UPDATE BOARD SET BOARD_TITLE=?,BOARD_CONTENT=?, MODIFY_DATE=SYSDATE WHERE BOARD_NO=?";
	      
	      try {
	         pstmt = connection.prepareStatement(query);
	         
	         pstmt.setString(1, board.getBoardTitle());
	         pstmt.setString(2, board.getBoardContent());
	         pstmt.setInt(3, board.getBoardNo());
	         
	         result = pstmt.executeUpdate();
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	      }
	      
	      
	      
	      
	      return result;
	   }

	

	
	
	public int boardStatus(Connection connection, int no, String status) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE BOARD SET BOARD_STATUS=? WHERE BOARD_NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, status);
			pstmt.setInt(2, no);			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	

}
