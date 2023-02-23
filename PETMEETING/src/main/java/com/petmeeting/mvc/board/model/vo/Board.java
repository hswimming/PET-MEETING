package com.petmeeting.mvc.board.model.vo;

import java.util.Date;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
   private int boardNo;
   private int rowNum;
   private String boardCode;
   private String boardName;
   private int boardNumber;
   private String boardTitle;
   private int memberCode;
   private String memberId;
   private String memberNickName;
   private String boardContent;
   private String subjectId;
   private Date createDate;
   private Date modifyDate;
   private int views;
   private String boardStatus;
 
   
   public int getReadCount() {
		int result = 0;
		
		
		return result;
	}
	public void setReadCount(int i) {
	}
}