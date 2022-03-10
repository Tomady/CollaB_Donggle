package co.Donggle.CollaB.calendar.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.Donggle.CollaB.board.service.BoardService;
import co.Donggle.CollaB.board.service.BoardVO;
import co.Donggle.CollaB.calendar.service.calendarService;
import co.Donggle.CollaB.calendar.service.calendarVO;
import co.Donggle.CollaB.card.service.CardVO;
import co.Donggle.CollaB.list.service.ListService;
import co.Donggle.CollaB.list.service.ListVO;
import co.Donggle.CollaB.user.service.UserService;
import co.Donggle.CollaB.workspace.service.WorkspaceJoinService;

@Controller
public class calendarController {
	
	@Autowired private calendarService calendarDao;
	@Autowired private BoardService boardDao;
	@Autowired private WorkspaceJoinService workspaceJoinDao;
	@Autowired private UserService userDao;
	@Autowired private ListService listDao;

	
	// 일정 보기
	@RequestMapping(value = "/calendar.do", method = RequestMethod.GET)
	public ModelAndView calendar(ModelAndView mv, HttpServletRequest request,
									HttpSession session, @RequestParam("boardID") int boardid) {
		String userId = (String)session.getAttribute("id");
		String viewpage = "calendar/calendar";
			
		BoardVO vo = new BoardVO();
		vo.setId(userId);
		vo.setBoard_id(boardid);
		int workspaceid = boardDao.boardWorkspaceID(vo); //해당보드의 워크스페이스아이디
		vo.setWorkspace_id(workspaceid);
			
		ListVO listvo = new ListVO();
		listvo.setBoard_id(boardid);
		List<ListVO> lists = listDao.selectTotalList(listvo);
			
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
		// 해당 보드의 리스트 목록(캘린더 페이지에 리스트 목록)
		mv.addObject("lists", lists);
			
		System.out.println(lists);
			
		return mv;
	}
		
	
	// 일정 가져오기
	@RequestMapping("/dbCalendar")
	@ResponseBody
	public List<Map<String, String>> dbCalendar(@RequestParam("boardid") int boardId) {
		List<Map<String, String>> list = null;
		list = new ArrayList<>();
		List<CardVO> list2 = calendarDao.calendarAllCard(boardId);
		System.out.println(list2);
		
		for(CardVO vo : list2) {
			if(vo.getCard_start_date() != null) {
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("title", vo.getCard_title());
				map.put("start", test(vo.getCard_start_date()));
				map.put("end", test(vo.getCard_end_date()));
				map.put("id", String.valueOf(vo.getCard_id()));
				list.add(map);				
			}
		}
		return list;
	}
	
	// 리스트별 일정 가져오기
	@RequestMapping("/listCalendar")
	@ResponseBody
	public List<Map<String, String>> listCalendar(@RequestParam("boardid") int boardId, @RequestParam("listid") int listId) {
		System.out.println("보드 아이디: " + boardId);
		System.out.println("리스트 아이디: " + listId);
		
		CardVO cardVo = new CardVO();
		cardVo.setBoard_id(boardId);
		cardVo.setList_id(listId);
		
		List<Map<String, String>> list = null;
		list = new ArrayList<>();
		List<CardVO> list2 = calendarDao.listPlanList(cardVo);
		System.out.println(list2);
		
		for(CardVO vo : list2) {
			if(vo.getCard_start_date() != null) {
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("title", vo.getCard_title());
				map.put("start", test(vo.getCard_start_date()));
				map.put("end", test(vo.getCard_end_date()));
				map.put("id", String.valueOf(vo.getCard_id()));
				list.add(map);				
			}
		}
		return list;
	}

	// 날짜 타입 형변환
	public String test(Date d) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String str = format.format(d);
		return str;
	}
	
	// 일정 변경 처리
	@RequestMapping(value = "/dateUpdate", method = RequestMethod.POST)
	@ResponseBody
	public String dateUpdate(@RequestBody calendarVO vo) {
		calendarDao.updateCalendar(vo);
		System.out.println(vo.getCard_start_date());
		System.out.println(vo.getCard_end_date());
		return "dateUpdate";
	}
	
	
	
}
