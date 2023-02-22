package com.petmeeting.mvc.board.model.service;

import java.sql.Connection;
import java.util.List;

import com.petmeeting.mvc.board.model.dao.Walk_BoardDao;
import com.petmeeting.mvc.board.model.vo.Dog;
import com.petmeeting.mvc.board.model.vo.Walk_Board;
import com.petmeeting.mvc.common.util.PageInfo;

import static com.petmeeting.mvc.common.jdbc.JDBCTemplate.*;

public class Walk_BoardService {
	
//	게시글 총 개수 조회
	public int getWalk_BoardCount() {
		int count = 0;
		Connection connection = getConnection();
		
		count = new Walk_BoardDao().getWalk_BoardCount(connection);
		
		close(connection);
		
		return count;
	}
	
//	게시글 목록 조회
	public List<Walk_Board> getWalk_BoardList(PageInfo pageInfo) {
		List<Walk_Board> list = null;
		Connection connection = getConnection();
		
		list = new Walk_BoardDao().findAll(connection, pageInfo);
		
		close(connection);
		
		return list;
	}
	
//	게시글 상세 조회
	public Walk_Board getWalk_BoardBywbNo(int wbNo, boolean hasRead) {
		Walk_Board walk_Board = null;
		Connection connection = getConnection();
		
		walk_Board = new Walk_BoardDao().findWalk_BoardBywbNo(connection, wbNo);
		
		if (walk_Board != null && !hasRead) {
			
			int result = new Walk_BoardDao().updateWb_Views(connection, walk_Board);
			
			if (result > 0) {
				commit(connection);
				
			} else {
				rollback(connection);
			}
		}
		
		close(connection);
		
		return walk_Board;
	}

//	게시글 등록
	public int save(Walk_Board walk_Board) {
		int result = 0;
		
		Connection connection = getConnection();
		
		result = new Walk_BoardDao().insert_Walk_Board(connection, walk_Board);
			
		if (result > 0) {
			commit(connection);
			
		} else {
			rollback(connection);
			
		}
		
		close(connection);
		
		return result;
		
	}

}