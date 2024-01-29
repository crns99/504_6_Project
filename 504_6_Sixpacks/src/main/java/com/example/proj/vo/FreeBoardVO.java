package com.example.proj.vo;

import java.util.Date;
import lombok.Data;

@Data
public class FreeBoardVO extends ComBoardVO{
	private String board_id;
	private String title;
	private String content;
	private String reg_user_id; 
	private Date reg_date;
	private int view_cnt;
	private int like_cnt;
	
	private String comment_id;
	private String comment;
	private String com_reg_date;
	private String comment_user_id;
}