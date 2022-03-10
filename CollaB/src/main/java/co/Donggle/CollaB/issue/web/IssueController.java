package co.Donggle.CollaB.issue.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.Donggle.CollaB.board.service.BoardService;
import co.Donggle.CollaB.board.service.BoardVO;

import co.Donggle.CollaB.issue.service.IssueCheckListMapper;
import co.Donggle.CollaB.issue.service.IssueCheckListVO;
import co.Donggle.CollaB.issue.service.IssueItemMapper;
import co.Donggle.CollaB.issue.service.IssueItemVO;
import co.Donggle.CollaB.issue.service.IssueMapper;
import co.Donggle.CollaB.issue.service.IssueVO;
import co.Donggle.CollaB.workspace.service.WorkspaceJoinService;
import co.Donggle.CollaB.workspace.service.WorkspaceService;
import co.Donggle.CollaB.workspace.service.WorkspaceVO;

@Controller
public class IssueController {

	@Autowired
	BoardService boardDao;
	@Autowired
	WorkspaceJoinService workspaceJoinDao;
	@Autowired
	WorkspaceService workspaceDao;
	@Autowired
	IssueMapper issueDao;
	@Autowired
	IssueCheckListMapper chkDao;
	@Autowired
	IssueItemMapper itemDao;

	// 이슈게시판 이동
	@RequestMapping("/issueBoard.do")
	public String issueBoard(HttpSession session, Model model, @RequestParam("workspace_id") int wkid) {
		String userId = (String) session.getAttribute("id");
		WorkspaceVO wkvo = new WorkspaceVO();
		BoardVO vo = new BoardVO();
		IssueVO issuevo = new IssueVO();

		wkvo.setWorkspace_id(wkid);
		vo.setId(userId);
		vo.setWorkspace_id(wkid);
		issuevo.setWorkspace_id(wkid);

		model.addAttribute("issues", issueDao.issueList(issuevo));
		// 사이드바에서 필요한 내용 - 은지가 추가했어용~~ 놀라지마세요 아람걸>_0
		model.addAttribute("workspace", workspaceDao.searchWorkspace(wkvo));
		model.addAttribute("workspaceList", workspaceJoinDao.workspaceJoinList(userId));
		model.addAttribute("boardStar", boardDao.selectBoardStar(vo));
		model.addAttribute("unStarBoards", boardDao.selectBoardNonStar(vo));

		return "issue/issueBoard";
	}

	// 등록 페이지 이동
	@RequestMapping("goIssueInsert.do")
	public String goIssueInsert(HttpSession session, Model model, @RequestParam("workspace_id") int wkid) {
		String userId = (String) session.getAttribute("id");
		WorkspaceVO wkvo = new WorkspaceVO();
		BoardVO vo = new BoardVO();

		wkvo.setWorkspace_id(wkid);
		vo.setId(userId);
		vo.setWorkspace_id(wkid);

		// 사이드바에서 필요한 내용 - 은지가 추가했어용~~ 놀라지마세요 아람걸>_0
		model.addAttribute("workspace", workspaceDao.searchWorkspace(wkvo));
		model.addAttribute("workspaceList", workspaceJoinDao.workspaceJoinList(userId));
		model.addAttribute("boardStar", boardDao.selectBoardStar(vo));
		model.addAttribute("unStarBoards", boardDao.selectBoardNonStar(vo));

		return "issue/issueInsert";
	}

	// 이슈 등록
	@PostMapping("/issueInsert.do")
	public void issueInsert(HttpSession session, IssueVO vo, IssueCheckListVO cvo,
			@RequestParam(value = "itemTitle") List<String> items, HttpServletResponse response) throws IOException {
		// alert 띄울 때 쓰려고
		response.setContentType("text/html; utf-8");
		PrintWriter out = response.getWriter();

		// 세션 아이디 받아오고
		String id = (String) session.getAttribute("id");
		vo.setId(id);
		
		// 이슈 등록해보자
		vo.setWorkspace_id((int) session.getAttribute("enterWorkspaceId"));
		int n = issueDao.insertIssue(vo);
		System.out.println("issue id = " + vo.getIssueId());
		
		// 체크리스트 등록
		cvo.setIssueId(vo.getIssueId());
		int chklistChk = chkDao.insertChkLi(cvo);
		System.out.println(chklistChk);
		
		// 아이템 등록
		for (String str : items) {
			IssueItemVO ivo = new IssueItemVO();
			System.out.println("되어라!" + str);
			ivo.setChkLiId(cvo.getChkLiId());
			ivo.setItemTitle(str);
			itemDao.insertItem(ivo);
		}
		
		// 이슈 등록 검사
		if (n == 1) {
			System.out.println("등록 완");
			out.println("<script>alert('등록 완'); location.href='issueBoard.do?workspace_id=${workspace.id}';</script>");
			out.flush();
		} else {
			System.out.println("등록 실패");
			out.println("<script>alert('회원가입 실패!'); history.back();</script>");
			out.flush();
		}
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

		if (edit > 0) {
			System.out.println("수정 완");
		} else {
			System.out.println("수정 실패");
		}

		return "redirect:issueBoard.do";
	}

	// 이슈 글 수정 페이지 이동
	@RequestMapping("/goIssueUpdate.do")
	public String goIssueUpdate(@RequestParam("issueId") int issueId, Model model, IssueVO vo, HttpSession session,
			@RequestParam("workspace_id") int wkid) {
		String id = (String) session.getAttribute("id");
		WorkspaceVO wkvo = new WorkspaceVO();
		BoardVO boardvo = new BoardVO();
		IssueVO ivo = issueDao.issueSelect(vo);

		wkvo.setWorkspace_id(wkid);
		boardvo.setId(id);
		boardvo.setWorkspace_id(wkid);
		vo.setIssueId(issueId);

		model.addAttribute("issue", ivo);
		// 사이드바에서 필요한 내용 - 은지가 추가했어용~~ 놀라지마세요 아람걸>_0
		model.addAttribute("workspace", workspaceDao.searchWorkspace(wkvo));
		model.addAttribute("workspaceList", workspaceJoinDao.workspaceJoinList(id));
		model.addAttribute("boardStar", boardDao.selectBoardStar(boardvo));
		model.addAttribute("unStarBoards", boardDao.selectBoardNonStar(boardvo));

		return "issue/issueUpdate";
	}

	// 이슈 글 상세
	@RequestMapping("/issueDetail.do")
	public String issueDetail(Model model, HttpSession session, @RequestParam("issueId") int issueId, IssueVO vo,
			@RequestParam("workspace_id") int wkid) {
		String id = (String) session.getAttribute("id");
		WorkspaceVO wkvo = new WorkspaceVO();
		BoardVO boardvo = new BoardVO();
		System.out.println("로그인 된 아이디는" + id);

		wkvo.setWorkspace_id(wkid);
		boardvo.setId(id);
		boardvo.setWorkspace_id(wkid);
		vo.setId(id);
		vo.setIssueId(issueId);

		model.addAttribute("issue", issueDao.issueSelect(vo));
		// 사이드바에서 필요한 내용 - 은지가 추가했어용~~ 놀라지마세요 아람걸>_0
		model.addAttribute("workspace", workspaceDao.searchWorkspace(wkvo));
		model.addAttribute("workspaceList", workspaceJoinDao.workspaceJoinList(id));
		model.addAttribute("boardStar", boardDao.selectBoardStar(boardvo));
		model.addAttribute("unStarBoards", boardDao.selectBoardNonStar(boardvo));

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