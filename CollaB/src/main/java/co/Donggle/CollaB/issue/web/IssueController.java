package co.Donggle.CollaB.issue.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IssueController {
	
	// 이슈게시판
	@RequestMapping("/issueBoard.do")
	public String issueBoard() {
		return "issue/issueBoard";
	}
	
	// 이슈 등록
	@RequestMapping("/issueInsert.do")
	public String issueInsert() {
		return "issue/issueInsert";
	}
	
	// 이슈 글 수정
	@RequestMapping("/issueUpdate.do")
	public String issueUpdate() {
		return "issue/issueUpdate";
	}
	
	// 이슈 글 상세
	@RequestMapping("issueDetail.do")
	public String issueDetail() {
		return "issue/issueDetail";
	}
}
