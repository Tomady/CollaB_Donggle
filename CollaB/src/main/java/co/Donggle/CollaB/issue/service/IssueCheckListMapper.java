package co.Donggle.CollaB.issue.service;

import java.util.List;

public interface IssueCheckListMapper {
	List<IssueCheckListVO> checkList(IssueCheckListVO vo);
	int insertChkLi(IssueCheckListVO vo);
	int deleteChkLi(IssueCheckListVO vo);
	
}
