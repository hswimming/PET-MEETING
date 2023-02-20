package com.petmeeting.mvc.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.petmeeting.mvc.board.model.vo.Walk_Board;
import static com.petmeeting.mvc.common.jdbc.JDBCTemplate.close;

public class Walk_BoardDao {
	
	public int insert_Walk_Board(Connection connection, Walk_Board walk_Board) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO WALK_BOARD VALUES(WB_NO_SEQ.NEXTVAL,8,swimming,?,?,DEFAULT,DEFAULT,?,DEFAULT)";
		
		try {
			pstmt = connection.prepareStatement(query);
			
//			pstmt.setInt(1, walk_Board.getMemberCode());
			// pstmt.setString(1, walk_Board.getDogId());
			pstmt.setString(1, walk_Board.getWbTitle());
			pstmt.setString(2, walk_Board.getWbContent());
			pstmt.setInt(3, walk_Board.getWbViews());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public int update_Walk_Board(Connection connection, Walk_Board walk_Board) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE WALK_BOARD SET WB_TITLE=? WB_CONTENT=? MODIFY_DATE=DEFAULT";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, walk_Board.getWbTitle());
			pstmt.setString(2, walk_Board.getWbContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}