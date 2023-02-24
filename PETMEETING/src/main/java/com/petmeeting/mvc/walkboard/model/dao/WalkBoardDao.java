package com.petmeeting.mvc.walkboard.model.dao;

import static com.petmeeting.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.petmeeting.mvc.common.util.PageInfo;
import com.petmeeting.mvc.walkboard.model.vo.WalkBoard;
import com.petmeeting.mvc.walkboard.model.vo.WalkBoardReply;

public class WalkBoardDao {
	
	/* 게시글 총 개수 조회 쿼리 */
	public int getWalkBoardCount(Connection connection) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM WALKBOARD WHERE WB_STATUS='Y'";
		
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
	public List<WalkBoard> findAll(Connection connection, PageInfo pageInfo) {
		List<WalkBoard> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT RNUM, WB_NO, WB_TITLE, M_NICKNAME, CREATE_DATE, WB_VIEWS, WB_STATUS, ORIGINAL_FILENAME "
					 + "FROM ( "
					 + "        SELECT ROWNUM AS RNUM, "
					 + "        WB_NO, "
					 + "        WB_TITLE, "
					 + "        M_NICKNAME, "
					 + "        CREATE_DATE, "
					 + "        WB_VIEWS, "
					 + "        WB_STATUS, "
					 + "        ORIGINAL_FILENAME "
					 + "        FROM ( "
					 + "        SELECT  WB.WB_NO, "
					 + "                WB.WB_TITLE, "
					 + "                M.M_NICKNAME, "
					 + "                WB.CREATE_DATE, "
					 + "                WB.WB_VIEWS, "
					 + "                WB.WB_STATUS, "
					 + "                WB.ORIGINAL_FILENAME "
					 + "        FROM WALKBOARD WB JOIN MEMBER M ON(WB.M_CODE = M.M_CODE)  "
					 + "        WHERE WB.WB_STATUS = 'Y' ORDER BY WB.WB_NO DESC "
					 + "    ) "
					 + ") "
					 + "WHERE RNUM BETWEEN ? and ?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				WalkBoard walkBoard = new WalkBoard();
				
				walkBoard.setWbNo(rs.getInt("WB_NO"));
				walkBoard.setRowNum(rs.getInt("RNUM"));
				walkBoard.setMemNickname(rs.getString("M_NICKNAME"));
				walkBoard.setWbTitle(rs.getString("WB_TITLE"));
				walkBoard.setCreateDate(rs.getDate("CREATE_DATE"));
				walkBoard.setWbViews(rs.getInt("WB_VIEWS"));
				walkBoard.setWbStatus(rs.getString("WB_STATUS"));
				walkBoard.setOriginalFileName(rs.getString("ORIGINAL_FILENAME"));
				
				list.add(walkBoard);
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
	public WalkBoard findWalkBoardBywbNo(Connection connection, int wbNo) {
		WalkBoard walkBoard = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT WB.WB_NO, WB.WB_TITLE, M.M_NICKNAME, WB.WB_VIEWS, WB.WB_CONTENT, WB.CREATE_DATE, WB.MODIFY_DATE, WB.ORIGINAL_FILENAME, WB.RENAMED_FILENAME, D.D_NAME, D.D_KIND, D.D_SIZE, D.D_GENDER, D.NEUTERED, D.VACCINE "
					 + "FROM WALKBOARD WB "
					 + "JOIN MEMBER M ON(WB.M_CODE = M.M_CODE) "
					 + "JOIN DOG D ON (WB.D_ID = D.D_ID) "
					 + "WHERE WB.WB_STATUS = 'Y' AND WB.WB_NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, wbNo);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				walkBoard = new WalkBoard();
				
				walkBoard.setWbNo(rs.getInt("WB_NO"));
				walkBoard.setWbTitle(rs.getString("WB_TITLE"));
				walkBoard.setMemNickname(rs.getString("M_NICKNAME"));
				walkBoard.setWbViews(rs.getInt("WB_VIEWS"));
				walkBoard.setOriginalFileName(rs.getString("ORIGINAL_FILENAME"));
				walkBoard.setRenamedFileName(rs.getString("RENAMED_FILENAME"));
				walkBoard.setWbContent(rs.getString("WB_CONTENT"));
				
				walkBoard.setName(rs.getString("D_NAME"));
				walkBoard.setKind(rs.getString("D_KIND"));
				walkBoard.setSize(rs.getString("D_SIZE"));
				walkBoard.setKind(rs.getString("D_GENDER"));
				walkBoard.setNeutered(rs.getString("NEUTERED"));
				walkBoard.setVaccine(rs.getString("VACCINE"));
				
				walkBoard.setReplies(this.getCommentsBywcNo(connection, wbNo));
				walkBoard.setCreateDate(rs.getDate("CREATE_DATE"));
				walkBoard.setModifyDate(rs.getDate("MODIFY_DATE"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return walkBoard;
	}
	
	/* 댓글 조회 쿼리 */
	private List<WalkBoardReply> getCommentsBywcNo(Connection connection, int wcNo) {
		List<WalkBoardReply> replies = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String query = "SELECT R.WR_NO, R.WB_NO, R.WR_CONTENT, M.M_NICKNAME, R.CREATE_DATE, R.MODIFY_DATE "
					 + "FROM WALKREPLY R "
					 + "JOIN MEMBER M ON(R.M_CODE = M.M_CODE) "
					 + "WHERE R.WR_STATUS='Y' AND WR_NO=? "
					 + "ORDER BY R.WR_NO DESC";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, wcNo);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				WalkBoardReply reply = new WalkBoardReply();
				
				reply.setWcNo(rs.getInt("WR_NO"));
				reply.setWbNo(rs.getInt("WB_NO"));
				reply.setWbComment(rs.getString("WR_CONTENT"));
				reply.setWcNickname(rs.getString("M_NICKNAME"));
				reply.setCreateDate(rs.getDate("CREATE_DATE"));
				reply.setModifyDate(rs.getDate("MODIFY_DATE"));
				
				replies.add(reply);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return replies;
	}

	/* 게시글 등록 쿼리 */
	public int insertWalkBoard(Connection connection, WalkBoard walkBoard) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO WALKBOARD VALUES (WB_NO_SEQ.NEXTVAL, ?, 0, ?, ?, DEFAULT, DEFAULT, 0, DEFAULT, ?, ?)";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, walkBoard.getMemberCode());
			// pstmt.setString(2, walkBoard.getDogId());
			pstmt.setString(2, walkBoard.getWbTitle());
			pstmt.setString(3, walkBoard.getWbContent());
			pstmt.setString(4, walkBoard.getOriginalFileName());
			pstmt.setString(5, walkBoard.getRenamedFileName());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	/* 게시글 수정 쿼리 */
	public int updateWalkBoard(Connection connection, WalkBoard walkBoard) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE WALKBOARD SET WB_TITLE=?, WB_CONTENT=?, ORIGINAL_FILENAME=?, RENAMED_FILENAME=?, MODIFY_DATE=SYSDATE WHERE WB_NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, walkBoard.getWbTitle());
			pstmt.setString(2, walkBoard.getWbContent());
			pstmt.setString(3, walkBoard.getOriginalFileName());
			pstmt.setString(4, walkBoard.getRenamedFileName());
			pstmt.setInt(5, walkBoard.getWbNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/* 조회수 증가 쿼리 */
	public int updateWbViews(Connection connection, WalkBoard walkBoard) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE WALKBOARD SET WB_VIEWS=? WHERE WB_NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			walkBoard.setWbViews(walkBoard.getWbViews() + 1);
			
			pstmt.setInt(1, walkBoard.getWbViews());
			pstmt.setInt(2, walkBoard.getWbNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/* 댓글 등록 쿼리 */
	public int insertReply(Connection connection, WalkBoardReply walkBoardReply) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "INSERT INTO WALKREPLY VALUES (WR_NO_SEQ.NEXTVAL, ?, ?, ?, SYSDATE, SYSDATE, DEFAULT)";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, walkBoardReply.getWbNo());
			pstmt.setInt(2, walkBoardReply.getMCode());
			pstmt.setString(3, walkBoardReply.getWbComment());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
}