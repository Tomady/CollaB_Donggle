package co.Donggle.CollaB.comment.service;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CommentFileInfoVO {
	
	private int file_id;
	private String file_name;
	private String pfile_name;
	private Date file_date;
	private int comment_id;
	
}
