package co.Donggle.CollaB.card.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.Donggle.CollaB.card.service.CardService;
import co.Donggle.CollaB.card.service.CardVO;

@Controller
public class CardController {
	@Autowired CardService cardDao;
	
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
}
