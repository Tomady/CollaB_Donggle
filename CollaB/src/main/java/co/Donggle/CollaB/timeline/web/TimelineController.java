package co.Donggle.CollaB.timeline.web;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.Donggle.CollaB.board.service.BoardService;
import co.Donggle.CollaB.board.service.BoardVO;
import co.Donggle.CollaB.user.service.UserService;
import co.Donggle.CollaB.workspace.service.WorkspaceJoinService;
import co.Donggle.CollaB.timeline.service.TimelineCardMapper;
import co.Donggle.CollaB.timeline.service.TimelineCardVO;
import co.Donggle.CollaB.timeline.service.TimelineListMapper;
import co.Donggle.CollaB.timeline.service.TimelineListVO;

@Controller
public class TimelineController {
	@Autowired BoardService boardDao;
	@Autowired WorkspaceJoinService workspaceJoinDao;
	@Autowired UserService userDao;
	@Autowired TimelineCardMapper cardDao;
	@Autowired TimelineListMapper listDao;

	// 타임라인 페이지 이동
	@GetMapping(value="/timeline.do")
	public String timeline(@RequestParam("boardID") int bId, Model model, HttpSession session) {
		System.out.println("timeline() ddddd");
		String userId = (String) session.getAttribute("id");
		BoardVO vo = new BoardVO();
		vo.setId(userId);
		vo.setBoard_id(bId);
		int workspaceId = boardDao.boardWorkspaceID(vo); // 해당보드의 워크스페이스아이디
		vo.setWorkspace_id(workspaceId);

		// 해당 보드의 리스트 출력
		TimelineListVO listvo = new TimelineListVO();
		listvo.setBoard_id(bId);
		System.out.println("보드아이디는" + listvo.getBoard_id());
		List<TimelineListVO> lists = listDao.timeList(listvo);
		
		for(TimelineListVO li : lists) {
			System.out.println("나올까? : " + li.getList_title());
		}
		
		int listid = lists.get(0).getList_id(); //이거땜에 [Index 0 out of bounds for length 0] 에러나는듯..?
		TimelineCardVO timelineCardVO = new TimelineCardVO();
		timelineCardVO.setList_id(listid);
		List<TimelineCardVO> CardLists = cardDao.timeCardSelect(timelineCardVO);
		
		// 리스트 첫번째 카드리스트
		model.addAttribute("cardlists", CardLists);
		
		for(TimelineCardVO ffff : CardLists) {
			System.out.println(ffff.getCard_end_date());
		}
		model.addAttribute("lists", lists);
		
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
		// 해당 보드가 포함된 워크스페이스 아이디 - 보드헤더
		model.addAttribute("workspaceID", workspaceId);

		return "timeline/timeline";
	}

	// 타임라인에서 리스트 추가
	@PostMapping("/insertTimeList.do")
	public String insertTimeList(TimelineListVO lvo, HttpSession session) {
		String userId = (String) session.getAttribute("id");
		lvo.setId(userId);
		System.out.println("board: " + lvo.getBoard_id());
		System.out.println("title: " + lvo.getList_title());
		System.out.println("나와 이 새꺄" + lvo.getId());
		int l = listDao.insertList(lvo);
		if(l > 0) {
			System.out.println("리스트 등록 완");
		}
		
		String retVal = "redirect:timeline.do?boardID=" + lvo.getBoard_id();
		
		return retVal;
	}
	// 타임라인에서 카드 추가
	@PostMapping("/insertTimeCard.do")
	public String insertTimeCard(TimelineCardVO cvo, Model model, HttpServletRequest req) {
		// form submit 받아와라
		int c = cardDao.insertCard(cvo);
		
		//cvo.setList_id();
		if(c > 0) {
			System.out.println("카드 등록 완");
		}
		
		String retVal = "redirect:timeline.do?boardID=" + req.getParameter("board_id");
		
		return retVal;
	}
	// 리스트 클릭 시 카드 내용 캘린더에 출력
	@RequestMapping("/clickList.do")
	@ResponseBody
	public List<TimelineCardVO> clickList(HttpServletRequest request) {	
		System.out.println(request.getParameter("list_id"));
		TimelineCardVO timelineCardVO = new TimelineCardVO();
		timelineCardVO.setList_id(Integer.parseInt(request.getParameter("list_id")));
		
		List<TimelineCardVO> CardLists = cardDao.timeCardSelect(timelineCardVO);
	
		return CardLists;
	
	}
}
