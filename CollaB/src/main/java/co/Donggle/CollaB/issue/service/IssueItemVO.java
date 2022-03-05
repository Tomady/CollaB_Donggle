package co.Donggle.CollaB.issue.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class IssueItemVO {
	private int itemId;
	private String itemTitle;
	private String itemStatus;
	private int chkLiId;
}
