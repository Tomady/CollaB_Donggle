package co.Donggle.CollaB.card.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.Donggle.CollaB.card.service.CardMapper;
import co.Donggle.CollaB.card.service.CardService;
import co.Donggle.CollaB.card.service.CardVO;

@Repository("cardDao")
public class CardServiceImpl implements CardService {
	@Autowired
	private CardMapper map;
	
	@Override
	public int cardCheckListExist(CardVO vo) {
		return map.cardCheckListExist(vo);
	}

	@Override
	public int cardFileExist(CardVO vo) {
		return map.cardFileExist(vo);
	}

	@Override
	public String cardManagerProfIMG(CardVO vo) {
		return map.cardManagerProfIMG(vo);
	}

	@Override
	public int createCard(CardVO vo) {
		return map.createCard(vo);
	}

	@Override
	public CardVO selectCurrentCard() {
		return map.selectCurrentCard();
	}

}
