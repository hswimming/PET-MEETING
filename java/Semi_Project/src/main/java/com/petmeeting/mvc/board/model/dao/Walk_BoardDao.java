package com.petmeeting.mvc.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.petmeeting.mvc.board.model.vo.Dog;
import com.petmeeting.mvc.board.model.vo.Walk_Board;
import com.petmeeting.mvc.board.model.vo.Walk_Comment;
import com.petmeeting.mvc.common.util.PageInfo;

import static com.petmeeting.mvc.common.jdbc.JDBCTemplate.close;

public class Walk_BoardDao {
	
	/* 게시글 총 개수 조회 쿼리 */
	public int getWalk_BoardCount(Connection connection) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM WALK_BOARD WHERE WB_STATUS='Y'";
		
		try {
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
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
	
	/* 게시글 목록 조회 쿼리 */
	public List<Walk_Board> findAll(Connection connection, PageInfo pageInfo) {
		List<Walk_Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT RNUM, WB_NO, WB_TITLE, MEM_NICKNAME, CREATE_DATE, WB_VIEWS, WB_STATUS "
					 + "FROM ("
					 + 		"SELECT ROWNUM AS RNUM, "
					 + 				"WB_NO, "
					 + 				"WB_TITLE, "
					 + 				"MEM_NICKNAME, "
					 + 				"CREATE_DATE, "
					 + 				"WB_VIEWS, "
					 + 				"WB_STATUS "
					 + 	"FROM ("
					 + 		"SELECT WB.WB_NO, "
					 + 				"WB.WB_TITLE, "
					 + 				"M.MEM_NICKNAME, "
					 + 				"WB.CREATE_DATE, "
					 + 				"WB.WB_VIEWS, "
					 + 				"WB.WB_STATUS "
					 + 		"FROM WALK_BOARD WB JOIN MEMBER M ON(WB.MEM_CODE = M.MEM_CODE) "
					 + 		"WHERE WB.WB_STATUS = 'Y' ORDER BY WB.WB_NO DESC "
					 + 		")"
					 + ") WHERE RNUM BETWEEN ? and ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Walk_Board walk_Board = new Walk_Board();
				
				walk_Board.setWbNo(rs.getInt("WB_NO"));
				walk_Board.setRowNum(rs.getInt("RNUM"));
				walk_Board.setMemNickname(rs.getString("MEM_NICKNAME"));
				walk_Board.setWbTitle(rs.getString("WB_TITLE"));
				walk_Board.setCreateDate(rs.getDate("CREATE_DATE"));
				walk_Board.setWbViews(rs.getInt("WB_VIEWS"));
				walk_Board.setWbStatus(rs.getString("WB_STATUS"));
				
				list.add(walk_Board);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}
	
	/* 게시글 상세 조회 쿼리 */
	public Walk_Board findWalk_BoardBywbNo(Connection connection, int wbNo) {
		Walk_Board walk_Board = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT  WB.WB_NO, "
					 + "WB.WB_TITLE, "
					 + "M.MEM_NICKNAME, "
					 + "WB.WB_VIEWS, "
					 + "WB.WB_CONTENT, "
					 + "WB.CREATE_DATE, "
					 + "WB.MODIFY_DATE, "
					 + "D.D_NAME, "
					 + "D.D_KIND, "
					 + "D.D_SIZE, "
					 + "D.D_GENDER, "
					 + "D.NEUTERED, "
					 + "D.VACCINE "
				+ "FROM WALK_BOARD WB "
				+ "JOIN MEMBER M ON(WB.MEM_CODE = M.MEM_CODE) "
				+ "JOIN DOG_INFO D ON (WB.D_ID = D.D_ID) "
				+ "WHERE WB.WB_STATUS = 'Y' AND WB.WB_NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, wbNo);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				walk_Board = new Walk_Board();
				
				walk_Board.setWbNo(rs.getInt("WB_NO"));
				walk_Board.setWbTitle(rs.getString("WB_TITLE"));
				walk_Board.setMemNickname(rs.getString("MEM_NICKNAME"));
				walk_Board.setWbViews(rs.getInt("WB_VIEWS"));
				walk_Board.setWbContent(rs.getString("WB_CONTENT"));
				
				walk_Board.setName(rs.getString("D_NAME"));
				walk_Board.setKind(rs.getString("D_KIND"));
				walk_Board.setSize(rs.getString("D_SIZE"));
				walk_Board.setKind(rs.getString("D_GENDER"));
				walk_Board.setNeutered(rs.getString("NEUTERED"));
				walk_Board.setVaccine(rs.getString("VACCINE"));
				
				walk_Board.setComments(this.getCommentsBywcNo(connection, wbNo));
				walk_Board.setCreateDate(rs.getDate("CREATE_DATE"));
				walk_Board.setModifyDate(rs.getDate("MODIFY_DATE"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return walk_Board;
	}
	
	/* 댓글 조회 쿼리 */
	private List<Walk_Comment> getCommentsBywcNo(Connection connection, int wcNo) {
		List<Walk_Comment> comments = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT C.WC_NO, "
						+ "C.WB_NO,"
						+ "C.WB_COMMENT, "
						+ "M.MEM_NICKNAME, "
						+ "C.CREATE_DATE, "
						+ "C.MODIFY_DATE "
					 + "FROM WALK_COMMENT C "
					 + "JOIN MEMBER M ON(C.WC_NICKNAME = M.MEM_NICKNAME) "
					 + "WHERE C.WC_STATUS='Y' AND WC_NO=? "
					 + "ORDER BY C.WC_NO DESC";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, wcNo);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Walk_Comment comment = new Walk_Comment();
				
				comment.setWcNo(rs.getInt("WC_NO"));
				comment.setWbNo(rs.getInt("WB_NO"));
				comment.setWbComment(rs.getString("WB_COMMENT"));
				comment.setWcNickname(rs.getString("MEM_NICKNAME"));
				comment.setCreateDate(rs.getDate("CREATE_DATE"));
				comment.setModifyDate(rs.getDate("MODIFY_DATE"));
				
				comments.add(comment);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return comments;
	}

	/* 게시글 등록 쿼리 */
	public int insert_Walk_Board(Connection connection, Walk_Board walk_Board) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO WALK_BOARD VALUES (WB_NO_SEQ.NEXTVAL, ?, ?, ?, ?, DEFAULT, DEFAULT, 0, DEFAULT)";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, walk_Board.getMemberCode());
			pstmt.setString(2, walk_Board.getDogId());
			pstmt.setString(3, walk_Board.getWbTitle());
			pstmt.setString(4, walk_Board.getWbContent());
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	/* 게시글 수정 쿼리 */
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

	/* 조회수 증가 쿼리 */
	public int updateWb_Views(Connection connection, Walk_Board walk_Board) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE WALK_BOARD SET WB_VIEWS=? WHERE WB_NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			walk_Board.setWbViews(walk_Board.getWbViews() + 1);
			
			pstmt.setInt(1, walk_Board.getWbViews());
			pstmt.setInt(2, walk_Board.getWbNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	
	public Dog findDogByCode(Connection connection, int memCode) {
		return null;
	}
	
}