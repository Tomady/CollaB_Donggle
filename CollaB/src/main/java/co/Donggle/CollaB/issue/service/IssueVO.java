package co.Donggle.CollaB.issue.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class IssueVO {
	private int issueId;
	private String issueTitle;
	private String issueContent;
	private String issueStatus;
	private String issueCategory;
	private String id;
	private Date issueDate;

	

	
	
}
