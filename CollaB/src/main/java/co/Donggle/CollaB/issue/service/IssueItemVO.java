package co.Donggle.CollaB.issue.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class IssueItemVO {
	private int item_id;
	private String item_title;
	private String item_status;
	private int checklist_id;
	private int issueid;
}
