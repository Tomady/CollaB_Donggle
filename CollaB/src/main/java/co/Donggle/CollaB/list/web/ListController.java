package co.Donggle.CollaB.list.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.Donggle.CollaB.card.service.CardService;
import co.Donggle.CollaB.card.service.CardVO;
import co.Donggle.CollaB.list.service.ListService;
import co.Donggle.CollaB.list.service.ListVO;

@Controller
public class ListController {
	@Autowired private ListService listDao;
	@Autowired private CardService cardDao;
	
	//리스트 생성, 리턴으로 방금 만든 리스트정보 보내주기
	@ResponseBody
	@RequestMapping("/AjaxCreateList")
	public ListVO AjaxCreateList(@RequestParam("listTitle") String listTitle,
								 @RequestParam("boardID") int boardID,
								 HttpSession session) {
		//String userId = (String)session.getAttribute("id");
		String userId = "user1";
		
		ListVO vo = new ListVO();
		vo.setList_title(listTitle);
		vo.setBoard_id(boardID);
		vo.setId(userId);
		
		listDao.insertList(vo);
		return listDao.selectCurrentList();
	}
	
	//리스트 이름 수정
	@ResponseBody
	@RequestMapping("/AjaxRenameList")
	public String AjaxRenameList(@RequestParam("listId") int listId,
								 @RequestParam("listName") String listName) {
		ListVO vo = new ListVO();
		vo.setList_title(listName);
		vo.setList_id(listId);
		int n = listDao.renameList(vo);
		
		return n > 0 ? "YES" : "NO";
	}
	
	// 리스트삭제
	// : 리스트,카드,카드댓글,댓글파일,댓글좋아요,첨부파일,첨부파일내역,체크리스트,체크리스트item 전부삭제
	// => 카드아이디, 카드댓글아이디, 파일아이디, 체크리스트 아이디 필요
	@ResponseBody
	@RequestMapping("/AjaxListDelete")
	public String AjaxListDelete(@RequestParam("listId") int listId) {
		//해당 리스트에 포함되어있는 카드아이디목록 구하기
		ListVO listvo = new ListVO();
		CardVO cardvo = new CardVO();
		listvo.setList_id(listId); 
		cardvo.setList_id(listId);
		int n = 0;
		
		//카드아이디목록 구하기
		List<CardVO> cardIds = listDao.selectCardIds(listvo); 
		
		//카드댓글 아이디목록 구하기
		for(CardVO vo : cardIds) {
			List<CardVO> commentids = cardDao.selectCommentIds(vo); //카드댓글 아이디목록
			for(CardVO commentid : commentids) {
				//카드댓글 아이디이용해서 카드댓글첨부파일, 카드댓글좋아요 삭제
				n += cardDao.deleteCardCommentFile(commentid);
				n += cardDao.deleteCardCommentLike(commentid);
			}
		}
		//첨부파일 아이디목록 구하기
		for(CardVO vo : cardIds) {
			List<CardVO> fileids = cardDao.selectFileIds(vo); //카드에 첨부된 파일 아이디목록
			for(CardVO fileid : fileids) {
				//첨부파일 아이디이용해서 첨부파일내역 삭제
				n += cardDao.deleteCardFileHistory(fileid);
			}
		}
		//체크리스트 아이디목록 구하기
		for(CardVO vo : cardIds) {
			List<CardVO> checkids = cardDao.selectCheckListIds(vo); //카드 체크리스트 아이디목록
			for(CardVO checkid : checkids) {
				//체크리스트 아이디이용해서 체크리스트아이템 삭제
				n += cardDao.deleteCardCheckItems(checkid);
			}
		}
		
		//카드아이디 이용해서 카드댓글,체크리스트,카드첨부파일 삭제
		for(CardVO cardid : cardIds) {
			n += cardDao.deleteCardComment(cardid);
			n += cardDao.deleteCardCheckList(cardid);
			n += cardDao.deleteCardFile(cardid);
		}
		
		//리스트아이디 이용해서 해당 리스트와 리스트 내 카드목록삭제
		n += listDao.deleteList(listvo);
		n += cardDao.deleteCard(cardvo);
		
		String listID = Integer.toString(listId);
		
		return n > 0 ? listID : "NO";
	}
	
}
