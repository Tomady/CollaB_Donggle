package co.Donggle.CollaB.card.web;

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
import co.Donggle.CollaB.workspace.service.WorkspaceJoinService;

@Controller
public class CardController {
	@Autowired CardService cardDao;
	@Autowired ListService listDao;
	@Autowired BoardService boardDao;
	@Autowired WorkspaceJoinService workspaceJoinDao;
	
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
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		
		ListVO listvo = new ListVO();
		listvo.setList_id(listId);
		int boardID = boardDao.selectBoardId(listvo); //해당 카드, 리스트가 속한 보드의 ID
		
		BoardVO vo = new BoardVO();
		vo.setId(userId);
		vo.setBoard_id(boardID);
		int workspaceID = boardDao.boardWorkspaceID(vo); //해당 카드,리스트가 속한 보드의 워크스페이스 ID
		vo.setWorkspace_id(workspaceID);
		
		//해당 보드의 상세정보-워크스페이스ID,워크스페이스이름,보드이름,보드테마,보드ID - 사이드
		model.addAttribute("workspace",boardDao.selectBoard(vo)); 
		//사용자가 가지고 있는 모든 워크스페이스-워크스페이스ID,워크스페이스이름 - 사이드
		model.addAttribute("workspaceList",workspaceJoinDao.workspaceJoinList(userId));
		//해당워크스페이스에서 즐겨찾기한 보드목록 - 사이드
		model.addAttribute("boardStar",boardDao.selectBoardStar(vo));
		//해당워크스페이스에서 즐겨찾기하지않은 보드목록 - 사이드
		model.addAttribute("unStarBoards",boardDao.selectBoardNonStar(vo));
		
		return "card/cardDetail";
	}
}
