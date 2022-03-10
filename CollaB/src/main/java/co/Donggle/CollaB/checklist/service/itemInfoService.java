package co.Donggle.CollaB.checklist.service;

import java.util.List;

import co.Donggle.CollaB.card.service.CardVO;

public interface itemInfoService {
	
	List<itemInfoVO> itemList(); // 아이템 리스트
	int additem(itemInfoVO vo); // 아이템 추가하기
	int modifyitem(itemInfoVO vo); // 아이템 수정하기
	int deleteitem(int item_id); // 아이템 개별 삭제하기
	itemInfoVO selectItem(itemInfoVO vo); //아이템 개별 조회
	
	List<CardVO> selectedCardItemList(); //카드상세조회-해당카드의체크리스트아이템목록
	int deleteItemAll(CardVO vo); //카드상세조회-체크리스트삭제시 해당 아이템 모두 삭제
	int modifyitemyn(CardVO vo); // 카드상세조회-체크여부 수정하기
	
	int itemInfoTotalCnt(int boardId); //해당보드의 아이템 개수 - 대시보드
	int itemInfoYesState(int boardId); //해당보드의 Y상태인 아이템 개수 - 대시보드
}
