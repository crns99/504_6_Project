package com.login.board.vo;

import java.util.Date;
import lombok.Data;

@Data
public class BoardVO extends ComBoardVO{
	private String no;
	private String id;
	private String title;
	private String content; 
	private Date regdate;
	private int readcount;
}