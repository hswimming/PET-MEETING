package com.petmeeting.mvc.board.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Walk_Comment {
	
	private int wcNo;
	
	private int wbNo;
	
	private String wbComment;
	
	private Date createDate;
	
	private Date modifyDate;
	
	private String wcStatus;

}