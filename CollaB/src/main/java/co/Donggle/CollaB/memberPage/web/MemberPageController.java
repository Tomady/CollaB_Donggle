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
		map.put("userAuthor", memWorkspaceJoinDao.workspaceJoinIdselect(wJvo));
		
		return map;
	}
	
	@RequestMapping("/ajaxBoardsNub.do")
	@ResponseBody
	public List<BoardVO> ajaxBoardsNub(BoardVO vo) {
		String id = vo.getId();

		return boardDao.boardList(id);
	}
	
	@RequestMapping("/ajaxMemBoardsListRow.do")
	@ResponseBody
	public List<BoardVO> ajaxMemBoardsListRow(BoardVO vo){
		String id = vo.getId();
		
		return boardDao.boardList(id);
				
	}

	@RequestMapping("/ajaxMemChangePermission.do")
	@ResponseBody
	public WorkspaceJoinVO ajaxMemChangePermission(WorkspaceJoinVO vo){
		
		return memWorkspaceJoinDao.workspaceJoinUserIdselect(vo);
		
	}
	
	
	
}
