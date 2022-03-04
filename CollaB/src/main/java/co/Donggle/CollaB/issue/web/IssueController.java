package co.Donggle.CollaB.issue.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import co.Donggle.CollaB.issue.service.IssueMapper;
import co.Donggle.CollaB.issue.service.IssueVO;


@Controller
public class IssueController {
	
	@Autowired IssueMapper issueDao;
	
	IssueVO vo = new IssueVO();
	
	
	// 이슈게시판 이동
	@RequestMapping("/issueBoard.do")
	public String issueBoard(HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		List<IssueVO> issue = issueDao.issueList(vo);
		System.out.println(issue.get(0).getId());
		model.addAttribute("issues", issue);
		return "issue/issueBoard";
	}
	// 등록 페이지 이동
	@RequestMapping("goIssueInsert.do")
	public String goIssueInsert() {
		return "issue/issueInsert";
	}
	// 이슈 등록
	@PostMapping("/issueInsert.do")
	public String issueInsert(HttpServletRequest request) {
		
		vo.setId(request.getParameter("id"));
		vo.setIssueTitle(request.getParameter("issue_title"));
		vo.setIssueCategory(request.getParameter("issue_category"));
		vo.setIssueContent(request.getParameter("issue_content"));
		
		/* cvo.setChecklist_title(request.getParameter("chk"));
		
		
		ivo.setItem_title(request.getParameter("item2")); */
		
		System.out.println("등록 완");
		
		
		return "issueBoard.do";
	}
	
	
	// 이슈 글 수정
	@RequestMapping("/issueUpdate.do")
	public String issueUpdate(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		int edit = issueDao.updateIssue(vo);
		vo.setId(id);
		List<IssueVO> issue = issueDao.issueList(vo);
		
		model.addAttribute("issue", issue);
		
		if(edit > 0) {
			System.out.println("수정 완");
		}
		
		return "issueBoard.do";
	}
	
	// 이슈 글 상세
	@RequestMapping("issueDetail.do")
	public String issueDetail(Model model, HttpSession session, @RequestParam("issueId") int issueId) {
		String id = (String) session.getAttribute("id");
		
		vo.setId(id);
		vo.setIssueId(issueId);
		model.addAttribute("issue", issueDao.issueSelect(vo));
		
		return "issue/issueDetail";
	}
	
	// 이슈 글 삭제 ajax
	@ResponseBody
	@RequestMapping("/issueDelete.do") 
	public String roomDelete(HttpServletRequest request, @RequestParam("issueId") int issueId) {
     
      String result = "false";

     
      vo.setIssueId(issueId);

      int n = issueDao.deleteIssue(vo);

      if (n > 0) {
         result = "true";
      }

      return result;
   }
}
