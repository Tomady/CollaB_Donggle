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
	
}
