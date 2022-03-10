package co.Donggle.CollaB.comment.service;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
@Setter
@Getter
public class CommentVO {
	private int comment_id;
	private int comment_order;
	private int comment_group;
	private String comment_content;
	private int comment_class;
	private int card_id;
	private String id;
	private Date comment_date;
	
	
	// commentLikeVO
	private int comment_num;
	private int comment_good;
	private int comment_bad;
//	private int comment_id;
//	private String id;
	
	// commentFileInfoVO
	private int file_id;
	private String file_name;
	private String pfile_name;
	private Date file_date;
//	private int comment_id;
	
// user_info
	private String nickname;
	private String prof_pic;
}
