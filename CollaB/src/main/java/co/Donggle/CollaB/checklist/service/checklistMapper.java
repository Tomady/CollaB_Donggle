package co.Donggle.CollaB.checklist.service;

import java.util.List;

import co.Donggle.CollaB.card.service.CardVO;

public interface checklistMapper {
	
	List<checklistVO> chklistAll();
	int chklistAdd(checklistVO vo);
	
	//카드상세조회시 해당 카드의 체크리스트 전부
	List<CardVO> totalCheckList(CardVO vo);
	//카드상세조회 _ 체크리스트 삭제
	int chklistDelete(CardVO vo);
}
