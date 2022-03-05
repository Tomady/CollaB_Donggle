package co.Donggle.CollaB.card.serviceImpl;

import java.util.List;

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

	@Override
	public List<CardVO> selectCommentIds(CardVO vo) {
		return map.selectCommentIds(vo);
	}

	@Override
	public List<CardVO> selectFileIds(CardVO vo) {
		return map.selectFileIds(vo);
	}

	@Override
	public List<CardVO> selectCheckListIds(CardVO vo) {
		return map.selectCheckListIds(vo);
	}

	@Override
	public int deleteCard(CardVO vo) {
		return map.deleteCard(vo);
	}

	@Override
	public int deleteCardComment(CardVO vo) {
		return map.deleteCardComment(vo);
	}

	@Override
	public int deleteCardCommentFile(CardVO vo) {
		return map.deleteCardCommentFile(vo);
	}

	@Override
	public int deleteCardCommentLike(CardVO vo) {
		return map.deleteCardCommentLike(vo);
	}

	@Override
	public int deleteCardFile(CardVO vo) {
		return map.deleteCardFile(vo);
	}

	@Override
	public int deleteCardFileHistory(CardVO vo) {
		return map.deleteCardFileHistory(vo);
	}

	@Override
	public int deleteCardCheckList(CardVO vo) {
		return map.deleteCardCheckList(vo);
	}

	@Override
	public int deleteCardCheckItems(CardVO vo) {
		return map.deleteCardCheckItems(vo);
	}

	@Override
	public int dropCard(CardVO vo) {
		return map.dropCard(vo);
	}

	@Override
	public CardVO selectCard(CardVO vo) {
		return map.selectCard(vo);
	}

	@Override
	public List<CardVO> selectCardList(CardVO vo) {
		return map.selectCardList(vo);
	}

	@Override
	public CardVO selectListinfo(CardVO vo) {
		return map.selectListinfo(vo);
	}

	@Override
	public int cardLabelUpdate(CardVO vo) {
		return map.cardLabelUpdate(vo);
	}

	@Override
	public int cardDatesUpdate(CardVO vo) {
		return map.cardDatesUpdate(vo);
	}

	@Override
	public int cardDatesDelete(CardVO vo) {
		return map.cardDatesDelete(vo);
	}

	@Override
	public int cardContentsUpdate(CardVO vo) {
		return map.cardContentsUpdate(vo);
	}

	@Override
	public int cardRename(CardVO vo) {
		return map.cardRename(vo);
	}

	@Override
	public int cardManagerSetting(CardVO vo) {
		return map.cardManagerSetting(vo);
	}
}
