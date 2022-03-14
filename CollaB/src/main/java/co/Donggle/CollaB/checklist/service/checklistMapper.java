package co.Donggle.CollaB.checklist.service;

import java.util.List;

import co.Donggle.CollaB.card.service.CardVO;

public interface checklistMapper {
	
	List<checklistVO> chklistAll(); //체크리스트 목록
	int chklistAdd(checklistVO vo); //체크리스트 추가
	
	//카드상세조회시 해당 카드의 체크리스트 전부
	List<CardVO> totalCheckList(CardVO vo);
	//카드상세조회 _ 체크리스트 삭제
	int chklistDelete(CardVO vo);
	//카드상세조회 _ 체크리스트 타이틀 수정
	int checklistUpdateTitle(checklistVO vo);
	
	checklistVO selectCheckList(checklistVO vo); //체크리스트 한건조회
}
