package co.Donggle.CollaB.card.service;

public interface CardService {
	//카드 아이템 조회-체크리스트 : 0초과면 존재 
	int cardCheckListExist(CardVO vo);
	//카드 아이템 조회-파일 : 0초과면 존재
	int cardFileExist(CardVO vo);
	//카드 매니저 프로필이미지경로
	String cardManagerProfIMG(CardVO vo);
	//카드 추가
	int createCard(CardVO vo);
	//방금 만든 카드 조회
	CardVO selectCurrentCard();
}
