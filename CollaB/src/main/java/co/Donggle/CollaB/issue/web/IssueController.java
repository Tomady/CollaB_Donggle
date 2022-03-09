package co.Donggle.CollaB.issue.web;



import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.apache.tiles.autotag.core.runtime.annotation.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.Donggle.CollaB.issue.service.IssueCheckListMapper;
import co.Donggle.CollaB.issue.service.IssueCheckListVO;
import co.Donggle.CollaB.issue.service.IssueItemMapper;
import co.Donggle.CollaB.issue.service.IssueItemVO;
import co.Donggle.CollaB.issue.service.IssueMapper;
import co.Donggle.CollaB.issue.service.IssueVO;


@Controller
public class IssueController {
	
	@Autowired IssueMapper issueDao;
	@Autowired IssueCheckListMapper chkDao;
	@Autowired IssueItemMapper itemDao;
	
	// 이슈게시판 이동
	@RequestMapping("/issueBoard.do")
	public String issueBoard(HttpSession session, Model model, IssueVO vo) {
		String id = (String) session.getAttribute("id");
		List<IssueVO> issue = issueDao.issueList(vo);
		
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
	   public String issueInsert(HttpServletRequest request, IssueVO vo, IssueCheckListVO cvo, IssueItemVO ivo, 
			   @RequestBody IssueItemVO[] items) {
	     
	      System.out.println("이슈타이틀은 " + vo.getIssueTitle());
	      System.out.println("이슈내용은 " + vo.getIssueContent());
	      System.out.println("체크리스트명은 " + cvo.getChkLiTitle());
	      
	      for(IssueItemVO ivo2 : items) {
	    	  System.out.println("되어라!" + ivo2.getItemTitle());
	      }
	      
	      // System.out.println("아이템은 " + ivo.getItemTitle());
	      
	      chkDao.insertChkLi(cvo);
	      itemDao.insertItem(ivo);
	      int n = issueDao.insertIssue(vo);
	      if(n == 1) {
	    	  System.out.println("등록 완");
	    	  
	      }else {
	    	  System.out.println("등록 실패");
	      }  
	       return "redirect:issueBoard.do";
	   }
	

	// 이슈 글 수정 버튼 실행
	@RequestMapping("/issueUpdate.do")
	public String issueUpdate(Model model, HttpSession session, IssueVO vo) {
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		int edit = issueDao.updateIssue(vo);
		
		System.out.println(vo.getIssueTitle());
		System.out.println(vo.getIssueContent());
		
		model.addAttribute("issues", edit);
		
		if(edit > 0) {
			System.out.println("수정 완");
		}else {
			System.out.println("수정 실패");
		}
		
		return "redirect:issueBoard.do";
	}
	// 이슈 글 수정 페이지 이동
	@RequestMapping("/goIssueUpdate.do")
	public String goIssueUpdate(@RequestParam("issueId") int issueId, Model model, IssueVO vo) {
		vo.setIssueId(issueId);
		IssueVO ivo = issueDao.issueSelect(vo);
		model.addAttribute("issue", ivo);
		return "issue/issueUpdate";
	}
	
	// 이슈 글 상세
	@RequestMapping("/issueDetail.do")
	public String issueDetail(Model model, HttpSession session, @RequestParam("issueId") int issueId, IssueVO vo) {
		String id = (String) session.getAttribute("id");
		System.out.println("로그인 된 아이디는" + id);
		vo.setId(id);
		vo.setIssueId(issueId);
		model.addAttribute("issue", issueDao.issueSelect(vo));
		
		return "issue/issueDetail";
	}
	
	// 이슈 글 삭제 ajax
	@ResponseBody
	@RequestMapping("/issueDelete.do") 
	public String roomDelete(HttpServletRequest request) {
      int no = Integer.parseInt(request.getParameter("issueid"));
      
      String result = "false";

      IssueVO vo = new IssueVO();
      vo.setIssueId(no);

      int n = issueDao.deleteIssue(vo);

      if (n > 0) {
         result = "true";
      }

      return result;
   }
}