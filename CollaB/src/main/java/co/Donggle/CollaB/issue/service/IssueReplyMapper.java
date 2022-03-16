package co.Donggle.CollaB.issue.service;

import java.util.List;

public interface IssueReplyMapper {
	// 이슈상세글 댓글 등록
	int insertIssueReply(IssueReplyVO vo);
	// 댓글 삭제
	int deleteIssueReply(IssueReplyVO vo);
	// 해당 이슈글의 댓글들 나와라
	List<IssueReplyVO> issueReplyLsit(IssueReplyVO vo);
}
