package com.petmeeting.mvc.board.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Walk_Board {

	private int rowNum;
	
	private int wbNo;
	
	private int memberCode;
	
	private String memId;
	
	private String memNickname;
	
	private String wbTitle;
	
	private String wbContent;
	
	private int wbViews;
	
	private String wbStatus;
	
	private List<Walk_Comment> comments;
	
	private String dogId;
	
	private Date createDate;
	
	private Date modifyDate;
	
}