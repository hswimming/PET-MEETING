package com.petmeeting.mvc.board.model.service;

import static com.petmeeting.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.petmeeting.mvc.common.jdbc.JDBCTemplate.close;
import static com.petmeeting.mvc.common.jdbc.JDBCTemplate.commit;
import static com.petmeeting.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.petmeeting.mvc.board.model.dao.BoardDao;
import com.petmeeting.mvc.board.model.vo.Board;
import com.petmeeting.mvc.common.jdbc.JDBCTemplate;
import com.petmeeting.mvc.common.util.PageInfo;

public class BoardService {

	public int getBoardCount() {
		int count = 0;
		Connection connection = getConnection();
		
		count = new BoardDao().getBoardCount(connection);
		
		
		close(connection);
		
		return count;
	}
	
	
	
	
	
	

	public List<Board> getBoardList(PageInfo pageInfo) {
		List<Board> list = null;
		
		Connection connection = getConnection();
		
		list = new BoardDao().findAll(connection, pageInfo);
		
		
		
		close(connection);
		
		return list;
	}

	
	//———————————————————조회수 증가 
		public Board getBoardByBoardNo(int boardNo, boolean hasRead) {
			Board board = null;
			Connection connection = getConnection();
			
			board = new BoardDao().findBoardByBoardNo(connection, boardNo);
			
			// 게시글 조회 수 증가 로직
			if(board != null && !hasRead) {
				int result = new BoardDao().updateViews(connection, board);
						
				if(result > 0) {
					commit(connection);
				} else {
					rollback(connection);
				}
			}
							
			close(connection);
					
			return board;
		}

	public int save(Board board) {
		int result = 0;
		Connection connection = getConnection();
		
		if(board.getBoardNo() > 0) {
			result = new BoardDao().updateBoard(connection, board);
		} else {
			result = new BoardDao().insertBoard(connection, board);
			
		}
		
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}

		close(connection);
		
		return result;
	}



	public int delete(int no) {
		int result = 0;
		//트랜잭션 처리를 서비스에서! 
		Connection connection = getConnection();
		
		result = new BoardDao().boardStatus(connection, no, "N");
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

}
