package co.Donggle.CollaB.card.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import co.Donggle.CollaB.checklist.service.checklistService;
import co.Donggle.CollaB.checklist.service.itemInfoService;
import co.Donggle.CollaB.list.service.ListService;
import co.Donggle.CollaB.list.service.ListVO;
import co.Donggle.CollaB.user.service.UserService;
import co.Donggle.CollaB.workspace.service.WorkspaceJoinService;

@Controller
public class CardController {
	@Autowired CardService cardDao;
	@Autowired ListService listDao;
	@Autowired BoardService boardDao;
	@Autowired WorkspaceJoinService workspaceJoinDao;
	@Autowired checklistService checklistDao;
	@Autowired itemInfoService itemInfoDao;
	@Autowired UserService userDao;
	
	//카드 생성
	@ResponseBody
	@RequestMapping("/AjaxAddCard")
	public CardVO AjaxAddCard(@RequestParam("newCardName") String newCardName,
							  @RequestParam("listId") int listId) {
		CardVO vo = new CardVO();
		vo.setCard_title(newCardName);
		vo.setList_id(listId);
		
		cardDao.createCard(vo);
		return cardDao.selectCurrentCard();
	}
	
	//카드 삭제
	// : 카드,카드댓글,댓글파일,댓글좋아요,첨부파일,첨부파일내역,체크리스트,체크리스트item 전부삭제
	// => 카드아이디, 카드댓글아이디, 파일아이디, 체크리스트 아이디 필요
	@ResponseBody
	@RequestMapping("/AjaxDeleteCard")
	public String AjaxDeleteCard(@RequestParam("cardID") int cardID) {
		CardVO cardvo = new CardVO();
		cardvo.setCard_id(cardID);
		int n = 0;
		System.out.println("=====컨트롤러 들어오나?====="+cardID);
		
		List<CardVO> commentids = cardDao.selectCommentIds(cardvo); //해당 카드내의 댓글 아이디 목록
		List<CardVO> fileids = cardDao.selectFileIds(cardvo); //해당 카드에 첨부된 파일 아이디 목록
		List<CardVO> checkids = cardDao.selectCheckListIds(cardvo); //카드 체크리스트 아이디목록
		
		//댓글 아이디 목록 이용해서 카드댓글첨부파일, 카드댓글좋아요 삭제하기
		for(CardVO commentid : commentids) {
			n += cardDao.deleteCardCommentFile(commentid);
			n += cardDao.deleteCardCommentLike(commentid);
		}
		//파일 아이디 목록 이용해서 첨부파일내역 삭제
		for(CardVO fileid : fileids) {
			n += cardDao.deleteCardFileHistory(fileid);
		}
		//체크리스트 아이디 목록 이용해서 체크리스트 아이템 삭제 
		for(CardVO checkid : checkids) {
			n += cardDao.deleteCardCheckItems(checkid);
		}
		//카드아이디 이용해서 카드댓글, 체크리스트, 카드첨부파일 삭제
		n += cardDao.deleteCardComment(cardvo);
		n += cardDao.deleteCardCheckList(cardvo);
		n += cardDao.deleteCardFile(cardvo);
		//카드아이디 이용해서 해당 카드 삭제하기
		n += cardDao.dropCard(cardvo);
		
		String cardid = Integer.toString(cardID);
		
		return n > 0 ? cardid : "NO";
	}
	
	//카드 상세조회
	@RequestMapping("/cardDetail")
	public String cardDetail(@RequestParam("list") int listId,
							 @RequestParam("card") int cardId,
							 HttpSession session,
							 Model model) {
		String userId = (String)session.getAttribute("id");
		
		ListVO listvo = new ListVO();
		listvo.setList_id(listId);
		int boardID = boardDao.selectBoardId(listvo); //해당 카드, 리스트가 속한 보드의 ID
		
		BoardVO vo = new BoardVO();
		vo.setId(userId);
		vo.setBoard_id(boardID);
		int workspaceID = boardDao.boardWorkspaceID(vo); //해당 카드,리스트가 속한 보드의 워크스페이스 ID
		vo.setWorkspace_id(workspaceID);
		CardVO cardvo = new CardVO();
		cardvo.setCard_id(cardId);
		cardvo.setList_id(listId);
		
		//해당 보드의 상세정보-워크스페이스ID,워크스페이스이름,보드이름,보드테마,보드ID - 사이드
		model.addAttribute("workspace",boardDao.selectBoard(vo)); 
		//사용자가 가지고 있는 모든 워크스페이스-워크스페이스ID,워크스페이스이름 - 사이드
		model.addAttribute("workspaceList",workspaceJoinDao.workspaceJoinList(userId));
		//해당워크스페이스에서 즐겨찾기한 보드목록 - 사이드
		model.addAttribute("boardStar",boardDao.selectBoardStar(vo));
		//해당워크스페이스에서 즐겨찾기하지않은 보드목록 - 사이드
		model.addAttribute("unStarBoards",boardDao.selectBoardNonStar(vo));
		//해당카드가 포함된 리스트에 모든 카드-카드이름,카드시작일,카드내용,카드종료일,카드라벨,카드관리자
		model.addAttribute("samelistcards",cardDao.selectCardList(cardvo));
		
		//해당카드정보-카드이름,카드시작일,리스트아이디,카드내용,카드종료일,카드라벨,관리자
		model.addAttribute("cardinfo",cardDao.selectCard(cardvo));
		//해당카드가 포함된 리스트정보
		model.addAttribute("listinfo",cardDao.selectListinfo(cardvo));
		//해당카드가 갖고있는 체크리스트
		model.addAttribute("checkList",checklistDao.totalCheckList(cardvo));
		//체크리스트 아이템목록
		model.addAttribute("checkItems",itemInfoDao.selectedCardItemList());
		//해당 보드에 초대되어있는 모든 멤버-아이디,이름,닉네임,비번,이메일,프로필사진,전화번호,회사,토큰,워크스페이스아이디,보드아이디 - 보드헤더
		model.addAttribute("boardJoinMembers",userDao.boardJoinMembers(vo));
		
		return "card/cardDetail";
	}
	
	//카드상세조회시 바로실행 _ 리스트 내 카드들의 아이템 체크
	@ResponseBody
	@RequestMapping("/AjaxCardDetail_CardItemsCheck")
	public Map<String,String> AjaxCardDetail_CardItemsCheck(@RequestParam("cardId") int cardId){
		Map<String, String> cardItems = new HashMap<String, String>();		
		CardVO cardvo = new CardVO();
		cardvo.setCard_id(cardId);
		
		//관리자 있는지 체크 & 관리자 프로필이미지
		cardItems.put("managerImg", cardDao.cardManagerProfIMG(cardvo));
		
		//체크리스트 있는지 체크. 있으면 YES, 없으면 NO
		int checkExist = cardDao.cardCheckListExist(cardvo);
		if(checkExist > 0) {
			cardItems.put("checkList", "YES");
		}else {
			cardItems.put("checkList", "NO");
		}
		
		//첨부파일 있는지 체크. 있으면 YES, 없으면 NO
		int fileExist = cardDao.cardFileExist(cardvo);
		if(fileExist > 0) {
			cardItems.put("file", "YES");
		}else {
			cardItems.put("file", "NO");
		}
		
		return cardItems;
	}
	
	//카드상세조회시 바로실행 _ 해당 카드의 체크리스트 아이디 목록
	@ResponseBody
	@RequestMapping("/AjaxSelectedCardCheckList")
	public List<CardVO> AjaxSelectedCardCheckList(CardVO vo){
		
		return checklistDao.totalCheckList(vo);
	}
	
	//카드라벨수정 _ 매개값으로 카드아이디, 카드라벨 받음
	@ResponseBody
	@RequestMapping("/AjaxCardLabelUpdate")
	public CardVO AjaxCardLabelUpdate(CardVO cardvo) {
		cardDao.cardLabelUpdate(cardvo);
		
		return cardDao.selectCard(cardvo);
	}
	
	//카드일정등록&수정 _ 매개값으로 카드아이디, 카드시작일, 카드종료일 받음
	@ResponseBody
	@RequestMapping("/AjaxAddCardDates")
	public String AjaxAddCardDates(CardVO cardvo) {
		int n = cardDao.cardDatesUpdate(cardvo);
		
		return n > 0 ? "YES" : "NO";
	}
	
	//카드일정삭제
	@ResponseBody
	@RequestMapping("/AjaxDeleteDates")
	public String AjaxDeleteDates(CardVO cardvo) {
		int n = cardDao.cardDatesDelete(cardvo);
		
		return n > 0 ? "YES" : "NO";
	}
	
	//카드내용수정 _ 매개값으로 카드아이디, 카드내용 받음
	@ResponseBody
	@RequestMapping("/AjaxCardContentsSave")
	public String AjaxCardContentsSave(CardVO cardvo) {
		int n = cardDao.cardContentsUpdate(cardvo);
		
		return n > 0 ? "YES" : "NO";
	}
	
	//카드이름변경 _ 매개값으로 카드아이디, 새로운 카드이름 받음
	@ResponseBody
	@RequestMapping("/AjaxRenameCard")
	public String AjaxRenameCard(CardVO vo) {
		int n = cardDao.cardRename(vo);
	
		return n > 0 ? "YES" : "NO";
	}
	
	//카드관리자지정 _ 매개값으로 아이디, 카드아이디 받음
	@ResponseBody
	@RequestMapping("/AjaxCardManagerSet")
	public String AjaxCardManagerSet(CardVO cardvo) {
		int n = cardDao.cardManagerSetting(cardvo);
		
		return n > 0 ? "YES" : "NO";
	}
}
