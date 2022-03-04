package co.Donggle.CollaB.issue.service;

import java.util.List;

public interface IssueMapper {
	
	// 이슈게시판 글 목록 조회
	List<IssueVO> issueList(IssueVO vo);
	// 글 상세
	IssueVO issueSelect(IssueVO vo);
	// 이슈 글 등록
	int insertIssue(IssueVO vo);
	// 이슈 글 삭제
	int deleteIssue(IssueVO vo);
	// 이슈 글 수정
	int updateIssue(IssueVO vo);
	
}
