package com.petmeeting.mvc.board.controller;

import java.sql.Connection;

import com.petmeeting.mvc.board.model.dao.Walk_BoardDao;
import com.petmeeting.mvc.board.model.vo.Walk_Board;
import  static com.petmeeting.mvc.common.jdbc.JDBCTemplate.*;

public class Walk_BoardService {

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