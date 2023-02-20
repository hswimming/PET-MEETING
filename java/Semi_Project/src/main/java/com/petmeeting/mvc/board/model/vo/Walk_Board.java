package com.petmeeting.mvc.board.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Walk_Board {

	private int wbNo;
	
	private int memberCode;
	
	private String nickname;
	
	private String dogId;
	
	private String wbTitle;
	
	private String wbContent;
	
	private Date createDate;
	
	private Date modifyDate;
	
	private int wbViews;
	
	private String wbStatus;
	
}