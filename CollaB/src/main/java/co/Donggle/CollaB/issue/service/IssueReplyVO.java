package co.Donggle.CollaB.issue.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class IssueReplyVO {
	private int replyid;
	private int replyindex;
	private int replygroup;
	private String replycomment;
	private int replyclass;
	private int issueid;
	private String id;
	private Date replydate;
	
	// user_info 
	private String nickname;
	private String prof_pic;
}
