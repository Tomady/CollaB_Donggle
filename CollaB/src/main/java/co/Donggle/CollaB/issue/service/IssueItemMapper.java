package co.Donggle.CollaB.issue.service;

import java.util.List;

public interface IssueItemMapper {
	List<IssueItemVO> issueItems(IssueItemVO vo);
	int insertItem(IssueItemVO vo);
	int updateItem(IssueItemVO vo);
	List<IssueItemVO> issueItemSelect(int wkid);
	int deleteItem(IssueItemVO vo);
}
