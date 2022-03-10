package co.Donggle.CollaB.timeline.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.Donggle.CollaB.board.service.BoardService;
import co.Donggle.CollaB.board.service.BoardVO;
import co.Donggle.CollaB.user.service.UserService;
import co.Donggle.CollaB.workspace.service.WorkspaceJoinService;

import co.Donggle.CollaB.timeline.service.TimelineCardMapper;
import co.Donggle.CollaB.timeline.service.TimelineListMapper;

@Controller
public class TimelineController {
	@Autowired private BoardService boardDao;
	@Autowired private WorkspaceJoinService workspaceJoinDao;
	@Autowired private UserService userDao;
	
	@Autowired TimelineCardMapper cardDao;
	@Autowired TimelineListMapper listDao;
	
	
	// 타임라인 페이지 이동
	@RequestMapping("/timeline.do")
	public String timeline(@RequestParam("boardID") int bId, Model model, HttpSession session) {
		String userId = (String)session.getAttribute("id");
		
		BoardVO vo = new BoardVO();
		vo.setId(userId);
		vo.setBoard_id(bId);
		int workspaceId = boardDao.boardWorkspaceID(vo); // 해당보드의 워크스페이스아이디
		vo.setWorkspace_id(workspaceId);
		
		// 해당 보드의 상세정보-워크스페이스ID,워크스페이스이름,보드이름,보드테마,보드ID - 사이드
		model.addAttribute("workspace", boardDao.selectBoard(vo));
		// 사용자가 가지고 있는 모든 워크스페이스-워크스페이스ID,워크스페이스이름 - 사이드
		model.addAttribute("workspaceList", workspaceJoinDao.workspaceJoinList(userId));
		// 해당워크스페이스에서 즐겨찾기한 보드목록 - 사이드
		model.addAttribute("boardStar", boardDao.selectBoardStar(vo));
		// 해당워크스페이스에서 즐겨찾기하지않은 보드목록 - 사이드
		model.addAttribute("unStarBoards", boardDao.selectBoardNonStar(vo));
		// 해당보드를 즐겨찾기했는지 유무 - 보드헤더
		model.addAttribute("starYesOrNo", boardDao.boardStarYesOrNo(vo));
		// 해당 보드의 아이디 - 보드헤더
		model.addAttribute("boardID", bId);
		// 해당 보드에 초대되어있는 모든 멤버-아이디,이름,닉네임,비번,이메일,프로필사진,전화번호,회사,토큰,워크스페이스아이디,보드아이디 - 보드헤더
		model.addAttribute("boardJoinMembers", userDao.boardJoinMembers(vo));
		// 해당워크스페이스멤버 - 해당보드멤버 = 같은워크스페이스 사용하지만 해당 보드에는 없는사람 - 보드헤더
		model.addAttribute("boardOthers", userDao.outsideBoardMembers(vo));
		
		return "timeline/timeline";
	}
	
	// 해당 보드의 리스트 출력
	
	// 타임라인에서 리스트 추가
	
	// 리스트 클릭 시 카드 내용 캘린더에 출력
	
	// 타임라인에서 카드 추가
}
