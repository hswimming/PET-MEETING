package com.petmeeting.mvc.walkboard.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WalkBoard {

	private int rowNum;
	
	private int wbNo;
	
	private int memberCode;
	
	private String memId;
	
	private String memNickname;
	
	private String wbTitle;
	
	private String wbContent;
	
	private int wbViews;
	
	private String wbStatus;
	
	private List<WalkBoardReply> replies;
	
	private String dogId;
	
	private Date createDate;
	
	private Date modifyDate;
	
	private String originalFileName;
	
	private String renamedFileName;
	
//	강아지 정보
	private int num; // (강아지 각각의 번호)
	
	private String name;
	
	private String kind;
	
	private String size;
	
	private String gender;
	
	private String neutered;
	
	private String vaccine;
	
}