package co.Donggle.CollaB.board.web;

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
import co.Donggle.CollaB.card.service.CardService;
import co.Donggle.CollaB.card.service.CardVO;
import co.Donggle.CollaB.list.service.ListService;
import co.Donggle.CollaB.list.service.ListVO;
import co.Donggle.CollaB.user.service.UserService;
import co.Donggle.CollaB.workspace.service.WorkspaceJoinService;
import co.Donggle.CollaB.workspace.service.WorkspaceService;
import co.Donggle.CollaB.workspace.service.WorkspaceVO;

@Controller
public class BoardController {
	@Autowired BoardService boardDao;
	@Autowired WorkspaceService workspaceDao;
	@Autowired WorkspaceJoinService workspaceJoinDao;
	@Autowired UserService userDao;
	@Autowired ListService listDao;
	@Autowired CardService cardDao;
	
	//해당워크스페이스 boards페이지로 이동
	@RequestMapping("/Boards")
	public String goBoards(@RequestParam("wkid") int wkid,
					 	   HttpSession session,
						   Model model) {
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		WorkspaceVO wvo = new WorkspaceVO();
		wvo.setWorkspace_id(wkid);
		
		model.addAttribute("workspace",workspaceDao.searchWorkspace(wvo)); //워크스페이스ID,생성자아이디,생성일자,워크스페이스이름
		model.addAttribute("workspaceList",workspaceJoinDao.workspaceJoinList(userId)); //사용자가 가지고 있는 모든 워크스페이스
		
		return "workspaceBoards";
	}
	
	//boards페이지 그려줄 때 바로 실행될 함수
	//해당 워크스페이스에서 사용자가 초대된 보드목록 뿌려주기
	@ResponseBody
	@RequestMapping("/AjaxBoardList")
	public List<BoardVO> AjaxBoardList(@RequestParam("workspaceID") int wkid){
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		
		BoardVO vo = new BoardVO();
		vo.setWorkspace_id(wkid);
		vo.setId(userId);
		
		return boardDao.boardsList(vo);//해당 워크스페이스에서 사용자가 가지고 있는 모든 보드
	}
	
	//보드 생성 & 해당 보드 join
	@ResponseBody
	@RequestMapping("/AjaxCreateNewBoard")
	public BoardVO AjaxCreateNewBoard(@RequestParam("boardThema") String thema,
									  @RequestParam("boardName") String name,
									  @RequestParam("workspaceID") int wkid,
									  HttpSession session) {
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		
		BoardVO vo = new BoardVO();
		vo.setBoard_Title(name);
		vo.setWorkspace_id(wkid);
		vo.setBoard_thema(thema);
		vo.setId(userId);
		
		boardDao.createBoard(vo);
		boardDao.insertBoardJoin(vo);
		
		return boardDao.currentBoardSelect();
	}
	
	//보드 이름 변경
	@ResponseBody
	@RequestMapping("/AjaxBoardRename")
	public BoardVO AjaxBoardRename(@RequestParam("boardId") int boardId,
								@RequestParam("newname") String boardName) {
		BoardVO vo = new BoardVO();
		vo.setBoard_id(boardId);
		vo.setBoard_Title(boardName);
		boardDao.boardRename(vo);
			
		return boardDao.selectBoard(vo);
	}
	
	//보드가입탈퇴
	@ResponseBody
	@RequestMapping("/AjaxBoardJoinDelete")
	public String AjaxBoardDelete(@RequestParam("boardID") int boardID,
								  @RequestParam("workID") int workID,
								  HttpSession session) {
		String result = "";
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		
		BoardVO vo = new BoardVO();
		vo.setId(userId);
		vo.setBoard_id(boardID);
		vo.setWorkspace_id(workID);
		int n = boardDao.boardJoinDelete(vo);
		if(n > 0) {
			result = "YES";
		}else if(n == 0) {
			result = "NO";
		}
			
		return result;
	}
	
	//하나의 보드 클릭시 해당 보드 상세페이지로 이동
	@RequestMapping("/boardDetail")
	public String goBoardDetails(@RequestParam("boardID") int bId,
								 Model model,
								 HttpSession session) {
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		
		BoardVO vo = new BoardVO();
		vo.setId(userId);
		vo.setBoard_id(bId);
		int workspaceId = boardDao.boardWorkspaceID(vo); //해당보드의 워크스페이스아이디
		vo.setWorkspace_id(workspaceId);
		ListVO listvo = new ListVO();
		listvo.setBoard_id(bId);
		
		//해당 보드의 상세정보-워크스페이스ID,워크스페이스이름,보드이름,보드테마,보드ID - 사이드
		model.addAttribute("workspace",boardDao.selectBoard(vo)); 
		//사용자가 가지고 있는 모든 워크스페이스-워크스페이스ID,워크스페이스이름 - 사이드
		model.addAttribute("workspaceList",workspaceJoinDao.workspaceJoinList(userId));
		//해당워크스페이스에서 즐겨찾기한 보드목록 - 사이드
		model.addAttribute("boardStar",boardDao.selectBoardStar(vo));
		//해당워크스페이스에서 즐겨찾기하지않은 보드목록 - 사이드
		model.addAttribute("unStarBoards",boardDao.selectBoardNonStar(vo));
		
		//해당보드를 즐겨찾기했는지 유무
		model.addAttribute("starYesOrNo",boardDao.boardStarYesOrNo(vo));
		//해당 보드의 아이디
		model.addAttribute("boardID",bId);
		//해당 보드가 포함된 워크스페이스 아이디
		model.addAttribute("workspaceID",workspaceId);
		//해당 보드가 포함된 워크스페이스의 모든 멤버-아이디,이름,닉네임,비밀번호,이메일,프로필이미지,연락처,회사,토큰,권한
		model.addAttribute("workspaceJoinMembers",userDao.workspaceJoinMembers(vo));
		//해당 보드에 초대되어있는 모든 멤버-아이디,이름,닉네임,비번,이메일,프로필사진,전화번호,회사,토큰,워크스페이스아이디,보드아이디
		model.addAttribute("boardJoinMembers",userDao.boardJoinMembers(vo));
		//해당 보드가 포함된 워크스페이스에서 사용자가 갖고 있는 보드 목록-보드아이디,보드이름,워크스페이스아이디,보드테마
		model.addAttribute("boardList",boardDao.boardsList(vo));
		//해당워크스페이스멤버 - 해당보드멤버 = 같은워크스페이스 사용하지만 해당 보드에는 없는사람
		model.addAttribute("boardOthers",userDao.outsideBoardMembers(vo));
		//해당 보드에 포함된 리스트 전부
		model.addAttribute("totalList",listDao.selectTotalList(listvo));
		//해당 보드에 포함된 카드 전부
		model.addAttribute("totalCard",listDao.selectTotalCard(listvo));
		
		return "board/board_details";
	}
	
	//보드상세페이지 그릴때 바로 실행-해당보드의 카드목록
	@ResponseBody
	@RequestMapping("/AjaxTotalCards")
	public List<ListVO> AjaxTotalList(@RequestParam("boardID") int boardId) {
		ListVO vo = new ListVO();
		vo.setBoard_id(boardId);
		return listDao.selectTotalCard(vo);
	}
	
	//보드상세페이지 그릴때 바로 실행-카드에 체크리스트 있는지 확인
	@ResponseBody
	@RequestMapping("/AjaxCardCheckListExist")
	public String AjaxCardCheckListExist(@RequestParam("cardId") int cardid) {
		CardVO vo = new CardVO();
		vo.setCard_id(cardid);
		
		int exist = cardDao.cardCheckListExist(vo);
		return exist > 0 ? "YES" : "NO";
	}
	
	//보드상세페이지 그릴때 바로 실행-카드에 파일첨부 있는지 확인
	@ResponseBody
	@RequestMapping("/AjaxCardFileExist")
	public String AjaxCardFileExist(@RequestParam("cardId") int cardid) {
		CardVO vo = new CardVO();
		vo.setCard_id(cardid);
		
		int exist = cardDao.cardFileExist(vo);
		return exist > 0 ? "YES" : "NO";
	}
	
	//보드상세페이지 그릴때 바로 실행-카드에 관리자 프로필 이미지 경로 전달
	@ResponseBody
	@RequestMapping("/AjaxCardManager")
	public String AjaxCardManager(@RequestParam("cardId") int cardid) {
		CardVO vo = new CardVO();
		vo.setCard_id(cardid);
		
		return cardDao.cardManagerProfIMG(vo);
	}
	
	//보드 테마 변경
	@ResponseBody
	@RequestMapping("/AjaxChangeBoardThema")
	public String AjaxChangeBoardThema(@RequestParam("thema")String thema,
									   @RequestParam("boardId") int boardId) {
		String result = "";
		BoardVO vo = new BoardVO();
		vo.setBoard_id(boardId);
		vo.setBoard_thema(thema);
		int n = boardDao.changeBoardThema(vo);
		if(n > 0) {
			result = "YES";
		}else if(n == 0) {
			result = "NO";
		}
		
		return result;
	}
	
	//보드 즐겨찾기 추가
	@ResponseBody
	@RequestMapping("/AjaxAddBoardStar")
	public String AjaxAddBoardStar(@RequestParam("boardId") int boardId,
								   HttpSession session) {
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		
		BoardVO vo = new BoardVO();
		vo.setBoard_id(boardId);
		vo.setId(userId);
		int n = boardDao.boardAddStar(vo);
		
		return n > 0 ? "YES" : "NO";
	}
	
	//보드 즐겨찾기 해제
	@ResponseBody
	@RequestMapping("/AjaxRemoveBoardStar")
	public String AjaxRemoveBoardStar(@RequestParam("boardId") int boardId,
									  HttpSession session) {
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		
		BoardVO vo = new BoardVO();
		vo.setBoard_id(boardId);
		vo.setId(userId);
		int n = boardDao.boardRemoveStar(vo);
		
		return n > 0 ? "YES" : "NO";
	}
	
	//보드 멤버추가
	@ResponseBody
	@RequestMapping("/AjaxAddBoardJoinMember")
	public String AjaxAddBoardJoinMember(@RequestParam("workspaceID") int workspaceID,
										 @RequestParam("boardID") int boardID,
										 @RequestParam("memberID") String memberID) {
		BoardVO vo = new BoardVO();
		vo.setId(memberID);
		vo.setWorkspace_id(workspaceID);
		vo.setBoard_id(boardID);
		
		int n = boardDao.addBoardJoinMember(vo);
		return n > 0 ? "YES" : "NO";
	}
	
//workspaceList페이지에서 사용자가 워크스페이스 클릭시 해당 워크스페이스의 boards페이지로 이동
//	@RequestMapping("/goBoards")
//	public String goBoards(HttpServletRequest hsrq,
//					 	   HttpSession session,
//						   Model model) {
//		//String userId = (String)session.getAttribute("id");
//		String userId = "user1";
//		WorkspaceVO wvo = new WorkspaceVO();
//		wvo.setWorkspace_id(Integer.parseInt(hsrq.getParameter("wkId")));
//		//사이드바때문에 boardDetail랑 보내주는 명 같아야함
//		model.addAttribute("workspace",workspaceDao.searchWorkspace(wvo)); //워크스페이스ID,생성자아이디,생성일자,워크스페이스이름
//		model.addAttribute("workspaceList",workspaceJoinDao.workspaceJoinList(userId)); //사용자가 가지고 있는 모든 워크스페이스
//		
//		return "board/boards";
//	}
	

	
	
}
