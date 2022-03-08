package co.Donggle.CollaB.issue.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class IssueReplyVO {
	private int replyId;
	private int replyIndex;
	private int replyGroup;
	private String replyComment;
	private int replyClass;
	private int issueId;
	private String id;
	private Date replyDate;
}
