package co.Donggle.CollaB.fileHistory.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.Donggle.CollaB.board.service.BoardService;
import co.Donggle.CollaB.board.service.BoardVO;
import co.Donggle.CollaB.workspace.service.WorkspaceJoinService;
import co.Donggle.CollaB.workspace.service.WorkspaceService;
import co.Donggle.CollaB.workspace.service.WorkspaceVO;

@Controller
public class FileHIstoryController {

	@Autowired WorkspaceJoinService workspaceJoinDao;
	@Autowired WorkspaceService workspaceDao;
	@Autowired BoardService boardDao;
	
	@RequestMapping("/filehistory.do")
	public String fileHistory(WorkspaceVO wkvo, Model model, HttpSession session, BoardVO vo) {
		String userId = (String) session.getAttribute("id");
		vo.setId(userId);
		model.addAttribute("workspace",workspaceDao.searchWorkspace(wkvo));
		model.addAttribute("workspaceList",workspaceJoinDao.workspaceJoinList(userId));
		model.addAttribute("boardStar", boardDao.selectBoardStar(vo));
		model.addAttribute("unStarBoards",boardDao.selectBoardNonStar(vo));
		return "fileHistory/fileHistory";
	}
}
