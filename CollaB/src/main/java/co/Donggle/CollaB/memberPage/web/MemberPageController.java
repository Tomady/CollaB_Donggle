package co.Donggle.CollaB.memberPage.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.Donggle.CollaB.board.service.BoardService;
import co.Donggle.CollaB.board.service.BoardVO;
import co.Donggle.CollaB.memberPage.service.MemWorkspaceJoinService;
import co.Donggle.CollaB.memberPage.service.MemberPageUserService;
import co.Donggle.CollaB.user.service.UserVO;
import co.Donggle.CollaB.workspace.service.WorkspaceJoinService;
import co.Donggle.CollaB.workspace.service.WorkspaceJoinVO;
import co.Donggle.CollaB.workspace.service.WorkspaceService;
import co.Donggle.CollaB.workspace.service.WorkspaceVO;

@Controller
public class MemberPageController {
	
	@Autowired
	WorkspaceService workspaceDao;
	
	@Autowired
	WorkspaceJoinService workspaceJoinDao;
	
	@Autowired
	MemWorkspaceJoinService memWorkspaceJoinDao;
	
	@Autowired
	BoardService boardDao;
	
	@Autowired
	MemberPageUserService memberPageUserDao;
	
	@RequestMapping("/memberPage.do")
	public String memberPage(Model model, HttpSession session, WorkspaceVO vo, WorkspaceJoinVO jvo) {
		String userId = (String) session.getAttribute("id");
		vo.setWorkspace_id(1);
		jvo.setWorkspace_id(1);
		
		model.addAttribute("workspace", workspaceDao.searchWorkspace(vo));
		model.addAttribute("workspaceList", workspaceJoinDao.workspaceJoinList(userId)); // 사용자가 가지고 있는 모든 워크스페이스
//		model.addAttribute("user_infoList", workspaceJoinDao.workspaceTotalMember(jvo)); // 워크스페이스의 유저 총 수
//		model.addAttribute("workspaceUserList", memWorkspaceJoinDao.workspaceJoinIdselect(jvo)); // 워크스페이스 권한
		
		return "member/memberPage";
		
	}
	
	@RequestMapping("/ajaxMemPageUserList.do")
	@ResponseBody
	public HashMap<String, List> ajaxMemPageUserList(WorkspaceJoinVO wJvo){
		HashMap<String, List> map = new HashMap<String, List>();
		map.put("userList", workspaceJoinDao.workspaceTotalMember(wJvo));
		map.put("userAuthor", memWorkspaceJoinDao.memPageWorkspaceJoinIdselect(wJvo));
		
		return map;
	}
	
	@RequestMapping("/ajaxBoardsNub.do")
	@ResponseBody
	public List<BoardVO> ajaxBoardsNub(BoardVO vo) {
		String id = vo.getId();

		return boardDao.boardsList(vo);
	}
	
	@RequestMapping("/ajaxMemBoardsListRow.do")
	@ResponseBody
	public List<BoardVO> ajaxMemBoardsListRow(BoardVO vo){
		
		
		return boardDao.boardsList(vo);
				
	}

	@RequestMapping("/ajaxMemPermissionsList.do")
	@ResponseBody
	public WorkspaceJoinVO ajaxMemChangePermission(WorkspaceJoinVO vo){
		
		return memWorkspaceJoinDao.memPageWorkspaceJoinCurrentWorkspaceidUseridselect(vo);
		
	}
	
	
	@RequestMapping("/ajaxCuerrentUserPermissionChk.do")
	@ResponseBody
	public boolean ajaxPermissionChk(WorkspaceJoinVO vo, HttpSession session) {
		vo.setId((String) session.getAttribute("id"));
		
		vo = memWorkspaceJoinDao.memPageWorkspaceJoinCurrentWorkspaceidUseridselect(vo);
		String currentPermission = vo.getPermissions();
	
		if(currentPermission.contains("admin")||currentPermission.contains("ADMIN")) {
	
			return true;
		}else {
	
			return false;
		}
	}
	
	@RequestMapping("/ajaxCurrentWorkspacePermissionChk.do")
	@ResponseBody
	public boolean ajaxCurrentWorkspacePermissionChk(WorkspaceJoinVO vo) {
		List<WorkspaceJoinVO> list = memWorkspaceJoinDao.memPageWorkspaceJoinIdselect(vo);
		int chkNum = 0;
		for(WorkspaceJoinVO vo1 : list) {
			String adminChk = vo1.getPermissions();
			if(adminChk.contains("ADMIN")|| adminChk.contains("admin")) chkNum++;
		}
		if(chkNum == 1) return false;
		else return true;
		
			
	}
	
	@RequestMapping("/ajaxTargetUserPermissionChange.do")
	@ResponseBody
	public boolean ajaxTargetUserPermissionChange(WorkspaceJoinVO vo) {
		int flag = memWorkspaceJoinDao.memPageWorkspaceJoinPermissionUpdate(vo);
		if(flag == 0) {
			return false;
		}else {
			return true;
		}
	}
	
	@RequestMapping("/ajaxSessionIdChk.do")
	@ResponseBody
	public boolean ajaxSessionChk(HttpSession session, String chkId) {
		String currentId = (String) session.getAttribute("id");
		if(chkId.equals(currentId)) {
			return true;
		}else {
			return false;
		}
	}
	
	@RequestMapping("/ajaxMemPageBoardRemove.do")
	@ResponseBody
	public boolean ajaxMemPageBoardRemove(BoardVO vo, HttpSession session) {
		vo.setId((String) session.getAttribute("id"));
		int chk = boardDao.boardJoinDelete(vo);
		
		if(chk == 0) {
			return false;
		}else {
			return true;
		}
	}
	@RequestMapping("/ajaxSessionId.do")
	@ResponseBody
	public String ajaxSessionId(HttpSession session) {
	
		return (String) session.getAttribute("id");
	}
	
	@RequestMapping("/ajaxWorkspaceLeave.do")
	@ResponseBody
	public String ajaxWorkspaceLeave(WorkspaceJoinVO wjvo) {

		String id = wjvo.getId();

		for(BoardVO Bvo : boardDao.boardList(id)) {
			boardDao.boardJoinDelete(Bvo); 
			boardDao.deleteBoardstar(Bvo);
		}
		
		workspaceJoinDao.workspaceJoinDelete(wjvo);
		
		return "true";
	}
	
	@RequestMapping("/ajaxWorkspaceTargetUserRemove.do")
	@ResponseBody
	public String ajaxWorkspaceTargetUserRemove(WorkspaceJoinVO wjvo) {
		BoardVO bvo = new BoardVO();
		bvo.setWorkspace_id(wjvo.getWorkspace_id());
		bvo.setId(wjvo.getId());
		
		for(BoardVO Bvo : boardDao.boardsList(bvo)) {
			Bvo.setId(wjvo.getId());
			boardDao.boardJoinDelete(Bvo); 
			boardDao.deleteBoardstar(Bvo);
		}
		
		workspaceJoinDao.workspaceJoinDelete(wjvo);
		
		return "true";
	}
	
	@RequestMapping("/ajaxWorkspaceInviteInputValSearch.do")
	@ResponseBody
	public List<UserVO> ajaxWorkspaceInviteInputValSearch(UserVO vo) {
		
		return memberPageUserDao.memberPageUserSearch(vo);
	}
}
