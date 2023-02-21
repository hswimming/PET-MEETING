package com.petmeeting.mvc.board.model.service;

import java.sql.Connection;
import java.util.List;

import com.petmeeting.mvc.board.model.dao.Walk_BoardDao;
import com.petmeeting.mvc.board.model.vo.Walk_Board;
import com.petmeeting.mvc.common.util.PageInfo;

import static com.petmeeting.mvc.common.jdbc.JDBCTemplate.*;

public class Walk_BoardService {
	
	public int getWalk_BoardCount() {
		int count = 0;
		Connection connection = getConnection();
		
		count = new Walk_BoardDao().getWalk_BoardCount(connection);
		
		close(connection);
		
		return count;
	}
	
	public List<Walk_Board> getWalk_BoardList(PageInfo pageInfo) {
		List<Walk_Board> list = null;
		Connection connection = getConnection();
		
		list = new Walk_BoardDao().findAll(connection, pageInfo);
		
		close(connection);
		
		return list;
	}
	
	public Walk_Board getWalk_BoardBywbNo(int wbNo, boolean hasRead) {
		Walk_Board walk_Board = null;
		Connection connection = getConnection();
		
		walk_Board = new Walk_BoardDao().findWalk_BoardBywbNo(connection, wbNo);
		
		if (walk_Board != null && !hasRead) {
			
			int result = new Walk_BoardDao().updateReadCount(connection, walk_Board);
			
			if (result > 0) {
				commit(connection);
				
			} else {
				rollback(connection);
			}
		}
		
		close(connection);
		
		return walk_Board;
	}

	public int save(Walk_Board walk_Board) {
		int result = 0;
		
		Connection connection = getConnection();
		
		if (walk_Board.getWbNo() > 0) {
			
			result = new Walk_BoardDao().update_Walk_Board(connection, walk_Board);
			
		} else {
			
			result = new Walk_BoardDao().insert_Walk_Board(connection, walk_Board);
		}
		
		if (result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
		
	}

}