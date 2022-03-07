package co.Donggle.CollaB.memberPage.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.Donggle.CollaB.memberPage.service.MemWorkspaceJoinService;
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
	
	
	@RequestMapping("/memberPage.do")
	public String memberPage(Model model, HttpSession session, WorkspaceVO vo, WorkspaceJoinVO jvo) {
		String userId = (String) session.getAttribute("id");
		vo.setWorkspace_id(1);
		jvo.setWorkspace_id(1);
		
		List<WorkspaceJoinVO> list = new ArrayList<WorkspaceJoinVO>();
		list = memWorkspaceJoinDao.workspaceJoinIdselect(jvo);
		System.out.println("================="+list);
		model.addAttribute("workspace", workspaceDao.searchWorkspace(vo));
		model.addAttribute("workspaceList", workspaceJoinDao.workspaceJoinList(userId)); // 사용자가 가지고 있는 모든 워크스페이스
		model.addAttribute("user_infoList", workspaceJoinDao.workspaceTotalMember(jvo)); // 유저들의 총 정보
		model.addAttribute("workspaceUserList", memWorkspaceJoinDao.workspaceJoinIdselect(jvo));
		return "member/memberPage";
		
	}
	
	
}
