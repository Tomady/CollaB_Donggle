package co.Donggle.CollaB.calendar.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.Donggle.CollaB.board.service.BoardService;
import co.Donggle.CollaB.board.service.BoardVO;
import co.Donggle.CollaB.calendar.service.calendarService;
import co.Donggle.CollaB.calendar.service.calendarVO;
import co.Donggle.CollaB.user.service.UserService;
import co.Donggle.CollaB.workspace.service.WorkspaceJoinService;

@Controller
public class calendarController {
	
	@Autowired private calendarService calendarDao;
	@Autowired private BoardService boardDao;
	@Autowired private WorkspaceJoinService workspaceJoinDao;
	@Autowired private UserService userDao;
	
	// 일정 보기
	@RequestMapping(value = "/calendar.do", method = RequestMethod.GET)
	public ModelAndView calendar(ModelAndView mv, HttpServletRequest request,
								 HttpSession session, @RequestParam("boardId") int boardid) {
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		String viewpage = "calendar/calendar";
		
		BoardVO vo = new BoardVO();
		vo.setId(userId);
		vo.setBoard_id(boardid);
		int workspaceid = boardDao.boardWorkspaceID(vo); //해당보드의 워크스페이스아이디
		vo.setWorkspace_id(workspaceid);
	
		List<calendarVO> calendar = null;
		
		try {
			calendar = calendarDao.calendarList();
			request.setAttribute("calendarList", calendar);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.setViewName(viewpage);
		//해당 보드의 상세정보-워크스페이스ID,워크스페이스이름,보드이름,보드테마,보드ID - 사이드
		mv.addObject("workspace", boardDao.selectBoard(vo));
		//사용자가 가지고 있는 모든 워크스페이스-워크스페이스ID,워크스페이스이름 - 사이드
		mv.addObject("workspaceList", workspaceJoinDao.workspaceJoinList(userId));
		//해당워크스페이스에서 즐겨찾기한 보드목록 - 사이드
		mv.addObject("boardStar", boardDao.selectBoardStar(vo));
		//해당워크스페이스에서 즐겨찾기하지않은 보드목록 - 사이드
		mv.addObject("unStarBoards",boardDao.selectBoardNonStar(vo));
		//해당 보드의 아이디 - 보드헤더
		mv.addObject("boardID",boardid);
		//해당보드를 즐겨찾기했는지 유무 - 보드헤더
		mv.addObject("starYesOrNo",boardDao.boardStarYesOrNo(vo));
		//해당 보드에 초대되어있는 모든 멤버-아이디,이름,닉네임,비번,이메일,프로필사진,전화번호,회사,토큰,워크스페이스아이디,보드아이디 - 보드헤더
		mv.addObject("boardJoinMembers",userDao.boardJoinMembers(vo));
		//해당워크스페이스멤버 - 해당보드멤버 = 같은워크스페이스 사용하지만 해당 보드에는 없는사람 - 보드헤더
		mv.addObject("boardOthers",userDao.outsideBoardMembers(vo));
		
		return mv;
	}
	
	// 일정 변경 처리
	@RequestMapping(value = "/dateUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public String dateUpdate(@RequestBody calendarVO vo) {
		calendarDao.updateCalendar(vo);
		System.out.println(vo.getCard_start_date());
		System.out.println(vo.getCard_end_date());
		return "dateUpdate";
	}
	
	// 해당 이벤트에 해당하는 카드 상세 보기
	
}
