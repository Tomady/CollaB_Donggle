package co.Donggle.CollaB.issue.service;

import java.util.List;

public interface IssueCheckListMapper {
	List<IssueCheckListVO> checkList(IssueCheckListVO vo);
	IssueCheckListVO chkSelect(IssueCheckListVO vo);
	IssueCheckListVO chklistSelect(IssueCheckListVO vo);
	int insertChkLi(IssueCheckListVO vo);
	int deleteChkLi(IssueCheckListVO vo);
}
