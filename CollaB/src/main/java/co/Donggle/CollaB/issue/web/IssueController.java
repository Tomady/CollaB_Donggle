package co.Donggle.CollaB.issue.web;

import java.util.ArrayList;
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

import co.Donggle.CollaB.board.service.BoardService;
import co.Donggle.CollaB.board.service.BoardVO;
import co.Donggle.CollaB.issue.service.IssueCheckListMapper;
import co.Donggle.CollaB.issue.service.IssueCheckListVO;
import co.Donggle.CollaB.issue.service.IssueItemMapper;
import co.Donggle.CollaB.issue.service.IssueItemVO;
import co.Donggle.CollaB.issue.service.IssueMapper;
import co.Donggle.CollaB.issue.service.IssueReplyMapper;
import co.Donggle.CollaB.issue.service.IssueReplyVO;
import co.Donggle.CollaB.issue.service.IssueVO;
import co.Donggle.CollaB.recent.service.RecentService;
import co.Donggle.CollaB.recent.service.RecentVO;
import co.Donggle.CollaB.workspace.service.WorkspaceJoinService;
import co.Donggle.CollaB.workspace.service.WorkspaceService;
import co.Donggle.CollaB.workspace.service.WorkspaceVO;

@Controller
public class IssueController {
	@Autowired BoardService boardDao;
	@Autowired WorkspaceJoinService workspaceJoinDao;
	@Autowired WorkspaceService workspaceDao;
	@Autowired IssueMapper issueDao;
	@Autowired IssueItemMapper itemDao;
	@Autowired IssueCheckListMapper chkListDao;
	@Autowired IssueReplyMapper replyDao;
	@Autowired RecentService RecentDao;

	// 이슈게시판 이동
	@RequestMapping("/issueBoard.do")
	public String issueBoard(HttpSession session, 
							 Model model,
							 @RequestParam("workspace_id") int wkid) {
		String userId = (String) session.getAttribute("id");
		WorkspaceVO wkvo = new WorkspaceVO();
		BoardVO vo = new BoardVO();
		IssueVO issuevo = new IssueVO();

		wkvo.setWorkspace_id(wkid);
		vo.setId(userId);
		vo.setWorkspace_id(wkid);
		issuevo.setWorkspace_id(wkid);
		
		// recent
		RecentVO recentvo = new RecentVO();
		recentvo.setId(userId);
		List<RecentVO> recents = new ArrayList<RecentVO>();
		recents = RecentDao.recentBoard(recentvo);
		
		model.addAttribute("issues", issueDao.issueList(issuevo));
		//사이드바에서 필요한 내용 - 은지가 추가했어용~~ 놀라지마세요 아람걸>_0
		model.addAttribute("workspace",workspaceDao.searchWorkspace(wkvo));
		model.addAttribute("workspaceList",workspaceJoinDao.workspaceJoinList(userId));
		model.addAttribute("boardStar", boardDao.selectBoardStar(vo));
		model.addAttribute("unStarBoards",boardDao.selectBoardNonStar(vo));
		model.addAttribute("recents", recents);
		
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
		
		// recent
		RecentVO recentvo = new RecentVO();
		recentvo.setId(userId);
		List<RecentVO> recents = new ArrayList<RecentVO>();
		recents = RecentDao.recentBoard(recentvo);
		
		//사이드바에서 필요한 내용 - 은지가 추가했어용~~ 놀라지마세요 아람걸>_0
		model.addAttribute("workspace",workspaceDao.searchWorkspace(wkvo));
		model.addAttribute("workspaceList",workspaceJoinDao.workspaceJoinList(userId));
		model.addAttribute("boardStar", boardDao.selectBoardStar(vo));
		model.addAttribute("unStarBoards",boardDao.selectBoardNonStar(vo));
		model.addAttribute("recents", recents);

		return "issue/issueInsert";
	}
	
	// 이슈 글 등록
	@ResponseBody
	@PostMapping("/issueInsert.do")
	public String issueInsert(HttpSession session, IssueVO vo, IssueCheckListVO cvo,
			@RequestParam(value = "itemTitle[]") List<String> items) {

		// 세션 아이디 받아오고
		String id = (String) session.getAttribute("id");
		vo.setId(id);

		// 이슈 등록해보자
		vo.setWorkspace_id((int)session.getAttribute("enterWorkspaceId"));
		int n = issueDao.insertIssue(vo);
		System.out.println("issue id = " + vo.getIssueId());

		// 체크리스트 등록
		cvo.setIssue_id(vo.getIssueId());
		int chklistChk = chkListDao.insertChkLi(cvo);
		System.out.println(chklistChk);

		// 아이템 등록
		for (String str : items) {
			IssueItemVO ivo = new IssueItemVO();
			System.out.println("되어라!" + str);
			ivo.setChecklist_id(cvo.getChecklist_id());
			ivo.setItem_title(str);
			itemDao.insertItem(ivo);
		}
		// 이슈 등록 검사
		if (n == 1) {
			System.out.println("등록 완");
			
		} else {
			System.out.println("등록 실패");
		}
		
		return Integer.toString((int)session.getAttribute("enterWorkspaceId"));
	}


	// 이슈 글 수정 버튼 실행
	@RequestMapping("/issueUpdate.do")
	public String issueUpdate(Model model, HttpSession session, IssueVO vo, HttpServletRequest req) {
		String id = (String) session.getAttribute("id");
		int count = 0;
		
		vo.setId(id);
		
		System.out.println("이 값은 어디에 있나효? : " + req.getParameter("item_id"));
		System.out.println("콘솔에 어디에 있느나요? : " + req.getParameter("item_status"));
		
		String[] itemId = req.getParameterValues("item_id");
		String[] itemStatus = req.getParameterValues("item_status");
		
		for(int i=0; i<itemId.length; i++) {
			IssueItemVO itemVO = new IssueItemVO();
			
			if(itemStatus[i].equals("Y")) {
				count += 1;
			}
			
			if(count == itemId.length) {
				vo.setIssueStatus("DONE");
			} else {
				vo.setIssueStatus("TO DO");
			}
			
			itemVO.setItem_id(Integer.parseInt(itemId[i]));
			itemVO.setItem_status(itemStatus[i]);
			
			int n = itemDao.updateItem(itemVO);
			
			if(n > 0) {
				System.out.println("수정 완");
			} else {
				System.out.println("업데이트 실패");
			}
		}

		System.out.println(vo.getIssueTitle());
		System.out.println(vo.getIssueContent());

		int edit = issueDao.updateIssue(vo);
		System.out.println("이슈 아이디: " + vo.getIssueId());
		System.out.println("이슈 타이틀: " + vo.getIssueTitle());
		System.out.println("이슈 카테고리: " + vo.getIssueCategory());
		System.out.println("이슈 컨텐츠: " + vo.getIssueContent());
		
		model.addAttribute("issues", edit);
	
		if (edit > 0) {
			System.out.println("수정 완");
		} else {
			System.out.println("수정 실패");
		}

		int workspaceid = (int)session.getAttribute("enterWorkspaceId");
		String url = "redirect:issueBoard.do?workspace_id=" + workspaceid;
		System.out.println("워크스페이스 : " + workspaceid);
		
		return url;
	}

	// 이슈 글 수정 페이지 이동
	@RequestMapping("/goIssueUpdate.do")
	public String goIssueUpdate(@RequestParam("issueId") int issueId, Model model, IssueVO vo, HttpSession session, @RequestParam("workspace_id") int wkid) {
		String id = (String) session.getAttribute("id");
		WorkspaceVO wkvo = new WorkspaceVO();
		BoardVO boardvo = new BoardVO();
		IssueVO ivo = issueDao.issueSelect(vo);

		wkvo.setWorkspace_id(wkid);
		boardvo.setId(id);
		boardvo.setWorkspace_id(wkid);
		vo.setIssueId(issueId);
		
		model.addAttribute("issue", ivo);
		
		// checklist 받아오기
		IssueCheckListVO chkVO = new IssueCheckListVO();
		chkVO.setIssue_id(issueId);
		chkVO = chkListDao.chklistSelect(chkVO);
		
		model.addAttribute("checkList", chkVO);
		
		if(chkVO == null) {
			System.out.println("null 값 넘어옴");
		}
		
		// itemlist 받아오기
		IssueItemVO iIssueItemVO = new IssueItemVO();
		iIssueItemVO.setChecklist_id(chkVO.getChecklist_id());
		model.addAttribute("itemList", itemDao.issueItems(iIssueItemVO));
		
		// recent
		RecentVO recentvo = new RecentVO();
		recentvo.setId(id);
		List<RecentVO> recents = new ArrayList<RecentVO>();
		recents = RecentDao.recentBoard(recentvo);
		
		//사이드바에서 필요한 내용 - 은지가 추가했어용~~ 놀라지마세요 아람걸>_0
		model.addAttribute("workspace",workspaceDao.searchWorkspace(wkvo));
		model.addAttribute("workspaceList",workspaceJoinDao.workspaceJoinList(id));
		model.addAttribute("boardStar", boardDao.selectBoardStar(boardvo));
		model.addAttribute("unStarBoards",boardDao.selectBoardNonStar(boardvo));
		model.addAttribute("recents", recents);

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
		
		// dy
		// checklist 받아오기
		IssueCheckListVO chkVO = new IssueCheckListVO();
		chkVO.setIssue_id(issueId);
		chkVO = chkListDao.chklistSelect(chkVO);
		
		model.addAttribute("checkList", chkVO);
		
		if(chkVO == null) {
			System.out.println("null 값 넘어옴");
		}
		
		// itemlist 받아오기
		IssueItemVO iIssueItemVO = new IssueItemVO();
		iIssueItemVO.setChecklist_id(chkVO.getChecklist_id());
		model.addAttribute("itemList", itemDao.issueItems(iIssueItemVO));
		
		// 해당 이슈글에 등록된 댓글 출력
		IssueReplyVO rvo = new IssueReplyVO();
		rvo.setId(id);
		rvo.setIssueid(issueId);
		System.out.println("아이디이여요!!!!!"+rvo.getId());
		System.out.println("이슈아이디이여요!!!!!"+rvo.getIssueid());
		System.out.println("닉네임이이여요!!!!!"+rvo.getNickname());
		System.out.println("프사여요!!!!!"+rvo.getProf_pic());
		model.addAttribute("reply", replyDao.issueReplyLsit(rvo));
		
		
		// recent
		RecentVO recentvo = new RecentVO();
		recentvo.setId(id);
		List<RecentVO> recents = new ArrayList<RecentVO>();
		recents = RecentDao.recentBoard(recentvo);
		
		// 사이드바에서 필요한 내용 - 은지가 추가했어용~~ 놀라지마세요 아람걸>_0
		model.addAttribute("workspace",workspaceDao.searchWorkspace(wkvo));
		model.addAttribute("workspaceList",workspaceJoinDao.workspaceJoinList(id));
		model.addAttribute("boardStar", boardDao.selectBoardStar(boardvo));
		model.addAttribute("unStarBoards",boardDao.selectBoardNonStar(boardvo));
		model.addAttribute("recents", recents);

		return "issue/issueDetail";
	}

	// 이슈 글 삭제 ajax
	@ResponseBody
	@RequestMapping("/issueDelete.do")
	public String issueDelete(HttpServletRequest request) {
		int isid = Integer.parseInt(request.getParameter("issueid"));
		int chkid = Integer.parseInt(request.getParameter("checklist_id"));
			
		IssueItemVO ivo = new IssueItemVO();
		ivo.setChecklist_id(chkid);
		itemDao.deleteItem(ivo);		
		
		// 체크리스트vo 세팅
		IssueCheckListVO cvo = new IssueCheckListVO();
		cvo.setIssue_id(isid);
		cvo.setChecklist_id(chkid);
		System.out.println("체크리스트아이디이이이이이" + cvo.getChecklist_id());
		chkListDao.deleteChkLi(cvo);

		String result = "false";
		IssueVO vo = new IssueVO();
		vo.setIssueId(isid);
		int n = issueDao.deleteIssue(vo);
				
		if (n > 0) {
			result = "true";
		}

		return result;
	}
	
	//이슈게시판 아이템 진척도 계산
	@ResponseBody
	@RequestMapping("/AjaxIssueItemsAvg")
	public List<IssueItemVO> AjaxIssueItemsAvg(@RequestParam("workspace_id") int wkid) {
		System.out.println("워크스페이스 아이디 : " + wkid);
		List<IssueItemVO> list = itemDao.issueItemSelect(wkid);
		
		for(IssueItemVO vo : list) {
			System.out.println("이슈 아이디 나오라구! " + vo.getIssueid());
		}
				
	  return list;
	}
	
	// =================== 댓글 ===================
	// 이슈상세글 댓글 등록 ajax
	@ResponseBody
	@PostMapping("/AjaxIssueReply")
	public String AjaxIssueReply(IssueReplyVO rvo, HttpServletRequest request, HttpSession session) {
		int isid = Integer.parseInt(request.getParameter("issueid"));
		String comment = request.getParameter("replycomment");
		String id = (String) session.getAttribute("id");
		String result = "false";
		
		// 이슈vo 세팅
		rvo.setIssueid(isid);
		rvo.setReplycomment(comment);
		rvo.setId(id);
		

		int n = replyDao.insertIssueReply(rvo);

		if (n > 0) {
			result = "true";
		}
		return result;
	}
	
	// 댓글 삭제 ajax
		@ResponseBody
		@RequestMapping("/AjaxDelReply")
		public String AjaxDelReply(HttpServletRequest request) {
			int rid = Integer.parseInt(request.getParameter("replyid"));

			String result = "false";

			IssueReplyVO rvo = new IssueReplyVO();
			rvo.setReplyid(rid);
			
			int n = replyDao.deleteIssueReply(rvo);

			if (n > 0) {
				result = "true";
			}

			return result;
		}
}