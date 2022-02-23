package co.Donggle.CollaB.workspace.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.Donggle.CollaB.workspace.service.WorkspaceJoinService;
import co.Donggle.CollaB.workspace.service.WorkspaceService;
import co.Donggle.CollaB.workspace.service.WorkspaceVO;

@Controller
public class WorkspaceController {
	@Autowired WorkspaceJoinService workspaceJoinDao;
	@Autowired WorkspaceService workspaceDao; 
	
	//로그인 후 바로 보이는 워크스페이스 목록 페이지
	@RequestMapping("/WorkspaceList")
	public String WorkspaceList(Model model, HttpSession session) {
		//세션에 있는 아이디값 넣어서 해당 유저가 워크스페이스를 하나이상 가지고 있는지 확인.
		//workspaceJoinDao.workspaceJoinCount((String)session.getAttribute("id"));
		String returnPage = "";
		int n = workspaceJoinDao.workspaceJoinCount("user1");
		if (n > 0) {
			returnPage = "workspaceList";
		}else if(n == 0) {
			returnPage = "workspaceNone";
		}
		
		return returnPage;
	}
	
	@ResponseBody
	@RequestMapping("/AjaxCreateWorkspace")
	public String AjaxCreateWorkspace(HttpSession session,
									  @RequestParam("wkspaceName") String wkspaceName) {
		String result = "";
		//세션에 있는 아이디값으로 insert하기
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		System.out.println("컨트롤러들어옴?");
		System.out.println(wkspaceName);
		
		WorkspaceVO wkVO = new WorkspaceVO();
		wkVO.setWorkspace_title(wkspaceName);
		wkVO.setId(userId);
		
		int n = workspaceDao.workspaceInsert(wkVO);
		if(n > 0) {
			result = "YES";
		}else if (n == 0) {
			result = "NO";			
		}
		
		System.out.println(result);
		return result;
	}
}
