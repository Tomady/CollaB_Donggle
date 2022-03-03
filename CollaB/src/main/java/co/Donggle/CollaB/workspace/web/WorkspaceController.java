package co.Donggle.CollaB.workspace.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.Donggle.CollaB.board.service.BoardService;
import co.Donggle.CollaB.board.service.BoardVO;
import co.Donggle.CollaB.user.service.UserVO;
import co.Donggle.CollaB.workspace.service.WorkspaceJoinService;
import co.Donggle.CollaB.workspace.service.WorkspaceJoinVO;
import co.Donggle.CollaB.workspace.service.WorkspaceService;
import co.Donggle.CollaB.workspace.service.WorkspaceVO;

@Controller
public class WorkspaceController {
	@Autowired WorkspaceJoinService workspaceJoinDao;
	@Autowired WorkspaceService workspaceDao;
	@Autowired BoardService boardDao;
	
	//로그인 후 바로 보이는 워크스페이스 목록 페이지
	@RequestMapping("/WorkspaceList")
	public String WorkspaceList(Model model, HttpSession session) {
		//세션에 있는 아이디값 넣어서 해당 유저가 워크스페이스를 하나이상 가지고 있는지 확인.
		//workspaceJoinDao.workspaceJoinCount((String)session.getAttribute("id"));
		String returnPage = "";
		
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		
		int n = workspaceJoinDao.workspaceJoinCount(userId);
		if (n > 0) {
			//워크스페이스 하나 이상 존재 - 해당 사용자의 워크스페이스와 가입된 보드리스트 넘기기
			model.addAttribute("workspaces",workspaceJoinDao.workspaceJoinList(userId));
			model.addAttribute("boards",boardDao.boardList(userId));
			returnPage = "workspaceList";
		}else if(n == 0) {
			//워크스페이스 없음
			returnPage = "workspaceNone";
		}
		
		return returnPage;
	}
	
	//워크스페이스 생성 모달-create버튼 클릭-워크스페이스 만들기
	@ResponseBody
	@RequestMapping("/AjaxCreateWorkspace")
	public String AjaxCreateWorkspace(HttpSession session,
									  @RequestParam("wkspaceName") String wkspaceName) {
		String result = "";
		//세션에 있는 아이디값으로 insert하기
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		System.out.println(wkspaceName);
		
		WorkspaceVO wkVO = new WorkspaceVO();
		wkVO.setWorkspace_title(wkspaceName);
		wkVO.setId(userId);
		WorkspaceJoinVO wkJoinVo = new WorkspaceJoinVO();
		wkJoinVo.setId(userId);
		wkJoinVo.setPermissions("ADMIN");
		
		int n = workspaceDao.workspaceInsert(wkVO);
		if(n > 0) {
			int num = workspaceJoinDao.workspaceJoinInsert(wkJoinVo);
			if(num > 0) {
				int wkid = workspaceDao.selectWorkspaceMaxId();
				result = Integer.toString(wkid);				
			}else if(num == 0) {
				result = "NO";
			}
		}else if (n == 0) {
			result = "NO";			
		}
		
		return result;
	}
	
	//워크스페이스 이름 변경
	@ResponseBody
	@RequestMapping("/AjaxWorkspaceRename")
	public String AjaxWorkspaceRename(@RequestParam("newWSName") String newWSName,
									  @RequestParam("wkid") int wkid,
									  Model model) {
		String result = "";
		WorkspaceVO vo = new WorkspaceVO();
		vo.setWorkspace_title(newWSName);
		vo.setWorkspace_id(wkid);
		int n = workspaceDao.workspaceRename(vo);
		if(n > 0) {
			result = "YES";
		}else if(n == 0) {
			result = "NO";
		}
		
		return result;
	}
	
	//새 쪽지쓰기에서 워크스페이스 하나 클릭시, 해당 워크스페이스 조인멤버출력
	@ResponseBody
	@RequestMapping("/AjaxWorkspaceJoinMembers")
	public List<UserVO> AjaxWorkspaceJoinMembers(@RequestParam("workspaceID") int wkid){
		WorkspaceJoinVO vo = new WorkspaceJoinVO();
		vo.setWorkspace_id(wkid);
		
		return workspaceJoinDao.workspaceTotalMember(vo);
	}
	
	//워크스페이스리스트페이지에서 워크스페이스 탈퇴, 해당워크스페이스의 보드도 탈퇴
	@ResponseBody
	@RequestMapping("/AjaxWorkspaceJoinDelete")
	public String AjaxWorkspaceJoinDelete(@RequestParam("wkid") int wkid,
										HttpSession session) {
		String result = "";
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		
		WorkspaceJoinVO wkjoin = new WorkspaceJoinVO();
		BoardVO boardvo = new BoardVO();
		
		wkjoin.setId(userId);
		wkjoin.setWorkspace_id(wkid);
		boardvo.setId(userId);
		boardvo.setWorkspace_id(wkid);
		
		int n = workspaceJoinDao.workspaceJoinDelete(wkjoin);
		if(n > 0) {
			int r = boardDao.boardJoinDrop(boardvo);
			if(r > 0) {
				result = "YES";
			}else if(r == 0){
				result = "NO";
			}
		}else if(n == 0){
			result = "NO";
		}
		
		return result;
	}
}
